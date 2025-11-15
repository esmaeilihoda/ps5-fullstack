using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Class;
using System.Data;
using System.Text;
using Library;
using zarinpal.ServiceReference;

namespace Shop.Account
{
    public partial class LoanZPay : System.Web.UI.Page
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
                ME.Q_Add(@"SELECT Name, UserName, Family, EName, EFamily, Mobile                          
                           FROM  Marketers WHERE UserName = '" + DRV["PositionRecord"].ToString() + "' ");
                DataView baladv = ME._GetDataView();
                if (baladv.Count > 0)
                {
                    moaref.InnerText += ":" + baladv[0]["Name"].ToString() + " " +
                        baladv[0]["Family"].ToString();
                    moarefusername.InnerText += ":" + baladv[0]["UserName"].ToString();
                    moarefphone.InnerText += ":" + baladv[0]["Mobile"].ToString();
                    ME.Q_Add("SELECT TOP (1) DateP FROM MPay WHERE MId = '"
                        + login[1] + "' ORDER BY Id ASC ");
                    Tsabt.InnerText += ":" + Constants.DateSplit(ME.GetF2Str());
                }
                      UserName.InnerText += ":" + DRV["UserName"].ToString();
                
                if (Session["Autohority"] != null 
                    && Request.QueryString["Authority"] != null && Request.QueryString["Authority"] != "")
                {
                    string[] Autohority = (string[])Session["Autohority"];

                    PaymentGatewayImplementationServicePortTypeClient request =
                       new PaymentGatewayImplementationServicePortTypeClient();
                    long re = long.Parse(Autohority[5]);
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
                        //Autohority[0] = e.Autohority;
                        //Autohority[1] = Amt.ToString();
                        //Autohority[2] = PackNo.SelectedValue;
                        //Autohority[3] = D_Code.Value.Trim();
                        //Autohority[4] = PayType.SelectedValue;
                        Session["Autohority"] = null;
                        //   activeapck(Autohority[2], double.Parse(Autohority[1])/double.Parse(Autohority[2]),
                        //int.Parse(Autohority[4]), 0, Autohority[3]);
                        ME.Q_Add("UPDATE GetLoan SET RStatus = 1 WHERE MID = @MID AND LoanType = @LoanType ");
                        ME.ParamAdd("@MID", login[1]);
                        ME.ParamAdd("@LoanType", Autohority[2]);
                        ME.Run();
                        alarm.CssClass = "btn btn-success btn-user btn-block";
                        alarm.GroupingText = "پرداخت کارمزد وام" + Autohority[6] + " موفق بود ";
                    }
                    else
                    {
                        ME.Q_Add("UPDATE ZarPay SET PStatus = 9 WHERE MID = @MID AND Authority = @Authority ");
                        ME.ParamAdd("@MID", login[1]);
                        ME.ParamAdd("@Authority", Autohority[0]);
                        ME.Run();
                        Session["Autohority"] = null;
                        alarm.CssClass = "btn btn-danger btn-user btn-block";
                        alarm.GroupingText = " پرداخت کارمزد وام " + Autohority[6] + " ناموفق بود ";
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
                    alarm.GroupingText = " پرداخت کارمزد وام " + "" + " ناموفق بود";
                }
            }
        }
        protected string activeeapck(string packno, double PAMT, int PayT, int PCount, string D_Code)
        {
            PCount = int.Parse(packno);
            Model.EXEQ ME = new Model.EXEQ();
            bool control = true;
            ME.Q_Add("SELECT TOP (1) Direction FROM Marketers WHERE PositionRecord = @DC ");
            ME.ParamAdd("@DC", D_Code);
            string dir = ME.GetF2Str();
            if (dir == "0")
                dir = "1";
            else if (dir == "" || dir == null)
                dir = "0";

            ME.Q_Add("SELECT UserName FROM MArketers WHERE UserName = @UN ");
            ME.ParamAdd("@UN", D_Code);
            string DCC = ME.GetF2Str();

            string[] parentuname = new string[7];

            ME.Q_Add("SELECT * FROM Marketers WHERE Id= @Id ");
            ME.ParamAdd("@Id", login[1]);
            DataView UDV = ME._GetDataView();
            DataRowView UDR = UDV[0];

            string pasvand = login[4].Substring((login[4].Length - 2), 2);
            //1-----------------------------------------------------------------
            Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
            MS.T_Start();

            MS.ParamAdd("@PositionRecord", DCC);
            MS.ParamAdd("@UserName", login[4]);
            MS.ParamAdd("@PayType", PayT.ToString());

            MS.ParamAdd("@PCount", PCount.ToString());
            MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
                + dir + ", PositionRecord = @PositionRecord, PCount = @PCount WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + login[1] +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");
            if (MS.commit())
            {
                control = true;
            }
            parentuname[1] = login[4];
            if (packno == "1")
                return control.ToString();
            //2----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            string max0 = ME.GetF2Str();
            string UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 0);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[1]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            if (packno == "2")
                return control.ToString();
            parentuname[2] = UName;
            //3----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            max0 = ME.GetF2Str();
            UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 1);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[1]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            parentuname[3] = UName;
            if (packno == "3")
                return control.ToString();
            //4----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            max0 = ME.GetF2Str();
            UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 1);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[2]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            parentuname[4] = UName;
            if (packno == "4")
                return control.ToString();
            //5----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            max0 = ME.GetF2Str();
            UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 1);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[3]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            parentuname[5] = UName;
            if (packno == "5")
                return control.ToString();
            //6----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            max0 = ME.GetF2Str();
            UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 1);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[4]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            parentuname[6] = UName;
            if (packno == "6")
                return control.ToString();
            //7----------------------------------------------------------------- 
            ME.Q_Add("SELECT IDENT_CURRENT('Marketers')+1");
            max0 = ME.GetF2Str();
            UName = "WSE" + max0 + pasvand;


            ME.Q_Add(@"INSERT INTO Marketers (UserName, Name, Family, EName, EFamily, STATUS,
                       password, NationalCode, Mobile, Email, Reagent, PositionRecord, Direction) VALUES  
                          (@UserName, @Name, @Family, @EName, @EFamily, @STATUS,
                       @password, @NationalCode, @Mobile, @Email, @Reagent, @PositionRecord, @Direction)");
            ME.ParamAdd("@UserName", UName);
            ME.ParamAdd("@Name", UDR["Name"]);
            ME.ParamAdd("@Family", UDR["Family"]);
            ME.ParamAdd("@EName", UDR["EName"]);
            ME.ParamAdd("@EFamily", UDR["EFamily"]);
            //ME.ParamAdd("@PositionRecord", RG_Code.Value);Direction
            ME.ParamAdd("@Direction", 1);
            ME.ParamAdd("@Reagent", parentuname[1]);
            ME.ParamAdd("@STATUS", "1");
            ME.ParamAdd("@password", UDR["password"]);
            ME.ParamAdd("@NationalCode", UDR["NationalCode"]);
            ME.ParamAdd("@Mobile", UDR["Mobile"]);
            ME.ParamAdd("@Email", UDR["Email"]);
            ME.ParamAdd("@PositionRecord", parentuname[5]);
            if (ME.Run() != "runed")
                control = false;

            MS.T_Start();

            //MS.ParamAdd("@PositionRecord", DCC);
            //MS.ParamAdd("@UserName", login[4]);
            //MS.Q_Add("UPDATE Marketers SET [STATUS] = 1, Direction = "
            //    + dir + ", PositionRecord = @PositionRecord WHERE UserName = @UserName ");

            MS.ParamAdd("@PayType", PayT.ToString());
            MS.Q_Add(@"INSERT INTO MPay(MID, Income, DateP, PayType, ForType, Perecent)
                       VALUES(" + max0 +
                         ", " + PAMT + ", " + Constants.CurDate()
                         + ", @PayType, 1, 0)");

            if (!MS.commit())
            {
                control = false;
            }
            parentuname[5] = UName;

            return control.ToString();
        }

    }
}