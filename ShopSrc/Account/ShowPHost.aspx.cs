using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Shop.Class;
using Library;

namespace Shop.Account
{
    public partial class ShowPHost : System.Web.UI.Page
    {
        string[] ULogin;
        Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                ULogin = (string[])Session["Login"];
                if (ULogin[0] != "OK")
                    Response.Redirect("Login.aspx");
            }
            

            string Hostname = Class.CookieControl.GetDomainName;
            ME.Q_Add(@"SELECT COUNT(*) FROM shop_domainregister WHERE DRusername = @DRusername  AND DRsubdomain = @DRsubdomain");
            ME.ParamAdd("@DRsubdomain", Hostname);
            ME.ParamAdd("@DRusername", ULogin[4]);
            if (ME.Counter() != 1)
                Response.Redirect("index.aspx");

            Account.iindex ds = new Account.iindex();
            double[] clho =  ds.CalcPHost(Hostname, ULogin[4], int.Parse(ULogin[1]) );
            pkhodesh.InnerHtml = clho[0].ToString()+" تومان";
            pbalasari.InnerHtml = clho[1].ToString()+" تومان";
            sumIncomeHost.InnerHtml = clho[3].ToString()+" تومان";
            SumAll.InnerHtml = clho[2].ToString()+" تومان";
           
        }
           

       

       
    }
}