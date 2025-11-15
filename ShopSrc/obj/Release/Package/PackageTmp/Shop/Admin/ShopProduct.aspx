<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="ShopProduct.aspx.cs" Inherits="NM.Shop.Admin.ShopProduct" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>اصلاح اطلاعات کاربری</title>

    <!-- Custom fonts for this template-->
    <!-- Custom styles for this template-->
    <style type="text/css">
        @font-face {
            font-family: 'BK';
            src: url('../Fonts/BKoodakBold.ttf') format('opentype');
        }

        * {
            font-family: BK;
            direction: rtl;
        }

        .bg-register-image {
            background: url('img/wse-logo.png');
            background-position: center;
            background-repeat: no-repeat;
            width: 500px;
            height: 500px;
        }
    </style>
    <script type="text/javascript" src="../../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript" src="../../Account/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
        //window.onload += rr();
        function clear() {
            var data = "{'tt':''}";
            var url = "ShopAdmin.asmx/HW";
            alert(ShopAdmin.HW(''));
            //alert(Ajax_Wecan(data, url));
        }
        function collectUrls(mode) {
            if (mode == 1) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() + "©";
                }
                fin("CCPH_Gallarys").value = result;
                fin("sdsd").style.display = "none";
                fin("selectpic").style.display = "none";
            }
            if (mode == 2) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() + "©";
                }
                fin("BannerPic").value = result;
                fin("sdsd").style.display = "none";
                fin("selecbtpic").style.display = "none";
            }
        }
        function showimagexplor(mode) {
            if (mode == 1) {
                fin("sdsd").style.display = "";
                fin("selectpic").style.display = "";
            }
            if (mode == 2) {
                fin("sdsd").style.display = "";
                fin("selecbtpic").style.display = "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CCPH" runat="server">
    <asp:UpdatePanel runat="server" ID="as">
        <ContentTemplate>
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">تعریف محصولات!</h1>
                                    <hr />
                                </div>
                                <asp:ScriptManager runat="server" ID="saca">
                                    <Services>
                                        <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
                                    </Services>
                                </asp:ScriptManager>                        
                                <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
                                <%--<asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>--%> 
                              <div class="form-group row">
                                    <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="Shop_ListItemsGrd" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="Shop_ListItemsGrd_NeedDataSource" OnItemCommand="Shop_ListItemsGrd_ItemCommand"
                                        BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="PId" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="PId">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="PName" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام محصول"
                                                     UniqueName="PName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                <telerik:GridBoundColumn DataField="Price" FilterControlAltText="Filter TemplateColumn column" HeaderText="قیمت"
                                                     UniqueName="Price">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="VPrice" FilterControlAltText="Filter TemplateColumn column" HeaderText="قیمت ویژه"
                                                     UniqueName="VPrice">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridButtonColumn CommandName="ProuductEdit" FilterControlAltText="Filter column9 column" HeaderText="عملیات"
                                                    UniqueName="Dsc" DataTextField="Dsc" HeaderTooltip="برای اصلاح لیست روی نام لیست کلیک کنید">
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridButtonColumn>

                                                <telerik:GridButtonColumn CommandName="delet" FilterControlAltText="Filter column9 column" HeaderText="حذف"
                                                    UniqueName="delet" DataTextField="delet" ConfirmText="برای حذف محصول مطمئن هستید؟!" >
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridButtonColumn>

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>                               
                                <hr />
                                <hr />
                                <hr />
                                <div onclick="fin('PId').value = '';" style="cursor: pointer; color: blue">+جدید</div>
                                <div class="form-group row">
                                  <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="PId" class="col-form-label-sm">سریال</label>
                                    <input name="PId" clientidmode="Static" readonly="readonly" type="number"
                                        runat="server" class="form-control form-control-user"
                                        id="PId" placeholder="" />
                                </div>
                                  <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="GRP" class="col-form-label-sm">دسته</label>
                                    <asp:DropDownList runat="server" ID="GRP" DataTextField="GName" DataValueField="Id" >
                                    </asp:DropDownList>
                                </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="PName" class="col-form-label-sm">نام محصول</label>
                                    <input name="PName" runat="server" class="form-control form-control-user"
                                        id="PName" placeholder="نام محصول" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Price" class="col-form-label-sm">قیمت</label>
                                    <input name="Price" runat="server" class="form-control form-control-user"
                                        id="Price" placeholder="قیمت" />
                                 </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="VPrice" class="col-form-label-sm">قیمت ویژه</label>
                                    <input name="VPrice" runat="server" class="form-control form-control-user"
                                        id="VPrice" placeholder="قیمت ویژه" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Disc" class="col-form-label-sm">درصد تخفیف</label>
                                    <input name="Disc" runat="server" class="form-control form-control-user"
                                        id="Disc" placeholder="درصد تخفیف" />
                                 </div>
                                </div>
                                <div class="form-group row">
                                  <div class="col-sm-6 mb-3 mb-sm-0">
                                   <label for="EndDDate" class="col-form-label-sm" >تاریخ اتمام تخفیف</label>
                                   <telerik:RadMaskedTextBox runat="server" Mask="####/##/##" ID="EndDDate" class="form-control form-control-user" >
                                     </telerik:RadMaskedTextBox>
                                  </div>
                                  
                                  <div class="col-sm-6 mb-3 mb-sm-0">
                                   <label for="ViewGroup" class="col-form-label-sm" >دسته بندی نمایشی</label>
                                    <asp:DropDownList runat="server" ID="ViewGroup">
                                        <asp:ListItem Text="برترین ها" Value="Bests"></asp:ListItem>
                                        <asp:ListItem Text="جدید ترینها" Value="Newest"></asp:ListItem>
                                        <asp:ListItem Text="پر فروش ترینها" Value="Bestselling"></asp:ListItem>
                                    </asp:DropDownList>
                                  </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="ImageUrl" class="col-form-label-sm">تصویر اول</label>
                                    <input name="ImageUrl" runat="server" class="form-control form-control-user"
                                        id="ImageUrl" placeholder="تصویر اول" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="ImageUrl2" class="col-form-label-sm">تصویر دوم</label>
                                    <input name="ImageUrl2" runat="server" class="form-control form-control-user"
                                        id="ImageUrl2" placeholder="تصویر دوم" />
                                 </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Dsc" class="col-form-label-sm">توضیح کوتاه محصول</label>
                                    <input name="Dsc" runat="server" class="form-control form-control-user"
                                        id="Dsc" placeholder="توضیح کوتاه محصول" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Size" class="col-form-label-sm">سایز</label>
                                    <input name="Size" runat="server" class="form-control form-control-user"
                                        id="Size" placeholder="سایز محصول" />
                                 </div>
                                </div>
                                 <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Stock" class="col-form-label-sm">میزان موجودی</label>
                                    <input name="Stock" runat="server" class="form-control form-control-user"
                                        id="Stock" placeholder="موجودی" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="SHave" class="col-form-label-sm">دارای موجودی</label>
                                    <asp:CheckBox runat="server" ID="SHave" Text="" />
                                 </div>
                                </div>
                                <%--(PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, ImageUrl2, Gallarys, Color, Byable, Details)--%>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Stock" class="col-form-label-sm">انتخاب رنگ</label>
                                    <input name="Stock" type="color" runat="server" class="form-control form-control-user"
                                        id="Color" placeholder="رنگ" />
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="Stock" class="col-form-label-sm">قابل خرید</label>
                                    <asp:CheckBox runat="server" ID="Byable" Text="" />
                                </div>
                                </div>

                                <div class="form-group row">
                                    <label for="Gallarys" class="col-form-label-sm">تصاویر گالری</label>
                                    <input name="Gallarys" runat="server" class="form-control form-control-user"
                                        id="Gallarys" placeholder="تصویر گاری" />
                                    <button type="button" style="display:inline-block;" onclick="showimagexplor(1);"><i class="lnr lnr-magnifier"></i></button>
                                            <telerik:RadFileExplorer style="display:none" runat="server" EnableFilterTextBox="true"
                                           Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Shop/ShopImages"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                         ID="sdsd" ClientIDMode="Static" ExplorerMode="Default"></telerik:RadFileExplorer>
                                    <div style="display:none" id="selectpic" onclick="collectUrls(1);">انتخاب تصویر</div>
                                </div>
 
                                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                                <asp:Literal runat="server" ID="lit"></asp:Literal>
                            </div>
                            <%-- -----%>
                        </div>
                    </div>
                </div>
                
                                <div>
                                    <telerik:RadEditor ImageManager-UploadPaths="~/Shop/ShopImages"
                                         ImageManager-DeletePaths="~/Shop/ShopImages"
                                        ImageManager-ViewPaths="~/Shop/ShopImages" 
                                        MediaManager-ViewPaths="~/Shop/ShopImages" ID="P_Content"
                                        MediaManager-SearchPatterns="*.mp4, *.mp3"
                                        MediaManager-DeletePaths="~/Shop/ShopImages" 
                                        MediaManager-UploadPaths="~/Shop/ShopImages" MediaManager-MaxUploadFileSize="150000000"
                                        ImageManager-MaxUploadFileSize="150000000"
                                        Width="100%" runat="server">
                                    </telerik:RadEditor>
                                    <asp:Button runat="server" OnClick="saveitems_Click" ID="saveitems"
                                        class="btn btn-primary btn-user btn-block" Text="ذخیره" />             
                                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
