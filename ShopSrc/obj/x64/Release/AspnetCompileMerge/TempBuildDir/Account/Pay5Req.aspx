<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="Pay5Req.aspx.cs" Inherits="NM.Account.Pay5Req" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>درخ.است واریز توربو</title>

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
                <h1 class="h4 text-gray-900 mb-4">درخواست واریز وجه توربو!</h1>
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
            <div style="display:none" class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="UserName" class="col-form-label-sm" >نام کاربری سیستمی</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moaref" class="col-form-label-sm" >نام معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefusername" class="col-form-label-sm" >نام کاربری معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefphone" class="col-form-label-sm" >شماره تماس معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="Tsabt" class="col-form-label-sm" >تاریخ ثبت</label>                            
                        </div>
              </div>
                    <div class="form-group row">                        
                            <label for="PayKif" class="col-form-label-sm" >درخواست از کیف پول</label>
                            <asp:DropDownList CssClass="dropdown" OnSelectedIndexChanged="PayKif_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server" ID="PayKif">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب کیف پول"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="کیف پول اصلی توربو"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="کیف پول بن خرید"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="3" Text="وام"></asp:ListItem>                                        
                                    </asp:DropDownList>
                        <label runat="server" id="mandekif" for="PayKif" class="col-form-label-sm" ></label>
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
