<%@ Page Title="پرداخت صورتحساب" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="True" CodeBehind="ShopZarPayment.aspx.cs" Inherits="NM.Shop.ShopZarPayment" %>
<asp:Content ID="Content2" ContentPlaceHolderID="AftSlideBox" runat="server">
       
       
        
                  
         
            <div class="col-5 m-auto shopzarPaymentwraperresult" >
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">نتیجه پرداخت صورتحساب!</h1>
                  <hr />
              </div>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <%--<asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>--%>
         
                <asp:Panel runat="server" ID="alarm" style="font-size:xx-large" CssClass="btn btn-danger btn-user btn-block">
                </asp:Panel>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
  <%--                      <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="تغییر رمز" />                        --%>
               
            </div>
                  <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                <asp:Literal runat="server" ID="lit"></asp:Literal>
                <a href="/Shop/Factors.aspx" class="btn btn-secondary btn-block">صورتحساب ها </a>
    </div>
     
        
      
     
</asp:Content>
