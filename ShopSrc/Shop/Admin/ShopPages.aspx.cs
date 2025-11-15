using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Library;

namespace Shop.Shop.Admin
{
    public partial class ShopPages : System.Web.UI.Page
    {
        string[] login; Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //    Response.Redirect("Login.aspx");
            //else
            //{
            //    login = (string[])Session["Login"];
            //    if (login[0] != "OK")
            //        Response.Redirect("Login.aspx");
            //}
            if (!IsPostBack)
            {
                ME.Q_Add("SELECT * FROM Shop_Pages");
                Shop_ListItemsGrd.DataSource = ME._GetDataTable();
                Shop_ListItemsGrd.DataBind();
                EditorLink uu = new EditorLink();

                uu.Href = "CHECKIT.com";
                uu.Name = "سایت CHECKIT";
                P_Content.Links.Add(uu);                
            }
        }
           

        protected void saveitems_Click(object sender, EventArgs e)
        {          
            string PCon = P_Content.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.RejectTrackChanges);
            if (IId.Value.Trim() == "")
            {
                ME.Q_Add(@"INSERT INTO Shop_Pages
                         (GName, GContent, ParentId, Status)
                           VALUES        (@GName, @GContent, @Status, @ParentId)");
                
                ME.ParamAdd("@ParentId", ParentId.Value);
                ME.ParamAdd("@Status", Istaus.Value);
                ME.ParamAdd("@GContent", PCon);
                ME.ParamAdd("@GName", Name.Value);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("لیست اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت لیست", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Shop_Pages SET
                                 ParentId = @ParentId, GContent = @GContent, Status = @Status,
                                      GName = @GName WHERE Id = @Id ");
               
                ME.ParamAdd("@Id", IId.Value);
                ME.ParamAdd("@ParentId", ParentId.Value);

                ME.ParamAdd("@Status", Istaus.Value);
                ME.ParamAdd("@GContent", PCon);
                ME.ParamAdd("@GName", Name.Value);
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("لیست اصلاح شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در اصلاح لیست", sender);
            }
        }

        protected void Shop_ListItemsGrd_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void Shop_ListItemsGrd_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "ListEdit")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add("SELECT * FROM Shop_Pages WHERE Id = @Id ");
                ME.ParamAdd("@Id", Shop_ListItemsGrd.Items[id]["Id"].Text);
                DataView dv = ME._GetDataView();
                IId.Value = dv[0]["Id"].ToString();
                Name.Value = dv[0]["GName"].ToString();
                P_Content.Content = dv[0]["GContent"].ToString();
                ParentId.Value = dv[0]["ParentId"].ToString();
                Istaus.Value = dv[0]["Status"].ToString();
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            ME.Q_Add("DELETE FROM Shop_Pages WHERE Id = @Id ");
            ME.ParamAdd("@Id", IId.Value);
            if (ME.Run() == "runed")
                SMM.CreateMessageAlert("صفحه پاک شد.", sender);
        }
    }
}