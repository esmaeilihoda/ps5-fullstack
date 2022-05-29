using Library;
using Stimulsoft.Report;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Instrumentation;
using System.Reflection;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class SPages : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        string[] login;
        protected void Page_Load(object sender, EventArgs e)
        {           
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
            string cnumber = string.Empty;
            cnumber = Request.QueryString["CN"];
            if (cnumber == "" || cnumber == null)
                cnumber = "0";
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add("SELECT TOP(1) FullContent FROM SiteContent WHERE Number = @Number  ");
            ME.ParamAdd("@Number", cnumber);
            conloit.Text = ME.GetF2Str();
        }

    }
}