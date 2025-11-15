using Shop.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using Shop;
namespace Shop.Account
{
    public partial class iindex : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/shop/admin/shoppages");
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            string[] login = (string[])Session["Login"];

            if (login[1] == "41")
            {
                //coinsdivhtml.Style.Add("display", "none");
                tuuur.Visible = false;
                hebeee.Visible = false;

            }

            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add("SELECT MobVerify, PStatus, WalletId FROM MArketers WHERE Id = @Id ");
            ME.ParamAdd("@Id", login[1]);
            DataView dv = ME._GetDataView();
            if (dv != null && dv[0]["MobVerify"].ToString() != "1")
            {
                Response.Redirect("Verify.aspx");
            }
            else if (dv != null && dv[0]["PStatus"].ToString() != "1")
            {
                Response.Redirect("MyProfile.aspx");
            }
            disnmae.InnerText += "_" + login[4];

            ME.Q_Add(@"SELECT  TOP(1) Message FROM  Alarms ORDER BY  EDate DESC ");
            string mese = ME.GetF2Str();
            if (mese.Length > 0)
            {
                Alarms.Visible = true;
                Alarms.InnerHtml = mese;
            }
            else
            {
                Alarms.Visible = false;
            }
            if (!IsPostBack)
            {
                ME.Q_Add("SELECT '*'+ Name + ' ' + Family + ' عزیز خوش آمدید* ' FROM Marketers WHERE Id = @Id  ");
                ME.ParamAdd("@Id", login[1]);
                sefareshimohammad.InnerText = ME.GetF2Str();

            }
            //Class.TreeQ TQ = new Class.TreeQ();
            //TQ.setusername(login[4]);
            //Rchild.InnerText = TQ.GetRightCount().ToString();
            //Lchild.InnerText = TQ.GetLeftCount().ToString();

            //Class.BinaryPay BP = new Class.BinaryPay();
            //BP.setpaydata();
            //BP.setusername(login[4]);
            ////DP.Rows.Add(R, L, P, SL, SR, SP, SUMP, DayP, kif, PDat, BalR);
            //DataTable DPT = BP.Process();

            //ME.Q_Add(@"SELECT sum(Income) AS TIN
            //      FROM MPay_Dir
            //    where mid ="+login[1]+" AND ForType = 3 ");
            //string Payed = ME.GetF2Str();
            //varizi.InnerText = Payed;

            //ME.Q_Add(@"SELECT   SUM(LOAN) AS TLOAN FROM   LOANS
            //    where MID =" + login[1] + " ");
            //string Loans = ME.GetF2Str();
            //loan.InnerText = Loans;

            //ME.Q_Add(@"SELECT  SUM(Income) FROM Wallet WHERE MID = @MID AND ForType = 3");
            //ME.ParamAdd("@MID", login[1]);
            //int pazkif = int.Parse(ME.GetF2Str());

            //kife.InnerText = (int.Parse(Loans) - pazkif).ToString();

       
       
            // ME.Q_Add("SELECT COUNT(*) FROM M5Pay WHERE (ForType = 1)  AND PayType IN("
            //     + Constants.get_pack_paytypes
            //+ ") AND MID = @MID ");
            // ME.ParamAdd("@MID", login[1]);

            // if (ME.Counter() != 0)
            // {
            
            //-------------------------show chart




            ME.Q_Add("SELECT COUNT(*) FROM M5Pay WHERE (ForType = 1)  AND PayType IN("
                            + Constants.get_pack_paytypes
                             + ") AND MID = @MID ");
            ME.ParamAdd("@MID", login[1]);

            //if (ME.Counter() != 0)
            //{
            //    if (mandepoor5plan > 0)
            //    {
            //        //CoinApi CA = new CoinApi();
            //        //CA.curencyname = "USD";
            //        //CA.amount = "1";
            //        //CA.coinsymname = CoinsList.SelectedValue;
            //        //CA.getvalfromapi();
            //        //if (!CA.CTRL)
            //        //{
            //        //    //mandekif.InnerText = "خطای Api_Control";
            //        //    return;
            //        //}             

            //        Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
            //        MS.T_Start();
            //        ME.Q_Add(@"SELECT ExCoef FROM Coins WHERE sample = @sample ");
            //        ME.ParamAdd("@sample", "MTT");
            //        double ExCoef = double.Parse(ME.GetF2Str());

