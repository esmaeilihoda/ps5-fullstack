<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="PayVoucherSetting.aspx.cs" Inherits="NM.Shop.Admin.PayVoucherSetting" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
   
   
       <div class="row text-right" style="margin-top:85px;direction:rtl;">
           <div class="col-2"><span >گروه محصول</span></div>
           <div class="col-6 text-rigth">
               <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="PGroup_SelectedIndexChanged" CssClass="form-control" ID="PGroup" runat="server" >
                  
               </asp:DropDownList>
           </div>
           <div class="col-1 text-right"><span >فعال</span>
               <input type="checkbox" />

           </div>
           
               
          
       </div>
       <div class="row">
           <div col="12"></div>
       </div>
  

</asp:Content>

