<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="CoinSetting.aspx.cs" Inherits="NM.Account.CoinSetting" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <asp:ScriptManager runat="server" ID="SmT"></asp:ScriptManager>
    <br /><br /><br /><br /><br /><br /><br /><br />
    <div style="direction:ltr">
        <asp:UpdatePanel runat="server" ID="up1">
           <ContentTemplate>
        <asp:TextBox runat="server" ID ="USDP"></asp:TextBox>
        <asp:TextBox runat="server" ID="MTTP"></asp:TextBox>
        <asp:Button runat="server" ID="SavePrice" OnClick="SavePrice_Click" Text="ذخیره" />
                  <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true" 
           ID="coinhistory" runat="server" AutoGenerateColumns="true" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"        
            OnNeedDataSource="coinhistory_NeedDataSource" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            </ContentTemplate></asp:UpdatePanel>
        </div>
</asp:Content>
