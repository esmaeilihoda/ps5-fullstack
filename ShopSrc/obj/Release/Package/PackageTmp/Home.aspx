<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NM.Home" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<!-- meta character set -->
	<meta charset="utf-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Blue One Page HTML Template</title>
	<!-- Meta Description -->
	<meta name="description" content="Blue One Page Creative HTML5 Template">
	<meta name="keywords"
		content="one page, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
	<meta name="author" content="Muhammad Morshed">

   <%--         <meta name="viewport" content="width=device-width, initial-scale=0">--%>
	<!-- Mobile Specific Meta -->
<!--	<meta name="viewport" content="width=device-width, initial-scale=1"> -->

	<!-- CSS
		================================================== -->

	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

	<!-- Fontawesome Icon font -->
	<link rel="stylesheet" href="NewCss/font-awesome.min.css">
	<!-- bootstrap.min -->
	<link rel="stylesheet" href="NewCss/jquery.fancybox.css">
	<!-- bootstrap.min -->
	<link rel="stylesheet" href="NewCss/bootstrap.min.css">
	<!-- bootstrap.min -->
	<link rel="stylesheet" href="NewCss/owl.carousel.css">
	<!-- bootstrap.min -->
	<%--<link rel="stylesheet" href="NewCss/slit-slider.css">--%>
	<!-- bootstrap.min -->
	<link rel="stylesheet" href="NewCss/animate.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="NewCss/main.css">

	<!-- Modernizer Script for old Browsers -->
	<script src="js/modernizr-2.6.2.min.js"></script>
        
   <style type="text/css">
         *{
            direction:rtl;
            font-family:B Titr;
        }
		.wslogo{
  position: relative;		
		animation-name: logoanim;
          animation-duration: 4s;
		}
		
		@keyframes logoanim {
  0%   { left:0px; top:0px;}
  25%  { left:200px; top:0px;}
  50%  { left:200px; top:200px;}
  75%  { left:0px; top:200px;}
  100% { left:0px; top:0px;}
}
		</style>		


</head>
<body>
     <form runat="server" id="form">
	<!-- preloader -->
