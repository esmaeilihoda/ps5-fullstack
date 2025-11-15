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
    public partial class showTurbo : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        DataTable Source = new DataTable();

        Model.EXEQ ME = new Model.EXEQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EditorLink uu = new EditorLink();

                uu.Href = "CHECKIT.com";
                uu.Name = "سایت CHECKIT";
                
            }
        }

        protected void ShowOrdersGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            ME.Q_Add(@"SELECT mK.USERNAME,MK.Name+' '+MK.Family AS FullName,income,DateP FROM M5Pay m5
                        LEFT JOIN Marketers mk ON m5.MID=mk.Id
                        WHERE ForType=1 ORDER BY datep DESC
                        ");

           
            Source = ME._GetDataTable();
            ShowOrdersGrid.DataSource = Source;
        }

        protected void ShowOrdersGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if(e.CommandName== "ShowOrderItem")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add(@"SELECT SOI.*,SP.PName FROM Shop_OrdersItem SOI
                    LEFT JOIN Shop_Products SP ON SP.PId =SOI.PId
                     WHERE OId=@OId ");
                ME.ParamAdd("@OId", ShowOrdersGrid.Items[id]["Id"].Text);
                DataTable dt = ME._GetDataTable();
                for(int i=0; i< dt.Rows.Count; i++)
                {
                    SM.CreateMessageAlert(dt.Rows[i]["PName"].ToString(), sender);        
                }
               
            }
            ShowOrdersGrid_NeedDataSource(null, null);
            ShowOrdersGrid.DataSource = Source;
            ShowOrdersGrid.DataBind();
           
        }

              
    }
}