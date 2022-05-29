
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
    public partial class Man : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Model.EXEQ ME = new Model.EXEQ();
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                string[] login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
                else
                {
                    UsPf.InnerText = login[2] + "_" + login[3];
                    msup.InnerText = login[4];
                    ME.Q_Add("SELECT PFS, MobVerify FROM Marketers WHERE Id = @Id ");
                    ME.ParamAdd("@Id", login[1]);
                    DataView dv = ME._GetDataView();
                    if (dv[0]["PFS"].ToString() != "")
                    {
                        byte[] ss = (byte[])dv[0]["PFS"];
                        string base64String = Convert.ToBase64String(ss, 0, ss.Length);
                        ProfileImage.Src = "data:image/png;base64," + base64String;
                    }
                    if (!IsPostBack)
                    {
                        ME.Q_Add("SELECT COUNT(*) FROM MPay WHERE (ForType = 1)  AND PayType IN("
                          + Constants.get_pack_paytypes
                             + ") AND MID = @MID ");
                        ME.ParamAdd("@MID", login[1]);
                        if (ME.Counter() == 0)
                        {
                            ActP.Visible = true;
                        }
                    }
                }



            }
        }
    }
}