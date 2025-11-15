using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using zarinpal;
using zarinpal.ServiceReference;
using Library;

namespace Shop.Shop
{
    public partial class ShopZarPayment : System.Web.UI.Page
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
                //ME.Q_Add(@"SELECT UserName, Name, Family, shaba, ShHesab, HesabName, HesabFamily, HCardNumber
                //             , PositionRecord   FROM      Marketers WHERE Id = @Id ");
                //ME.ParamAdd("@Id", login[1]);
                //DataView dv = ME._GetDataView();
                //DataRowView DRV = dv[0];
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
                //      UserName.InnerText += ":" + DRV["UserName"].ToString();
                
                if (Session["Autohority"] != null 
                    && Request.QueryString["Authority"] != null && Request.QueryString["Authority"] != "")
                {
                    string[] Autohority = (string[])Session["Autohority"];
                    
                    PaymentGatewayImplementationServicePortTypeClient request =
                       new PaymentGatewayImplementationServicePortTypeClient();
                    long re = long.Parse(Autohority[3]);
                    var rer = request.PaymentVerification("677dd2e4-aa40-413d-bfa7-397528f0c374",
                        Autohority[0], int.Parse(Autohority[1]), out re);

                    if (Autohority[0] == Request.QueryString["Authority"] 
                        && Request.QueryString["Status"] == "OK" && rer > 0 )
                    {

                        ME.Q_Add("UPDATE ZarPay SET PStatus = 1, Erja = '"+re+
                            "' WHERE MID = @MID AND Authority = @Authority ");
                        ME.ParamAdd("@MID", login[1]);
                        ME.ParamAdd("@Authority", Autohority[0]);
                        ME.Run();

                       
                        ME.Q_Add(@"UPDATE      ShopOrders
                                          SET                 Status = 1 WHERE MID = @MID AND Id = @FID ");

                        ME.ParamAdd("@MID", login[1]);
                        ME.ParamAdd("@FID", Autohority[4]);

                        ME.Run();
                       

                        //Autohority[0] = e.Autohority;
                        //Autohority[1] = Amt.ToString();
                        //Autohority[2] = PackNo.SelectedValue;
                        //Autohority[3] = D_Code.Value.Trim();
                        //Autohority[4] = PayType.SelectedValue;
                        Session["Autohority"] = null;
                        //activeapck(Autohority[2], double.Parse(Autohority[1])/double.Parse(Autohority[2]), int.Parse(Autohority[4]), 0, Autohority[3]);
                        alarm.CssClass = "alert alert-success btn-user btn-block";
                        alarm.GroupingText = "پرداخت صورتحساب شماره " + Autohority[4] + " موفق بود ";
                        ME.Q_Add(@"select mobile from marketers  
	                                where UserName in(select DRusername collate Persian_100_CI_AS_KS from shop_domainregister 
	                                where DRsubdomain in(select HostName from ShopOrders where id=@Fid))");
                        ME.ParamAdd("@Fid", Autohority[4]);
                        String mobile = ME.GetF2Str();
                        Library.SendSms SSM = new SendSms();
                        string ss = "خریدی به شماره فاکتور : " + Autohority[4] + " از سایت شما انجام شده است ";
                       // SSM.sendsmsviaMessage(mobile, ss);CHECKIT
                    }
                    else
                    {
                        ME.Q_Add("UPDATE ZarPay SET PStatus = 9 WHERE MID = @MID AND Authority = @Authority ");
                        ME.ParamAdd("@MID", login[1]);
                        ME.ParamAdd("@Authority", Autohority[0]);
                        ME.Run();
                        Session["Autohority"] = null;
                        alarm.CssClass = "alert alert-danger btn-user btn-block";
                        alarm.GroupingText = "پرداخت صورتحساب شماره " + Autohority[4] + " ناموفق بود ";
                    }
                }
                else
                {
                    ME.Q_Add(@"SELECT        TOP (1) Id
                                  FROM   ZarPay WHERE MID = @MID
                                                   ORDER BY Id DESC");
                    ME.ParamAdd("@MID", login[1]);
                    string id = ME.GetF2Str();

                    ME.Q_Add("UPDATE ZarPay SET PStatus = 9 WHERE MID = @MID AND Id = @Id ");
                    ME.ParamAdd("@MID", login[1]);
                    ME.ParamAdd("@Id", id);
                    ME.Run();

                    Session["Autohority"] = null;
                    alarm.CssClass = "btn btn-danger btn-user btn-block";
                    alarm.GroupingText = "پرداخت صورتحساب   ناموفق بود ";
                }
            }
        }

    }
}