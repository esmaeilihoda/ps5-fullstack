<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="Adindex.aspx.cs" Inherits="NM.Account.Adindex" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <style type="text/css">
                  *{
            direction:rtl;
            font-family:BK;
        }
        @font-face {
	font-family: 'BK';
	src: 
	url('../Fonts/BKoodakBold.ttf') 
	format('opentype');
}
    </style>
    <asp:ScriptManager runat="server" ID="SM">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager> 
                        <div class="container-fluid">
                             <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-title-box">
                                        <div class="row align-items-center">
                                            <div class="col-md-8">
                                                <h4 runat="server" id="disnmae" class="page-title m-0">میز کار</h4>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="float-right d-md-block">
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="ti-reload mr-1"></i>بروزرسانی
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated">
                                                            <asp:LinkButton runat="server" ID="NewPr" OnClick="NewPr_Click"
                                                                 CssClass="dropdown-item" >بروزرسانی و پردازش دوباره</asp:LinkButton>   
                                                               <asp:LinkButton Visible="false" runat="server" ID="ZeroDay" OnClick="ZeroDay_Click"
                                                                 CssClass="dropdown-item" >صفر کردن پورسانت و پاداش تیم</asp:LinkButton>  
                                                            <asp:LinkButton runat="server" ID="reqall" OnClick="reqall_Click"
                                                                 CssClass="dropdown-item" >req all</asp:LinkButton>  
                                                               <asp:LinkButton  runat="server" ID="CreateWallet" OnClick="CreateWallet_Click"
                                                                 CssClass="dropdown-item" >ساختن ولت برای کل تیم</asp:LinkButton>                                                                                                                     
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="#">لغو عملیات</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->
                                    </div>
                                    <!-- end page-title-box -->
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">مجموع پورسانت های قابل پرداخت</div>
                                                    <div runat="server" id="Poorsant" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300" style="color:orangered"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">مجموع پورسنات پرداخت شده</div>
                                                    <div runat="server" id="PoorsantPshode" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"  style="color:cornflowerblue"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">مجموع وچرها</div>
                                                    <div runat="server" id="Vocherha" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color:orangered"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">وچرهای خرج شده</div>
                                                    <div runat="server" id="VocheXarji" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color:cornflowerblue"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                               <%-- end of row --%> 
                                         
                            <div class="row">            
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-info mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">جمع واریزی های به شرکت</h6>
                                                <h4 runat="server" id="SumVariz" class="mb-3 mt-0 float-right">$0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-danger"> </span> <span class="ml-2"></span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-buffer h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0"> : $0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-pink mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">جمع پرداخت های شرکت</h6>
                                                <h4 runat="server" id="SumPCompany" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2"></span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین واریزی : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-dark mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">کیف پول</h6>
                                                <h4 runat="server" id="kife" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">وام</h6>
                                                <h4 runat="server" id="loan" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-danger text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                  <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">جایگاه خریداری شده از وام</h6>
                                                <h4 runat="server" id="vamxarid" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-danger text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                            </div>                              
                            <!-- end row -->                            
                            </div>
                            <!-- end page title -->
     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Marketers_Grid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
           OnNeedDataSource="Marketers_Grid_NeedDataSource" ClientSettings-Scrolling-AllowScroll="true"
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری" UniqueName="UserName">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" Font-Size="Small"  HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
<asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>
         <div class="row">
             <div class="col-xl-9">                  
                 <%--OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"--%>        
</ContentTemplate></asp:UpdatePanel>
                           <!-- end row -->
                           <!-- end row -->
</asp:Content>
