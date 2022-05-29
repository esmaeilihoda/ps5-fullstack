<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="Showpay.aspx.cs" Inherits="NM.Shop.Admin.Showpay" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
   
    <div class="col-12 " style="margin-top:85px;">
         <asp:ScriptManager runat="server" ID="UCCPH"></asp:ScriptManager>
                                       <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="ShowOrdersGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ShowOrdersGrid_NeedDataSource" OnItemCommand="ShowOrdersGrid_ItemCommand"
                                                     Skin="Glow"
                                          BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView AllowFilteringByColumn="true">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter TemplateColumn column"
                                                    HeaderText="سریال" UniqueName="Id" AllowFiltering="true">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center"  />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                                    UniqueName="UserName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                  <telerik:GridBoundColumn DataField="Date" DataFormatString="{0:####/##/##}" FilterControlAltText="Filter TemplateColumn column" HeaderText="تاریخ"
                                                    UniqueName="Date">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="satatus"  FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                                    UniqueName="satatus">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                  <telerik:GridBoundColumn DataField="Amt" FilterControlAltText="Filter TemplateColumn column" HeaderText="پرداختی"
                                                    UniqueName="Amt">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                             
                                                
                                                 

                                                

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
</div>
</asp:Content>

