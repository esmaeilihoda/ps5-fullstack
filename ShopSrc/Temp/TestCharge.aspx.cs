using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Temp 
{
    public partial class TestCharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPost RP = new GetPost();
            RP.Url = "https://inax.ir/webservice.php";
            RP.Add("method", "invoice");
            RP.Add("username", "72b72adbc8267f8e576d6be797d89bce");
            RP.Add("password", "13671367");

            RP.Add("operator", "MCI"); 
            RP.Add("amount", "2000");
            RP.Add("product", "topup");
            RP.Add("mobile", "09145563630");
            RP.Add("charge_type", "normal");
            RP.Add("order_id", "503");
            RP.Add("company", "CHECKIT");

            RP.Post();
            string[] tyy = RP.getresult;
        }
    }
}