<%--	<div id="preloader">
		<div class="loder-box">
			<div class="battery"></div>
		</div>
	</div>--%>
	<!-- end preloader -->

	<!--
        Fixed Navigation
        ==================================== -->
	<header id="navigation" class="navbar-inverse navbar-fixed-top animated-header">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->
				<h1 class="navbar-brand">
					<a href="#body">ESP</a>
					<img src="img/wse-logo.png" class="wslogo" style="height:150px;width:150px;" />
				</h1>
				<!-- /logo -->
			</div>

			<!-- main nav -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<ul id="nav" style="    display: flex;"  class="nav navbar-nav">
					<li class="active"><a href="index.aspx" class="nav-link">خانه</a></li>
			  <li class="active" runat="server" id="loginnn"><a href="Account/Login.aspx" class="nav-link">ورود</a></li>
              <li class="active"><a href="Account/Register.aspx" class="nav-link">ثبت نام</a></li>
                <li class="active"><a href="https://almaskart.com/product/%d8%ae%d8%b1%db%8c%d8%af-%d8%a7%d9%84%d9%85%d8%a7%d8%b3-%da%a9%d8%a7%d8%b1%d8%aa/" class="nav-link">باشگاه مشتریان</a></li>
                <li style="display:none" class="active"><a href="https://ispadan.ir/" class="nav-link">پنل پیامکی</a></li>
              <li><a href="Shop/Shop.aspx" style="display:none" class="nav-link">فروشگاه</a></li>
                      <li><a href="File/WhatIsMtt.pdf" target="_blank" class="nav-link">MTT چیست؟</a></li>
              <li class="has-children">
                <a href="#" class="nav-link">وبلاگ</a>
                <ul class="dropdown">
                <!--  <li><a href="blog.html" class="nav-link">Blog</a></li>
                  <li><a href="blog-single.html" class="nav-link">Blog Sigle</a></li>-->
                </ul>
              </li>
              <li><a href="#Adress" class="nav-link">ارتباط با ما</a></li>
               <li class="has-children" runat="server" id="showuname">
                <a runat="server" id="uname" class="nav-link"></a>
                <ul class="dropdown">
                  <li><a href="Account/index.aspx" class="nav-link">برگشت به پنل کاربری</a></li>
                  <li><a href="Account/Exit.aspx" class="nav-link">خروج</a></li>
                </ul>
              </li>
				</ul>
			</nav>
			<!-- /main nav -->

		</div>
	</header>
	<!--
        End Fixed Navigation
        ==================================== -->
         
	   

	<main class="site-content" role="main">
         <asp:ScriptManager runat="server" ID="smc"></asp:ScriptManager>
        <div class="row">
        <telerik:RadImageGallery Skin="MetroTouch" Height="685" LoopItems="true" DisplayAreaMode="Image"
            ID="RadImageGallery1" EnableAjaxSkinRendering="true" runat="server">
            <Items>
                <telerik:ImageGalleryItem Width="100%" ImageUrl="img/slider/new/1/5.jpg" Height="685" />
            </Items>
            <ClientSettings ><AnimationSettings ></AnimationSettings>
                <KeyboardNavigationSettings AllowCycle="false"></KeyboardNavigationSettings>

                
            </ClientSettings>
            <ThumbnailsAreaSettings EnableZoneScroll="false" />
            <ToolbarSettings ShowFullScreenButton="false" ShowItemsCounter="false" ShowSlideshowButton="false" /> 
        </telerik:RadImageGallery>
            </div>
        <div class="row">
            <br /><br />
        </div>
		<!--
        Home Slider
        ==================================== -->

		<!--
        End Home SliderEnd
        ==================================== -->

		<!-- about section -->
		<section id="about">
			<div class="container">
				<div class="row">
					<div class="col-md-4 wow animated fadeInLeft">
						<div class="recent-works">
							<h3>Recent Works</h3>
							<div id="works">
								<div class="work-item">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
										et dolore magna aliqua. <br> <br> There are many variations of passages of Lorem Ipsum available,
										but the majority have suffered alteration in some form, by injected humour, or randomised words
										which don't look even slightly believable.</p>
								</div>
								<div class="work-item">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
										et dolore magna aliqua. <br><br> There are many variations of passages of Lorem Ipsum available, but
										the majority have suffered alteration in some form, by injected humour, or randomised words which
										don't look even slightly believable.</p>
								</div>
								<div class="work-item">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
										et dolore magna aliqua. <br><br> There are many variations of passages of Lorem Ipsum available, but
										the majority have suffered alteration in some form, by injected humour, or randomised words which
										don't look even slightly believable.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-7 col-md-offset-1 wow animated fadeInRight">
						<div class="welcome-block">
							<h3>Welcome To Our Site</h3>
							<div class="message-body">
								<img src="img/member-1.jpg" class="pull-left" alt="member">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
									et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
									aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
									dolore eu fugiat nulla pariatur. </p>
							</div>
							<a href="#" class="btn btn-border btn-effect pull-right">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- end about section -->


		<!-- Service section -->
		<section id="service">
			<div class="container">
				<div class="row">

					<div class="sec-title text-center">
						<h2 class="wow animated bounceInLeft">خدمات</h2>
						<p class="wow animated bounceInRight">The Key Features of our Job</p>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-home fa-3x"></i>
							</div>
							<h3>Support</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.3s">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-tasks fa-3x"></i>
							</div>
							<h3>Well Documented</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.6s">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-clock-o fa-3x"></i>
							</div>
							<h3>Design UI/UX</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.9s">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-heart fa-3x"></i>
							</div>

							<h3>Web Security</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- end Service section -->

		<!-- Testimonial section -->
		  <div class="row">
        <telerik:RadImageGallery Skin="MetroTouch" Width="100%" ImagesFolderPath="img/slider/new/2" LoopItems="true" DisplayAreaMode="Image"
            ID="RadImageGallery2" EnableAjaxSkinRendering="true" runat="server">
            <ClientSettings ><AnimationSettings ></AnimationSettings>
                <KeyboardNavigationSettings AllowCycle="false"></KeyboardNavigationSettings>

                
            </ClientSettings>
            <ThumbnailsAreaSettings EnableZoneScroll="false" />
            <ToolbarSettings ShowFullScreenButton="false" ShowItemsCounter="false" ShowSlideshowButton="false" /> 
        </telerik:RadImageGallery>
            </div>
		<!-- end Testimonial section -->

		<!-- Price section -->
		<section id="price">
			<div class="container">
				<div class="row">

					<div class="sec-title text-center wow animated fadeInDown">
						<h2>Price</h2>
						<p>Our price for your company</p>
					</div>

					<div class="col-md-4 wow animated fadeInUp">
						<div class="price-table text-center">
							<span>Silver</span>
							<div class="value">
								<span>$</span>
								<span>24,35</span><br>
								<span>month</span>
							</div>
							<ul>
								<li>No Bonus Points</li>
								<li>No Bonus Points</li>
								<li>No Bonus Points</li>
								<li>No Bonus Points</li>
								<li><a href="#">sign up</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-4 wow animated fadeInUp" data-wow-delay="0.4s">
						<div class="price-table featured text-center">
							<span>Gold</span>
							<div class="value">
								<span>$</span>
								<span>50,00</span><br>
								<span>month</span>
							</div>
							<ul>
								<li>Free Trial</li>
								<li>Free Trial</li>
								<li>Free Trial</li>
								<li>Free Trial</li>
								<li><a href="#">sign up</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-4 wow animated fadeInUp" data-wow-delay="0.8s">
						<div class="price-table text-center">
							<span>Diamond</span>
							<div class="value">
								<span>$</span>
								<span>123,12</span><br>
								<span>month</span>
							</div>
							<ul>
								<li>All Bonus Points</li>
								<li>All Bonus Points</li>
								<li>All Bonus Points</li>
								<li>All Bonus Points</li>
								<li><a href="#">sign up</a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- end Price section -->

		<!-- Social section -->
		<section id="social" class="parallax">
			<div class="overlay" style="padding:0">
				<div >
					<div class="row">

					<!--	<div class="sec-title text-center white wow animated fadeInDown">
							<h2>FOLLOW US</h2>
							<p>Beautifully simple follow buttons to help you get followers on</p>
						</div>

						<ul class="social-button">
							<li class="wow animated zoomIn"><a href="#"><i class="fa fa-thumbs-up fa-2x"></i></a></li>
							<li class="wow animated zoomIn" data-wow-delay="0.3s"><a href="#"><i class="fa fa-twitter fa-2x"></i></a>
							</li>
							<li class="wow animated zoomIn" data-wow-delay="0.6s"><a href="#"><i class="fa fa-dribbble fa-2x"></i></a>
							</li>
						</ul>

					</div> -->
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1372.0000330253129!2d51.63922853974812!3d32.66468666229755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3fbc3452fb5970d3%3A0x8b4d3a8787382!2zMzLCsDM5JzU0LjYiTiA1McKwMzgnMjEuMyJF!5e0!3m2!1sen!2s!4v1598432861464!5m2!1sen!2s" width="100%" height="450" frameborder="0" style="border:4;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			</div>
		</section>
		<!-- end Social section -->
	</main>

	<section class="buy-pro" style="padding: 100px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="pro-block text-center"
	
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="footer-content">
					<div class="wow animated fadeInDown">
						<p>اصفهان_اصفهان_محله اشرفی اصفهانی خیابان آیت الله مدرسی نجفی نبش کوچه زرنگار پلاک ۱۱۵ طبقه دوم
