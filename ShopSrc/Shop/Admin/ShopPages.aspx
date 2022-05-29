<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="ShopPages.aspx.cs" Inherits="Shop.Shop.Admin.ShopPages" %>

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
                                    <h1 class="h4 text-gray-900 mb-4">دسته بندی محصولات!</h1>
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
                                <hr />
                                <hr />
                                <hr />
                                <div onclick="fin('IId').value = '';" style="cursor: pointer; color: blue">+جدید</div>
                                <div class="form-group row">
                                    <label for="IId" class="col-form-label-sm">سریال</label>
                                    <input name="IId" clientidmode="Static" readonly="readonly" type="number"
                                        runat="server" class="form-control form-control-user"
                                        id="IId" placeholder="" />
                                </div>
                                <div class="form-group row">
                                    <label for="Name" class="col-form-label-sm">نام صفحه</label>
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
                                </div>
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
                                                <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="Id">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridButtonColumn CommandName="ListEdit" FilterControlAltText="Filter column9 column" HeaderText="عملیات"
                                                    UniqueName="GName" DataTextField="GName" HeaderTooltip="برای اصلاح لیست روی نام لیست کلیک کنید">
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridButtonColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
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
                                     
                                    <asp:Button runat="server" OnClick="Delete_Click" ID="Delete"
                                        class="btn btn-danger btn-user btn-block" Text="حذف" />
                                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
