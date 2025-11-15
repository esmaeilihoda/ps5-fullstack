using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class Defualt : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();      
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
            if (Session["Login"] == null)
            { }
            else
            {
                string[] login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("~/Defualt.aspx");
                else
                {
                    US.Text = login[2] + "_" + login[3];
                }
            }
        }
       
        protected void Unnamed_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}