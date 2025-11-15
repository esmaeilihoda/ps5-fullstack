using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class Soft : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                loginnn.Visible = true;
                showuname.Visible = false;
            }
            else
            {
                string[] login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("~/Defualt.aspx");
                else
                {
                    uname.InnerText = login[2] + "_" + login[3];
                }
                loginnn.Visible = false;
                showuname.Visible = true;
            }

        }
    }
}