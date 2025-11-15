<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NLogin.aspx.cs" Inherits="NM.NLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>شرکت پدید آوران فکر و ثروت اسپادان</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
    <meta name="viewport" content="width=device-width, initial-scale=0.5">
    <meta name="description" content="Mobland - Mobile App Landing Page Template">
    <meta name="keywords" content="HTML5, bootstrap, mobile, app, landing, ios, android, responsive">

    <!-- Font -->
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- Main css -->
    <link href="css/style.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap-rtl.min.css">
    <link rel="stylesheet" href="../css/rtl.css">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <style type="text/css">
        .textonslider {
            color: darkgrey;
            position: relative;
            /*top: 50%;*/
            /*/ right: 35%;*/
            /* transform: translate(-50%, -50%); */
            font-size: xx-large;
            background-color: rgba(68, 67, 67, 0.81);
            border-radius: 20px;
            background: -moz-linear-gradient(135deg, rgb(74, 13, 143) 0%, rgb(250, 42, 143) 100%);
            /* background: -webkit-linear-gradient(135deg, rgb(74, 13, 143) 0%, rgb(250, 42, 143) 100%); */
            background: linear-gradient(135deg, rgb(63 30 30) 0%, rgb(13 13 21 / 35%) 100%);
        }

        * {
            font-family: B Titr;
        }

        @font-face {
            font-family: 'B Titr';
            src: url('fonts/BTitrBold.ttf') format('opentype');
        }
    </style>
    <script type="text/javascript">
       
    </script>
