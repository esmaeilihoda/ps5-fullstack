using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Text.RegularExpressions;
using Library;

namespace Shop.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            //string host = "";
            //host = "https://";

            //host += HttpContext.Current.Request.Url.Host;
            //string hoste = HttpContext.Current.Request.Url.Host;
            //host += "/Account/login.aspx";
            //if (!HttpContext.Current.Request.IsSecureConnection && hoste != "localhost")
            //{
            //    Response.Redirect(host);
            //}
            if (!IsPostBack)
            {
                Session["CaptchaCode"] = RadCaptcha1.CaptchaImage.Text;
            }
        }
        protected void RadCaptcha1_CaptchaValidate(object sender, CaptchaValidateEventArgs e)
        {
            if (Session["CaptchaCode"] == null)
                Response.Redirect("index.aspx");
            e.CancelDefaultValidation = true;
            string validationCodeNumbers = Regex.Replace(Session["CaptchaCode"].ToString(), "[^0-9]", "");
            int digitsSum = 0;
            foreach (char c in validationCodeNumbers)
            {
                digitsSum += Convert.ToInt32(c.ToString());
            }

            int enteredDigitsSum = 0;
            e.IsValid = Int32.TryParse(ValdiationCodeDigitsSum.Value, out enteredDigitsSum) && digitsSum == enteredDigitsSum;
            if (e.IsValid)
            {
                RadCaptcha1.CaptchaImage.ImageCssClass = "imgCorrectCode";
                Btn_Login_Click(sender, e);
            }
            else
            {
                RadCaptcha1.CaptchaImage.ImageCssClass = "imgWrongCode";
            }
            Session["CaptchaCode"] = RadCaptcha1.CaptchaImage.Text;
        }
protected void Btn_Login_Click(object sender, EventArgs e)
        {
            if(UName.Value == "" || Password.Value == "")
            {
                ffa.Visible = true;
                alarm.InnerText = "نام کاربری و پسورد اجباری هست.";
                return;
            }
            else
                ffa.Visible = false;
            Model.EXEQ MD = new Model.EXEQ();
            MD.clear();
            MD.Q_Add("SELECT password FROM Marketers WHERE UserName = @UserName AND password = @password ");
            MD.ParamAdd("@UserName", UName.Value);
            MD.ParamAdd("@password", Constants.Sha256_hash(Password.Value));
            DataView count = MD._GetDataView();
            if (count != null && count.Count == 1)
            {
                if (count[0]["password"].ToString() != Constants.Sha256_hash(Password.Value))
                {
                    ffa.Visible = true;
                    alarm.InnerText = "نام کاربری یا رمز عبور اشتباه است.";
                    return;
                }
                // MD.clear();
                MD.Q_Add("SELECT Id, UserName, Name, Family, Ad, WalletId, PositionRecord FROM Marketers WHERE UserName = @UserName ");
                MD.ParamAdd("@UserName", UName.Value);
                DataView DV = MD._GetDataView();
                string[] login = new string[8];

                login[0] = "OK"; login[1] = DV[0]["Id"].ToString();
                login[2] = DV[0]["Name"].ToString(); login[3] = DV[0]["Family"].ToString(); login[4] = DV[0]["UserName"].ToString();
                login[5] = DV[0]["Ad"].ToString(); login[6] = DV[0]["WalletId"].ToString();
                login[7] = DV[0]["PositionRecord"].ToString();

                Session["Login"] = login;
                if (Request.QueryString["ComeBack"] != null)
                {
                    Response.Redirect(Request.QueryString["ComeBack"]);
                }
                if (login[5] == "1")
                    Response.Redirect("~/shop/admin/shoppages");
                //Response.Redirect("Adindex.aspx");
                else
                {
                    if (Request.QueryString["mode"] != null && Request.QueryString["mode"] == "shop")
                        Response.Redirect("~/shop/index.aspx");
                    else
                        Response.Redirect("index.aspx");
                }
            }
            else
            {
                ffa.Visible = true;
                alarm.InnerText = "نام کاربری یا رمز عبور اشتباه است.";
                return;
            }
        }
    }
}