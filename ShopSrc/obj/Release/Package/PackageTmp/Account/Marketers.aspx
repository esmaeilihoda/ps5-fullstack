<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="Marketers.aspx.cs" Inherits="NM.Account.Marketers" %>
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
                            <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="UserName" placeholder="نام کاربری"></asp:TextBox>

                     <label for="Name" class="col-form-label-sm" >نام </label>
                            <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="Name" placeholder="نام "></asp:TextBox>
                    
                    <label for="Family" class="col-form-label-sm" >نام خانوادگی</label>
                            <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="Family" placeholder="نام خانوادگی"></asp:TextBox>

                     <label for="SLoan" class="col-form-label-sm" >مبلغ وام</label>
                            <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="SLoan" placeholder="مبلغ وام"></asp:TextBox>     
                               <asp:Button runat="server" ID="filters" OnClick="UserName_TextChanged" Text="Filter" />
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
                            </div>  </div>                           
                            <!-- end page title -->
                                   
         <div class="row">
             <div class="col-xl-9">        
          <telerik:RadGrid AllowPaging="true" PageSize="40" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Marketers_Grid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
           OnNeedDataSource="Marketers_Grid_NeedDataSource"  OnItemCommand="Marketers_Grid_ItemCommand"             
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="Id" UniqueName="Id">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" Font-Size="Small"  HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="UserName" UniqueName="UserName">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" Font-Size="Small"  HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridNumericColumn DataField="nf" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter column3 column" HeaderText="ن.خ" UniqueName="nf">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridNumericColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="معرف" UniqueName="PositionRecord" DataField="PositionRecord" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="وضعیت" UniqueName="STATUS" DataField="STATUS" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="نحوه فعال شدن جایگاه" UniqueName="MType" DataField="MType" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small"
                                 HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter column9 column" HeaderText="موبایل" UniqueName="Mobile" DataField="Mobile" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="ایمیل" UniqueName="Email" DataField="Email" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="راست" UniqueName="rdir" DataField="rdir" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="چپ" UniqueName="ldir" DataField="ldir" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn> 
                                  
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="وام" UniqueName="SLOAN" DataField="SLOAN" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="اختلاف" UniqueName="EXTT" DataField="EXTT" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="PD" UniqueName="password" DataField="password" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                                                
                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                             ShowFilterIcon="false" HeaderText="تاریخ" UniqueName="ADate" DataField="ADate" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                        <telerik:GridButtonColumn CommandName="Confirm" FilterControlAltText="Filter column9 column" HeaderText="ت.ر"
                             ConfirmText="آیا برای تغییر رمز مطمئن هستید؟!!!"                          
                             UniqueName="CD_DL" DataTextField="Id" HeaderTooltip="رمز">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>
                        
                        <telerik:GridButtonColumn CommandName="Maghroozi" FilterControlAltText="Filter column9 column" HeaderText="ت.م"
                             ConfirmText="آیا برای تبدیل به مقروضی مطمئن هستید؟!!!"                          
                             UniqueName="Maghroozi" DataTextField="Id" HeaderTooltip="رمز">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" 
                                HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>

                        <telerik:GridButtonColumn CommandName="Llogin" FilterControlAltText="Filter column9 column" HeaderText="پروفایل"                                                    
                             UniqueName="Llogin" DataTextField="Id" HeaderTooltip="Llogin">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>


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
