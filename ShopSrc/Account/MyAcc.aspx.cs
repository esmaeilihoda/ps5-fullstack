using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using System.Data;

namespace Shop.Account
{
    public partial class MyAcc : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    Model.EXEQ ME = new Model.EXEQ();
                    ME.Q_Add(@"SELECT UserName, Name, Family, shaba, ShHesab, HesabName, HesabFamily, HCardNumber, MVAdress
                             , PositionRecord   FROM      Marketers WHERE Id = @Id ");
                    ME.ParamAdd("@Id", login[1]);
                    DataView dv = ME._GetDataView();
                    DataRowView DRV = dv[0];

                    //ME.Q_Add(@"SELECT Name, UserName, Family, EName, EFamily, Mobile                          
                    //   FROM  Marketers WHERE UserName = '" + DRV["PositionRecord"].ToString() + "' ");
                    //DataView baladv = ME._GetDataView();
                    //if (baladv.Count > 0)
                    //{
                    //    moaref.InnerText += ":" + baladv[0]["Name"].ToString() + " " +
                    //        baladv[0]["Family"].ToString();
                    //    moarefusername.InnerText += ":" + baladv[0]["UserName"].ToString();
                    //    moarefphone.InnerText += ":" + baladv[0]["Mobile"].ToString();
                        ME.Q_Add("SELECT TOP (1) DateP FROM MPay WHERE MId = '"
                            + login[1] + "' ORDER BY Id ASC ");
                        Tsabt.InnerText += ":" + Constants.DateSplit(ME.GetF2Str());
                    //}
                    UserName.InnerText += ":" + DRV["UserName"].ToString();
                    shaba.Value = DRV["shaba"].ToString();
                    HesabFamily.Value = DRV["HesabFamily"].ToString();
                    HesabName.Value = DRV["HesabName"].ToString();
                    HCardNumber.Value = DRV["HCardNumber"].ToString();
                    ShHesab.Value = DRV["ShHesab"].ToString();                                       
                    MVAdress.Value = DRV["MVAdress"].ToString();
                }
            }

        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
                        

            

            ME.Q_Add(@"UPDATE Marketers SET shaba = @shaba, ShHesab = @ShHesab, HesabName = @HesabName,
                       HesabFamily = @HesabFamily, HCardNumber = @HCardNumber, MVAdress = @MVAdress
                         WHERE Id = @Id  ");

            //sex, fathername, varesname, varescode, city, postalcode
            ME.ParamAdd("@shaba", shaba.Value.Trim());
            ME.ParamAdd("@ShHesab",Constants.PersianDigit2English(ShHesab.Value.Trim()) );
            ME.ParamAdd("@HesabName", HesabName.Value.Trim());
            ME.ParamAdd("@HesabFamily", HesabFamily.Value.Trim());
            ME.ParamAdd("@Id", login[1]);
            ME.ParamAdd("@HCardNumber", HCardNumber.Value);
            ME.ParamAdd("@MVAdress", MVAdress.Value.Trim());
            if (ME.Run() == "runed")
            {
                SM.CreateMessageAlert("اطلاعات بانکی بروز شدند", sender);
            }
            else
            {
                SM.CreateMessageAlert("اشکال در ثبت اطلاعات", sender);
            }
        }

    }
}