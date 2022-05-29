<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="FreeCgp.aspx.cs" Inherits="NM.Account.FreeCgp" %>
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
                <h1 class="h4 text-gray-900 mb-4">آزاد کردن جایگاه مقروضی!</h1>
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
                <asp:Panel runat="server" ID="alarm" style="font-size:xx-large" CssClass="btn btn-danger btn-user btn-block">
                </asp:Panel>
                <div class="form-group row">
                       <label for="Pass" class="col-form-label-sm" >Pass</label>
                            <asp:TextBox runat="server" class="form-control form-control-user"
                               ID="Pass" placeholder="Pass"></asp:TextBox>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                         <input name="UId" type="text" runat="server" class="form-control form-control-user"
                                 id="UId" placeholder="کد کاربری" required>
                    </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ارتقا جایگاه" />                        
                        <asp:Button runat="server" OnClick="TBP_Click" ID="TBP" class="btn btn-primary btn-user btn-block" Text="ت.ب.پ" />                        
                                                <asp:Button runat="server" OnClick="Aturbo_Click" ID="Aturbo" class="btn btn-primary btn-user btn-block" Text="توربو" />   
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
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
