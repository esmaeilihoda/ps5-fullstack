using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Class;
using System.Data;
using Library;

namespace Shop.Account
{
    public partial class Verify : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        string[] login = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Session["VCODE"] != null)
                {
                    LVCode.Visible = true;
                    VCode.Visible = true;
                }
                Model.EXEQ ME = new Model.EXEQ();
                ME.Q_Add(@"SELECT UserName, Name, Family, shaba, ShHesab, HesabName, HesabFamily, HCardNumber
                             , PositionRecord, Mobile   FROM      Marketers WHERE Id = @Id ");
                ME.ParamAdd("@Id", login[1]);
                DataView dv = ME._GetDataView();
                DataRowView DRV = dv[0];
                //ME.Q_Add(@"SELECT Name, UserName, Family, EName, EFamily, Mobile                          
                //           FROM  Marketers WHERE UserName = '" + DRV["PositionRecord"].ToString() + "' ");
                //DataView baladv = ME._GetDataView();
                //if (baladv.Count > 0)
                //{
                //    moaref.InnerText += ":" + baladv[0]["Name"].ToString() + " " +
                //        baladv[0]["Family"].ToString();
                //    moarefusername.InnerText += ":" + baladv[0]["UserName"].ToString();
                //    moarefphone.InnerText += ":" + baladv[0]["Mobile"].ToString();
                //    ME.Q_Add("SELECT TOP (1) DateP FROM MPay WHERE MId = '"
                //        + login[1] + "' ORDER BY Id ASC ");
                //    Tsabt.InnerText += ":" + Constants.DateSplit(ME.GetF2Str());
                //}
                      UserName.InnerText += ":" + DRV["UserName"].ToString();
                      Mobile.Value = DRV["Mobile"].ToString();
            }
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            SendSms Ss = new SendSms();
            if (Session["VCODE"] == null)
            {
                //if (NMobile.Value != "" && NMobile.Value.Length == 11)
                //    Session["VCODE"] = Ss.sendsmsviarandomcode(NMobile.Value.Trim())[1];
                //else
                //    Session["VCODE"] = Ss.sendsmsviarandomcode(Mobile.Value.Trim())[1];
                //SM.CreateMessageAlert("کد تایید برای شما ارسال شد و تا زمانی که مرورگر خود را نبسته اید برای شما معتبر خواهد بود", sender);
                //LVCode.Visible = true;
                //VCode.Visible = true;
            }
            else
            {
                if(Session["VCODE"].ToString() != VCode.Value.Trim())
                {
                    SM.CreateMessageAlert("کد تایید درست نیست", sender);
                    return;
                }
                Model.EXEQ ME = new Model.EXEQ();
                ME.clear();

                ME.Q_Add(@"Update [Marketers] set [MobVerify] = 1, Mobile = @Mobile WHERE Id = @Id ");
                //sex, fathername, varesname, varescode, city, postalcode                

                ME.ParamAdd("@Id", login[1]);
                if (NMobile.Value != "" && NMobile.Value.Length == 11)
                    ME.ParamAdd("@Mobile", NMobile.Value.Trim());
                else
                    ME.ParamAdd("@Mobile", Mobile.Value.Trim());

                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("شماره تلفن شما تایید شد", sender);
                    Response.Redirect("index.aspx");
                }
                else
                {
                    SM.CreateMessageAlert("اشکال در ازسال اطلاعات به سرور", sender);
                }
            }
        }

        protected void sendcode1_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT Mobile, [MobVerify]   FROM      Marketers WHERE Id = @Id ");
            ME.ParamAdd("@Id", login[1]);
            DataRowView drv = ME._GetDataView()[0];
            if (Mobile.Value.Trim() == NMobile.Value.Trim())
            {
                SM.CreateMessageAlert("شماره تلفن قبلی و جدید نباید تکراری باشد", sender);
                return;
            }
            //else if (drv["MobVerify"].ToString() == "1" && drv["Mobile"].ToString() == Mobile.Value.Trim() )
            //{
            //    SM.CreateMessageAlert("شماره تلفن شما قبلا تایید شده است!!", sender);
            //    return;
            //}
            SendSms Ss = new SendSms();
            //if (Session["VCODE"] == null)
            //{
                if (NMobile.Value != "" && NMobile.Value.Length == 11)
                    Session["VCODE"] = Ss.sendsmsviarandomcode(NMobile.Value.Trim())[1];
                else
                    Session["VCODE"] = Ss.sendsmsviarandomcode(Mobile.Value.Trim())[1];
                SM.CreateMessageAlert("کد تایید برای شما ارسال شد و تا زمانی که مرورگر خود را نبسته اید برای شما معتبر خواهد بود", sender);
                LVCode.Visible = true;
                VCode.Visible = true;
            //}
            //else
            //    SM.CreateMessageAlert("کد تایید برای شما قبلا ارسال شده است برای ارسال دوباره مرورگر خود را بسته و دوباره وارد سامانه شوید!!", sender);
        }
    }
}