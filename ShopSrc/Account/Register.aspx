<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Shop.Account.Register" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>CHECKIT</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

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
.bg-register-image {
    background: url('img/CHECKITLOGO.png');
     background-position: center; 
    background-repeat:no-repeat;
    width:500px;
    height:500px;
}
    </style>
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
      <script type="text/javascript">
        function RCode_Change() {
            fin("GetRName").click();
        }
        function MRCode_Change() {
            fin("GetMN").click();
        }
          function omidenglishprevent(event, omid) {
              if (document.getElementById(omid).value != "") {
            if (/^[a-zA-Z]+$/.test(document.getElementById(omid).value)) {
                return true;
            } else {
                alert("زبان کیبورد را به انگلیسی تغییر دهید");
                document.getElementById(omid).value = "";
                return false;
                  }
              }
        }
      </script>  
</head>

<body  style="background-color:black">

  <div class="container" >
      <br /><br />
    <div  style="background-color:rgb(14 23 38);width:96%;border-style:double;border-color:red;border-radius:25px;margin-bottom:40px">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-danger mb-4">ثبت نام</h1>
              </div>
        <form id="form1" runat="server" class="user">
            <asp:ScriptManager runat="server" ID="saca">
                  <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
            </asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>
                    <%--                            
                                <fieldset>
                                    <input name="RG_Code" onchange="MRCode_Change();" runat="server" type="text" class="form-control" id="RG_Code" placeholder="ثبت موقعیت" >
                                    <asp:Label ID="RG_LBL" runat="server" 
                                        style="color:red;font-size:x-large;font-family:'BK';font-style:italic" CssClass="alert-success"></asp:Label>
                                </fieldset>--%>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input name="name" type="text" runat="server" class="form-control form-control-user"
                                 id="name" placeholder="نام" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">

                            <input name="Fname" type="text" runat="server" class="form-control form-control-user"
                                 id="Fname" placeholder="نام خانوادگی" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input name="Ename" 
                                onkeypress="omidenglishprevent(event, this.id);" 
                                 onkeyup="omidenglishprevent(event, this.id);" 
                                type="text" runat="server" class="form-control form-control-user"
                                 id="Ename" placeholder="Name" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">

                            <input name="EFname" 
                                onkeypress="omidenglishprevent(event, this.id);" 
                                 onkeyup="omidenglishprevent(event, this.id);" 
                                 type="text" runat="server" class="form-control form-control-user"
                                 id="EFname" placeholder="Family" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0" style="display:none">

                            <input name="NationalCode" type="text" runat="server" class="form-control form-control-user"
                                 id="NationalCode" placeholder="کد ملی" style="display:none">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">

                            <input name="email" type="email" runat="server" class="form-control form-control-user"
                                 id="email" placeholder="ایمیل" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input name="Tell" type="text" runat="server" class="form-control form-control-user"
                                 id="Tell" placeholder="شماره موبایل" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0" >

                            <input name="D_Code" onchange="RCode_Change();" runat="server" type="text"
                                 class="form-control form-control-user" id="D_Code" placeholder="کد معرف" autocomplete="off">
                            <asp:Label ID="D_Name" runat="server"
                                Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>
                        </div>
                    </div>
                    
                         <div class="form-group row">
               <label for="scan" class="col-form-label-sm" >قوانین و مقررات</label>
                <textarea readonly="readonly" class="form-control form-control" style="height:500px" >
                <%--CHECKIT--%>    
                </textarea></div>
          <div class="form-group row">
                <asp:CheckBox Font-Size="Medium" TextAlign="Right" ID="gconfirm" OnCheckedChanged="gconfirm_CheckedChanged" runat="server" AutoPostBack="true"
                     Text="قوانین  را خوانده و مورد قبول اینجانب میباشد" />
              </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">

                            <input name="Pass" type="password" runat="server" class="form-control" id="Pass"
                                 placeholder="رمز عبور">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input name="RePass" type="password" runat="server" class="form-control" id="RePass"
                                 placeholder="تکرار رمز عبور">
                        </div>
                        
                    </div>
            
                    <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" Enabled="false" OnClick="Register_Click" ID="Regster" class="btn btn-primary btn-user btn-block" Text="ثبت نام" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetMN" OnClick="GetMN_Click" Style="display: none" />
                </ContentTemplate>
            </asp:UpdatePanel>
            </form>
    </div>
        <%-- -------------=-=-=- -=- =-= -= -= -= -= - =- - = -= -= - =- = -= -= - =- =- = -= - --%>
              <hr>
              <div class="text-center">
                <a class="small" href="#">فراموشی رمز عبور</a>
              </div>
              <div class="text-center">
                <a class="small" href="Login.aspx">قبلا ثبت نام کرده ام!</a>
              </div>
              <div class="text-center">
                    <a class="small" href="../index.aspx">برگشت به صفحه اصلی!</a>
              </div>
            </div>
        </div>
      </div>
    </div>
      <br /><br />
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