            //        MS.ParamAdd("@MID", login[1]);
            //        MS.ParamAdd("@Income", mandepoor5plan.ToString());
            //        MS.ParamAdd("@ExCoef", ExCoef.ToString());
            //        MS.ParamAdd("@DateP", Constants.CurDate().ToString());

            //        MS.Q_Add(@"INSERT  
            //              INTO              M5Pay(MID, Income, DateP, PayType, ForType, Perecent, ExCoef)
            //               VALUES        (@MID, @Income, @DateP, 6, 3, 0, 0)  ");

            //        ME.Q_Add("SELECT WalletId FROM Marketers WHERE Id = 1 ");

            //        MS.ParamAdd("@FWallet", ME.GetF2Str());
            //        MS.ParamAdd("@TWallet", login[6]);
            //        MS.ParamAdd("@MID", login[1]);
            //        MttApi ma = new MttApi();
            //        ma.getvalfromapi();
            //        double fiat = ma.getprice;
            //        double cmount = mandepoor5plan / fiat;
            //        MS.ParamAdd("@Amount", cmount.ToString());
            //        MS.ParamAdd("@ExCoef", ExCoef.ToString());
            //        MS.ParamAdd("@PDate", Constants.CurDate().ToString());

            //        ME.Q_Add(@"SELECT Id FROM Coins WHERE sample = @sample ");
            //        ME.ParamAdd("@sample", "MTT");
            //        MS.ParamAdd("@PlanT", 5.ToString());
            //        MS.ParamAdd("@CID", ME.GetF2Str());


            //        MS.Q_Add(@"INSERT
            //          INTO   Coin_Exch(MID, CID, FWallet, TWallet, Amount, Status, PDate, ExCoef, Mode, Type, PlanT)
            //           VALUES        (@MID, @CID, @FWallet, @TWallet, @Amount, 1, @PDate, 0, 1, 1, @PlanT)");

            //        if (MS.commit())
            //        {
            //            SM.CreateMessageAlert("تبادل برای پلن توربو با موفقیت انجام شد!!!", sender);
            //        }
            //        else
            //        {
            //            SM.CreateMessageAlert("اشکال در  تبادل برای پلن توربو با پشتیبانی تماس بگیرید", sender);
            //        }

