using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using Library;

namespace Shop.Account
{
    public partial class ProccessPercentHost : System.Web.UI.Page
    {
        Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SM = new ShowMessage();
        DataTable Source = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowProccessPercentHost_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT PH.Id, MID,MK.Name+' '+MK.Family FullName,Income,PH.Dsc,PH.TrackingCode,'<input type=button class=btn-primary value=ثبت />' as ok,
                        CASE WHEN PayStatus = 0 THEN N'پرداخت نشده' WHEN PayStatus = 1 THEN N'پرداخت شده' END TPAYSTATUS
                        , DatePReq,DatePPay, DR.DRsubdomain,PayStatus
                        FROM Shop_PercentHost PH
                        LEFT JOIN Marketers MK ON PH.MID = MK.Id
                        LEFT JOIN shop_domainregister DR ON MK.UserName = DR.DRusername");
           
            Source = ME._GetDataTable();
            ShowProccessPercentHost.DataSource = Source;
        }

        protected void ShowProccessPercentHost_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.CommandName== "BtnChangeState")
            {
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                TextBox desc = (TextBox)gi.FindControl("Dscc");
                TextBox tracking = (TextBox)gi.FindControl("tracingcode");
                RadMaskedTextBox datepay = (RadMaskedTextBox)gi.FindControl("DatePPay");
                DropDownList ChangePay1 = (DropDownList)gi.FindControl("ChangePay");
                string Vstate = ChangePay1.Items[ChangePay1.SelectedIndex].Value;
                if (Vstate == "-1")
                {
                    SM.CreateMessageAlert("لطفا نوع وضعیت را مشخص نمایید",sender);
                    return;
                }
                ME.Q_Add("UPDATE Shop_PercentHost SET Dsc=@Dsc ,TrackingCode=@Tracking,PayStatus=@PayStatus,DatePPay=@DatePPay where id= @Id");
                ME.ParamAdd("@Id", id);
                ME.ParamAdd("@Dsc", desc.Text);
                ME.ParamAdd("@Tracking", tracking.Text);
                ME.ParamAdd("@PayStatus", Vstate);
                ME.ParamAdd("@DatePPay", datepay.Text);
                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert(" ثبت شد.", sender);
                }
                else
                {
                    SM.CreateMessageAlert("Error: 0X13991119", sender);
                }
            }
            ShowProccessPercentHost_NeedDataSource(null, null);
            ShowProccessPercentHost.DataSource = Source;
            ShowProccessPercentHost.DataBind();
        }
    }
}