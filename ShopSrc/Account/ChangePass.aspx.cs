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
    public partial class ChangePass : System.Web.UI.Page
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
            }
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
            
            ME.Q_Add(@"SELECT password FROM Marketers WHERE Id = @Id ");
            ME.ParamAdd("@Id", login[1]);
            string passw = ME.GetF2Str();
            if (passw != Constants.Sha256_hash( Pass.Value.Trim()))
            {
                SM.CreateMessageAlert("پسورد قبلی اشتباه وارد شده است!!", sender);
                return;
            }
            else if (NPass.Value.Trim() != RNPass.Value.Trim())
            {
                SM.CreateMessageAlert("پسوردها باهم همخوانی ندارند!!", sender);
                return;
            }

            else
            {
                ME.Q_Add(@"UPDATE Marketers SET password = @Pass WHERE Id = @Id ");
                ME.ParamAdd("@Id", login[1]);
                ME.ParamAdd("@Pass", Constants.Sha256_hash( NPass.Value.Trim()));
                if(ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("رمز کاربری شما تغییر یافت", sender);           
                }
                else
                    SM.CreateMessageAlert("اشکال در اسال اطلاعات به سرور", sender);                

            }
        }

    }
}