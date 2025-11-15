using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using System.Data;
using System.Text;

namespace Shop.Account
{
    public partial class Messages : System.Web.UI.Page
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
                Model.EXEQ ME = new Model.EXEQ();
                ME.Q_Add(@"SELECT UserName, Name, Family, shaba, ShHesab, HesabName, HesabFamily, HCardNumber
                             , PositionRecord   FROM      Marketers WHERE Id = @Id ");
                ME.ParamAdd("@Id", login[1]);
                DataView dv = ME._GetDataView();
                DataRowView DRV = dv[0];
                ME.Q_Add(@"SELECT Name, UserName, Family, EName, EFamily, Mobile                          
                           FROM  Marketers WHERE UserName = '" + DRV["PositionRecord"].ToString() + "' ");
                DataView baladv = ME._GetDataView();
                if (baladv.Count > 0)
                {
                    moaref.InnerText += ":" + baladv[0]["Name"].ToString() + " " +
                        baladv[0]["Family"].ToString();
                    moarefusername.InnerText += ":" + baladv[0]["UserName"].ToString();
                    moarefphone.InnerText += ":" + baladv[0]["Mobile"].ToString();
                    ME.Q_Add("SELECT TOP (1) DateP FROM MPay WHERE MId = '"
                        + login[1] + "' ORDER BY Id ASC ");
                    Tsabt.InnerText += ":" + Constants.DateSplit(ME.GetF2Str());
                }
                      UserName.InnerText += ":" + DRV["UserName"].ToString();
                //        shaba.Value = DRV["shaba"].ToString();
                //        HesabFamily.Value = DRV["HesabFamily"].ToString();
                //        HesabName.Value = DRV["HesabName"].ToString();
                //        HCardNumber.Value = DRV["HCardNumber"].ToString();
                //        ShHesab.Value = DRV["ShHesab"].ToString();                                       

                //    }
                //}
            }
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
            
            ME.Q_Add(@"INSERT INTO  Tickets(SMID, TSubject, TContent, Attachment, AttachName, ParentTId, RMID)
                       VALUES        (@MID, @TSubject, @TContent, @Attachment, @AttachName, @ParentTId) ,1 ");
            byte[] fbyte = Attachment.FileBytes;
            string fileformat = Attachment.FileName.Split(".".ToCharArray())[Attachment.FileName
                .Split(".".ToCharArray()).Length - 1].ToLower();
            if (Attachment.FileName != "")
            {
                if (fileformat != "jpg")
                {
                    //SM.CreateMessageAlert("فرمت فایل کارت ملی فقط باید jpg باشد", sender);                    
                   // return;
                }
                if (fbyte.Length / 1024 > 300)
                {                    
                    SM.CreateMessageAlert("حداکثر حجم فایل ارسالی  نباید بیشتر از 300 کیلوبایت باشد", sender);
                    return;
                }
            }
            //sex, fathername, varesname, varescode, city, postalcode
            ME.ParamAdd("@MID", login[1]);
            ME.ParamAdd("@TSubject", TSubject.Value.Trim());
            ME.ParamAdd("@TContent", TContent.Value.Trim());
            ME.ParamAdd("@Attachment", fbyte);
            ME.ParamAdd("@AttachName", Attachment.FileName.Trim());            
            ME.ParamAdd("@ParentTId", 0);           

            if (ME.Run() == "runed")
            {
                SM.CreateMessageAlert("درخواست پشتیبانی ارسال شده و در صف پاسخگویی قرار گرفت", sender);
            }
            else
            {
                SM.CreateMessageAlert("اشکال در ازسال درخواست", sender);
            }
        }

    }
}