<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="NM.Account.Verify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>اصلاح اطلاعات کاربری</title>

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
                <h1 class="h4 text-gray-900 mb-4">تایید شماره تلفن همراه!</h1>
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
                            <label for="Mobile" class="col-form-label-sm" >شماره موبایل</label>
                            <input name="Mobile" type="text" readonly="readonly" runat="server" class="form-control form-control-user"
                                 id="Mobile" placeholder="شماره تماس" required>                        
                    </div>
                <div class="form-group row">                        
                        <asp:Button runat="server" OnClick="sendcode1_Click" ID="sendcode1" class="btn btn-warning btn-user btn-block" Text="ارسال کد تایید" />                                        
                </div>
                <div class="form-group row">
                            <label for="NMobile" class="col-form-label-sm" >تغییر شماره موبایل</label>
                            <input name="NMobile" type="text" runat="server" class="form-control form-control-user"
                               id="NMobile" placeholder="تغییر شماره تلفن" />
                </div>
                <div class="form-group row">                        
                        <asp:Button runat="server" OnClick="sendcode1_Click" ID="sendcode2" class="btn btn-warning btn-user btn-block" Text="ارسال کد تایید" />                                        
                </div>
                     <div class="form-group row">                        
                            <label for="VCode" runat="server" id="LVCode" visible="false" class="col-form-label-sm" >کد تایید</label>
                            <input name="VCode" type="text" runat="server" visible="false" class="form-control form-control-user"
                                 id="VCode" placeholder="کد تایید">                        
                     </div>
                <div class="form-group row">                        
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-success btn-user btn-block" Text="تایید شماره تلفن" />                                        
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
