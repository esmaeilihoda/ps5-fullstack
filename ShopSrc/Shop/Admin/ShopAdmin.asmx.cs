using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using zarinpal;
using zarinpal.ServiceReference;
namespace Shop.Shop.Admin
{
    /// <summary>
    /// Summary description for ShopAdmin
    /// </summary>
    //[WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ShopAdmin : System.Web.Services.WebService
    {
        string noac = "X0_Access Denid";
        // [WebMethod(EnableSession = true)]
        public string[] adminlogin()
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
        public string[] Userlogin()
        {
            string[] re = null;
            if (HttpContext.Current.Session["Login"] == null)
                re = null;
            else
            {
                string[] Ulogin = (string[])Session["Login"];
                if (Ulogin[0] != "OK")
                    re = null;
                //else if (Ulogin[5] != "1")
                //    re = null;
                else if (Ulogin[0] == "OK")
                {
                    re = Ulogin;
                    Ulogin = (string[])Session["Login"];
                }
            }
            return re;
        }
        [WebMethod(EnableSession = true)]
        public List<wecan> HW(string tt)
        {
            //var dd = HttpContext.Current.Session["Login"];
            //if (adminlogin())
            //    return "Hello World";
            //else
            //    return noac;
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(string));
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            wecan ec = new wecan();
            List<wecan> rt = new List<wecan>();
            ec.Id = "1";
            rt.Add(ec);
            ec.Id = "1";
            rt.Add(ec);
            ec.Id = "1";
            rt.Add(ec);
            ec.Id = "1";

            rt.Add(ec);
            return rt;
        }
        [WebMethod(EnableSession = true)]
        public string getproducts()
        {
            string HTML0 = "<div class=\"owl-stage-outer\"><div class=\"owl-stage\" style=\"transform: translate3d(0px, 0px, 0px);transition: all 0s ease 0s; width: 1416px;\">";

            string HTML = "<div class=\"owl-item active\" " +
              "	style=\"width: 226px; margin-left: 10px;\"><div class=\"single-product\"> " +
              "            <!--Product Image Start--> " +
              "            <div class=\"pro-img\"> " +
              "                <a href=\"product.html\">" +
              "                    <img class=\"primary-img\" src=\"img/products/10.jpg\" alt=\"single-product\">" +
              "                   <img class=\"secondary-img\" src=\"img/products/11.jpg\" alt=\"single-product\">" +
              "                </a>" +
              "                <div class=\"countdown\" data-countdown=\"2020/03/01\">" +
              "				<div class=\"count\"><p>00</p> <span>روز</span></div><div class=\"count\"><p>00</p> " +
              "				<span>ساعت</span></div><div class=\"count\"><p>00</p> <span>دقیقه</span></div>" +
              "				<div class=\"count\"> <p>00</p> <span>ثانیه</span></div></div>" +
              "                <a href=\"#\" class=\"quick_view\" data-toggle=\"modal\" data-target=\"#myModal\" " +
              "				data-original-title=\"مشاهده سریع\"><i class=\"lnr lnr-magnifier\"></i></a> " +
              "            </div>" +
              "            <!--Product Image End--> " +
              "            <!--Product Content Start--> " +
              "            <div class=\"pro-content\"> " +
              "                <div class=\"pro-info\"> " +
              "                    <h4><a href=\"product.html\">لباس تابستانی قرمز</a></h4> " +
              "                    <p><span class=\"price\">۴۵۳۰۰۰۰ تومان</span><del class=\"prev-price\">۳,۵۰۰,۰۰۰ تومان</del></p>" +
              "                    <div class=\"label-product l_sale\">۲۰<span class=\"symbol-percent\">%</span></div> " +
              "                </div>" +
              "                <div class=\"pro-actions\">" +
              "                    <div class=\"actions-primary\">" +
              "                        <a href=\"cart.html\" data-original-title=\"افزودن به سبد خرید\"> اضافه کردن به سبد خرید</a>" +
              "                    </div>" +
              "                    <div class=\"actions-secondary\">" +
                "                        <a href=\"compare.html\" data-original-title=\"مقایسه\"><i class=\"lnr lnr-sync\"></i> <span>افزودن برای مقایسه</span></a>" +
                "                        <a href=\"wishlist.html\" data-original-title=\"علاقمندی\"><i class=\"lnr lnr-heart\"></i> <span>افزودن به لیست علاقه مندی</span></a>" +
                "                    </div>" +
                "                </div>" +
                "            </div>" +
                "            <!--Product Content End--> " +
              "            <span class=\"sticker-new\">جدید</span>" +
              "        </div></div>";
            for (int i = 0; i < 2; i++)
            {
                HTML += HTML;
            }
            string HTMLEND = "</div></div><div class=\"owl-nav\"><div class=\"owl-prev disabled\"> " +
                   " <i class=\"lnr lnr-arrow-right\"></i></div><div class=\"owl-next\"> " +
                   "<i class=\"lnr lnr-arrow-left\"></i></div></div><div class=\"owl-dots disabled\"></div>";
            return HTML0 + HTML + HTMLEND;
        }
        [WebMethod(EnableSession = true)]
        public object Set_Get_BI(string mode, string type, int PId)
        {
            object rt = null;
            Model.EXEQ ME = new Model.EXEQ();
            if (mode == "Set")
            {
                //if (Userlogin() == null)
                //    return "برای استفاده از امکانات فروشگاه باید وارد شوید!!";
                if (type == "interest")
                {
                    if (PId != 0)
                    {
                        ME.Q_Add(@"INSERT  INTO    Shop_By_Bascket(UserCookie, PId, Type) 
                                   VALUES        (@UserCookie, @PId, 1)");
                        ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                        ME.ParamAdd("@PId", PId);
                        if (ME.Run() == "runed")
                            return "محصول به لیست علاقه مندیهای شما اضافه شد";
                    }
                }
                else if (type == "bascket")
                {
                    if (PId != 0)
                    {
                        ME.Q_Add(@"INSERT  INTO    Shop_By_Bascket(UserCookie, PId, Type) 
                                   VALUES        (@UserCookie, @PId, 0)");
                        ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                        ME.ParamAdd("@PId", PId);
                        if (ME.Run() == "runed")
                            return "محصول به سبد شما اضافه شد";
                    }
                }
            }
            else if (mode == "get")
            {
                //if (Userlogin() == null)
                //{
                //    return null;
                //}
                if (type == "interest")
                {
                    ME.Q_Add(@"SELECT        PId, PName, CASE  WHEN EndDDate >= @CurDate  AND VPrice > 0 THEN VPrice WHEN VPrice > 0 AND  EndDDate=0 THEN VPrice ELSE Price END 
                                AS NPrice, imageurl
                                      FROM            Shop_Products WHERE PId IN(
                         SELECT   PId
                                 FROM            Shop_By_Bascket WHERE Type = 1 AND UserCookie = @UserCookie ) ");

                    ME.ParamAdd("@CurDate", Constants.CurDate());
                    ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);

                    return ME.getlistjava();
                }
                else if (type == "bascket")
                {
                    ME.Q_Add(@"SELECT DISTINCT SBB.PId ,   MAX(SBB.Id) OVER (PARTITION BY SBB.Property,SBB.PId) AS ID
	                            ,(SELECT PName FROM Shop_Products SP WHERE SP.PId=SBB.PId) AS PName
	                            ,(SUM(propval)OVER (PARTITION BY SBB.Property,SBB.PId ORDER BY SBB.PId)+(COUNT(SBB.PId)OVER (PARTITION BY SBB.Property,SBB.PId ORDER BY SBB.PId)*(SELECT SUM(CASE  WHEN EndDDate >= @CurDate  AND VPrice > 0 THEN VPrice WHEN VPrice > 0 AND  EndDDate=0 THEN VPrice ELSE Price END ) FROM Shop_Products SP WHERE SP.PId=SBB.PId))) AS NPrice
	                            ,COUNT(SBB.PId) OVER (PARTITION BY SBB.Property,SBB.PId ORDER BY SBB.PId) AS CNT
	                            ,(SELECT ImageUrl FROM Shop_Products SP WHERE SP.PId=SBB.PId) AS imageurl
	                            ,( SELECT stuff( ( SELECT '
'+SPH.PName +' : ' +sp.PName FROM  Shop_Property sp  
						    LEFT JOIN Shop_Prop_Head SPH ON sp.ParentId=SPH.Id
						    WHERE  SP.Id  IN (SELECT  item FROM dbo.StringSplit(SBB.Property ,',')) FOR XML PATH('')),7,1,'')) AS Property
                            ,	SBB.Property as propertis	
												 
                            FROM Shop_By_Bascket SBB
                            WHERE TYPE=0 And UserCookie = @UserCookie 
                               ORDER BY SBB.PId,Property ASC");

                    ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                    ME.ParamAdd("@CurDate", Constants.CurDate());

                    return ME.getlistjava();

                }
            }
            else if (mode == "delete")
            {
                //if (Userlogin() == null)
                //{
                //    return null;
                //}
                if (type == "interest")
                {
                    ME.Q_Add(@"DELETE
                                 FROM  Shop_By_Bascket WHERE Type = 1 AND UserCookie = @UserCookie AND PId = @PId ");

                    ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                    ME.ParamAdd("@PId", PId);
                    ME.Run();
                }
                else if (type == "bascket")
                {
                    ME.Q_Add(@"DELETE
                                 FROM  Shop_By_Bascket WHERE Type = 0 AND UserCookie = @UserCookie AND PId = @PId ");

                    ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                    ME.ParamAdd("@PId", PId);
                    ME.Run();
                }else if (type == "bascket-item")
                {
                    ME.Q_Add(@"DELETE FROM Shop_By_Bascket WHERE Id=@ID ");
                    ME.ParamAdd("@ID", PId);
                    ME.Run();
                }
            }
            else if (mode=="Add")
            {
                if(type== "bascket-item")
                {
                    ME.Q_Add(@"INSERT INTO Shop_By_Bascket (MID,PId,Type,UserCookie,Property,propval) 
		 SELECT MID,PId,Type,UserCookie,Property,propval FROM Shop_By_Bascket WHERE Id=@ID ");
                    ME.ParamAdd("@ID", PId);
                    ME.Run();
                }
            }
            return rt;
        }

        //show order items
        public object Set_Get_SOI(string mode, string type, int FId)
        {
            object rt = null;
            Model.EXEQ ME = new Model.EXEQ();
            if (mode == "GET")
            {
                if (type == "OrderItem")
                {
                    ME.Q_Add(@"//showorder
SELECT        PId, PName,
                       ( (SELECT   SUM(propval)
                                 FROM             Shop_OrdersItem WHERE OId=@FId AND MID = 1 AND Shop_OrdersItem.PId = Shop_Products.PId ) +
                         (SELECT   Count(*)
                                 FROM             Shop_OrdersItem WHERE OId=@FId AND MID = 1 AND Shop_OrdersItem.PId = Shop_Products.PId )
                         *SUM(CASE  WHEN EndDDate >= @CurDate  AND VPrice > 0 THEN VPrice WHEN VPrice > 0 AND  EndDDate=0 THEN VPrice ELSE Price END )) AS NPrice, (SELECT   Count(*)
                                 FROM            Shop_OrdersItem WHERE OId=@FId AND MID = 1 AND Shop_OrdersItem.PId = Shop_Products.PId )
                                          AS CNT , imageurl
                                      FROM            Shop_Products WHERE PId IN(
                         SELECT   PId
                                 FROM            Shop_OrdersItem WHERE  MID = 1 AND OId=@FId ) GROUP BY PId, PName, imageurl");

                    ME.ParamAdd("@FId", FId);
                    ME.ParamAdd("@CurDate", Constants.CurDate());
                    return ME.getlistjava();
                }
            }
            return rt;
        }


        public class wecan
        {
            private string _Id;
            public string Id { get { return _Id; } set { _Id = value; } }
        }
        [WebMethod(EnableSession = true)]
        public string[] CheckOut()
        {
            string[] rt = new string[2];
            if(Userlogin() == null)
            {
                rt[0] = "Err";
                rt[1] = "جهت تکمیل سفارش یا وارد شوید یا ثبت نام کنید";
                return rt;
            }
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT PId , (SELECT CAST(Price AS nvarchar)+','+CAST(VPrice as nvarchar)+','+ CAST(EndDDate as nvarchar) AS SAa FROM [Shop_Products] WHERE Shop_Products.PId = Shop_By_Bascket.PId ) AS PDET
                   FROM [Shop_By_Bascket] WHERE UserCookie = @UserCookie AND Type = 0 AND PId IN (SELECT PId FROM Shop_Products) ");
            ME.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
            DataView PDV = ME._GetDataView();
            
            ME.Q_Add("SELECT IDENT_CURRENT('ShopOrders')+1");
            string max0 = ME.GetF2Str();
            Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
            MS.T_Start();

            int pamt = 0, tamt = 0;
            foreach(DataRowView drv in PDV)
            {
                string[] pdetail = drv[1].ToString().Split(",".ToCharArray());
                if (pdetail[1] == "0")
                    pamt = int.Parse(pdetail[0]);
                else if(Constants.CurDate() > int.Parse(pdetail[2]))
                    pamt = int.Parse(pdetail[0]);
                else
                    pamt = int.Parse(pdetail[1]);
                tamt += pamt;

                MS.ParamAdd("@OId", max0);
                MS.ParamAdd("@MID", Userlogin()[1]);
                MS.ParamAdd("@PId", drv[0].ToString());
                MS.ParamAdd("@ODate", Constants.CurDate().ToString());
                MS.ParamAdd("@Amt", pamt.ToString());
                
                MS.Q_Add(@"INSERT    
                            INTO              Shop_OrdersItem(OId, MID, PId, ODate, Qty, Amt, Prefrence, Status, SendMetod)
                              VALUES        (@OId, @MID, @PId, @ODate, 1, @Amt, 0, 0, 1)");
            }
            tamt = tamt + tamt * 9 / 100;

            HttpContext.Current.Session["shopamt"] = tamt;

            MS.ParamAdd("@MID", Userlogin()[1]);
            MS.ParamAdd("@AMT", (tamt).ToString());

            MS.Q_Add(@"INSERT 
                  INTO              ShopOrders(MID, AMT)
                   VALUES        (@MID, @AMT)");

            //-------------------------zarrinpal
            if (MS.commit())
            {
                string host = string.Empty;
                if (HttpContext.Current.Request.IsSecureConnection)
                    host = "https://";
                else
                    host = "http://";
                host += HttpContext.Current.Request.Url.Host;
                host += ":" + HttpContext.Current.Request.Url.Port;
                host += "/Account/Pay.aspx";
                zarinpal.pay zarpay = new pay("677dd2e4-aa40-413d-bfa7-397528f0c374",
                    tamt
                    , "سفارش کاربر" + Userlogin()[1], host, "", "");
                zarpay.OnPaymentAction += Zarpay_OnPaymentAction;
                 rt[1] = (zarpay.URL + zarpay.StartPay());
                rt[0] = "ok";
            }

            ////=============================end zar
            return rt;


        }
        private void Zarpay_OnPaymentAction(object sender, pay.PayArgs e)
        {          
            Model.EXEQ ME = new Model.EXEQ();
            //ME.Q_Add("SELECT Position_Amt FROM Setting WHERE Date >= " + Constants.CurDate() + " ORDER BY Date ");
            //double Amt = double.Parse(ME.GetF2Str())* double.Parse(PackNo.SelectedValue);
            //for tax
            var kj = (zarinpal.pay)sender;     
            int Amt = kj.Amount;
            string[] Autohority = new string[8];
            Autohority[0] = e.Autohority;
            Autohority[1] = Amt.ToString();
            Autohority[2] = Userlogin()[1];
            Autohority[3] = e.RefID.ToString();
            Session["Autohority"] = Autohority;
            ME.Q_Add(@"INSERT INTO  ZarPay(MID, Authority, Date, PStatus, Amt, PackNo) 
                            VALUES (@MID, @Authority, @Date, 0, @Amt, @PackNo)");
            ME.ParamAdd("@MID", Userlogin()[1]);
            ME.ParamAdd("@Authority", e.Autohority);
            ME.ParamAdd("@Date", Constants.CurDate().ToString());
            ME.ParamAdd("@Amt", Amt.ToString());
            ME.ParamAdd("@PackNo", Autohority[2]);
            ME.Run();
        }
        [WebMethod(EnableSession = true)]
        public string imonline()
        {
            Model.EXEQ ME = new Model.EXEQ();
            string rt = "OOK";            
            if (Userlogin() != null)
            {
                ME.Q_Add(@"UPDATE       Marketers
                       SET  LastOnline = GETDATE() WHERE Id = @Id ");
                ME.ParamAdd("@Id", Userlogin()[1]);
                if (ME.Run() != "runed")
                    rt = "NNOK";
            }
            else
                rt = "NOK";
            return rt;
        }
    }
}
