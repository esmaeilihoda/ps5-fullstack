using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Shop.Admin
{
    public partial class SAM : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
                Response.Redirect("~/Account/Login.aspx");
            else
            {
                string[] login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
                else if (login[5] != "1")
                    Response.Redirect("~/shop/Index.aspx");
                else
                {
                    UsPf.InnerText = login[2] + "_" + login[3];
                    msup.InnerText = login[4];
                }
            }
        }
    }
}