using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Shop
{
    public partial class index : System.Web.UI.Page
    {
        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/Shop/shop");
            ME.Q_Add("SELECT GContent FROM Shop_Pages WHERE Home = 1 ");
            AS.InnerHtml = ME.GetF2Str();
        }
    }
}