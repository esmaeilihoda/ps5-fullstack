using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zarinpal;
using Shop.Class;

namespace Shop.Shop
{       
    public partial class checkout : System.Web.UI.Page
    {
        string[] Userlogin = null;
        
        
        Model.EXEQ ME = new Model.EXEQ();
        Class.GetSet_Wallet GSW = new Class.GetSet_Wallet();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            if (Session["Login"] == null)
            {
                com2login.Visible = true;
                FormAddress.Visible = false;
                codeTakhfif.Visible = false;
                paymentmethod.Visible = false;
            }
            else
            {
                com2login.Visible = false;
                FormAddress.Visible = true;
                codeTakhfif.Visible = true;
                paymentmethod.Visible = true;
            }

            Userlogin = (string[])Session["Login"];
            GSW.Set_Uname = Userlogin;
            if (Userlogin != null)
            {
                com2login.Visible = false;
            }
            ME.Q_Add("SELECT COUNT(*) FROM   Shop_By_Bascket WHERE [UserCookie] = @UserCookie AND Type = 0 AND PId IN (SELECT PId FROM Shop_Products ) ");
            ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
            if (ME.Counter() == 0)
                Response.Redirect("Shop.aspx");
            //}
            //else
            //    Response.Redirect("index.aspx");
            if (!IsPostBack)
            {
                ME.Q_Add("SELECT * FROM States ");
                state.DataSource = ME._GetDataTable();
                state.DataTextField = "StateName";
                state.DataValueField = "StateId";
                state.DataBind();
            }
            if (!IsPostBack && (Userlogin != null))
            {
                ME.Q_Add("SELECT Name, Family, Address, City, PostalCode, Email, Mobile, State FROM Marketers WHERE Id = @Id ");
                ME.ParamAdd("@Id", Userlogin[1]);
                DataView MSS = ME._GetDataView();

                name.Value = MSS[0]["Name"].ToString();
                Family.Value = MSS[0]["Family"].ToString();
                Address.Value = MSS[0]["Address"].ToString();
                City.Value = MSS[0]["City"].ToString();
                Email.Value = MSS[0]["Email"].ToString();
                Mobile.Value = MSS[0]["Mobile"].ToString();
                PostalCode.Value = MSS[0]["PostalCode"].ToString();
                state.Value = MSS[0]["State"].ToString();
            }

            
                Btndiscount.ServerClick += new EventHandler(Btndiscount_click);
           
        }