</head>
<body style="background-color: rgb(1, 6, 34) rgb(74, 13, 143);">
    <form id="form1" runat="server">
        <div style="text-align: center; position: absolute; width: 100%; text-align: -webkit-center">
            <div class="textonslider" style="width: 600px; min-height: 70vh; margin-top: 9vh">
                <div style="text-align: center">
                    <br />
                    <label style="display: block; color: red; stroke: white; text-align: center;">
                        LOGIN                    
                    </label>
                    <div style="height: 8px"></div>
                    <div style="text-align: center; display: inline-block; width: 60%">
                        <input placeholder="نام کاربری" style="background: none; border-radius: 15px; display: block; font-size: medium; height: 45px; width: 100%; text-align: center"
                            id="UName" runat="server" tabindex="10000" type="text" />
                        <div style="height: 12px"></div>
                        <input placeholder="پسورد" style="background: none; border-radius: 15px; display: block; font-size: medium; height: 45px; width: 100%; text-align: center"
                            id="Password" runat="server" tabindex="10000" type="password" />

                        <div style="height: 8px"></div>
                        <input style="height: 18px; padding-right: 20px" id="ssap" type="checkbox" title="مرا بخاطر بسپار" />
                        <label for="ssap" style="font-size: medium">مرا بخاطر بسپار</label>
                        <div style="height: 8px"></div>
                     <%-- Google Capcha Start --%>
                        <div id="dvCaptcha" class="g-recaptcha" style="background-color: none" data-sitekey="6LfI7sQZAAAAAK8tIdRdg5D6E7mssx8m3Hx8hDv2"></div>
                    </div>

                    <%--<div id="dvCaptcha">
                    </div>--%>

                    <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                    <asp:RequiredFieldValidator ID="rfvCaptcha" 
                        ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                        runat="server" ForeColor="Red" Display="Dynamic" />
                    <%-- Google Capcha End --%>

                    <div style="height: 8px"></div>
                      <%--<input type="button" class="btn-info" onclick="testcapcha();"
                    style="border-radius: 20px; width: 70%;font-size:large;height:40px" value="ورود" />--%>
                    <asp:Button runat="server" ClientIDMode="Static" ID="Btn_Login" OnClick="Btn_Login_Click" class="btn-info"
                        Style="border-radius: 20px; width: 70%; font-size: large; height: 40px" Text="ورود" />
                    <div style="height: 18px"></div>

                    <input type="button" class="btn-danger"
                        style="border-radius: 20px; width: 70%; font-size: large; height: 40px"
                        value="رمز عبور خود را فراموش کرده اید؟" />
                    <div style="height: 18px"></div>
                    <div style="text-align: center">
                        <a href="../Index.aspx" class="btn-dark" style="border-radius: 15px; width: 50%; font-size: medium">برگشت به صفحه اصلی</a>
                    </div>
                </div>
            </div>
        </div>
        <header class="bg-gradient" id="home" style="width: 100%; max-height: 100%">
            <img src="../images/login/loginback.jpg" style="width: 100%; height: 99vh" />
            <%-- for big show must be set  id="owl-demo" --%>
            <%--        <div id="owl-demo" class="owl-carousel">--%>

            <%-- <div class="item"><img src="images/perspective.png" alt="The Last of us"></div>--%>
            <%-- <div class="item">
                    <img id="strt" src="images/1/11.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/1.jpg" alt="GTA V">
                </div>
                <div class="item">
                    <img src="images/1/2.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/3.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/4.jpg" alt="Mirror Edge">
                </div>
            </div> --%>

            <%--<div class="img-holder mt-3">
        
        </div>--%>
        </header>

        <!-- // end .section -->
        <footer class="my-5 text-center">
            <a href="#" target="_blank">

            <p class="mb-2"><small>کپی رایت © 2020 کلیه ی حقوق محفوظ پدید آوران فکر و ثروت اسپادان است  </small></p>

            <small>
                <a href="#" class="m-2">رسانه</a>
                <a href="#" class="m-2">توافقنامه</a>
                <a href="#" class="m-2">حریم خصوصی</a>
            </small>
        </footer>

        <!-- jQuery and Bootstrap -->
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <!-- Plugins JS -->
        <script src="../js/owl.carousel.min.js"></script>
        <!-- Custom JS -->
        <script src="../js/script.js"></script>
        <a href="https://mrcode.ir" style="visibility: hidden; display: block; margin-top: -15px;">MrCode.ir</a>
    </form>
    <script>
        var onloadCallback =  function testcapcha() {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "NLogin.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        };
        $(document).ready(function () {
            $("#owl-demo").owlCarousel({
                navigation: true,
                slideSpeed: 100,
                paginationSpeed: 400,
                items: 1,
                itemsDesktop: false,
                itemsDesktopSmall: false,
                itemsTablet: false,
                itemsMobile: false
            });
        });
        var next = document.getElementsByClassName("owl-next");
        var prec = document.getElementsByClassName("owl-prev");
        var ni = next.length;
        var jj = 0; var hh = 4;
        setInterval(function () {
            if (jj < 5) {
                jj++;
                for (var i = 0; i < next.length; i++) {
                    next[i].click();
                }
            }
            else
                hh = 4;
            if (jj >= 4) {
                hh--;
                for (var i = 0; i < prec.length; i++) {
                    prec[i].click();
                }
                if (hh <= 0)
                    jj = 0;
            }

        }, 3000);
        <%--function testcapcha() {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "NLogin.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        }--%>
            //var ifm = document.getElementsByTagName("iframe");
            //for (var i = 0 ; i < ifm.length; i++) {
            //    var dh = ifm[i].contentWindow.document.getElementsByClassName("recaptcha-checkbox goog-inline-block recaptcha-checkbox-unchecked rc-anchor-checkbox recaptcha-checkbox-checked");
            //    if (dh.length>0) {
            //        document.getElementById("Btn_Login").click();
            //    }
            //    else
            //        return false;
            //}
        //}
    </script>
    <style>
        .bg-gradient {
            padding-top: 0PX;
        }

        #owl-demo .item img {
            display: block;
            width: 100%;
            height: auto;
        }

        .nav-menu.is-scrolling, .nav-menu.menu-is-open {
            background-color: rgb(74, 13, 143);
            background: -moz-linear-gradient(135deg, rgb(74, 13, 143) 0%, rgb(250, 42, 143) 100%);
            /* background: -webkit-linear-gradient(135deg, rgb(74, 13, 143) 0%, rgb(250, 42, 143) 100%); */
            background: linear-gradient(135deg, rgb(74, 13, 143) 0%, rgb( 20 20 20) 100%);
            -webkit-box-shadow: 0px 5px 23px 0px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0px 5px 23px 0px rgba(0, 0, 0, 0.1);
            box-shadow: 0px 5px 23px 0px rgba(0, 0, 0, 0.1);
        }

        /*.navbar navbar-dark navbar-expand-lg{
            direction:ltr;
            width:100%
        }
        .navbar-collapse collapse{
            direction:rtl;
        }*/

        /*div#vms-slider {
	width:600px;
	height:300px;
	overflow: hidden; 
}
.ss {
	width: 20%;
	height: auto;
	float: left;
}
.fgt {
	position: relative;
	width: 500%;
	margin: 0;
	padding: 0;
	font-size: 0;
	left: 0;
	text-align: left;
	animation: 30s vms infinite; 
	-webkit-animation: 30s vms infinite; 
	-moz-animation: 30s vms infinite; 
	-o-animation: 30s vms infinite; 
	-ms-animation: 30s vms infinite; 
}
@keyframes vms { 
	0%  { left: 0%; }
	20% { left: 0%; }
	25% { left: -100%; }
	45% { left: -100%; }
	50% { left: -200%; }
	70% { left: -200%; } 
	75% { left: -300%; }
	95% { left: -300%; }
	100% { left: -400%; } 
}
@-webkit-keyframes vms { 
	0%  { left: 0%; }
	20% { left: 0%; }
	25% { left: -100%; }
	45% { left: -100%; }
	50% { left: -200%; }
	70% { left: -200%; } 
	75% { left: -300%; }
	95% { left: -300%; }
	100% { left: -400%; } 
}*/
    </style>
</body>
</html>

