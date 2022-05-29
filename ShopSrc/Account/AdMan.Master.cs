using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Account
{
    public partial class AdMan : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] login = new string[8];
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
                else if (login[5] != "1")
                    Response.Redirect("Index.aspx");
                else
                {
                    UsPf.InnerText = login[2] + "_" + login[3];
                    msup.InnerText = login[4];
                }

            }
            if (login[1] != "1")
            {
                bool acccontrol = false;
                string sPagePath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo oFileInfo = new System.IO.FileInfo(sPagePath);
                string sPageName = oFileInfo.Name.Split(".".ToCharArray())[0];

                Model.EXEQ ME = new Model.EXEQ();
                ME.Q_Add("SELECT [Access] FROM [Ad-Access] WHERE UserId = @UserId ");
                ME.ParamAdd("@UserId", login[1]);
                DataView adv = ME._GetDataView();
                if(adv == null)
                    Response.Redirect("index.aspx");
                foreach (DataRowView adrv in adv)
                {
                    if(adrv[0].ToString().ToUpper() == sPageName.ToUpper())
                    {
                        acccontrol = true;
                        break;
                    }
                }
                if (!acccontrol)
                {
                    Response.Redirect("index.aspx");
                }
            }

        }
    }
}