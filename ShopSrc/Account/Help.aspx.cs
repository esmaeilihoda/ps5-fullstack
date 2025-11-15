using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Class;
using System.Data;
using System.Text;
using Library;

namespace Shop.Account
{
    public partial class Help : System.Web.UI.Page
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

                ME.Q_Add(@"SELECT        Id AS 'سریال', TSubject AS 'موضوع', TContent AS 'توضیحات', LastUpdate AS 'زمان ارسال'
                                  FROM            Tickets WHERE MID = @MID ORDER BY LastUpdate DESC ");
                ME.ParamAdd("@MID", login[1]);

                Session["GSS"] = ME._GetDataTable();

            }
        }
        protected void Marketers_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Marketers_Grid.DataSource = (DataTable)Session["GSS"];
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
            
            ME.Q_Add(@"INSERT INTO  Tickets(MID, TSubject, TContent, Attachment, AttachName, ParentTId)
                       VALUES        (@MID, @TSubject, @TContent, @Attachment, @AttachName, @ParentTId)  ");
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
                SM.CreateMessageAlert("درخواست پشایبانی ارسال شده و در صف پاسخگویی قرار گرفت", sender);
            }
            else
            {
                SM.CreateMessageAlert("اشکال در ازسال درخواست", sender);
            }
        }

    }
}