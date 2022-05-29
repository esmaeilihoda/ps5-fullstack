using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;

namespace Shop.Shop.Admin
{
    public partial class PayVoucherSetting : System.Web.UI.Page
    {
        ShowMessage SMM = new ShowMessage();
        DataTable Source = new DataTable();

        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ME.Q_Add("select id, GName from Shop_PGroups where Status=1 order by GName");
                PGroup.DataSource = ME._GetDataTable();
                PGroup.DataTextField = "GName";
                PGroup.DataValueField = "id";
                PGroup.DataBind();
            }
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {

           
            DataView pgroup = ME._GetDataView();
           foreach(DataRowView pg in pgroup)
            {
               
               SMM.RunAnyScript(@"$('#CCPH_PGroup').append('<option>asdf</option>');", sender);
            }
        }

        protected void PGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            string a = PGroup.SelectedValue;
            a = PGroup.Items[PGroup.SelectedIndex].Text;
        }
    }
}