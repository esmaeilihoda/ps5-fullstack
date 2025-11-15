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
    public partial class ShowOrderItems : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
       protected DataTable dt = new DataTable();
        protected DataView dv = new DataView();
         Model.EXEQ ME = new Model.EXEQ();
        string OID="";
        protected void Page_Load(object sender, EventArgs e)
        {
             OID = Request.QueryString["oid"];
            ME.Q_Add(@"SELECT SO.Id AS Fid,MK.Name +' '+ MK.Family AS FULLNAME,MK.Address , MK.postalcode,MK.Mobile  FROM ShopOrders SO
            LEFT JOIN Marketers MK ON MK.Id = SO.MID
                     WHERE SO.id = @OId");
            ME.ParamAdd("@OId", OID);
            dv = ME._GetDataView();

            
        }

        protected void ShowOrderItemsGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            
            ME.Q_Add(@"SELECT SOI.PId,SOI.OId
                        ,(SELECT OrderDate FROM ShopOrders WHERE Id=@OId) AS OrderDate
                        ,(SELECT PName FROM Shop_Products SP WHERE SP.PId=SOI.PId) AS PName
                        ,(SUM(SOI.Propval)+ SUM(AMT)) AS NPrice
                        ,COUNT(SOI.PId) AS CNT
                        ,(SELECT ImageUrl FROM Shop_Products SP WHERE SP.PId=SOI.PId) AS imageurl
                        ,( SELECT stuff( ( SELECT ' - '+SPH.PName +' : ' +sp.PName FROM  Shop_Property sp  
						LEFT JOIN Shop_Prop_Head SPH ON sp.ParentId=SPH.Id
						WHERE  SP.Id  IN (SELECT  item FROM dbo.StringSplit(SOI.Property ,',')) FOR XML PATH('')),2,1,'')) AS Property	
                    FROM Shop_OrdersItem SOI
                    WHERE   SOI.OId=@OId 
                    GROUP BY SOI.PId,SOI.OId,SOI.Property
                    ORDER BY SOI.PId ASC ");
            ME.ParamAdd("@OId", OID);
            dt = ME._GetDataTable();
            ShowOrderItemsGrid.DataSource = dt;
        }

        protected void ShowOrderItemsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }
    }
}