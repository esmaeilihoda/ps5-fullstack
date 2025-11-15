<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="PayPhostReq.aspx.cs" Inherits="NM.Account.PayPhostReq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>درخواست واریز  همکاری در فروش</title>

  <!-- Custom fonts for this template-->
  <!-- Custom styles for this template-->
    <style type="text/css">
        @font-face {
	font-family: 'BK';
	src: 
	url('../Fonts/BKoodakBold.ttf') 
	format('opentype');
}
*{
    font-family:BK;
    direction:rtl;
}
.bg-register-image {
    background: url('img/wse-logo.png');
     background-position: center; 
    background-repeat:no-repeat;
    width:500px;
    height:500px;
}
    </style>
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">درخواست واریز وجه همکاری در فروش</h1>
                  <hr />
              </div>        
            <asp:ScriptManager runat="server" ID="saca">
                  <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
            </asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <%--<asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>--%>
            
                    <div class="form-group row">                        
                           <div class="col-12">
                               <label for="MandePhost" class="col-form-label-sm" >میزان موجودی:  </label>
                             <span id="MandePhost"  runat="server" class="col-form-label-sm" >  </span>
                           </div>
                            
                        
                        <div class="col-12">
                        <p runat="server" id="mandekif" for="PayKif" class="col-form-label-sm" ></p>
                            </div>
                    </div>
                <div class="form-group row">
                            <label for="TContent" class="col-form-label-sm" >مبلغ</label>
                            <input name="TContent" type="number" runat="server" class="form-control form-control-user"
                               id="TContent" placeholder="مبلغ درخواستی" required />
                </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ارسال" />                        
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
                  <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                <asp:Literal runat="server" ID="lit"></asp:Literal>
    </div>
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>    
</asp:Content>
