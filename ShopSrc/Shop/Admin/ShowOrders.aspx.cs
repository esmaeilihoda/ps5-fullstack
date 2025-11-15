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
    public partial class ShowOrders : System.Web.UI.Page
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

            ME.Q_Add(@"SELECT so.*,mk.name +' '+mk.Family AS fullname,mk.Mobile , mk.UserName ,
                        CASE  WHEN so.Status= 0 and ISNULL(PayVoucher,0) = 0 THEN 'پرداخت نشده ' WHEN so.Status = 0 and ISNULL(PayVoucher,0) > 0 THEN 'بخشی از فاکتور با کیف پول پرداخت شده ' WHEN so.Status = 1 THEN 'پرداخت شده' END AS FStatus
                        , CASE SendStatus WHEN 0 THEN 'درحال بررسی' WHEN 1 THEN 'ارسال به پست' WHEN 2 THEN 'ارسال به آدرس پستی' 
                                                         WHEN 3 THEN 'رسیده مرکز پستی' WHEN 4 THEN 'تحویل شده' END AS  USendStatus
                        FROM ShopOrders so 
                        left join Marketers mk ON so.MID = mk.id
                        ORDER BY so.Id DESC
                        ");

            //ME.Q_Add(@"SELECT so.*,mk.name +' '+mk.Family as fullname,mk.Mobile , mk.UserName,so.Status as FStatus FROM ShopOrders so 
            //left join Marketers mk ON so.MID = mk.id
            //                        ");
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

               protected void BtnSendChange_Click(object sender, EventArgs e)
        {
            string ChangeSendHide = SendChangeHide.Value;
            string SendChangeId = SendChangeHide.Value.Split(",".ToCharArray())[0];
            string FID = SendChangeHide.Value.Split(",".ToCharArray())[1];

            ME.Q_Add("UPDATE ShopOrders SET SendStatus=@SendStatus WHERE Id=@FID");
            ME.ParamAdd("@SendStatus", SendChangeId);
            ME.ParamAdd("@FID", FID);

            if (ME.Run()=="runed")
            {
                SM.CreateMessageAlert("وضعیت ارسال تغییر کرد", sender);
            }
            else
            {
                SM.CreateMessageAlert("خطا در هنگام تغییر وضعیت .خطای شماره 607",sender);
            }
            ShowOrdersGrid_NeedDataSource(null, null);
            ShowOrdersGrid.DataSource = Source;
            ShowOrdersGrid.DataBind();
        }
    }
}