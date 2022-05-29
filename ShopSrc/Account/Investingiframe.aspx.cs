using Shop.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Library;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Account
{
    public partial class Investingiframe : System.Web.UI.Page
    {
        DataTable GSource = new DataTable();
        string[] login = null;
        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
                disnmae.InnerText += "_" + login[4];
            }

            ME.Q_Add(@"SELECT       Id, MID, DSC, PDate, Amt, '4' AS Perecent, Amt*4/100 AS Benefit, CASE Type 
                     WHEN 1 THEN 'واریز' WHEN 3 THEN 'برداشت' END AS Type , 
                      CASE Status WHEN 0 THEN 'ناموفق' WHEN 1 THEN 'موفق' END AS Status, TDate, DollarCount
                       FROM  Investing WHERE MID = @MID AND Status > 0 ");
            ME.ParamAdd("@MID", login[1]);
            GSource = ME._GetDataTable();

            //------------------lvl0-----------------------

            ME.Q_Add(@"SELECT  (SUM(Amt)*4/100) AS SDD
                       FROM  Investing WHERE MID IN(" + login[1] + ") AND Status > 0 ");
            double am0 = double.Parse(ME.GetF2Str());
            //------------------lvl1-----------------------
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 1 ");
            ME.ParamAdd("@BID", login[1]);
            string LVLA = string.Join(",", ME._GetF2Array("MID"));
            if (LVLA == "")
                LVLA = "0";

            ME.Q_Add(@"SELECT  (SUM(Amt)*1/100) AS SDD
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            double am1 = double.Parse(ME.GetF2Str());
            //-----------------------------------      
            //------------------lvl2-----------------------
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 2 ");
            ME.ParamAdd("@BID", login[1]);
            LVLA = string.Join(",", ME._GetF2Array("MID"));
            if (LVLA == "")
                LVLA = "0";

            ME.Q_Add(@"SELECT  (SUM(Amt)*1/100) AS SDD
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            double am2 = double.Parse(ME.GetF2Str());
            //-----------------------------------   
            //------------------lvl3-----------------------
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 3 ");
            ME.ParamAdd("@BID", login[1]);
            LVLA = string.Join(",", ME._GetF2Array("MID"));
            if (LVLA == "")
                LVLA = "0";

            ME.Q_Add(@"SELECT  (SUM(Amt)*1/100) AS SDD
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            double am3 = double.Parse(ME.GetF2Str());
            //-----------------------------------   
            double suulvl = am0 + am1 + am2 + am3;
            double suulvlsal = (am0 + am1 + am2 + am3) * 12;
            string sall = Constants.sepnum(suulvlsal.ToString());
            string mah = Constants.sepnum(suulvl.ToString());
            Hsal.InnerText = "سود سالیانه مشارکت : " + sall;
            HMah.InnerText = "سود ماهیانه مشارکت : " + mah;


            //------------------------SUMER Botom  Benefit----------------------------
            ME.Q_Add(@"SELECT         SUM(AMT)
                       FROM            Invest_SelfP
                         WHERE MID = @MID AND Type = 1");
            ME.ParamAdd("@MID", login[1]);

            double selsum = double.Parse(ME.GetF2Str());

            ME.Q_Add(@"SELECT  SUM(AMT)
                      FROM            dbo.Invest_TeamP
                       WHERE BID = @MID AND Type = 1 ");
            ME.ParamAdd("@MID", login[1]);

            selsum += double.Parse(ME.GetF2Str());

            ME.Q_Add(@"SELECT         SUM(AMT)
                       FROM            Invest_SelfP
                         WHERE MID = @MID AND Type = 3");
            ME.ParamAdd("@MID", login[1]);

            double selsumOut = double.Parse(ME.GetF2Str());

            double stock = selsum - selsumOut;

            SUMMT.InnerText = "سود تا این لحظه : " + Constants.sepnum(selsum.ToString());
            Payed.InnerText = "برداشت تا این لحظه : " + Constants.sepnum(selsumOut.ToString()); ;
            SStock.InnerText = "مانده : " + Constants.sepnum(stock.ToString()); ;


        }

        protected void Marketers_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Marketers_Grid.DataSource = GSource;
        }

        protected void Marketers_Grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //if (e.CommandName == "FillLOAN")
            //{
            //    Model.EXEQ MD = new Model.EXEQ();
            //    MD.Q_Add(@"SELECT  [Id]      
            //                          ,[LOAN]      
            //                              FROM LOANS WHERE MID = @MID ");
            //    MD.ParamAdd("@MID", Marketers_Grid.Items[e.Item.ItemIndex]["Id"].Text);
            //    LOANGRID.DataSource = MD._GetDataTable();
            //    LOANGRID.DataBind();
            //}
        }

        protected void Register_Click(object sender, EventArgs e)
        {

        }

        protected void InvA_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 1 ");
            ME.ParamAdd("@BID", login[1]);
            string LVLA = string.Join(",", ME._GetF2Array("MID"));

            ME.Q_Add(@"SELECT       Id, MID,(SELECT UserName FROM Marketers WHERE Id = MID) AS UserName,
                    DSC, PDate, Amt, '1' AS Perecent, Amt*1/100 AS Benefit, CASE Type 
                     WHEN 1 THEN 'واریز' WHEN 3 THEN 'برداشت' END AS Type , 
                      CASE Status WHEN 0 THEN 'ناموفق' WHEN 1 THEN 'موفق' END AS Status, TDate, DollarCount
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            // ME.ParamAdd("@MID", LVLA);
            InvA_Grid.DataSource = ME._GetDataTable();
        }

        protected void InvA_Grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void InvB_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 2 ");
            ME.ParamAdd("@BID", login[1]);
            string LVLA = string.Join(",", ME._GetF2Array("MID"));

            ME.Q_Add(@"SELECT       Id, MID,(SELECT UserName FROM Marketers WHERE Id = MID) AS UserName,
                    DSC, PDate, Amt, '1' AS Perecent, Amt*1/100 AS Benefit, CASE Type 
                     WHEN 1 THEN 'واریز' WHEN 3 THEN 'برداشت' END AS Type , 
                      CASE Status WHEN 0 THEN 'ناموفق' WHEN 1 THEN 'موفق' END AS Status, TDate, DollarCount
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            // ME.ParamAdd("@MID", LVLA);
            InvB_Grid.DataSource = ME._GetDataTable();
        }

        protected void InvB_Grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void InvC_Grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT          MID 
                  FROM            Invest_Lvl WHERE BID = @BID AND Lvl = 3 ");
            ME.ParamAdd("@BID", login[1]);
            string LVLA = string.Join(",", ME._GetF2Array("MID"));

            ME.Q_Add(@"SELECT       Id, MID,(SELECT UserName FROM Marketers WHERE Id = MID) AS UserName,
                    DSC, PDate, Amt, '1' AS Perecent, Amt*1/100 AS Benefit, CASE Type 
                     WHEN 1 THEN 'واریز' WHEN 3 THEN 'برداشت' END AS Type , 
                      CASE Status WHEN 0 THEN 'ناموفق' WHEN 1 THEN 'موفق' END AS Status, TDate, DollarCount
                       FROM  Investing WHERE MID IN(" + LVLA + ") AND Status > 0 ");
            // ME.ParamAdd("@MID", LVLA);
            InvC_Grid.DataSource = ME._GetDataTable();
        }

        protected void InvC_Grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void HebeDetail_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT         Id, (SELECT UserName FROM Marketers WHERE Id = MID) AS UserName, NULL AS BID, PDate, AMT AS Benefit,4 AS Type, LastUpdateDate, Refrence AS DSC, Days
                       FROM            Invest_SelfP
                         WHERE MID = @MID AND Type = 1
                      
                                                            UNION

                     SELECT        Id, (SELECT UserName FROM Marketers WHERE Id = MID) AS UserName, BID, PDate, AMT AS Benefit,1 AS Type, LastUpdateDate, Refrence AS DSC, Days
                      FROM            dbo.Invest_TeamP
                       WHERE BID = @MID AND Type = 1

                               

                    ");
            ME.ParamAdd("@MID", login[1]);


            HebeDetail.DataSource = ME._GetDataTable();
        }

        protected void HebeDetail_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }
    }
}