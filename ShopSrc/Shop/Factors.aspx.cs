using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop;

namespace Shop.Shop
{
    public partial class Factors : System.Web.UI.Page
    {

        Model.EXEQ ME = new Model.EXEQ();
        string[] Userlogin = null;
        Class.GetSet_Wallet GSW = new Class.GetSet_Wallet();
        Library.SendSms SSM = new Library.SendSms();
        protected void Page_Load(object sender, EventArgs e)
        {
            Userlogin = (string[])Session["Login"];
            if (Userlogin == null)
            {
                ShowMessage SMM = new ShowMessage();
                SMM.CreateMessageAlert("برای نهایی کردن خرید و صدور فاکتور لطفا وارد شوید.", sender);

                SMM.RunAnyScript(@"document.body.innerHTML = 'در حال انتقال به صفحه ورود';", sender);

                SMM.RunAnyScript(@"setTimeout(
                    function(){
                          location.replace('../Account/Login.aspx?ComeBack=~/Shop/Factors.aspx');
                           }
                        , 3000);", sender);

                return;
            }
               


        }

        protected void Factors_Grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //if (e.CommandName == "Pay")
            //{
            //    int FIndex = e.Item.ItemIndex;
            //    string FID = Factors_Grid.Items[FIndex]["FId"].Text;
            //    ME.Q_Add("SELECT case when PayVoucher>0  then PayCach else AMT end as AMT FROM  ShopOrders WHERE MID = @MID AND Status = 0 AND Id = @FID ");
            //    ME.ParamAdd("@MID", Userlogin[1]);
            //    ME.ParamAdd("@FID", FID);
            //    string AMT = ME.GetF2Str();
            //    if (AMT != null && AMT != string.Empty)

            //        {
            //        string host = string.Empty;
            //        //if (HttpContext.Current.Request.IsSecureConnection)
            //        //    host = "https://";
            //        //else
            //        host = "http://";
            //        host += HttpContext.Current.Request.Url.Host;
            //        host += ":" + HttpContext.Current.Request.Url.Port;
            //        host += "/Shop/ShopZarPayment";
            //        zarinpal.pay zarpay = new zarinpal.pay("677dd2e4-aa40-413d-bfa7-397528f0c374",
            //            int.Parse(AMT)
            //            , "سفارش کاربر" + Userlogin[1], host, "", "");
            //        Session["FID"] = FID;
            //        zarpay.OnPaymentAction += Zarpay_OnPaymentAction;
            //        ShowMessage SM = new ShowMessage();
            //        // SM.popupcenter(zarpay.URL + zarpay.StartPay(), sender);
            //        Response.Redirect(zarpay.URL + zarpay.StartPay());
            //    }
            //}


        }
        private void Zarpay_OnPaymentAction(object sender, zarinpal.pay.PayArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();

            var sen = (zarinpal.pay)sender;
            int Amt = sen.Amount;
            string[] Autohority = new string[8];
            Autohority[0] = e.Autohority;
            Autohority[1] = Amt.ToString();
            Autohority[2] = Userlogin[1];
            Autohority[3] = e.RefID.ToString();
            Autohority[4] = Session["FID"].ToString();

            Session["Autohority"] = Autohority;
            ME.Q_Add(@"INSERT INTO  ZarPay(MID, Authority, Date, PStatus, Amt, PackNo) 
                            VALUES (@MID, @Authority, @Date, 0, @Amt, @PackNo)");
            ME.ParamAdd("@MID", Userlogin[1]);
            ME.ParamAdd("@Authority", e.Autohority);
            ME.ParamAdd("@Date", Constants.CurDate().ToString());
            ME.ParamAdd("@Amt", Amt.ToString());
            ME.ParamAdd("@PackNo", Autohority[2]);
            ME.Run();
        }
        protected void Factors_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Userlogin != null)
            {
                ME.Q_Add(@"SELECT Id AS FId, MID,  AMT,AmtNoDisc

, OrderDate AS FDate, Case  WHEN Status= 0 and PayVoucher = 0 THEN 'پرداخت نشده هم اکنون جهت پرداخت اقدام  کنید' WHEN Status = 0 and PayVoucher > 0 then 'بخشی از فاکتور با کیف پول پرداخت شده جهت تسویه فاکتور هم اکنون از طریق درگاه بانک اقدام کنید' WHEN Status = 1 THEN 'پرداخت شده' END AS FStatus,
                               CASE SendStatus WHEN 0 THEN 'درحال بررسی' WHEN 1 THEN 'ارسال به پست' WHEN 2 THEN 'ارسال به آدرس پستی' 
                                 WHEN 3 THEN 'رسیده مرکز پستی' WHEN 4 THEN 'تحویل شده' END AS  SendStatus
                            FROM            ShopOrders SHO WHERE MID = @MID ORDER BY Id DESC ");
                ME.ParamAdd("@MID", Userlogin[1]);
                Factors_Grid.DataSource = ME._GetDataTable();
            }
        }

