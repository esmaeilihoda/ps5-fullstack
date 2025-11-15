using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;

namespace Shop.Account
{
    public partial class Register : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
            ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            ME.ParamAdd("@UN", D_Code.Value);
            D_Name.Text = ME.GetF2Str();
            if(D_Code.Value != "")
            {
                if (D_Name.Text == "")
                {
                    SM.CreateMessageAlert("کد معرف اشتباه است", sender);
                    return;
                }
            }
            
            //ME.clear();
            //ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            //ME.ParamAdd("@UN", RG_Code.Value);
            //RG_LBL.Text = ME.GetF2Str();
            //if (RG_LBL.Text == "")
            //{
            //    SM.CreateMessageAlert("کد ثبت موقعیت اشتباه است", sender);
            //    return;
            //}
            if (Pass.Value != RePass.Value)
            {
                Pass.Value = ""; RePass.Value = "";
                SM.CreateMessageAlert("پسورد ها همخوانی ندارد", sender);
                return;
            }
            if (Pass.Value.Length < 8)
            {
                SM.CreateMessageAlert("حداقل طول پسورد باید بیشتر از 8 کاراکتر باشد.", sender);
                return;
            }
            //ME.Q_Add("SELECT COUNT(*) FROM Marketers WHERE PositionRecord = @PR AND Status = 1 ");
            //ME.ParamAdd("@PR", RG_Code.Value);
            //if(ME.Counter() >= 2)
            //{
            //    SM.CreateMessageAlert("نفرات باشگاه شخص  مورد نظر از قبل پر شده است.", sender);
            //    return;
            //}
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            string max0 = ME.GetF2Str();
            string UName = "WSE" + max0 + Ename.Value.Trim().Substring(0, 1) + EFname.Value.Trim().Substring(0, 1);

            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", name.Value.Trim());
            ME.ParamAdd("@Family", Fname.Value.Trim());
            ME.ParamAdd("@EName", Ename.Value.Trim());
            ME.ParamAdd("@EFamily", EFname.Value.Trim());
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);
            ME.ParamAdd("@Reagent", D_Code.Value.Trim());
            ME.ParamAdd("@STATUS", "0");
            ME.ParamAdd("@password", Constants.Sha256_hash(Pass.Value));
            ME.ParamAdd("@NationalCode",Constants.PersianDigit2English( NationalCode.Value));
            ME.ParamAdd("@Mobile",Constants.PersianDigit2English( Tell.Value.Trim()));
            ME.ParamAdd("@Email", email.Value.Trim());
            if (ME.Run() == "runed")
            {
                
                string[] login = new string[5];
                login[0] = "OK"; login[1] = max0; login[2] = name.Value; login[3] = Fname.Value; login[4] = UName;
                Session["Login"] = login;
                SM.CreateMessageAlert("ثبت نام با موفقیت انجام شد."+ "نام کاربری:" + login[4] + "رمز کاربری:رمز انتخابی کاربر", sender);
                SendSms Ss = new SendSms();
                try
                {
                    if(D_Code.Value != "")
                    {
                      //  Ss.sendsmsviaMessage(Tell.Value.Trim(), @"CHECKIT"
                      //+ "نام کاربری شما:" + login[4]);CHECKIT
                    }
                   
                }
                catch
                {

                }
                if (Request.QueryString["ComeBack"] != null)
                {
                    Response.Redirect(Request.QueryString["ComeBack"]);
                }
                else
                Response.Redirect("index.aspx");
            }
            else
                SM.CreateMessageAlert("مشکلی در ثبت نام بوجود آمده است لطفا دوباره تلاش کنید", sender);
        }

        protected void GetRName_Click(object sender, EventArgs e)
        {

            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();
            ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            ME.ParamAdd("@UN", D_Code.Value);
            D_Name.Text = ME.GetF2Str();
            if (D_Name.Text == "")
            {
                D_Code.Focus();
                SM.CreateMessageAlert("کد معرف اشتباه است", sender);
            }
            else
                Pass.Focus();
        }

        protected void GetMN_Click(object sender, EventArgs e)
        {
            //Model.EXEQ ME = new Model.EXEQ();
            //ME.clear();
            //ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            //ME.ParamAdd("@UN", RG_Code.Value);
            //RG_LBL.Text = ME.GetF2Str();
            //if (RG_LBL.Text == "")
            //    SM.CreateMessageAlert("کد ثبت موقعیت اشتباه است", sender);
        }

        protected void gconfirm_CheckedChanged(object sender, EventArgs e)
        {
            if (gconfirm.Checked)
                Regster.Enabled = true;
            else
                Regster.Enabled = false;
        }
    }
}