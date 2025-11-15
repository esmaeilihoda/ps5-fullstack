using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Shop
{
    public partial class DomainRegister : System.Web.UI.Page
    {
        Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SM = new ShowMessage();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void save_Click(object sender, EventArgs e)
        {


            ShopMain smm = new ShopMain();
            string Domaincontrol = smm.Userdomaincontrol(DRusername.Value);
            if (Domaincontrol != "1")
            {
                SM.CreateMessageAlert("کاربری شما پیدا نشد", sender);
                return;
            }
            else
            {
                if (DRusername.Value == "")
                {
                    SM.CreateMessageAlert("لطفا نام کاربری را وارد نمایید", sender);
                    return;
                }
                else if (DRsubdomain.Value == "")
                {
                    SM.CreateMessageAlert("لطفا نام دامنه را وارد نمایید", sender);
                    return;
                }
                else if (DRmobile.Value == "")
                {
                    SM.CreateMessageAlert("لطفا شماره  مبایل خود را وارد نمایید", sender);
                    return;
                }
                else
                {
                    string SubDomain = DRsubdomain.Value.Trim() + "." + DRdomain.Value.ToString() + "." + DRtypedomain.Value.ToString();
                    SubDomain = SubDomain.Replace(" ", string.Empty);
                    Regex pattern = new Regex("^[a-zA-Z0-9]*$");

                    bool matches = pattern.IsMatch(DRsubdomain.Value);
                    if (!matches || DRsubdomain.Value.Replace(".", "").Length < DRsubdomain.Value.Length)
                    {
                        SM.CreateMessageAlert("Domain Error Characters should only be a-z | A-Z | 0-9  and dash(-) ", sender);
                        return;
                    }

                    ME.Q_Add("SELECT COUNT(*) FROM dbo.shop_domainregister WHERE DRsubdomain = @DRsubdomain  ");
                    ME.ParamAdd("@DRsubdomain",  SubDomain.ToLower());

                    if (ME.Counter() > 0)
                    {
                        SM.CreateMessageAlert("این دامنه قبلا ثبت شده است", sender);
                        return;
                    }

                    ME.Q_Add("SELECT COUNT(*) FROM dbo.shop_domainregister WHERE DRusername=@DRusername");
                    ME.ParamAdd("@DRusername", DRusername.Value);
                    if (ME.Counter() > 0)
                    {
                        SM.CreateMessageAlert("با این نام کاربری قبلا دامنه ثبت شده است", sender);
                        return;
                    }


                    ME.Q_Add(@"INSERT INTO dbo.shop_domainregister (DRusername,DRsubdomain,DRmobile)  VALUES
                                                   (@DRusername,@DRsubdomain,@DRmobile) ");

                    ME.ParamAdd("@DRusername", DRusername.Value);
                    ME.ParamAdd("@DRsubdomain", SubDomain.ToLower());
                    ME.ParamAdd("@DRmobile", Constants.PersianDigit2English(DRmobile.Value));

                    if (ME.Run() == "runed")
                    {
                        //string meessage = "درخواست شما جهت فعال سازی فروشگاه زنجیره ای CHECKIT ثبت شد و پس از بررسی درخواست شما فعال خواهد شد .  دامنه شما  " + SubDomain + "  و نام کاربری شما " + DRusername.Value + " ،" + " و رمز عبور شما رمز عبور سامانه می باشد.";
                        //Library.SendSms dd = new Library.SendSms();
                        //dd.sendsmsviaMessage((Constants.PersianDigit2English(DRmobile.Value)).ToString(), meessage);
                        DRusername.Value = "";
                        DRsubdomain.Value = "";
                        DRmobile.Value = "";
                        SM.CreateMessageAlert("درخواست شما با موفقیت ثبت شد", sender);
                    }
                    else
                    {
                        SM.CreateMessageAlert("ERROR:0x6001", sender);
                    }
                }

            }

        }
    }
}