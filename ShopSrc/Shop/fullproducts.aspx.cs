using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using Microsoft.AspNet.FriendlyUrls;
using System.Data;

namespace Shop.Shop
{
    public partial class fullproducts : System.Web.UI.Page
    {
        private string seva="";private int PageNumber=1;
        protected void Page_Load(object sender, EventArgs e)
        {
            seva = Request.QueryString["seva"];
        }
        public string Get_Seva
        {
            get
            {
                return seva;
            }
        }
        public int Get_PN
        {
            get
            {
                return PageNumber;
            }
        }

        protected void btnpagenumber_Click(object sender, EventArgs e)
        {
            if (hidepage.Value == "")
            {
                hidepage.Value = "1";
            }
            PageNumber = int.Parse(hidepage.Value.ToString());
        }
        //public string GetParam(string param)
        //{
        //    return Library.Constants.UrlParamValue(Request.GetFriendlyUrlSegments(), "cat");
        //}


    }
}