        protected void Payment_Click(object sender, EventArgs e)
        {
            string FID = PayHide.Value.Split(",".ToCharArray())[0];
            string PayMode = PayHide.Value.Split(",".ToCharArray())[1];

            // pay
            if (PayMode == "0")
            {

                ME.Q_Add("SELECT case when PayVoucher>0  then PayCach else AMT end as AMT FROM  ShopOrders WHERE MID = @MID AND Status = 0 AND Id = @FID ");
                ME.ParamAdd("@MID", Userlogin[1]);
                ME.ParamAdd("@FID", FID);
                string AMT = ME.GetF2Str();
                if (AMT != null && AMT != string.Empty)
                {
                    string host = string.Empty;
                    //if (HttpContext.Current.Request.IsSecureConnection)
                    //    host = "https://";
                    //else
                    host = "http://";
                    host += HttpContext.Current.Request.Url.Host;
                    host += ":" + HttpContext.Current.Request.Url.Port;
                    host += "/Shop/ShopZarPayment";
                    zarinpal.pay zarpay = new zarinpal.pay("677dd2e4-aa40-413d-bfa7-397528f0c374",
                        int.Parse(AMT)
                        , "سفارش کاربر" + Userlogin[1], host, "", "");
                    Session["FID"] = FID;
                    zarpay.OnPaymentAction += Zarpay_OnPaymentAction;
                    ShowMessage SM = new ShowMessage();
                    // SM.popupcenter(zarpay.URL + zarpay.StartPay(), sender);
                    Response.Redirect(zarpay.URL + zarpay.StartPay());
                }
            }
            //pay vucher
            if (PayMode == "1")
            {
                ShowMessage SMM = new ShowMessage();

                ME.Q_Add("SELECT AMT,PayVoucher,AmtNoDisc FROM  ShopOrders WHERE MID = @MID AND Status = 0 AND Id = @FID ");
                ME.ParamAdd("@MID", Userlogin[1]);
                ME.ParamAdd("@FID", FID);
                DataView DTshoporder = ME._GetDataView();
                if (DTshoporder.Count == 0)
                {

                    return;
                }

                string AMT = DTshoporder[0]["AmtNoDisc"].ToString();
                string AMTOrginal = DTshoporder[0]["AmtNoDisc"].ToString();
                string PayVoucher1 = DTshoporder[0]["PayVoucher"].ToString();
                double priceVucher, pricefactor;
               //get price vucher user
                GSW.Set_Uname = Userlogin;
                priceVucher = GSW.GetWalletAmount;
                //priceVucher = 1000;

                if (priceVucher <= 0)
                {
                    SMM.CreateMessageAlert("موجودی کیف پول شما کافی نمی باشد لطفا از طریق درگاه بانک اقدام نمایید", sender);
                    return;
                }
                if (double.Parse(PayVoucher1.ToString()) > 0)
                {
                    SMM.CreateMessageAlert("برای این فاکتور پرداخت از کیف پول انجام شده است لطفا برای تسویه کامل فاکتور خود پرداخت از طریف درگاه بانک را انتخاب کنید", sender);
                    return;
                }

                if (AMT != null && AMT != string.Empty)
                {
                    ME.Q_Add("select distinct  GRP,case when (Products ='' or Products is null ) then ( select top(1)  STUFF((SELECT  ','+cast([PId] AS VARCHAR ) FROM  Shop_Products WHERE  GRP  = t.GRP  FOR XML PATH('')),1,1,'')as Products   from Shop_Products t where GRP=vo.GRP ) else Products end as Products,Status from VoucherOrders vo  group by GRP, Products ,Status having Status=1");
                    DataTable DTVoucherid = ME._GetDataTable();

                    ME.Q_Add("select * from Shop_OrdersItem where OId=@FID");
                    ME.ParamAdd("@FID", FID);
                    DataTable DTOrderItem = ME._GetDataTable();

                    Double PriceOrderisVocher = 0;
                    for (int i = 0; i < DTVoucherid.Rows.Count; i++)
                    {
                        if (DTVoucherid.Rows[i]["GRP"].ToString() != "" && DTVoucherid.Rows[i]["Products"].ToString() != "")
                        {
                            //SMM.CreateMessageAlert(DTVoucherid.Rows[i]["Products"].ToString(), sender);
                            string[] vocherid = (DTVoucherid.Rows[i]["Products"].ToString()).Split(',');

                            for (int k = 0; k < vocherid.Length; k++)
                            {
                                for (int j = 0; j < DTOrderItem.Rows.Count; j++)
                                {
                                    if (DTOrderItem.Rows[j]["Pid"].ToString() == vocherid[k])
                                    {

                                        PriceOrderisVocher = PriceOrderisVocher + (int.Parse(DTOrderItem.Rows[j]["AmtNoDisc"].ToString()) + (int.Parse(DTOrderItem.Rows[j]["AmtNoDisc"].ToString()) * 9) / 100);
                                    }
                                }

                            }
                        }
                    }

                    if (PriceOrderisVocher == 0)
                    {
                        SMM.CreateMessageAlert("هیچکدام از محصولاتی که انتخاب کرده اید شرایط پرداخت از طریق کیف پول را  شامل نمی شود. لطفا پرداخت از طریق درگاه پرداخت را انتخاب نمایید.", sender);
                        return;
                    }
                    //SMM.CreateMessageAlert("PriceOrderisVocher :" + PriceOrderisVocher, sender);


                    string passprice = "false";
                    if (priceVucher > 0)
                    {
                        if ((priceVucher - PriceOrderisVocher) >= 0)
                        {
                            //SMM.CreateMessageAlert("okk", sender);
                            passprice = "true";
                        }
                        else
                        {
                            //SMM.CreateMessageAlert("not okk", sender);
                            passprice = "false";
                        }
                    }



                    if (passprice == "false")
                    {

                        pricefactor = double.Parse(AMT);
                        AMT = (pricefactor - priceVucher).ToString();
                    }
                    if (passprice == "true")
                    {

                        pricefactor = double.Parse(AMT);
                        AMT = (pricefactor - priceVucher).ToString();
                    }

                    if ((double.Parse(AMT) > 0 && passprice == "false") || (double.Parse(AMT) > 0 && passprice == "true"))
                    {
                        SMM.CreateMessageAlert("موجودی کیف پول شما کافی نمی باشد لطفا از طریق درگاه بانک اقدام نمایید", sender);
                        return;
                    }
                        //if ((double.Parse(AMT) > 0 && passprice == "false") || (double.Parse(AMT) > 0 && passprice == "true"))
                        //{
                        //    //hanoz bakhsi bedehkar ast
                        //    //در اینجا باید مبلغ فاکتور از وچر اصلی کم شود

                        //    Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
                        //    string AlertPriceVoucher = "";
                        //    MS.T_Start();

                        //    if (priceVucher - PriceOrderisVocher > 0)
                        //    {
                        //        AMT = (double.Parse(AMTOrginal) - PriceOrderisVocher).ToString();
                        //        AlertPriceVoucher = PriceOrderisVocher.ToString();
                        //        GSW.SetPayedWallet = long.Parse(PriceOrderisVocher.ToString());

                        //        MS.ParamAdd("@payVoucher", PriceOrderisVocher);
                        //        MS.ParamAdd("@payCash", double.Parse(AMT));
                        //        MS.ParamAdd("@FID", FID);
                        //    }
                        //    else if (priceVucher - PriceOrderisVocher <= 0)
                        //    {
                        //        AlertPriceVoucher = priceVucher.ToString();
                        //        GSW.SetPayedWallet = long.Parse(priceVucher.ToString());
                        //        MS.ParamAdd("@payVoucher", priceVucher);
                        //        MS.ParamAdd("@payCash", int.Parse(AMT));
                        //        MS.ParamAdd("@FID", FID);
                        //    }


                        //    MS.Q_Add(@"update ShopOrders set LastUpdate=GETDATE(), Status=0, PayVoucher=@payVoucher ,PayCach =@payCash where id=@FID");
                        //    if (MS.commit())
                        //    {
                        //        if (GSW.GetControl)
                        //        {
                        //            SMM.CreateMessageAlert("فاکتور شما از کیف پول به مبلغ:  " + AlertPriceVoucher + " پرداخت شده جهت تسویه کامل فاکتور به درگاه پرداخت منتقل می شوید", sender);
                        //        }



                        //        //    SMM.RunAnyScript(@"setTimeout(
                        //        //        function(){
                        //        //  alert('فاکتور شما از کیف پول به مبلغ:  "+ priceVucher + @"  پرداخت شده جهت تسویه کامل فاکتور به درگاه پرداخت منتقل می شوید');
                        //        //   }
                        //        //, 3000);", sender);
                        //        string host = string.Empty;
                        //        //if (HttpContext.Current.Request.IsSecureConnection)
                        //        //    host = "https://";
                        //        //else
                        //        host = "http://";
                        //        host += HttpContext.Current.Request.Url.Host;
                        //        host += ":" + HttpContext.Current.Request.Url.Port;
                        //        host += "/Shop/ShopZarPayment";
                        //        zarinpal.pay zarpay = new zarinpal.pay("677dd2e4-aa40-413d-bfa7-397528f0c374",
                        //            int.Parse(AMT)
                        //            , "سفارش کاربر" + Userlogin[1], host, "", "");
                        //        Session["FID"] = FID;
                        //        zarpay.OnPaymentAction += Zarpay_OnPaymentAction;
                        //        ShowMessage SM = new ShowMessage();
                        //        // SM.popupcenter(zarpay.URL + zarpay.StartPay(), sender);
                        //        // Response.Redirect(zarpay.URL + zarpay.StartPay());
                        //        SMM.RunAnyScript(@"setTimeout(
                        //         function(){
                        //      location.replace('" + zarpay.URL + zarpay.StartPay() + @"');
                        //       }
                        //    , 3000);", sender);

                        //        priceVucher = priceVucher - PriceOrderisVocher;
                        //    }
                        //    else
                        //    {
                        //        SMM.CreateMessageAlert("ERROR:10X6003", sender);
                        //    }



                        //}
                        //else 
                        if (double.Parse(AMT) <= 0)
                    {
                        // kamel tasviye shod
                        //در اینجا باید مبلغ فاکتور از وچر اصلی کم شود و همچنین فاکتور تسویه بخورد.
                        //SMM.CreateMessageAlert("kamel tasviye shod",sender);
                        Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
                        string IsTrue = "false";
                        if (PriceOrderisVocher == 0)
                        {
                            SMM.CreateMessageAlert("هیچکدام از محصولاتی که انتخاب کرده اید شرایط پرداخت از طریق کیف پول را  شامل نمی شود. لطفا پرداخت از طریق درگاه پرداخت را انتخاب نمایید.", sender);
                            return;
                        }
                        if (double.Parse(AMTOrginal) - PriceOrderisVocher > 0)
                        {
                            SMM.CreateMessageAlert("موجودی کیف پول شما کافی نمی باشد لطفا از طریق درگاه بانک اقدام نمایید", sender);
                            return;
                        }

                            MS.T_Start();
                        if (double.Parse(AMTOrginal) - PriceOrderisVocher == 0)
                        {
                            MS.ParamAdd("@payVoucher", PriceOrderisVocher);
                            GSW.SetPayedWallet = long.Parse(PriceOrderisVocher.ToString());
                            MS.ParamAdd("@FID", FID);
                            MS.Q_Add(@"update ShopOrders set LastUpdate=GETDATE(), Status=1, PayVoucher=@payVoucher ,PayCach =0 where id=@FID");
                            IsTrue = "true";
                        }
                        //else if (double.Parse(AMTOrginal) - PriceOrderisVocher > 0)
                        //{
                        //    MS.ParamAdd("@payVoucher", PriceOrderisVocher);
                        //    GSW.SetPayedWallet = long.Parse(PriceOrderisVocher.ToString());
                        //    MS.ParamAdd("@payCash", double.Parse(AMTOrginal) - PriceOrderisVocher);
                        //    MS.ParamAdd("@FID", FID);
                        //    MS.Q_Add(@"update ShopOrders set LastUpdate=GETDATE(), Status=0, PayVoucher=@payVoucher ,PayCach =@payCash where id=@FID");
                        //    IsTrue = "false";
                        //}

                       
                      
                        if (MS.commit())
                        {
                            if(IsTrue == "true")
                            {
                                ME.Q_Add(@"select mobile from marketers  
	                                where UserName in(select DRusername collate Persian_100_CI_AS_KS from shop_domainregister 
	                                where DRsubdomain in(select HostName from ShopOrders where id=@Fid))");
                                ME.ParamAdd("@Fid", FID);
                                String mobile = ME.GetF2Str();
                                string ss = "خریدی به شماره فاکتور : " + FID + " از سایت CHECKIT شاپ انجام شده است ";
                                //SSM.sendsmsviaMessage("mobile", ss);
                            }
                            if (GSW.GetControl)
                            {
                                SMM.CreateMessageAlert("عملیات با موفقیت انجام شد.", sender);
                                SMM.RunAnyScript(@"setTimeout(
                                function(){
                                  location.replace('Factors.aspx');
                                   }
                                , 3000);", sender);
                            }
                            
                           
                        }
                        else
                        {
                            SMM.CreateMessageAlert("ERROR:10X6002", sender);
                        }

                    }







                }

            }


        }

        protected void Factors_Grid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }
    }


}