        protected void Btndiscount_click(object sender,EventArgs e)
        {
            ShowMessage SMM = new ShowMessage();
            //SMM.CreateMessageAlert(Inputdiscount.Value.ToString(),sender);
            if (Inputdiscount.Value == "")
            {
                SMM.CreateMessageAlert("لطفا کوپن تخفیف خود را وارد نمایید",sender);
                return;
            }
            if(Inputdiscount.Value != "")
            {
                ME.Q_Add(@"SELECT mk.id   FROM[RozCards] RC
                            LEFT JOIN Marketers mk ON RC.MID = mk.Id
                            WHERE Rc.Status = 1 AND UserName =@UserName ");
                ME.ParamAdd("@UserName", Inputdiscount.Value);
                string IdUserCopen=ME.GetF2Str();
                if(IdUserCopen== Userlogin[1])
                {
                        double[] SP = SumPruduct();

                        SMM.RunAnyScript(@"$('.totalsum').html('" + SP[0] + " تومان <br><span style=text-decoration-line:line-through;color:red;> " + SP[2] + @" تومان </span>');
                       $('.copen').text('" + SP[1] + @" تومان');
                    ", sender);
                }
                else
                {
                    SMM.CreateMessageAlert("کد تخفیف وارد شده وجود ندارد", sender);
                    return;
                }
                
            }
        }


        protected void CheckOut_Click(object sender, EventArgs e)
        {
            
            ShowMessage SMM = new ShowMessage();
            if (Userlogin == null)
            {
                SMM.CreateMessageAlert("برای نهایی کردن خرید و صدور فاکتور لطفا وارد شوید.", sender);
                SMM.RunAnyScript(@"document.body.innerHTML = 'در حال انتقال به صفحه ورود';", sender);
                SMM.RunAnyScript(@"setTimeout(
                    function(){
                          location.replace('../Account/Login.aspx?ComeBack=~/Shop/checkout.aspx');
                           }
                        , 3000);", sender);

                return;
            }
            ME.Q_Add(@"UPDATE Marketers SET Address = @Address, State = @State, City =@City, Postalcode = @Postalcode, Email =@Email, Mobile = @Tell 
                                                      WHERE Id = @Id ");
            ME.ParamAdd("@Address", Address.Value);
            ME.ParamAdd("@State", state.Value);
            ME.ParamAdd("@City", City.Value);
            ME.ParamAdd("@Postalcode", PostalCode.Value);
            ME.ParamAdd("@Email", Email.Value);
            ME.ParamAdd("@Tell", Mobile.Value);
            ME.ParamAdd("@Id", Userlogin[1]);
            if (ME.Run() != "runed")
            {
                SMM.CreateMessageAlert("فیلدها را چک کنید", sender);
                return;
            }


            ME.Q_Add(@"SELECT PId , (SELECT CAST(Price AS nvarchar)+','+CAST(VPrice as nvarchar)+','+ CAST(EndDDate as nvarchar)+','+CAST(Disc as nvarchar) AS SAa FROM [Shop_Products] WHERE Shop_Products.PId = Shop_By_Bascket.PId ) AS PDET
                 , Property, propval  FROM [Shop_By_Bascket] WHERE UserCookie = @UserCookie AND Type = 0 AND PId IN (SELECT PId FROM Shop_Products) ");
            ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
            DataView PDV = ME._GetDataView();

            ME.Q_Add("SELECT IDENT_CURRENT('ShopOrders')+1");
            string max0 = ME.GetF2Str();

           

            Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
            MS.T_Start();

            int pamt = 0, AMTNoDisc = 0; string rt = "";
            double tamt = 0, percentdisc=0, TamtDisc=0, TamtDiscpercent=0, TamtDiscpercent1=0, TamtDisc1=0;
            foreach (DataRowView drv in PDV)
            {
                string[] pdetail = drv[1].ToString().Split(",".ToCharArray());
                if (pdetail[1] == "0")
                    pamt = int.Parse(pdetail[0]);
                else if (Constants.CurDate() > int.Parse(pdetail[2]) && int.Parse(pdetail[2]) != 0)
                    pamt = int.Parse(pdetail[0]);
                else
                    pamt = int.Parse(pdetail[1]);
                tamt += pamt;
                tamt += int.Parse((drv["Propval"].ToString()));
                AMTNoDisc += int.Parse(pdetail[0]);
                AMTNoDisc += int.Parse((drv["Propval"].ToString()));
                int disc = int.Parse(pdetail[3]);
                percentdisc = GSW.GetUserDiscount;
                double ResultDisc = disc * 5 * percentdisc;
                TamtDisc += (pamt+ int.Parse((drv["Propval"].ToString()))) - (pamt+ int.Parse((drv["Propval"].ToString()))) * ResultDisc / 100;
                TamtDisc1 = (pamt+ int.Parse((drv["Propval"].ToString()))) - (pamt+ int.Parse((drv["Propval"].ToString()))) * ResultDisc / 100;
                TamtDisc1 = Math.Round(TamtDisc1);

                TamtDiscpercent += (pamt+ int.Parse((drv["Propval"].ToString()))) * ResultDisc / 100;
                TamtDiscpercent1 = (pamt+ int.Parse((drv["Propval"].ToString()))) * ResultDisc / 100;
                TamtDiscpercent1 = Math.Round(TamtDiscpercent1);

                MS.ParamAdd("@Property", drv["Property"].ToString());
                MS.ParamAdd("@Propval", drv["Propval"].ToString());

                MS.ParamAdd("@OId", max0);
                MS.ParamAdd("@MID", Userlogin[1]);
                MS.ParamAdd("@PId", drv[0].ToString());
                MS.ParamAdd("@ODate", Constants.CurDate().ToString());
                MS.ParamAdd("@Amt", pamt.ToString());
                MS.ParamAdd("@AmtNoDisc", (int.Parse(pdetail[0].ToString())+ int.Parse((drv["Propval"].ToString()))).ToString() );
                if (Inputdiscount.Value != "")
                {
                    ME.Q_Add(@"SELECT mk.id   FROM[RozCards] RC
                            LEFT JOIN Marketers mk ON RC.MID = mk.Id
                            WHERE Rc.Status = 1 AND UserName =@UserName ");
                    ME.ParamAdd("@UserName", Inputdiscount.Value);
                    string IdUserCopen = ME.GetF2Str();
                    if (IdUserCopen == Userlogin[1])
                    {
                        MS.ParamAdd("@AMTWithDiscCopen", TamtDisc1.ToString());
                        MS.ParamAdd("@AMTPercentDiscCopen", TamtDiscpercent1.ToString());
                        MS.ParamAdd("@PercentDiscCopen", ResultDisc.ToString());
                    }
                    else
                    {
                        MS.ParamAdd("@AMTWithDiscCopen", (0).ToString());
                        MS.ParamAdd("@AMTPercentDiscCopen", (0).ToString());
                        MS.ParamAdd("@PercentDiscCopen", (0).ToString());
                    }
                   
                }
                if (Inputdiscount.Value == "")
                {
                    MS.ParamAdd("@AMTWithDiscCopen", (0).ToString());
                    MS.ParamAdd("@AMTPercentDiscCopen", (0).ToString());
                    MS.ParamAdd("@PercentDiscCopen", (0).ToString());
                }
                MS.ParamAdd("@HostName", Class.CookieControl.GetDomainName);

                MS.Q_Add(@"INSERT    
                            INTO              Shop_OrdersItem(OId, MID, PId, ODate, Qty, Amt, Prefrence, Status, SendMetod, HostName , Property, propval,AmtNoDisc,AMTWithDiscCopen,AMTPercentDiscCopen,PercentDiscCopen)
                              VALUES        (@OId, @MID, @PId, @ODate, 1, @Amt, 0, 0, 1, @HostName, @Property, @Propval,@AmtNoDisc,@AMTWithDiscCopen,@AMTPercentDiscCopen,@PercentDiscCopen)");
            }

            MS.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
            MS.Q_Add(@"DELETE FROM Shop_By_Bascket WHERE UserCookie = @UserCookie");
            //قیمت با کپن تخفیف
            TamtDisc = TamtDisc + TamtDisc * 9 / 100;
            TamtDisc = Math.Round(TamtDisc);
            //مقدار تخفیف داده شده
            TamtDiscpercent = TamtDiscpercent + TamtDiscpercent * 9 / 100;
            TamtDiscpercent = Math.Round(TamtDiscpercent);
            //قیمت با تخفیف اصلی
            tamt = tamt + tamt * 9 / 100;
            tamt = Math.Round(tamt);


            AMTNoDisc = AMTNoDisc + AMTNoDisc * 9 / 100;


            if (Inputdiscount.Value != "")
            {
                ME.Q_Add(@"SELECT mk.id   FROM[RozCards] RC
                            LEFT JOIN Marketers mk ON RC.MID = mk.Id
                            WHERE Rc.Status = 1 AND UserName =@UserName ");
                ME.ParamAdd("@UserName", Inputdiscount.Value);
                string IdUserCopen = ME.GetF2Str();
                if (IdUserCopen == Userlogin[1])
                {
                    HttpContext.Current.Session["Shopamt"] = TamtDisc;
                    MS.ParamAdd("@AMT", (TamtDisc).ToString());
                    MS.ParamAdd("@CopenCodeDisc", Inputdiscount.Value);
                    MS.ParamAdd("@CopenPercentDisc", percentdisc);
                    MS.ParamAdd("@AmtNoCopenDesc", (tamt).ToString());
                    MS.ParamAdd("@AmtPercentDisc", (TamtDiscpercent).ToString());
                }
                else
                {
                    HttpContext.Current.Session["Shopamt"] = tamt;
                    MS.ParamAdd("@AMT", (tamt).ToString());
                    MS.ParamAdd("@CopenCodeDisc", "");
                    MS.ParamAdd("@CopenPercentDisc", (0).ToString());
                    MS.ParamAdd("@AmtNoCopenDesc", (0).ToString());
                    MS.ParamAdd("@AmtPercentDisc", (0).ToString());
                }
                
                  
            }
            if (Inputdiscount.Value == "")
            {
                HttpContext.Current.Session["Shopamt"] = tamt;
                MS.ParamAdd("@AMT", (tamt).ToString());
                MS.ParamAdd("@CopenCodeDisc", "");
                MS.ParamAdd("@CopenPercentDisc", (0).ToString());
                MS.ParamAdd("@AmtNoCopenDesc", (0).ToString());
                MS.ParamAdd("@AmtPercentDisc", (0).ToString());
            }

            MS.ParamAdd("@MID", Userlogin[1]);
            MS.ParamAdd("@AmtNoDisc", (AMTNoDisc).ToString());
            MS.ParamAdd("@OrderDate", Constants.CurDate());
            MS.ParamAdd("@HostName", Class.CookieControl.GetDomainName);
            
            

            MS.Q_Add(@"INSERT 
                  INTO              ShopOrders(MID, AMT, OrderDate, HostName,AmtNoDisc,CopenCodeDisc,CopenPercentDisc,AmtNoCopenDesc,AmtPercentDisc)
                   VALUES        (@MID, @AMT, @OrderDate, @HostName,@AmtNoDisc,@CopenCodeDisc,@CopenPercentDisc,@AmtNoCopenDesc,@AmtPercentDisc)");

            //-------------------------zarrinpal
            if (MS.commit())
            {
                SMM.CreateMessageAlert("یک صورتحساب برای شما ایجاد گردید جهت پرداخت اقام نمایید", sender);
                SMM.RunAnyScript(@"document.body.innerHTML = 'در حال انتقال به بخش فاکتور';", sender);

                SMM.RunAnyScript(@"setTimeout(
                    function(){
                          location.replace('Factors.aspx');
                           }
                        , 3000);", sender);

                //string host = string.Empty;
                //if (HttpContext.Current.Request.IsSecureConnection)
                //    host = "https://";
                //else
                //    host = "http://";
                //host += HttpContext.Current.Request.Url.Host;
                //host += ":" + HttpContext.Current.Request.Url.Port;
                //host += "/Account/Pay.aspx";
                //zarinpal.pay zarpay = new pay("677dd2e4-aa40-413d-bfa7-397528f0c374",
                //    tamt
                //    , "سفارش کاربر" + Userlogin[1], host, "", "");

                //zarpay.OnPaymentAction += Zarpay_OnPaymentAction;
                //ShowMessage SM = new ShowMessage();
                //SM.popupcenter(zarpay.URL + zarpay.StartPay(), sender);
            }
            else
                SMM.CreateMessageAlert("ERROR:10X3521", sender);
            ////=============================end zar
            //Console.WriteLine(rt);

        }
        private void Zarpay_OnPaymentAction(object sender, pay.PayArgs e)
        {
            if (Session["Login"] != null)
                com2login.Visible = true;
            Model.EXEQ ME = new Model.EXEQ();
            //ME.Q_Add("SELECT Position_Amt FROM Setting WHERE Date >= " + Constants.CurDate() + " ORDER BY Date ");
            //double Amt = double.Parse(ME.GetF2Str())* double.Parse(PackNo.SelectedValue);
            //for tax
            var sen = (zarinpal.pay)sender;
            int Amt = sen.Amount;
            string[] Autohority = new string[8];
            Autohority[0] = e.Autohority;
            Autohority[1] = Amt.ToString();
            Autohority[2] = Userlogin[1];
            Autohority[3] = e.RefID.ToString();
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

        private double[] SumPruduct()
        {
            ME.Q_Add(@"SELECT PId , (SELECT CAST(Price AS nvarchar)+','+CAST(VPrice as nvarchar)+','+ CAST(EndDDate as nvarchar)+','+CAST(Disc as nvarchar) AS SAa FROM [Shop_Products] WHERE Shop_Products.PId = Shop_By_Bascket.PId ) AS PDET
                 , Property, propval  FROM [Shop_By_Bascket] WHERE UserCookie = @UserCookie AND Type = 0 AND PId IN (SELECT PId FROM Shop_Products) ");
            ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
            DataView PDV1 = ME._GetDataView();

            
            int pamt = 0, AMTNoDisc = 0; 
            double tamt = 0;
            double TamtDisc = 0,TamtDiscpercent=0;
            double percentdisc=0;
            foreach (DataRowView drv1 in PDV1)
            {
                string[] pdetail = drv1[1].ToString().Split(",".ToCharArray());
                if (pdetail[1] == "0")
                    pamt = int.Parse(pdetail[0]);
                else if (Constants.CurDate() > int.Parse(pdetail[2]) && int.Parse(pdetail[2]) != 0)
                    pamt = int.Parse(pdetail[0]);
                else
                    pamt = int.Parse(pdetail[1]);
                tamt += pamt;
                tamt += int.Parse((drv1["Propval"].ToString()));
                AMTNoDisc += int.Parse(pdetail[0])+ int.Parse((drv1["Propval"].ToString()));
                int disc= int.Parse(pdetail[3]);
                 percentdisc = GSW.GetUserDiscount;
                double ResultDisc = disc * 5 * percentdisc;
                 TamtDisc += (pamt+ int.Parse((drv1["Propval"].ToString()))) - (pamt+ int.Parse((drv1["Propval"].ToString()))) * ResultDisc / 100;
                TamtDiscpercent +=(pamt+ int.Parse((drv1["Propval"].ToString()))) * ResultDisc / 100;
            }



            TamtDisc = TamtDisc + TamtDisc * 9 / 100;
            TamtDisc= Math.Round(TamtDisc);
            TamtDiscpercent = TamtDiscpercent + TamtDiscpercent * 9 / 100;
            TamtDiscpercent = Math.Round(TamtDiscpercent);
            tamt = tamt + tamt * 9 / 100;
            tamt = Math.Round(tamt);



            return new double[3] { TamtDisc, TamtDiscpercent, tamt  };
        }

        public string[] adminlogin1()
        {
            string[] re = null;
            if (HttpContext.Current.Session["Login"] == null)
                re = null;
            else
            {
                string[] Ulogin = (string[])Session["Login"];
                if (Ulogin[0] != "OK")
                    re = null;
                else if (Ulogin[5] != "1")
                    re = null;
                else if (Ulogin[0] == "OK" && Ulogin[5] == "1")
                {
                    re = Ulogin;
                    Ulogin = (string[])Session["Login"];
                }
            }
            return re;
        }

    }
}