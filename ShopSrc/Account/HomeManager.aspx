<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="~/Account/HomeManager.aspx.cs" Inherits="Shop.Account.HomeManager" %>

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
            background: url('img/CHECKITLOGO.png');
            background-position: center;
            background-repeat: no-repeat;
            width: 500px;
            height: 500px;
        }
    </style>
      <link rel="stylesheet" href="../css/linearicons.css" />
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
                fin("SlidePics").value = result;
                fin("sdsd").style.display = "none";
                fin("selectpic").style.display = "none";
                fin("selecCertificatspic").style.display = "none";
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
                fin("selecCertificatspic").style.display = "none";
            }
            if (mode == 3) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() + "©";
                }
                fin("Certificats").value = result;
                fin("sdsd").style.display = "none";
                fin("selecbtpic").style.display = "none";
                fin("selecCertificatspic").style.display = "none";
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
            if (mode == 3) {
                fin("sdsd").style.display = "";
                fin("selecCertificatspic").style.display = "";
            }
        }
        function NewC() {
            document.getElementById("SID").value = "0";
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
                                    <h1 class="h4 text-gray-900 mb-4">تنظیمات صفحه اصلی</h1>
                                    <hr />
                                </div>
                                <asp:ScriptManager runat="server" ID="saca">
                                    <Services>
                                        <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
                                    </Services>
                                </asp:ScriptManager>                        
                                <%-- هغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغغ --%>
                                <%--<asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>--%>                                
                                <hr />
                                <hr />
                                <hr />
                                <%--<div onclick="fin('IId').value = '';" style="cursor: pointer; color: blue">+جدید</div>--%>
                                <div class="form-group row">
                                    <label for="SlidePics" class="col-form-label-sm">تصاویر اسلایدر</label>
                                    <input name="SlidePics" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="SlidePics" placeholder="" />
                                    <button type="button" style="display:inline-block;" onclick="showimagexplor(1);"><i class="lnr lnr-magnifier"></i></button>

                                      <telerik:RadFileExplorer style="display:none" runat="server" EnableFilterTextBox="true"
                                           Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Account/img/HM"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                         ID="sdsd" ClientIDMode="Static" ExplorerMode="Default"></telerik:RadFileExplorer>
                                    <div style="display:none" id="selectpic" onclick="collectUrls(1);">انتخاب تصویر</div>
                                </div>
                                   <div class="form-group row">
                                    <label for="BannerPic" class="col-form-label-sm">تصویر اسلاید پایین</label>
                                    <input name="BannerPic" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="BannerPic" placeholder="" />
                                    <button type="button" style="display:inline-block;" onclick="showimagexplor(2);"><i class="lnr lnr-magnifier"></i></button>

                                <%--      <telerik:RadFileExplorer style="display:none" runat="server" EnableFilterTextBox="true" 
                                          Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Shop/ShopImages"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                         ID="BNE" ClientIDMode="Static" ExplorerMode="Default"></telerik:RadFileExplorer>--%>
                                    <div style="display:none" id="selecbtpic" onclick="collectUrls(2);">انتخاب تصویر</div>
                                </div>
                                   <div class="form-group row">
                                    <label for="Certificats" class="col-form-label-sm">تصویر مجوزها</label>
                                    <input name="Certificats" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="Certificats" placeholder="" />
                                    <button type="button" style="display:inline-block;" onclick="showimagexplor(3);"><i class="lnr lnr-magnifier"></i></button>

                                <%--      <telerik:RadFileExplorer style="display:none" runat="server" EnableFilterTextBox="true" 
                                          Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Shop/ShopImages"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                         ID="BNE" ClientIDMode="Static" ExplorerMode="Default"></telerik:RadFileExplorer>--%>
                                    <div style="display:none" id="selecCertificatspic" onclick="collectUrls(3);">انتخاب تصویر</div>
                                </div>
                                <div class="form-group row">
                                    <label for="Certificats" class="col-form-label-sm">لینک ها</label>
                                    <input name="lisnks" clientidmode="Static" 
                                        runat="server" class="form-control form-control-user"
                                        id="lisnks" placeholder="*#" />
                                </div>
                               <%-- <div class="form-group row">
                                    <label for="Name" class="col-form-label-sm">نام زیر فهرست</label>
                                    <input name="Name" runat="server" class="form-control form-control-user"
                                        id="Name" placeholder="نام فهرست" />
                                </div>
                                <div class="form-group row">
                                    <label for="ParentId" class="col-form-label-sm">مادر</label>
                                    <input name="ParentId" runat="server" class="form-control form-control-user"
                                        id="ParentId" placeholder="سریال لیست مادر" />
                                </div>
                                 <div class="form-group row">
                                    <label for="Istaus" class="col-form-label-sm">وضعیت</label>
                                    <input name="Istaus" runat="server" class="form-control form-control-user"
                                        id="Istaus" placeholder="وضعیت" />
                                </div>--%>
                                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                                <asp:Literal runat="server" ID="lit"></asp:Literal>
                            </div>
                            <%-- -----%>
                        </div>
                    </div>
                </div>
                      <div onclick="NewC();" class="btn-success">جدید</div>
                      <asp:HiddenField runat="server" ClientIDMode="Static" ID="SID" />
                      <asp:TextBox runat="server" ID="Number" PlaceHolder="Number" ></asp:TextBox>
                      <asp:TextBox runat="server" ID="head"  PlaceHolder="head" ></asp:TextBox>
                      <asp:TextBox runat="server" ID="contentt" PlaceHolder="contentt" ></asp:TextBox>
                      <asp:CheckBox runat="server" ID="NEWS" Text="تبدیل به خبر" />
                      <asp:Button runat="server" OnClick="addcontent_Click" ID="addcontent" Text="اضافه" />
                      <asp:Button runat="server" OnClick="CDELETE_Click" ID="CDELETE" Text="حذف" />
                      
                                <div>
                                      <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true" Skin="WebBlue"
                                        ID="RadGrid1" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ElemntsGrid_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand"
                                        BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings> 
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="Id" Display="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال"
                                                    UniqueName="SSId">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridButtonColumn DataTextField="Id" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال"
                                                    UniqueName="Id" CommandName="ED">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridButtonColumn> 
                                                <telerik:GridBoundColumn DataField="Number" FilterControlAltText="Filter TemplateColumn column" HeaderText="شماره"
                                                    UniqueName="Number">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridBoundColumn DataField="head" FilterControlAltText="Filter TemplateColumn column" HeaderText="محتوا"
                                                    UniqueName="head">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>

                                    <telerik:RadEditor ImageManager-UploadPaths="~/Account/img/HM"
                                        ImageManager-DeletePaths="~/Account/img/HM"
                                        ImageManager-ViewPaths="~/Account/img/HM"
                                        MediaManager-ViewPaths="~/Account/img/HM" ID="P_Content"
                                        MediaManager-SearchPatterns="*.mp4, *.mp3"
                                        MediaManager-DeletePaths="~/Account/img/HM"
                                        MediaManager-UploadPaths="~/Account/img/HM" MediaManager-MaxUploadFileSize="150000000"
                                        ImageManager-MaxUploadFileSize="150000000"
                                        Width="100%" runat="server">
                                    </telerik:RadEditor>

                                    <asp:DropDownList AutoPostBack="true" runat="server" ID="PageList" OnSelectedIndexChanged="PageList_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="انتخاب" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="صفحه اصلی" Value="index.aspx"></asp:ListItem>
                                        <asp:ListItem Text="صفحه فروشگاه" Value="shop.aspx"></asp:ListItem>
                                        <asp:ListItem Text="صفحه نمایش جزئیات محصول" Value="product.aspx"></asp:ListItem>
                                        <asp:ListItem Text="نهایی کردن خرید" Value="checkout.aspx"></asp:ListItem>
                                        <asp:ListItem Text="صفحه سبد خرید" Value="cart.aspx"></asp:ListItem>
                                    </asp:DropDownList>


                                    <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true"
                                        ID="ElemntsGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ElemntsGrid_NeedDataSource"
                                        BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings> 
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView>
                                            <Columns>

                                                <telerik:GridBoundColumn DataField="elementname" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام المان"
                                                    UniqueName="elementname">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="مخفی کردن المان" UniqueName="CHK">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" Checked='<%# Eval("CHK") %>' ID="CHK" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn>                                              

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>


                                    <asp:Button runat="server" OnClick="saveitems_Click" ID="saveitems"
                                        class="btn btn-primary btn-user btn-block" Text="ذخیره" />
                                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
