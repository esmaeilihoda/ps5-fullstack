using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class VerifyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Access-Control-Allow-Origin", "*");
        }
       
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string Verify(string NationalCode, string ApiKey)
        {
            string rtt = "0";
            string ApiK = "WsdsdUi0125YU77";
            if (ApiKey == ApiK)
            {
                Model.EXEQ ME = new Model.EXEQ();
                ME.Q_Add(@"SELECT COUNT(*) FROM MPay WHERE " +
                    "MID IN(SELECT Id FROM Marketers WHERE NationalCode = @NationalCode ) ");
                ME.ParamAdd("@NationalCode", NationalCode);
                if (ME.Counter() > 0)
                {
                    rtt = "1";
                }
                else
                    rtt = "0";
            }
            else
                rtt = "-1";

            return rtt;
        }
    }
}