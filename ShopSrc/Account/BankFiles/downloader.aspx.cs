using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Account.BankFiles
{
    public partial class downloader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] fb =(string[])Session["filebank"];
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
            response.AddHeader("Content-Disposition", "attachment; filename=" + "ELFL" + fb[0] + ";");
            response.TransmitFile(fb[1]);
            response.Flush();
            response.End();
        }
    }
}