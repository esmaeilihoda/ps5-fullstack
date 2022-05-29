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
    public partial class ShopMenus : System.Web.UI.Page
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
                ME.Q_Add("SELECT * FROM Shop_Lists");
                ShopLists_Grd.DataSource = ME._GetDataTable();
                ShopLists_Grd.DataBind();
                EditorLink uu = new EditorLink();

                uu.Href = "CHECKIT.com";
                uu.Name = "سایت CHECKIT";
                P_Content.Links.Add(uu);                
            }
        }

        protected void ListSave_Click(object sender, EventArgs e)
        {
            if(Id.Value.Trim() == "")
            {
                ME.Q_Add(@"INSERT INTO Shop_Lists
                         (ListName, Position, Status)
                             VALUES        (@ListName, @Position, @Status)");
                ME.ParamAdd("@ListName", ListName.Value);
                ME.ParamAdd("@Position", Position.SelectedValue);
                ME.ParamAdd("@Status", Hstaus.Value);
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("لیست اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت لیست", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Shop_Lists
                                SET   ListName = @ListName, Position = @Position, Status = @Status  WHERE Id = @Id ");
                ME.ParamAdd("@ListName", ListName.Value);
                ME.ParamAdd("@Position", Position.SelectedValue);
                ME.ParamAdd("@Status", Hstaus.Value);
                ME.ParamAdd("@Id", Id.Value);
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("لیست اصلاح شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در اصلاح لیست", sender);
            }
        }

        protected void ShopLists_Grd_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if(e.CommandName == "ListEdit")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add("SELECT * FROM Shop_Lists WHERE Id = @Id ");
                ME.ParamAdd("@Id", ShopLists_Grd.Items[id]["Id"].Text);
                DataView dv = ME._GetDataView();
                Id.Value = dv[0]["Id"].ToString();
                ListName.Value = dv[0]["ListName"].ToString();

                Hstaus.Value = dv[0]["Status"].ToString();

                Position.SelectedValue = dv[0]["Position"].ToString();
                ME.Q_Add("SELECT *, 'اصلاح' AS ListEdit FROM Shop_ListItems WHERE LID = @Id ");
                ME.ParamAdd("@Id", ShopLists_Grd.Items[id]["Id"].Text);
                Shop_ListItemsGrd.DataSource = ME._GetDataView();
                Shop_ListItemsGrd.DataBind();
            }
        }

        protected void ShopLists_Grd_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void saveitems_Click(object sender, EventArgs e)
        {
            if(Id.Value.Trim() == "")
            {
                SMM.CreateMessageAlert("لیستی انتخاب نشده است!!!", sender);
                return;
            }
            string PCon = P_Content.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.RejectTrackChanges);
            if (IId.Value.Trim() == "")
            {
                ME.Q_Add(@"INSERT INTO Shop_ListItems
                         (LID, ParentId, Contents, Name, Status)
                           VALUES        (@LID, @ParentId, @Contents, @Name, @Status)");

                ME.ParamAdd("@LID", Id.Value);
                ME.ParamAdd("@ParentId", ParentId.Value);
                ME.ParamAdd("@Status", Istaus.Value);
                ME.ParamAdd("@Contents", PCon);
                ME.ParamAdd("@Name", Name.Value);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("لیست اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت لیست", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Shop_ListItems
                                SET LID = @LID, ParentId = @ParentId, Contents = @Contents, Status = @Status,
                                      Name = @Name WHERE Id = @Id ");
                ME.ParamAdd("@LID", Id.Value);
                ME.ParamAdd("@Id", IId.Value);
                ME.ParamAdd("@ParentId", ParentId.Value);

                ME.ParamAdd("@Status", Istaus.Value);
                ME.ParamAdd("@Contents", PCon);
                ME.ParamAdd("@Name", Name.Value);
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
                ME.Q_Add("SELECT * FROM Shop_ListItems WHERE Id = @Id ");
                ME.ParamAdd("@Id", Shop_ListItemsGrd.Items[id]["Id"].Text);
                DataView dv = ME._GetDataView();
                IId.Value = dv[0]["Id"].ToString();
                Name.Value = dv[0]["Name"].ToString();
                Istaus.Value = dv[0]["Status"].ToString();
                
                P_Content.Content = dv[0]["Contents"].ToString();
                ParentId.Value = dv[0]["ParentId"].ToString();
            }
        }
    }
}