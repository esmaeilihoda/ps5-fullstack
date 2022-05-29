<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NM.Account.Login" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>ورود به پنل کاربری</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
.bg-login-image {
    background: url('img/wse-logo.png');
     background-position: center; 
    background-repeat:no-repeat;
    width:500px;
    height:500px;
}        
.imageClass
{
    margin-top: 10px;
    margin-bottom: 10px;
    border: 1px solid #000;
}
.textBox
{
    display: block;
    margin-bottom: 10px;
}
.moduleContainer
{
    background-color: #dff3ff;
    border: 1px solid #c6e1f2;
    padding: 15px 0 30px 10px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -moz-box-shadow: 5px 5px 10px #ccc;
    -webkit-box-shadow: 5px 5px 10px #ccc;
    box-shadow: 5px 5px 10px #ccc;
}
.imgCorrectCode
{
    margin-top: 10px;
    margin-bottom: 10px;
    border: 3px solid green;
}
.imgWrongCode
{
    margin-top: 10px;
    margin-bottom: 10px;
    border: 3px solid red;
}
    </style>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
    </script>
</head>

<body class="bg-gradient-primary">

  <div class="container">
      <form id="forml" runat="server">
<asp:ScriptManager runat="server" ID="rezSC">
      <Services>
        <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
      </Services>
</asp:ScriptManager>
          
    <!-- Outer Row -->
<%--  <asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>--%>
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">خوش آمدید!!</h1>
                  </div>
                    <div class="form-group">
                      <input type="text" runat="server" class="form-control form-control-user" id="UName" aria-describedby="emailHelp" placeholder="نام کاربری">
                    </div>
                    <div class="form-group">
                      <input type="password" runat="server" class="form-control form-control-user" id="Password" placeholder="رمز عبور">
                    </div>
                    <a runat="server" visible="false" id="ffa" href="#" class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">                      
                    </span>
                    <span runat="server" onclick="alarmclick();" id="alarm" class="text"></span>
                  </a>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">مرا به خاطر بسپار</label>
                      </div>
                    </div>              
 <%--   <telerik:RadFormDecorator RenderMode="Lightweight" ID="FormDecorator1" runat="server" DecoratedControls="All" DecorationZoneID="zoneToDecorate">
    </telerik:RadFormDecorator>--%>
    <div class="form-group">
    <div class="demo-containers">
    <div class="demo-container" id="zoneToDecorate">
        <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ValidationGroup="Group" 
            ErrorMessage="عدد وارد شده درست نیست دوباره امتحان کنید!!"
            CaptchaTextBoxCssClass="textBox" OnCaptchaValidate="RadCaptcha1_CaptchaValidate" >
            <CaptchaImage ImageCssClass="form-control form-control-user" BackgroundColor="#dff3ff" TextColor="Red"
                RenderImageOnly="true"></CaptchaImage>
        </telerik:RadCaptcha>
        جمع عددهای موجود در تصویر را وارد کنید
        <br />
        (اگر عددی نمیبینید 0 را وارد کنید):<br />
        </div>
        <div class="form-group">
        <input type="text" class="form-control form-control-user" id="ValdiationCodeDigitsSum" runat="server" />
        <div style="margin-top: 15px;">
            <asp:Button CssClass="btn btn-primary btn-user btn-block" ID="btnValidate" runat="server" Text="ورود" ValidationGroup="Group">
            </asp:Button>
        </div>
        </div>
    </div>
    </div>
                    
                    <%--<asp:Button runat="server" ID="Btn_Login" OnClick="Btn_Login_Click" Text="ورود" class="btn btn-primary btn-user btn-block" />                      --%>
                    <hr>
                    <a href="#" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> ورورد با گوگل
                    </a>
                    <a href="#" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> ورود با فیس بوک
                    </a>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="#">رمز عبور خود را فراموش کرده اید?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="Register.aspx">ثبت نام!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="../index.aspx">برگشت به صفحه اصلی!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
<%--   </ContentTemplate></asp:UpdatePanel>--%>
  </form>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>



    