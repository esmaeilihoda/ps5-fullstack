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
    public partial class DeleteDomains : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        DataTable Source = new DataTable();

        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowDomainsGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            
                ME.Q_Add("SELECT *, 'OK' AS NOK ,'Del' as Del FROM dbo.shop_domainregister");
            Source = ME._GetDataTable();
            ShowDomainsGrid.DataSource = Source;
        }

        protected void ShowDomainsGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "ChangeStatus")
            {
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                ME.Q_Add("update shop_domainregister set status=case when status=0 then 1 when status=1 then 0 end where id=@id");
                ME.ParamAdd("@id", id);
                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("وضعیت دامنه تغییر کرد", sender);
                }
                else 
                {
                    SM.CreateMessageAlert("تغییر وضعیت با مشکل مواجه شد .خطای شماره 602", sender);
                }
            }
            else if(e.CommandName == "InserDsc")
            {
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                TextBox NOOK = (TextBox)gi.FindControl("Dscc");
                ME.Q_Add("UPDATE shop_domainregister SET Dsc = @Dsc WHERE Id = @Id");
                ME.ParamAdd("@Id", id);
                ME.ParamAdd("@Dsc", NOOK.Text);
                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("Description is Saved", sender);
                }
                else
                {
                    SM.CreateMessageAlert("Error: 0x12505", sender);
                }
            }
            else if(e.CommandName == "DeleteDomain")
            {
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                TextBox NOOK = (TextBox)gi.FindControl("Dscc");
                ME.Q_Add("delete from shop_domainregister where id=@Id");
                ME.ParamAdd("@Id", id);
               
                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("Deleted!", sender);
                }
                else
                {
                    SM.CreateMessageAlert("Error: 0x12506", sender);
                }
            }
            ShowDomainsGrid_NeedDataSource(null, null);
            ShowDomainsGrid.DataSource = Source;
            ShowDomainsGrid.DataBind();
        }
    }
}