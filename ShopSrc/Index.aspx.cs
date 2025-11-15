using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class NIndex : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        string[] login;
        protected void Page_Load(object sender, EventArgs e)
        {     
            Response.Redirect("Shop/index.aspx");
            string host = "";
            host = "https://";

            host += HttpContext.Current.Request.Url.Host;
            string hoste = HttpContext.Current.Request.Url.Host;
            host += "/index.aspx";
            if (!HttpContext.Current.Request.IsSecureConnection && hoste != "localhost")
            {
                  Response.Redirect(host);
            }

            if (Session["Login"] == null)
            {
                loginnn.Visible = true;
                showuname.Visible = false;
            }
            else
            {
                login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("~/Defualt.aspx");
                else
                {
                    uname.InnerText = login[2] + "_" + login[3];
                }
                loginnn.Visible = false;
                showuname.Visible = true;
            }
        }

        protected void GetMCI_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();

            if (sender == GetMCI)
            {
                if (MCIamount.SelectedValue == "0")
                {
                    SM.CreateMessageAlert("مبلغ را انتخاب کنید", sender);
                    return;
                }
            }
            else if (sender == GetMTN)
            {
                if (MTNamount.SelectedValue == "0")
                {
                    SM.CreateMessageAlert("مبلغ را انتخاب کنید", sender);
                    return;
                }
            }
            else if (sender == GetRTL)
            {
                if (RTLamount.SelectedValue == "0")
                {
                    SM.CreateMessageAlert("مبلغ را انتخاب کنید", sender);
                    return;
                }
            }

            GetPost RP = new GetPost();
            RP.Url = "https://inax.ir/webservice.php";
            RP.Add("method", "invoice");
            RP.Add("username", "72b72adbc8267f8e576d6be797d89bce");
            RP.Add("password", "13671367");

            ME.Q_Add("SELECT IDENT_CURRENT('OpCharge')+1");
            string max0 = ME.GetF2Str();

            RP.Add("product", "topup");
           
            RP.Add("charge_type", "normal");

            RP.Add("order_id", max0);
            RP.Add("company", "CHECKIT");

            ME.Q_Add(@"INSERT  
                      INTO              OpCharge(MID, Amount, TsId, Status, PDate, Mobile, operator)
                       VALUES        (@MID, @Amount, @TsId, @Status, @PDate, @Mobile, @operator)");

            ME.ParamAdd("@MID", (login == null ? "0" : login[1] ));
            ME.ParamAdd("@TsId", "0");
            ME.ParamAdd("@Status", 0);
            ME.ParamAdd("@PDate", Constants.CurDate());          

            if (sender == GetMCI)
            {
                RP.Add("operator", "MCI");
                RP.Add("amount", MCIamount.SelectedValue);
                ME.ParamAdd("@Amount", MCIamount.SelectedValue);
                ME.ParamAdd("@Mobile", MyTellmci.Value);
                RP.Add("mobile", MyTellmci.Value);
                ME.ParamAdd("@operator", "MCI");
            }
            else if (sender == GetMTN)
            {
                RP.Add("operator", "MTN");
                RP.Add("amount", MTNamount.SelectedValue);
                ME.ParamAdd("@Amount", MTNamount.SelectedValue);
                ME.ParamAdd("@Mobile", MyTellmtn.Value);
                ME.ParamAdd("@operator", "MTN");
                RP.Add("mobile", MyTellmtn.Value);
            }
            else if(sender == GetRTL)
            {
                RP.Add("operator", "RTL");
                RP.Add("amount", RTLamount.SelectedValue);
                ME.ParamAdd("@Amount", RTLamount.SelectedValue);
                ME.ParamAdd("@Mobile", MyTellrtl.Value);
                ME.ParamAdd("@operator", "RTL");
                RP.Add("mobile", MyTellrtl.Value);
            }
            if (ME.Run() == "runed")
            {
                RP.RdPost();
                string[] tyy = RP.getresult;
                if(tyy[0] == "1")
                {
                    ME.Q_Add("UPDATE OpCharge SET Status = 5, TsId = @TsId  WHERE Id = @Id ");
                    ME.ParamAdd("@Id", max0);
                    ME.ParamAdd("@TsId", tyy[1]);
                    if(ME.Run() == "runed")
                    {
                        Response.Redirect("https://inax.ir/pay.php?tid=" + tyy[1]);
                    }
                    else
                    {
                        SM.CreateMessageAlert("err:25050", sender);
                    }
                }
            }
            else
            {
                SM.CreateMessageAlert("err:03265", sender);
            }
        }
    }
}