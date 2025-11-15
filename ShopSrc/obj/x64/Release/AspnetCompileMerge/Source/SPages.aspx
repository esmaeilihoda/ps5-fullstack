<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPages.aspx.cs" Inherits="NM.SPages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>شرکت پدید آوران فکر و ثروت اسپادان</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Mobland - Mobile App Landing Page Template">
    <meta name="keywords" content="HTML5, bootstrap, mobile, app, landing, ios, android, responsive">

    <!-- Font -->
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <!-- Main css -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-rtl.min.css" />
    <link rel="stylesheet" href="css/rtl.css">

    <style type="text/css">
        .textonslider {
            color: darkgrey;
            position: absolute;
            top: 50%;
            left: 50%;
            /* transform: translate(-50%, -50%); */
            font-size: xx-large;
            background-color: rgba(68, 67, 67, 0.81);
        }

        * {
            font-family: B Titr;
        }

        @font-face {
            font-family: 'B Titr';
            src: url('fonts/BTitrBold.ttf') format('opentype');
        }
    </style>
</head>
<body style="background-color: rgb(1, 6, 34)">
    <form id="form1" runat="server">
        <!-- Nav Menu -->

        <div class="nav-menu fixed-top">
            <div class="container">
                <div class="row" style="font-family: 'B Titr'">
                    <div class="col-md-12">
                        <nav class="navbar navbar-dark navbar-expand-lg" style="float: right">

                            <div class="collapse navbar-collapse" id="navbar">
                                <ul class="navbar-nav ml-auto">
                                    <li class="active"><a href="index.aspx" class="nav-link">خانه</a></li>
                                    <li class="active" runat="server" id="loginnn"><a href="Account/Login.aspx" class="nav-link">ورود</a></li>
                                    <li class="active"><a href="Account/Register.aspx" class="nav-link">ثبت نام</a></li>
                                    <li style="display: none" class="active"><a href="https://almaskart.com/product/%d8%ae%d8%b1%db%8c%d8%af-%d8%a7%d9%84%d9%85%d8%a7%d8%b3-%da%a9%d8%a7%d8%b1%d8%aa/" class="nav-link">باشگاه مشتریان</a></li>
                                    <li style="display: none" class="active"><a href="https://ispadan.ir/" class="nav-link">پنل پیامکی</a></li>
                                    <li><a href="Shop/Shop.aspx" class="nav-link">فروشگاه</a></li>
                                    <li style="display: none"><a href="File/WhatIsMtt.pdf" target="_blank" class="nav-link">MTT چیست؟</a></li>
                                    <li class="has-children">
                                        <a href="#" class="nav-link">وبلاگ</a>
                                        <ul class="dropdown">
                                            <!--  <li><a href="blog.html" class="nav-link">Blog</a></li>
                  <li><a href="blog-single.html" class="nav-link">Blog Sigle</a></li>-->
                                        </ul>
                                    </li>
                                    <li><a href="#Adress" class="nav-link">ارتباط با ما</a></li>
                                    <ul runat="server" id="showuname">
                                        <a runat="server" id="uname" class="nav-link"></a>

                                        <li><a href="Account/index.aspx" class="nav-link">برگشت به پنل کاربری</a></li>
                                        <li><a href="Account/Exit.aspx" class="nav-link">خروج</a></li>

                                    </ul>
                                </ul>
                            </div>
                            <a class="navbar-brand" href="index.html">
                                <img src="img/wse-logo.png" style="height: 100px;" class="img-fluid" alt="logo"></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <header class="bg-gradient" id="home">

            <br />
            <%-- for big show must be set  id="owl-demo" --%>
            <div id="owl-demo" class="owl-carousel">

                <%-- <div class="item"><img src="images/perspective.png" alt="The Last of us"></div>--%>


                <% NM.Account.HomeManager HM = new NM.Account.HomeManager();
                    System.Data.DataView SDV = HM.GETHOMESETTING();
                    if (SDV.Count > 0)
                    {
                        int i = 0;
                        string[] sp = SDV[0]["SlidePics"].ToString().Split("©".ToCharArray());
                        foreach (string sps in sp)
                        {
                            if (sps != "")
                            {
                                if (i == 0)
                                { %>

                <div class="item">
                    <img id="strt" src="<%=sps %>" alt="Mirror Edge" />
                </div>
                <%  }
                    else
                    {object @__o; %>

                <div class="item">
                    <img src="<%=sps %>" alt="Mirror Edge" />
                </div>
                <%  }
                            }
                            i++;
                        }
                    }

                %>
                <%--<div class="item">
                    <img id="strt" src="images/1/banner.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/1.jpg" alt="GTA V"><div class="textonslider"></div>
                </div>
                <div class="item">
                    <img src="images/1/2.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/3.jpg" alt="Mirror Edge">
                </div>
                <div class="item">
                    <img src="images/1/4.jpg" alt="Mirror Edge">
                </div>--%>
            </div>
            <div class="container mt-5" style="display: none">
            </div>

            <%--<div class="img-holder mt-3">
        
        </div>--%>
        </header>

        <div class="client-logos my-5">
            <div class="container text-center" style="min-height: 50px">
                <%--<img src="images/client-logos.png" alt="client logos" class="img-fluid">--%>
            </div>
        </div>

        <div class="section light-bg" id="features">


            <div class="container">
                <asp:Literal runat="server" ID="conloit"></asp:Literal>
            </div>



        </div>
       
        <!-- // end .section -->
        <footer class="my-5 text-center">
            <a href="#" target="_blank">

            <p class="mb-2"><small>کپی رایت © 2020 کلیه ی حقوق محفوظ پدید آوران فکر و ثروت اسپادان است  </small></p>

            <small>
                <% 
                    SDV = HM.GETHOMESETTING();
                    if (SDV.Count > 0)
                    {
                        int i = 0;
                        string[] sp = SDV[0]["lisnks"].ToString().Split("#".ToCharArray());
                        foreach (string sps in sp)
                        {
                            if (sps != "")
                            {
                                string[] uu = sps.Split("*".ToCharArray());
                                if (uu.Length == 2)
                                {object @__o; %>

                <a href="<%=uu[1] %>" class="m-2" target="_blank"><%=uu[0] %></a>

                <%}
                            }

                        }
                    }

                %>
            </small>
        </footer>

        <!-- jQuery and Bootstrap -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Plugins JS -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Custom JS -->
        <script src="js/script.js"></script>
        <a href="https://mrcode.ir" style="visibility: hidden; display: block; margin-top: -15px;">MrCode.ir</a>
    </form>
    <script>
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

        }, 3000)
    </script>
    <style>
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
    </style>
</body>
</html>

