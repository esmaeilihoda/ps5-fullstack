using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Shop.Class;
using Library;
using System.IO;

namespace Shop.Account
{
    public partial class ClProduct : System.Web.UI.Page
    {
        string[] ULogin; Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {
            PPercent.Visible = false;
            SPercent.Visible = false;
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                ULogin = (string[])Session["Login"];
                if (ULogin[0] != "OK")
                    Response.Redirect("Login.aspx");
            }
            

            string Hostname = Class.CookieControl.GetDomainName;
            if (ULogin[4].ToLower() != "admin")
            {
                ME.Q_Add(@"SELECT COUNT(*) FROM shop_domainregister WHERE DRusername = @DRusername  AND DRsubdomain = @DRsubdomain");
                ME.ParamAdd("@DRsubdomain", Hostname);
                ME.ParamAdd("@DRusername", ULogin[4]);
                if (ME.Counter() != 1)
                    Response.Redirect("index.aspx");
            }
            if (!IsPostBack)
            {
                string subPath = "ClientImages/" + CookieControl.GetDomainName; // Your code goes here

                bool exists = System.IO.Directory.Exists(Server.MapPath(subPath));

                if (!exists)
                    System.IO.Directory.CreateDirectory(Server.MapPath(subPath));

                EditorLink uu = new EditorLink();

                uu.Href = "espadannet.com";
                uu.Name = "سایت CHECKIT";
                //P_Content.Links.Add(uu);

                ME.Q_Add(@"SELECT  Id, GName
                                  FROM            Shop_PGroups");
                GRP.DataSource = ME._GetDataTable();
                GRP.DataBind();
                PropSelectBind(0);
            }

            if (!IsPostBack)
            {
                // لیست گروه بندی نمایشی
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
            string PCon = "";

            string uploadimagename = ImageUrl.FileName.Split(".".ToCharArray())[ImageUrl.FileName.Split(".".ToCharArray()).Length - 1].ToLower();

            string uploadimagename2 = ImageUrl2.FileName.Split(".".ToCharArray())[ImageUrl2.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            string max0 = "";
            if (PId.Value.Trim() == "")
            {
                ME.Q_Add("SELECT IDENT_CURRENT('Shop_Products')+1");
                max0 = ME.GetF2Str();
            }
            else
                max0 = PId.Value.Trim();

            string subPath = "ClientImages/" +  CookieControl.GetDomainName ;

            if (ImageUrl.HasFile && uploadimagename.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrl.HasFile)
            {
                uploadimagename = "Pr" + max0 + "img1.jpg";
                string mappath = MapPath(subPath);
                ImageUrl.SaveAs(mappath + "\\" + uploadimagename);
            }
            if (ImageUrl2.HasFile && uploadimagename2.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrl2.HasFile)
            {
                uploadimagename2 = "Pr" + max0 + "img2.jpg";
                string mappath = MapPath(subPath);
                ImageUrl2.SaveAs(mappath + "\\" + uploadimagename2);
            }
            //-----------------------------galery-----------------------------
            //galery1
            string uploadimagenameg1 = ImageUrlg1.FileName.Split(".".ToCharArray())[ImageUrlg1.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg1.HasFile && uploadimagenameg1.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg1.HasFile)
            {
                uploadimagenameg1 = "Pr" + max0 + "gal1.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg1.SaveAs(mappath + "\\" + uploadimagenameg1);
            }
            //galery2
            string uploadimagenameg2 = ImageUrlg2.FileName.Split(".".ToCharArray())[ImageUrlg2.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg2.HasFile && uploadimagenameg2.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg2.HasFile)
            {
                uploadimagenameg2 = "Pr" + max0 + "gal2.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg2.SaveAs(mappath + "\\" + uploadimagenameg2);
            }
            //galery3
            string uploadimagenameg3 = ImageUrlg3.FileName.Split(".".ToCharArray())[ImageUrlg3.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg3.HasFile && uploadimagenameg3.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg3.HasFile)
            {
                uploadimagenameg3 = "Pr" + max0 + "gal3.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg3.SaveAs(mappath + "\\" + uploadimagenameg3);
            }
            //galery4
            string uploadimagenameg4 = ImageUrlg4.FileName.Split(".".ToCharArray())[ImageUrlg4.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg4.HasFile && uploadimagenameg4.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg4.HasFile)
            {
                uploadimagenameg4 = "Pr" + max0 + "gal4.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg4.SaveAs(mappath + "\\" + uploadimagenameg4);
            }
            //galery5
            string uploadimagenameg5 = ImageUrlg5.FileName.Split(".".ToCharArray())[ImageUrlg5.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg5.HasFile && uploadimagenameg5.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg5.HasFile)
            {
                uploadimagenameg5 = "Pr" + max0 + "gal5.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg5.SaveAs(mappath + "\\" + uploadimagenameg5);
            }
            //galery6
            string uploadimagenameg6 = ImageUrlg6.FileName.Split(".".ToCharArray())[ImageUrlg6.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg6.HasFile && uploadimagenameg6.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg6.HasFile)
            {
                uploadimagenameg6 = "Pr" + max0 + "gal6.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg6.SaveAs(mappath + "\\" + uploadimagenameg6);
            }
            //galery7
            string uploadimagenameg7 = ImageUrlg7.FileName.Split(".".ToCharArray())[ImageUrlg7.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg7.HasFile && uploadimagenameg7.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg7.HasFile)
            {
                uploadimagenameg7 = "Pr" + max0 + "gal7.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg7.SaveAs(mappath + "\\" + uploadimagenameg7);
            }
            //galery8
            string uploadimagenameg8 = ImageUrlg8.FileName.Split(".".ToCharArray())[ImageUrlg8.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg8.HasFile && uploadimagenameg8.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg8.HasFile)
            {
                uploadimagenameg8 = "Pr" + max0 + "gal8.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg8.SaveAs(mappath + "\\" + uploadimagenameg8);
            }
            //galery9
            string uploadimagenameg9 = ImageUrlg9.FileName.Split(".".ToCharArray())[ImageUrlg9.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg9.HasFile && uploadimagenameg9.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg9.HasFile)
            {
                uploadimagenameg9 = "Pr" + max0 + "gal9.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg9.SaveAs(mappath + "\\" + uploadimagenameg9);
            }
            //galery10
            string uploadimagenameg10 = ImageUrlg10.FileName.Split(".".ToCharArray())[ImageUrlg10.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
            if (ImageUrlg10.HasFile && uploadimagenameg10.ToLower() != "jpg")
            {
                SMM.CreateMessageAlert("image formt must be jpg", sender);
                return;
            }
            else if (ImageUrlg10.HasFile)
            {
                uploadimagenameg10 = "Pr" + max0 + "gal10.jpg";
                string mappath = MapPath(subPath);
                ImageUrlg10.SaveAs(mappath + "\\" + uploadimagenameg10);
            }
            //-----------------------------end galery-------------------------


            if (DescAllProduct.Value == "")
            {
                SMM.CreateMessageAlert("لطفا توضیحات کامل محصول را وارد نمایید", sender);
                return;
            }

            if (DropState.SelectedValue == "0") {
                SMM.CreateMessageAlert("لطفا استان آدرس را انتخاب نمایید", sender);
                return;
            }
            if (DropCity.SelectedValue == "0") {
                SMM.CreateMessageAlert("لطفا شهر استان آدرس را انتخاب نمایید", sender);
                return;
            }
            if (Address.Value == "") {
                SMM.CreateMessageAlert("لطفا  آدرس را وارد نمایید", sender);
                return;
            }

            uploadimagename = "../account/clientimages/" + CookieControl.GetDomainName + "/" + "Pr" + max0 + "img1.jpg";
            uploadimagename2 = "../account/clientimages/" + CookieControl.GetDomainName + "/" + "Pr" + max0 + "img2.jpg";
            string uploadGalery = "";
            for (int i = 1; i <= 10; i++)
            {
                if (File.Exists(Server.MapPath("../account/clientimages/" + CookieControl.GetDomainName + "/" + "Pr" + max0 + "gal" + i + ".jpg")))
                {
                    uploadGalery += "../account/clientimages/" + CookieControl.GetDomainName + "/" + "Pr" + max0 + "gal" + i + ".jpg©";
                }
                
            }
            if (PId.Value.Trim() == "")
            {
               

                ME.Q_Add(@"INSERT INTO Shop_Products
                         (GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, ImageUrl2,
                             Gallarys, Color, Byable, Details, EndDDate, ViewGroup, PPercent, SPercent, Domain,
                            TypeReq,DescAllProduct,FoodDrugLicens,BusinessLicens,OperationLicens,PhysicalStore,DescLicens,Address,gconfirm,CStatus,State,City)
                              VALUES        (@GRP, @PName, @Price, @VPrice, @Disc, @Dsc, @Size, @Stock, @SHave, @ImageUrl, @ImageUrl2,
                               @Gallarys, @Color, @Byable, @Details, @EndDDate, @ViewGroup, @PPercent, @SPercent, @Domain
                                ,@TypeReq,@DescAllProduct,@FoodDrugLicens,@BusinessLicens,@OperationLicens,@PhysicalStore,@DescLicens,@Address,@gconfirm,@CStatus,@State,@City)");

                ME.ParamAdd("@GRP", GRP.SelectedValue);
                ME.ParamAdd("@PName", PName.Value);
                ME.ParamAdd("@Price", Price.Value);
                ME.ParamAdd("@VPrice", VPrice.Value);
                ME.ParamAdd("@Disc", Disc.Value);
                ME.ParamAdd("@Dsc", Dsc.Value);
                ME.ParamAdd("@Size", Size.Value);
                ME.ParamAdd("@Stock", Stock.Value);
                ME.ParamAdd("@SHave", (SHave.Checked ? 1:0));
                
                ME.ParamAdd("@ImageUrl", uploadimagename);
                ME.ParamAdd("@ImageUrl2", uploadimagename2);
                
                ME.ParamAdd("@Gallarys", uploadGalery);
                ME.ParamAdd("@Color", Color.Value);
                ME.ParamAdd("@Byable", (Byable.Checked ? 1 : 0));
                ME.ParamAdd("@Details", PCon);
                ME.ParamAdd("@EndDDate", EndDDate.Text);
                ME.ParamAdd("@ViewGroup", ViewGroup.SelectedValue);
                ME.ParamAdd("@PPercent", PPercent.Value);
                ME.ParamAdd("@SPercent", SPercent.Value);
                ME.ParamAdd("@Domain", CookieControl.GetDomainName);
                ME.ParamAdd("@TypeReq", TypeReq.SelectedValue);
                ME.ParamAdd("@DescAllProduct", DescAllProduct.Value);
                ME.ParamAdd("@FoodDrugLicens", FoodDrugLicens.SelectedValue);
                ME.ParamAdd("@BusinessLicens", BusinessLicens.SelectedValue);
                ME.ParamAdd("@OperationLicens", OperationLicens.SelectedValue);
                ME.ParamAdd("@PhysicalStore", PhysicalStore.SelectedValue);
                ME.ParamAdd("@DescLicens", DescLicens.Value);
                ME.ParamAdd("@Address", Address.Value);
                ME.ParamAdd("@gconfirm", 1);
                ME.ParamAdd("@CStatus", 0);
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
                             Stock = @Stock, SHave = @SHave,ImageUrl = @ImageUrl, ImageUrl2 = @ImageUrl2,
                             Gallarys = @Gallarys, Color = @Color, Byable = @Byable,  EndDDate = @EndDDate
                              , ViewGroup = @ViewGroup, PPercent =@PPercent, SPercent = @SPercent
                            ,TypeReq=@TypeReq,DescAllProduct=@DescAllProduct,FoodDrugLicens=@FoodDrugLicens,BusinessLicens=@BusinessLicens
                            ,OperationLicens=@OperationLicens ,PhysicalStore=@PhysicalStore  ,DescLicens=@DescLicens,Address=@Address,gconfirm=@gconfirm,CStatus=@CStatus
                              ,State=@State,City=@City
                              WHERE PId = @PId AND Domain = @Domain");

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

                ME.ParamAdd("@ImageUrl", uploadimagename);
                ME.ParamAdd("@ImageUrl2", uploadimagename2);

                ME.ParamAdd("@Gallarys", uploadGalery);
                ME.ParamAdd("@Color", Color.Value);
                ME.ParamAdd("@Byable", (Byable.Checked ? 1 : 0));
               // ME.ParamAdd("@Details",PCon );
                ME.ParamAdd("@EndDDate", EndDDate.Text);
                ME.ParamAdd("@ViewGroup", ViewGroup.SelectedValue);
                ME.ParamAdd("@PPercent", PPercent.Value);
                ME.ParamAdd("@SPercent", SPercent.Value);
                ME.ParamAdd("@Domain", CookieControl.GetDomainName);
                ME.ParamAdd("@TypeReq", TypeReq.SelectedValue);
                ME.ParamAdd("@DescAllProduct", DescAllProduct.Value);
                ME.ParamAdd("@FoodDrugLicens", FoodDrugLicens.SelectedValue);
                ME.ParamAdd("@BusinessLicens", BusinessLicens.SelectedValue);
                ME.ParamAdd("@OperationLicens", OperationLicens.SelectedValue);
                ME.ParamAdd("@PhysicalStore", PhysicalStore.SelectedValue);
                ME.ParamAdd("@DescLicens", DescLicens.Value);
                ME.ParamAdd("@Address", Address.Value);
                ME.ParamAdd("@gconfirm", 1);
                ME.ParamAdd("@CStatus", 0);
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
            ME.Q_Add("SELECT *, 'حذف' AS delet FROM Shop_Products WHERE Domain = @Domain ORDER BY PId  DESC");
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            Shop_ListItemsGrd.DataSource = ME._GetDataTable();
        }

        protected void Shop_ListItemsGrd_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "ProuductEdit")
            {
                int id = e.Item.ItemIndex;
                ME.Q_Add(@"SELECT        PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, 
                               ImageUrl2, Gallarys, Color, Byable, Details, EndDDate, ViewGroup, PPercent, SPercent
                                ,TypeReq,DescAllProduct,FoodDrugLicens,BusinessLicens,OperationLicens,PhysicalStore,DescLicens,Address,gconfirm,State,City
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
                //ImageUrl.Value = dv[0]["ImageUrl"].ToString();
                //ImageUrl2.Value = dv[0]["ImageUrl2"].ToString();
                Gallarys.Value = dv[0]["Gallarys"].ToString();
                Color.Value = dv[0]["Color"].ToString();
                Byable.Checked = (dv[0]["Byable"].ToString() == "1" ? true : false);
              //  P_Content.Content = dv[0]["Details"].ToString();
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
                

                gconfirm.Checked = dv[0]["gconfirm"].ToString() == "1" ? true:false;
                if(dv[0]["gconfirm"].ToString() == "1")
                {
                    saveitems.Attributes.Add("style", "display: block");
                    saveitems.Attributes.Add("disable", "false");
                }
                else
                {
                    saveitems.Attributes.Add("style", "display: none");
                    saveitems.Attributes.Add("disable", "true");
                }
                DropState.SelectedValue = dv[0]["State"].ToString() == "" ? "0" : dv[0]["State"].ToString();
                ME.Q_Add(@"SELECT       '0' AS Id, 'شهر را انتخاب کنید' Name UNION
                        SELECT Id,Name FROM City WHERE StateId=@StateId");
                ME.ParamAdd("@StateId", DropState.SelectedValue);
                DropCity.DataSource = ME._GetDataTable();
                DropCity.DataTextField = "Name";
                DropCity.DataValueField = "Id";
                DropCity.DataBind();
                DropCity.SelectedValue= dv[0]["City"].ToString();
            }
            else if(e.CommandName == "delet")
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
            if(PropSS.SelectedValue == "1")
            {
                SMM.CreateMessageAlert("Please select Property", sender);
                return;
            }
            if(PId.Value == "")
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
                                   (Pid, PropIdd, PValue)
                                     VALUES        (@Pid, @PropIdd, @PValue)");
                ME.ParamAdd("@Pid", PId.Value.Trim());
                ME.ParamAdd("@PropIdd", PropSS.SelectedValue);
                ME.ParamAdd("@PValue", PropValue.Value);
                ME.Run();
                SMM.CreateMessageAlert("Property Added To Product", sender);

            }
            else
            {

                ME.Q_Add(@"UPDATE  ShopPValue SET PValue = @Price
                       WHERE ProductId = @ProductId
                                AND PropertyId = @PropertyId");
                ME.ParamAdd("@ProductId", PId.Value.Trim());
                ME.ParamAdd("@PropertyId", PropSS.SelectedValue);
                ME.ParamAdd("@Price", PropValue.Value);
                ME.Run();
                SMM.CreateMessageAlert("Product Property is Updated", sender);
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

        protected void DropState_SelectedIndexChanged(object sender, EventArgs e)
        {
            //لیست شهرها استان

            ME.Q_Add(@"SELECT       '0' AS Id, 'شهر را انتخاب کنید' Name UNION
                        SELECT Id,Name FROM City WHERE StateId=@StateId");
            ME.ParamAdd("@StateId", DropState.SelectedValue);
            DropCity.DataSource = ME._GetDataTable();
            DropCity.DataTextField = "Name";
            DropCity.DataValueField = "Id";
            DropCity.DataBind();
        }
    }
}