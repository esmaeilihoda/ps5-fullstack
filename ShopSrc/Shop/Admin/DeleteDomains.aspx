<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="DeleteDomains.aspx.cs" Inherits="Shop.Shop.Admin.DeleteDomains" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
   
    <div class="col-12 " style="margin-top:85px;">
         <asp:ScriptManager runat="server" ID="UCCPH"></asp:ScriptManager>
                                       <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="ShowDomainsGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ShowDomainsGrid_NeedDataSource" OnItemCommand="ShowDomainsGrid_ItemCommand"
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

                                                <telerik:GridBoundColumn DataField="DRusername" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                                    UniqueName="DRusername">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                  <telerik:GridBoundColumn DataField="DRsubdomain" FilterControlAltText="Filter TemplateColumn column" HeaderText="دامنه"
                                                    UniqueName="DRsubdomain">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                  <telerik:GridTemplateColumn DataField="Dsc" FilterControlAltText="Filter TemplateColumn column" HeaderText="توضیحات"
                                                    UniqueName="Dsc">
                                                      <ItemTemplate>
                                                          <asp:TextBox runat="server" Text='  <%# Eval("Dsc")  %>' ID="Dscc" Width="100%" ></asp:TextBox>
                                                      </ItemTemplate>
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridBoundColumn DataField="DRmobile" FilterControlAltText="Filter TemplateColumn column" HeaderText="تلفن همراه"
                                                    UniqueName="DRmobile">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                  <telerik:GridButtonColumn CommandName="ChangeStatus" DataTextField="Status" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                                    UniqueName="Status">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridButtonColumn>

                                                 <telerik:GridButtonColumn CommandName="InserDsc" DataTextField="NOK" FilterControlAltText="Filter TemplateColumn column" HeaderText="NOK"
                                                    UniqueName="NOK">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridButtonColumn>
                                                
                                                <telerik:GridButtonColumn CommandName="DeleteDomain" DataTextField="Del" FilterControlAltText="Filter TemplateColumn column" HeaderText="NOK"
                                                    UniqueName="Del">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridButtonColumn>

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
</div>
</asp:Content>

