<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="CHUP.aspx.cs" Inherits="NM.Account.CHUP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>تغییر رمز کاربران</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <br /><br /><br /><br /><br /><br /><br /><br />
     <div class="form-group row">
        <asp:TextBox runat="server" ID="password" CssClass="form-control form-control-user"></asp:TextBox>
        <asp:Button runat="server"  ID="Save" OnClick="Save_Click" class="btn btn-primary btn-user btn-block" Text="تغییر رمز کاربر" /> 
                <a class="small" href="Adindex.aspx">برگشت به پنل مدیریت</a>
            </div>
</asp:Content>
    