            //    }
            //}
            //else
            //    turbodv.Visible = false;
            //--------------------مشاهده پورسانت مشارکت در فروش--------------------
            string Hostname = Class.CookieControl.GetDomainName;
            Account.iindex ds = new Account.iindex();
            double[] clho = ds.CalcPHost(Hostname, login[4], int.Parse(login[1]));
            pkhodesh.InnerHtml = clho[0].ToString() + " تومان";
            pbalasari.InnerHtml = clho[1].ToString() + " تومان";
            sumIncomeHost.InnerHtml = clho[3].ToString() + " تومان";
            SumAll.InnerHtml = clho[2].ToString() + " تومان";
            //------------------مشاهده تعداد آمار بازدید از سایت------------------
            string[] vistch= ds.visitcount(Hostname, login[4]);
            visitCountshow.InnerText = Constants.sepnum( vistch[0].ToString());
            showshop.InnerHtml = "<a style='font-size: 20px;' href='http://" + vistch[1].ToString()+"/'>مشاهده سایت</a>";
        }
        public DataView coinsdv()
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT     Id, currencyname, sample, PriceUSD, Stock, USD2IRR, LastUpdate, UpdateStatus, Status, UpTime, Error
                        FROM            Coins WHERE Status = 1 ");
            return ME._GetDataView();
        }
        public double[] MandeCoin(string coinid)
        {
            string[] login = (string[])Session["Login"];
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT ISNULL(SUM([Amount]),0) AS Coi
                           FROM [Coin_Exch] WHERE TWallet = @MID AND CID = @Id  ");
            ME.ParamAdd("@MID", login[6]);
            ME.ParamAdd("@Id", coinid);

            double incoin = double.Parse(ME.GetF2Str());

            ME.Q_Add(@"SELECT ISNULL(SUM([Amount]),0) AS Coi
                           FROM [Coin_Exch] WHERE  FWallet = @MID AND CID = @Id ");
            ME.ParamAdd("@MID", login[6]);
            ME.ParamAdd("@Id", coinid);

            double oucoin = double.Parse(ME.GetF2Str());

            double mandecoin = incoin - oucoin;

            ME.Q_Add("SELECT TOP(1) USD2IRR FROM Coins ");
            double USD2IRR = double.Parse(ME.GetF2Str());

            double[] rtd = new double[4];
            rtd[3] = USD2IRR;
            rtd[0] = incoin; rtd[1] = oucoin; rtd[2] = mandecoin;

            return rtd;
        }
        public string[] logined()
        {
            return (string[])Session["Login"];
        }

        public double[] CalcPHost(string HostName,string UserName,int UserID)
        {
            Model.EXEQ ME = new Model.EXEQ();
            double pkhodesh1 = 0, pbalasari1 = 0, sumall1 = 0,sumincome=0;
            ME.Q_Add(@"SELECT COUNT(*) FROM shop_domainregister WHERE DRusername = @DRusername  AND DRsubdomain = @DRsubdomain");
            ME.ParamAdd("@DRsubdomain", HostName);
            ME.ParamAdd("@DRusername", UserName);
            if (ME.Counter() == 1) 
            { 
             
                //mohasebeh porsant khodesh
                ME.Q_Add(@"SELECT CAST( ISNULL( SUM( CAST((((SPI.AMT+SPI.Propval-ISNULL(SPI.AMTPercentDiscCopen,0))+((SPI.AMT+SPI.Propval-ISNULL(SPI.AMTPercentDiscCopen,0)))*9/100))*sp.SPercent as decimal(18,2))/100),0) AS decimal(18,0)) as pkhodesh
                          FROM Shop_OrdersItem SPI 
                          LEFT JOIN Shop_Products SP ON SP.PId=SPI.PId
                         WHERE OID IN(SELECT ID FROM ShopORDERS WHERE HOSTNAME=@hostname AND Status=1 AND PayCach=0 AND PayVoucher=0) ");
                ME.ParamAdd("@hostname", HostName);
           
                pkhodesh1 = double.Parse(ME.GetF2Str());
           
                ME.Q_Add(@"SELECT CAST( ISNULL( SUM( CAST((((SPI.AMT+SPI.Propval-ISNULL(SPI.AMTPercentDiscCopen,0))+((SPI.AMT+SPI.Propval-ISNULL(SPI.AMTPercentDiscCopen,0)))*9/100))*sp.SPercent as decimal(18,2))/100),0) AS decimal(18,0))  as pblasari
                          FROM Shop_OrdersItem SPI 
                          LEFT JOIN Shop_Products SP ON SP.PId=SPI.PId
                         WHERE OID IN(SELECT ID FROM ShopORDERS WHERE Status=1 AND PayCach=0 AND PayVoucher=0 AND HOSTNAME IN (
 
	                        SELECT DRsubdomain FROM shop_domainregister WHERE DRusername IN(SELECT UserName COLLATE  Persian_100_CI_AI_KS  FROM Marketers WHERE PositionRecord=@UserPositionRecord)
                         )) 
                ");
                ME.ParamAdd("@UserPositionRecord", UserName);
                pbalasari1 = double.Parse(ME.GetF2Str());

                ME.Q_Add("SELECT ISNULL(SUM(Income),0)SumIncome FROM Shop_PercentHost WHERE MID=@MID and PayStatus=1");
                ME.ParamAdd("@MID", UserID);
                sumincome = double.Parse(ME.GetF2Str());

                sumall1 = (pkhodesh1 + pbalasari1)- sumincome;
            }
            return new double[4] { pkhodesh1, pbalasari1, sumall1,sumincome };
           
        }

        public String[] visitcount(string hostname ,string username)
        {
            Model.EXEQ ME = new Model.EXEQ();
            string vicount = "0", domName = "";
            ME.Q_Add(@"SELECT COUNT(*) FROM shop_domainregister WHERE DRusername = @DRusername  AND DRsubdomain = @DRsubdomain");
            ME.ParamAdd("@DRsubdomain", hostname);
            ME.ParamAdd("@DRusername", username);
            if (ME.Counter() == 1)
            {
                ME.Q_Add("SELECT Count(*) as visitcount,DomainName FROM Shop_DomainVisit WHERE DomainName=@DomainName group by DomainName");
                ME.ParamAdd("@DomainName", hostname);
                DataView dv1 = ME._GetDataView();
                vicount= dv1[0]["visitcount"].ToString();
                domName = dv1[0]["DomainName"].ToString();
            }
                return new string[2] { vicount, domName };
        }
    }
}