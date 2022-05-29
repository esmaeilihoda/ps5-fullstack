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
    public partial class ShopProduct : System.Web.UI.Page
    {
        string[] login;
        Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();
        DataTable Source = new DataTable();

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
                EditorLink uu = new EditorLink();

                uu.Href = "CHECKIT.com";
                uu.Name = "سایت CHECKIT";
                P_Content.Links.Add(uu);

                ME.Q_Add(@"SELECT  Id, GName
                                  FROM            Shop_PGroups");
                GRP.DataSource = ME._GetDataTable();
                GRP.DataBind();
                PropSelectBind(0);
            }

            if (!IsPostBack)
            {
                //لیست گروه نمایشی
                ME.Q_Add("SELECT Id,ViewGroupName,ViewGroupValue FROM Shop_ViewGroup");
                ViewGroup.DataSource = ME._GetDataTable();
                ViewGroup.DataTextField = "ViewGroupName";
                ViewGroup.DataValueField = "ViewGroupValue";
                ViewGroup.DataBind();

                //لیست نام استان ها
                ME.Q_Add(@"SELECT       '0' AS Id, 'استان را انتخاب کنید' Name UNION
                    SELECT Id,Name FROM State");
                DropState.DataSource = ME._GetDataTable();
                DropState.DataTextField = "Name";
                DropState.DataValueField = "Id";
                DropState.DataBind();
            }
        }


        protected void saveitems_Click(object sender, EventArgs e)
        {
            string PCon = P_Content.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.RejectTrackChanges);
            if (PId.Value.Trim() == "")
            {
                ME.Q_Add(@"INSERT INTO Shop_Products
                         (GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, ImageUrl2,
                             Gallarys, Color, Byable, Details, EndDDate, ViewGroup, PPercent, SPercent, CStatus, AllShops,
                               TypeReq,DescAllProduct,FoodDrugLicens,BusinessLicens,OperationLicens,PhysicalStore,DescLicens,Address,State,City)
                              VALUES        (@GRP, @PName, @Price, @VPrice, @Disc, @Dsc, @Size, @Stock, @SHave, @ImageUrl, @ImageUrl2,
                               @Gallarys, @Color, @Byable, @Details, @EndDDate, @ViewGroup, @PPercent, @SPercent, @CStatus, @AllShops
                                 ,@TypeReq,@DescAllProduct,@FoodDrugLicens,@BusinessLicens,@OperationLicens,@PhysicalStore,@DescLicens,@Address,@State,@City)");

                ME.ParamAdd("@GRP", GRP.SelectedValue);
                ME.ParamAdd("@PName", PName.Value);
                ME.ParamAdd("@Price", Price.Value);
                ME.ParamAdd("@VPrice", VPrice.Value);
                ME.ParamAdd("@Disc", Disc.Value);
                ME.ParamAdd("@Dsc", Dsc.Value);
                ME.ParamAdd("@Size", Size.Value);
                ME.ParamAdd("@Stock", Stock.Value);
                ME.ParamAdd("@SHave", (SHave.Checked ? 1 : 0));
                ME.ParamAdd("@ImageUrl", ImageUrl.Value);
                ME.ParamAdd("@ImageUrl2", ImageUrl2.Value);
                ME.ParamAdd("@Gallarys", Gallarys.Value);
                ME.ParamAdd("@Color", Color.Value);
                ME.ParamAdd("@Byable", (Byable.Checked ? 1 : 0));
                ME.ParamAdd("@CStatus", (CStatus.Checked ? 1 : 0));
                ME.ParamAdd("@AllShops", (AllShops.Checked ? 1 : 0));
                ME.ParamAdd("@Details", PCon);
                ME.ParamAdd("@EndDDate", EndDDate.Text);
                ME.ParamAdd("@ViewGroup", ViewGroup.SelectedValue);
                ME.ParamAdd("@PPercent", PPercent.Value);
                ME.ParamAdd("@SPercent", SPercent.Value);
                ME.ParamAdd("@TypeReq", TypeReq.SelectedValue);
                ME.ParamAdd("@DescAllProduct", DescAllProduct.Value);
                ME.ParamAdd("@FoodDrugLicens", FoodDrugLicens.SelectedValue);
                ME.ParamAdd("@BusinessLicens", BusinessLicens.SelectedValue);
                ME.ParamAdd("@OperationLicens", OperationLicens.SelectedValue);
                ME.ParamAdd("@PhysicalStore", PhysicalStore.SelectedValue);
                ME.ParamAdd("@DescLicens", DescLicens.Value);
                ME.ParamAdd("@Address", Address.Value);
                ME.ParamAdd("@State", DropState.SelectedValue);
                ME.ParamAdd("@City", DropCity.SelectedValue);


                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("محصول اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت محصول", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Shop_Products SET
                         GRP = @GRP, PName = @PName, Price = @Price , VPrice = @VPrice, Disc = @Disc, Dsc = @Dsc, Size = @Size,
                             Stock = @Stock, SHave = @SHave, ImageUrl = @ImageUrl, ImageUrl2 = @ImageUrl2,
                             Gallarys = @Gallarys, Color = @Color, Byable = @Byable, Details = @Details, EndDDate = @EndDDate
                              , ViewGroup = @ViewGroup, PPercent =@PPercent, SPercent = @SPercent, CStatus = @CStatus
                              ,AllShops = @AllShops
                            ,TypeReq=@TypeReq,DescAllProduct=@DescAllProduct,FoodDrugLicens=@FoodDrugLicens,BusinessLicens=@BusinessLicens
                            ,OperationLicens=@OperationLicens ,PhysicalStore=@PhysicalStore  ,DescLicens=@DescLicens,Address=@Address
                            ,State=@State,City=@City
                              WHERE PId = @PId");

                ME.ParamAdd("@PId", PId.Value.Trim());
                ME.ParamAdd("@GRP", GRP.SelectedValue);
                ME.ParamAdd("@PName", PName.Value);
                ME.ParamAdd("@Price", Price.Value);
                ME.ParamAdd("@VPrice", VPrice.Value);
                ME.ParamAdd("@Disc", Disc.Value);
                ME.ParamAdd("@Dsc", Dsc.Value);
                ME.ParamAdd("@Size", Size.Value);
                ME.ParamAdd("@Stock", Stock.Value);
                ME.ParamAdd("@SHave", (SHave.Checked ? 1 : 0));
                ME.ParamAdd("@ImageUrl", ImageUrl.Value);
                ME.ParamAdd("@ImageUrl2", ImageUrl2.Value);
                ME.ParamAdd("@Gallarys", Gallarys.Value);
                ME.ParamAdd("@Color", Color.Value);
                ME.ParamAdd("@Byable", (Byable.Checked ? 1 : 0));

                ME.ParamAdd("@CStatus", (CStatus.Checked ? 1 : 0));
                ME.ParamAdd("@AllShops", (AllShops.Checked ? 1 : 0));

                ME.ParamAdd("@Details", PCon);
                ME.ParamAdd("@EndDDate", EndDDate.Text);
                ME.ParamAdd("@ViewGroup", ViewGroup.SelectedValue);
                ME.ParamAdd("@PPercent", PPercent.Value);
                ME.ParamAdd("@SPercent", SPercent.Value);
                ME.ParamAdd("@TypeReq", TypeReq.SelectedValue);
                ME.ParamAdd("@DescAllProduct", DescAllProduct.Value);
                ME.ParamAdd("@FoodDrugLicens", FoodDrugLicens.SelectedValue);
                ME.ParamAdd("@BusinessLicens", BusinessLicens.SelectedValue);
                ME.ParamAdd("@OperationLicens", OperationLicens.SelectedValue);
                ME.ParamAdd("@PhysicalStore", PhysicalStore.SelectedValue);
                ME.ParamAdd("@DescLicens", DescLicens.Value);
                ME.ParamAdd("@Address", Address.Value);
                ME.ParamAdd("@State", DropState.SelectedValue);
                ME.ParamAdd("@City", DropCity.SelectedValue);


                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("محصول اصلاح شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در اصلاح محصول", sender);
            }
        }

        protected void Shop_ListItemsGrd_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add("SELECT *, 'حذف' AS delet FROM Shop_Products ORDER BY PId  DESC");
            Shop_ListItemsGrd.DataSource = ME._GetDataTable();
        }

        protected void Shop_ListItemsGrd_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            string DomainName = Class.CookieControl.GetDomainName;
            if (e.CommandName == "ProuductEdit")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add(@"SELECT        PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, 
                               ImageUrl2, Gallarys, Color, Byable, Details, EndDDate, ViewGroup, PPercent, SPercent, CStatus, AllShops
                                ,TypeReq,DescAllProduct,FoodDrugLicens,BusinessLicens,OperationLicens,PhysicalStore,DescLicens,Address,gconfirm
                                ,(SELECT  'نام و نام خانوادگی: '+Name +' '+Family+' &nbsp&nbsp&nbsp&nbsp&nbspکد کاربری: '+UserName+' &nbsp&nbsp&nbsp&nbsp&nbspشماره تماس: '
	                            +Mobile+' &nbsp&nbsp&nbsp&nbsp&nbspآدرس:'+city+' - ' +Address  FROM Marketers WHERE UserName IN 
	                            (SELECT DRusername COLLATE Persian_100_CI_AS_KS FROM shop_domainregister WHERE DRsubdomain=Domain)) AS NameReq 
                                 ,State,City
                                        FROM    Shop_Products WHERE PId = @PId ");
                ME.ParamAdd("@PId", Shop_ListItemsGrd.Items[id]["PId"].Text);
                DataView dv = ME._GetDataView();
                PId.Value = dv[0]["PId"].ToString();
                GRP.SelectedValue = dv[0]["GRP"].ToString();
                PName.Value = dv[0]["PName"].ToString();
                Price.Value = dv[0]["Price"].ToString();
                VPrice.Value = dv[0]["VPrice"].ToString();
                Disc.Value = dv[0]["Disc"].ToString();
                Dsc.Value = dv[0]["Dsc"].ToString();
                Size.Value = dv[0]["Size"].ToString();
                Stock.Value = dv[0]["Stock"].ToString();
                SHave.Checked = (dv[0]["SHave"].ToString() == "1" ? true : false);
                ImageUrl.Value = dv[0]["ImageUrl"].ToString();

                ImageUrl2.Value = dv[0]["ImageUrl2"].ToString();
                Gallarys.Value = dv[0]["Gallarys"].ToString();
                Color.Value = dv[0]["Color"].ToString();
                Byable.Checked = (dv[0]["Byable"].ToString() == "1" ? true : false);
                CStatus.Checked = (dv[0]["CStatus"].ToString() == "1" ? true : false);
                AllShops.Checked = (dv[0]["AllShops"].ToString() == "1" ? true : false);
                P_Content.Content = dv[0]["Details"].ToString();
                EndDDate.Text = dv[0]["EndDDate"].ToString();
                ViewGroup.SelectedValue = dv[0]["ViewGroup"].ToString();

                PPercent.Value = dv[0]["PPercent"].ToString();
                SPercent.Value = dv[0]["SPercent"].ToString();
                TypeReq.SelectedValue = dv[0]["TypeReq"].ToString();
                DescAllProduct.Value = dv[0]["DescAllProduct"].ToString();
                FoodDrugLicens.SelectedValue = dv[0]["FoodDrugLicens"].ToString();
                BusinessLicens.SelectedValue = dv[0]["BusinessLicens"].ToString();
                OperationLicens.SelectedValue = dv[0]["OperationLicens"].ToString();
                PhysicalStore.SelectedValue = dv[0]["PhysicalStore"].ToString();
                DescLicens.Value = dv[0]["DescLicens"].ToString();
                Address.Value = dv[0]["Address"].ToString();
                gconfirm.Checked = dv[0]["gconfirm"].ToString() == "1" ? true : false;
                NameReq.InnerHtml = dv[0]["NameReq"].ToString();

                Shop_Prop_NeedDataSource(null, null);
                Shop_Prop.DataSource = Source;
                Shop_Prop.DataBind();

                DropState.SelectedValue = dv[0]["State"].ToString() == "" ? "0" : dv[0]["State"].ToString();
                ME.Q_Add(@"SELECT       '0' AS Id, 'شهر را انتخاب کنید' Name UNION
                        SELECT Id,Name FROM City WHERE StateId=@StateId");
                ME.ParamAdd("@StateId", DropState.SelectedValue);
                DropCity.DataSource = ME._GetDataTable();
                DropCity.DataTextField = "Name";
                DropCity.DataValueField = "Id";
                DropCity.DataBind();
                DropCity.SelectedValue = dv[0]["City"].ToString() == "" ? "0" : dv[0]["City"].ToString();
                string divimg = "";
                string[] gpics = dv[0]["Gallarys"].ToString().Split("©".ToCharArray());
                ShowMessage SM = new ShowMessage();
                foreach (string gpi in gpics)
                {
                    
                        if (gpi != "")
                    {
                        divimg += "<img src='../" + gpi + "' class='mr-3 ml-5 ImgGalery' />";
                        //SM.popupcenter("../" + gpi, sender);
                    }
                            
                }

                showGalery.InnerHtml = divimg;


            }
            else if (e.CommandName == "delet")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add(@"DELETE   FROM    Shop_Products WHERE PId = @PId ");
                ME.ParamAdd("@PId", Shop_ListItemsGrd.Items[id]["PId"].Text);
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("محصول حذف شد", sender);

            }
        }

        protected void Propertysave_Click(object sender, EventArgs e)
        {
            ME.Q_Add(@"INSERT 
                    INTO              Shop_Property(PName, ParentId)
                           VALUES        (@PName, @ParentId)");
            ME.ParamAdd("@PName", PropertyDsc.Value);
            ME.ParamAdd("@ParentId", PropSelect.SelectedValue);
            ME.Run();
            PropSelectBind(1);
        }

        protected void PropValSave_Click(object sender, EventArgs e)
        {
            if (PropSS.SelectedValue == "1")
            {
                SMM.CreateMessageAlert("Please select Property", sender);
                return;
            }
            if (PId.Value == "")
            {
                SMM.CreateMessageAlert("You Must Save Product First!", sender);
                return;
            }
            ME.Q_Add(@"SELECT    COUNT(*)
                              FROM            ShopPValue WHERE Pid = @ProductId
                                AND PropIdd = @PropertyId  ");
            ME.ParamAdd("@ProductId", PId.Value.Trim());
            ME.ParamAdd("@PropertyId", PropSS.SelectedValue);

            if (ME.Counter() == 0)
            {

                ME.Q_Add(@"INSERT INTO ShopPValue
                                   (Pid, PropIdd, PValue,State)
                                     VALUES        (@Pid, @PropIdd, @PValue,@State)");
                ME.ParamAdd("@Pid", PId.Value.Trim());
                ME.ParamAdd("@PropIdd", PropSS.SelectedValue);
                ME.ParamAdd("@PValue", PropValue.Value);
                ME.ParamAdd("@State", 1);
                ME.Run();
                SMM.CreateMessageAlert("Property Added To Product", sender);

            }
                                                         
        }
        private void PropSelectBind(int cc)
        {
            if (cc == 0)
            {
                ME.Q_Add(@"SELECT        Id, PName
                      FROM            Shop_Prop_Head ");
                PropSelect.DataTextField = "PName";
                PropSelect.DataValueField = "Id";
                PropSelect.DataSource = ME._GetDataTable();
                PropSelect.DataBind();
            }
            else
            {
                ME.Q_Add(@"SELECT        Id, PName
                      FROM            Shop_Property WHERE ParentId = @ParentId ");
                ME.ParamAdd("@ParentId", PropSelect.SelectedValue);
                PropSS.DataTextField = "PName";
                PropSS.DataValueField = "Id";
                PropSS.DataSource = ME._GetDataTable();
                PropSS.DataBind();
            }

        }

        protected void PropSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            PropSelectBind(1);
        }

        protected void PheadSave_Click(object sender, EventArgs e)
        {
            ME.Q_Add(@"INSERT 
                    INTO              Shop_Prop_Head(PName)
                           VALUES        (@PName)");
            ME.ParamAdd("@PName", PHead.Value);
            ME.Run();
            PropSelectBind(0);
        }

        protected void PropSS_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void PropSS_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ME.Q_Add(@"SELECT   PValue
                                   FROM            ShopPValue WHERE Pid = @ProductId  AND PropIdd = @PropertyId ");
            ME.ParamAdd("@ProductId", PId.Value);
            ME.ParamAdd("@PropertyId", PropSS.SelectedValue);
            PropValue.Value = ME.GetF2Str();
        }

        protected void SetDisc_Click(object sender, EventArgs e)
        {

        }

        protected void ImageUrlshow_Click(object sender, EventArgs e)
        {
            ShowMessage SM = new ShowMessage();
            SM.popupcenter("../" + ImageUrl.Value, sender);
        }

        protected void Shop_Prop_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT spv.Id ,SPH.PName PHEAD ,sp.PName,spv.PValue, CASE WHEN spv.State=1 THEN N'فعال' ELSE N'غیرفعال' END AS State,
                        '<input type=button class=btn-primary value=ثبت />' AS ok FROM shopPvalue spv
                        LEFT JOIN Shop_Property sp ON spv.PropIdd = sp.Id 
						LEFT JOIN Shop_Prop_Head SPH ON sp.ParentId=SPH.Id
						WHERE  spv.pid = @Pid ORDER BY SPV.ID DESC");
            ME.ParamAdd("@Pid", PId.Value.Trim());
            Source = ME._GetDataTable();
            Shop_Prop.DataSource = Source;
        }

        protected void Shop_Prop_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "BtnChangeState")
            {
                ShowMessage SM = new ShowMessage();
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                TextBox propval = (TextBox)gi.FindControl("propvalue");
                if (propval.Text == "")
                {
                   
                    SM.CreateMessageAlert("لطفا مقدار ارزش ویژگی را وارد نمایید.",sender);
                    return;
                }
                ME.Q_Add(@"UPDATE ShopPValue SET PValue=@PVALUE WHERE ID=@ID ");
                ME.ParamAdd("@PVALUE", propval.Text);
                ME.ParamAdd("@ID", id);
                if (ME.Run() == "runed")
                {
                    SM.CreateMessageAlert("ارزش ویژگی ویرایش شد", sender);
                    Shop_Prop_NeedDataSource(null, null);
                    Shop_Prop.DataSource = Source;
                    Shop_Prop.DataBind();
                }
                else
                {
                    SM.CreateMessageAlert("0x13991204", sender);
                }
                
            }
            else if(e.CommandName== "ChangeStateProp")
            {
                GridDataItem gi = (GridDataItem)e.Item;
                string id = gi["Id"].Text;
                ME.Q_Add ( "UPDATE ShopPValue SET State=CASE WHEN STATE=1 THEN 0  WHEN STATE=0 THEN 1 END WHERE Id=@ID");
                ME.ParamAdd("@ID", id);
                if (ME.Run() == "runed")
                {
                    SMM.CreateMessageAlert("وضعیت تغییر کرد", sender);
                    Shop_Prop_NeedDataSource(null, null);
                    Shop_Prop.DataSource = Source;
                    Shop_Prop.DataBind();
                }
                else
                {
                    SMM.CreateMessageAlert("1x13991204", sender);
                }
                
            }
        }
    }
}