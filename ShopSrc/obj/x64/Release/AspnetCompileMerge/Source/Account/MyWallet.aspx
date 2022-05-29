<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="MyWallet.aspx.cs" Inherits="NM.Account.MyWallet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <br /><br /><br /><br /><br /><br /><br /><br />
    <div style="direction:ltr">
        <span style="font-size:xx-large">YOUR WALLET ID IS ::::</span><br />
    <asp:Label style="direction:ltr" Font-Size="XX-Large" runat="server" ID="wll"></asp:Label>
        </div>
</asp:Content>
