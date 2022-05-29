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
    public partial class Showpay : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        DataTable Source = new DataTable();

        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowOrdersGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            
                ME.Q_Add(@"select zp.*,mk.UserName,case when zp.PStatus=9 then N'پرداخت انصراف شده'  when zp.PStatus=1 then N'پرداخت انجام شده' when zp.PStatus=0 then N'از صفحه پرداخت خارج شده'   end satatus from ZarPay zp
left join Marketers mk on zp.MID = mk.Id order by zp.id desc");
            Source = ME._GetDataTable();
            ShowOrdersGrid.DataSource = Source;
        }

        protected void ShowOrdersGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
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
            ShowOrdersGrid_NeedDataSource(null, null);
            ShowOrdersGrid.DataSource = Source;
            ShowOrdersGrid.DataBind();
        }
    }
}