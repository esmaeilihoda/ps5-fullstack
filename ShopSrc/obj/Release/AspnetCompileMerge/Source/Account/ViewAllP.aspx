<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="ViewAllP.aspx.cs" Inherits="NM.Account.ViewAllP" %>
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
                <asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>         

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
                                                            <i class="ti-filter mr-1"></i>فیلتر
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated">                                                            
                                                            <div class="dropdown-divider"></div>
                                                            
                     <label for="UserName" class="col-form-label-sm" >نام کاربری</label>
                            <asp:TextBox OnTextChanged="UserName_TextChanged" AutoPostBack="true" runat="server" class="form-control form-control-user"
                               ID="UserName" placeholder="نام کاربری"></asp:TextBox>

                     <label for="Name" class="col-form-label-sm" >نام </label>
                            <asp:TextBox OnTextChanged="UserName_TextChanged" AutoPostBack="true" runat="server" class="form-control form-control-user"
                               ID="Name" placeholder="نام "></asp:TextBox>
                    
                    <label for="Family" class="col-form-label-sm" >نام خانوادگی</label>
                            <asp:TextBox OnTextChanged="UserName_TextChanged" AutoPostBack="true" runat="server" class="form-control form-control-user"
                               ID="Family" placeholder="نام خانوادگی"></asp:TextBox>

                     <label for="SLoan" class="col-form-label-sm" >مبلغ وام</label>
                            <asp:TextBox OnTextChanged="UserName_TextChanged" AutoPostBack="true" runat="server" class="form-control form-control-user"
                               ID="SLoan" placeholder="مبلغ وام"></asp:TextBox>                                                        </div>
                         </div>
                                                </div>
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->
                                    </div>
                                    <!-- end page-title-box -->
                                </div>
                            </div>  </div>                           
                            <!-- end page title -->
                                   
         <div class="row">
             <div class="col-xl-9">        
          <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Marketers_Grid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
            OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="MID" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                             FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="MID">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری" UniqueName="UserName">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn DataField="Name" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter column3 column" HeaderText="نام" UniqueName="Name">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridNumericColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نام خانوادگی" UniqueName="Family" DataField="Family" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="رزروA" UniqueName="SR" DataField="SR" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter column9 column" HeaderText="رزروB" UniqueName="SL" DataField="SL" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="تعادل" UniqueName="SP" DataField="SP" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="پورسانت" UniqueName="SUMP" DataField="SUMP" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="بن" UniqueName="Kif" DataField="Kif" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
                 <hr />
                 <%--OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"--%>  
</ContentTemplate></asp:UpdatePanel>
                            <!-- end row -->
                            <!-- end row -->
                                      
                           <!-- end row -->
</asp:Content>