</p>
						<p>کد ثبت : 64448 شناسه ملی: 14009095542</p>
					</div>
					<form action="#" method="post" class="subscribe-form wow animated fadeInUp">
						<div class="input-field">
							<input type="email" class="subscribe form-control" placeholder="Enter Your Email...">
							<button type="submit" class="submit-icon">
								<i class="fa fa-paper-plane fa-lg"></i>
							</button>
						</div>
					</form>
					<div class="footer-social">
						<ul>
							<li class="wow animated zoomIn"><a href="#"><i class="fa fa-thumbs-up fa-3x"></i></a></li>
							<li class="wow animated zoomIn" data-wow-delay="0.3s"><a href="https://instagram.com/espadan__net?igshid=d8ozwhl51mya"><i class="fa fa-instagram fa-3x"></i></a>
							</li>
							<li class="wow animated zoomIn" data-wow-delay="0.6s"><a href="https://t.me/espadannett"><i class="fa fa-telegram fa-3x"></i></a>
							</li>
							<li class="wow animated zoomIn" data-wow-delay="0.9s"><a href="#"><i class="fa fa-dribbble fa-3x"></i></a>
							</li>
							<li class="wow animated zoomIn" data-wow-delay="1.2s"><a href="#"><i class="fa fa-youtube fa-3x"></i></a>
							</li>
						</ul>
					</div>

					<p>Copyright &copy; 2020<a href="#">ESPADAN</a> </p>
				</div>
			</div>
		</div>
	</footer>
         <style type="text/css">
        .rigThumbnailsBoxHorizontal rigPositionBottom{
            display:none;
        }
        .rigThumbnailsList{
            display:none;
        }
        .rigThumbnailsBox{
            display:none;
        }
        .rigThumbnailsBoxHorizontal rigPositionBottom{
            display:none;
        }
        .rslHorizontal{
            display:none;
        }
        .rigToolsWrapper{
            display:none;
        }
    </style>
    <script type="text/javascript">
        document.getElementById("RadImageGallery1_ThumbnailsArea").style.display = "none";
        document.getElementById("RadSliderWrapper_RadSlider1").style.display = "none";
    </script>
	<!-- Essential jQuery Plugins
		================================================== -->
	<!-- Main jQuery -->
<%--	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- Twitter Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Single Page Nav -->
	<script src="js/jquery.singlePageNav.min.js"></script>
	<!-- jquery.fancybox.pack -->
	<script src="js/jquery.fancybox.pack.js"></script>
	<!-- Google Map API -->
	<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<!-- Owl Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- jquery easing -->
	<script src="js/jquery.easing.min.js"></script>
	<!-- Fullscreen slider -->
	<%--<script src="js/jquery.slitslider.js"></script>--%>
	<script src="js/jquery.ba-cond.min.js"></script>
	<!-- onscroll animation -->
	<script src="js/wow.min.js"></script>
	<!-- Custom Functions -->
	<script src="js/main.js"></script>--%>
        </form>
</body>
</html>
