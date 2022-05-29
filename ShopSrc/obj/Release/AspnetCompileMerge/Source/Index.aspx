<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="NM.NIndex" %>

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
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Main css -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-rtl.min.css">
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
                        <nav class="navbar navbar-dark navbar-expand-lg" style="float:right">
                           
                            <div class="collapse navbar-collapse" id="navbar">
                                <ul class="navbar-nav ml-auto">
                                    <li class="active"><a href="index.aspx" class="nav-link">خانه</a></li>
                                    <li class="active" runat="server" id="loginnn"><a href="Account/Login.aspx" class="nav-link">ورود</a></li>
                                    <li class="active"><a href="Account/Register.aspx" class="nav-link">ثبت نام</a></li>
                                    <li class="active"><a href="https://almaskart.com/product/%d8%ae%d8%b1%db%8c%d8%af-%d8%a7%d9%84%d9%85%d8%a7%d8%b3-%da%a9%d8%a7%d8%b1%d8%aa/" class="nav-link">باشگاه مشتریان</a></li>
                                    <li style="display: none" class="active"><a href="https://ispadan.ir/" class="nav-link">پنل پیامکی</a></li>
                                    <li><a href="Shop/Shop.aspx" style="display: none" class="nav-link">فروشگاه</a></li>
                                    <li><a href="File/WhatIsMtt.pdf" target="_blank" class="nav-link">MTT چیست؟</a></li>
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
                <div class="item">
                    <img id="strt" src="images/1/11.jpg" alt="Mirror Edge">
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
                </div>


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

                <div class="section-title">
                    <small>شاخص های سرویس های ما</small>
                    <h3>ویژگی هایی که به آنها افتخار میکنیم</h3>
                </div>


                <div class="row">
                    <div class="col-12 col-lg-4">
                        <div class="card features">
                            <div class="card-body">
                                <div class="media">
                                    <span class="ti-face-smile gradient-fill ti-3x ml-3"></span>
                                    <div class="media-body">
                                        <h4 class="card-title">کمک به اقتصـاد بازار</h4>
                                        <p class="card-text">افزایش گردش مالی بازار</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="card features">
                            <div class="card-body">
                                <div class="media">
                                    <span class="ti-face-smile  gradient-fill ti-3x ml-3"></span>
                                    <div class="media-body">
                                        <h4 class="card-title">کمک به اقتصـاد خانواده</h4>
                                        <p class="card-text">کاهش هزینه های خانوار</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="card features">
                            <div class="card-body">
                                <div class="media">
                                    <span class="ti-face-smile  gradient-fill ti-3x ml-3"></span>
                                    <div class="media-body">
                                        <h4 class="card-title">کسـب درآمـد</h4>
                                        <p class="card-text">فکرکردن کافیست کسب درآمدراشروع کنید</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>
        <!-- // end .section -->
        <div class="section">

            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-6">
                        <div class="box-icon"><span class="ti-mobile gradient-fill ti-3x"></span></div>
                        <h2>خـدمات اسـپادان</h2>
                        <p class="mb-4">پدیدآوران فکر ثروت اسپادان با حمایت از تولیدات فرزندان و برادرانمان با ایجاد بستری مناسب و امن برای ارائه و تبلیغات انواع خدمات و محصولات کسب و کارها و مشاغل ایرانی با موازین قانونی جمهوری ایران می باشد و این شرکت وظیفه خود می داند با تاثیرگذاری مثبت در جامعه ی جمهوری اسلامی ایران بتواند نگرش‌های صحیح و درستی از سبک زندگی مدرن در بستر خدمات الکترونیکی را به مردم ایران آموزش دهد در همین راستا با آحاد مردم،درصدی از اطلاعات خود را برای ایجاد اشتغال های اینترنتی و با توجه به توسعه فناوری اطلاعات طی سالهای اخیر و حرکت به سوی سبک زندگی مدرن و استفاده وسیع از فضای مجازی و حذف فروشگاه فیزیکی و ایجاد خدمات بهتر به آموزش خود پرداخت می نماید تا فرهنگ سازی این امر وسیع را پیاده‌سازی گردانند طرح های کارآفرینی پدید آوران فکر و ثروت اسپادان در کنار استفاده از تبلیغات و خدمات بی نظیر می ‌توانید کسب در درآمد نیز داشته باشید این بخش حائز اهمیت می باشد به طوری که این درآمدها می توانند مقدار قابل توجهی از هزینه های زندگی افراد را کاهش داده و در اداره زندگی شان نقش بسیار تاثیرگذار و چشمگیری داشته باشد در بخش اهداف شرکت پدید آوران فکر و ثروت اسپادان با توجه به تاکید و توصیه های مکرر مقام معظم رهبری بر پیاده سازی آن تأکیدداشته‌اند(( سند چشم انداز است)) که بخش اعظمی از اهداف خدمات و توسعه ،فضای کسب و کار در آن نهادینه شده است؛ و در حال پیاده سازی می باشد یکی از مهمترین این اسناد توسعه کسب و کارهای مجازی است تا شاغلین در این حرفه بتوانند با بالارفتن درآمدهای خود و کاهش هزینه های جاری زندگی روند و طعم جدیدی از موفقیت را احساس کنند..</p>
                        <%--<a href="#" class="btn btn-primary">کسب اطلاعات بیشتر</a>--%>
                    </div>
                </div>
                <div class="perspective-phone" style="text-align: left;">
                    <img src="images/Services/1.png" alt="perspective phone" class="img-fluid">
                </div>
            </div>

        </div>
        <!-- // end .section -->


        <div style="display: none" class="section light-bg">
            <div class="container">
                <div class="section-title">
                    <small>امکانات</small>
                    <h3>با اپلیکیشن ما به امکانات بیشتری دسترسی داشته باشید</h3>
                </div>

                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#communication">ارتباطات</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#schedule">زمانبندی</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#messages">پیام ها</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#livechat">گفتگوی زنده</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="communication">
                        <div class="d-flex flex-column flex-lg-row">
                            <img src="images/graphic.png" alt="graphic" class="img-fluid rounded align-self-start ml-lg-5 mb-5 mb-lg-0">
                            <div>

                                <h2>به آسانی ارتباط برقرار کنید</h2>
                                <p class="lead">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ای،
                                </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="schedule">
                        <div class="d-flex flex-column flex-lg-row">
                            <div>
                                <h2>برنامه ریزی در زمان دلخواه شما</h2>
                                <p class="lead">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ای،
                                </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص.
                                </p>
                            </div>
                            <img src="images/graphic.png" alt="graphic" class="img-fluid rounded align-self-start mr-lg-5 mb-5 mb-lg-0">
                        </div>
                    </div>
                    <div class="tab-pane fade" id="messages">
                        <div class="d-flex flex-column flex-lg-row">
                            <img src="images/graphic.png" alt="graphic" class="img-fluid rounded align-self-start ml-lg-5 mb-5 mb-lg-0">
                            <div>
                                <h2>سرویس پیام رسان زنده</h2>
                                <p class="lead">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ای،
                                </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="livechat">
                        <div class="d-flex flex-column flex-lg-row">
                            <div>
                                <h2>گفتگوی زنده هر زمان که به آن احتیاج داشته باشید</h2>
                                <p class="lead">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ای،
                                </p>
                                <p>
                                    صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص.
                                </p>
                            </div>
                            <img src="images/graphic.png" alt="graphic" class="img-fluid rounded align-self-start mr-lg-5 mb-5 mb-lg-0">
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- // end .section -->

        <div style="display: none" class="section">

            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="images/dualphone.png" alt="dual phone" class="img-fluid">
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <div>
                            <div class="box-icon"><span class="ti-rocket gradient-fill ti-3x"></span></div>
                            <h2>همین حالا اپلیکیشن را دانلود کنید</h2>
                            <p class="mb-4">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                            <a href="#" class="btn btn-primary">کسب اطلاعات بیشتر</a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- // end .section -->


        <div class="section light-bg">

            <div class="container">
                <div class="row">
                    <div class="col-md-8 d-flex align-items-center">
                        <ul class="list-unstyled ui-steps">
                            <li class="media">
                                <div class="circle-icon mr-4">1</div>
                                <div class="media-body">
                                    <h5>ایجاد حساب کاربری</h5>
                                    <p>بصورت کاملا رایگان حساب کاربری خود را ایجاد کنید.</p>
                                </div>
                            </li>
                            <li class="media my-4">
                                <div class="circle-icon mr-4">2</div>
                                <div class="media-body">
                                    <h5>پک درآمدی خودتون را مشخص کنید!</h5>
                                    <p>با انتخاب پک درآمدی به رونق کسب و کار خود بپردازید.</p>
                                </div>
                            </li>
                            <li class="media">
                                <div class="circle-icon mr-4">3</div>
                                <div class="media-body">
                                    <h5>از کسب و کار خود لذت ببرید</h5>
                                    <p>با صرفه جویی در زمان و انرژی خود به درآمد و رویاهایتان برسید</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <img src="images/iphonex.png" alt="iphone" class="img-fluid">
                    </div>

                </div>

            </div>

        </div>
        <!-- // end .section -->


        <div class="section bg-gradient">
            <div style="text-align: center" class="container">
                <div class="section-title">
                    <small></small>
                    <h3>مـجوزهـا</h3>
                </div>
                <img class="img-fluid" src="img/moj1.jpeg" />
                <img class="img-fluid" src="img/sslct.png" />
                <img class="img-fluid" src="img/sherk.jpg" />
                <a target="_blank" href="https://trustseal.enamad.ir/?id=157847&amp;Code=qgnj29MvS4tNzOWqWhF6"><img src="https://Trustseal.eNamad.ir/logo.aspx?id=157847&amp;Code=qgnj29MvS4tNzOWqWhF6" alt="" style="cursor:pointer" id="qgnj29MvS4tNzOWqWhF6"></a> 
                <img id = 'jxlzjzpewlaofukzoeuknbqe' style = 'cursor:pointer' onclick = 'window.open("https://logo.samandehi.ir/Verify.aspx?id=174682&p=rfthjyoeaodsgvkamcsiuiwk", "Popup","toolbar=no, scrollbars=no, location=no, statusbar=no, menubar=no, resizable=0, width=450, height=630, top=30")' alt = 'logo-samandehi' src = 'https://logo.samandehi.ir/logo.aspx?id=174682&p=nbpdyndtshwlwlbqaqgwodrf' />
                <%--                <div class="testimonials owl-carousel">
                    <div class="testimonials-single">
                        <img src="images/client.png" alt="client" class="client-img">
                        <blockquote class="blockquote">سرویس دهی فوق العاده قوی و تاثیر گذار در 24 ساعت شبانه روز شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان و متن دلخواه شما.</blockquote>
                        <h5 class="mt-4 mb-2">کریستال گوردون</h5>
                        <p class="text-primary">کشوری در دنیا</p>
                    </div>
                    <div class="testimonials-single">
                        <img src="images/client.png" alt="client" class="client-img">
                        <blockquote class="blockquote">سرویس دهی فوق العاده قوی و تاثیر گذار در 24 ساعت شبانه روز شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان و متن دلخواه شما.</blockquote>
                        <h5 class="mt-4 mb-2">کریستال گوردون</h5>
                        <p class="text-primary">کشوری در دنیا</p>
                    </div>
                    <div class="testimonials-single">
                        <img src="images/client.png" alt="client" class="client-img">
                        <blockquote class="blockquote">سرویس دهی فوق العاده قوی و تاثیر گذار در 24 ساعت شبانه روز شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان و متن دلخواه شما.</blockquote>
                        <h5 class="mt-4 mb-2">کریستال گوردون</h5>
                        <p class="text-primary">کشوری در دنیا</p>
                    </div>
                </div>--%>
            </div>

        </div>
        <!-- // end .section -->


        <div class="container mt-5" id="gallery">
            <%--   <div class="container">--%>
            <div class="section-title">
                <small>خدمات</small>
                <h3>خـدمـات مـا</h3>
            </div>

            <div id="owl-demo1" class="img-gallery owl-carousel">
                <img src="images/2/5.jpg" alt="image">
                <img src="images/2/6.jpg" alt="image">
                <img src="images/2/7.jpg" alt="image">
                <img src="images/2/8.jpg" alt="image">
                <img src="images/2/9.jpg" alt="image">
                <img src="images/2/10.jpg" alt="image">
            </div>

            <%--</div>--%>
        </div>
        <!-- // end .section -->

        


        <div class="section" >
            <div class="container">
                <div class="section-title">
                    <small>خرید شارژ</small>
                    <h3>خرید شارژ برای اپراتورها</h3>
                </div>

                <div class="card-deck">

                    <div style="min-height: 360px" class="card pricing popular">
                        <div class="card-head">
                            <div style="font-size: xx-large; color: black; font-family: 'B Titr'">
                                همراه اول
                            </div>

                            <br />
                            
                            <span style="font-size: x-large;" class="price">   
                                <input type="tel" placeholder="شماره تلفن" id="MyTellmci" class="text-center text-success alert-success" style="width:80%" runat="server" />
                                     <asp:DropDownList Width="80%" runat="server" ID="MCIamount">
                                    <asp:ListItem Selected="True" Text="انتخاب" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1000" Value="1000"></asp:ListItem>
                                    <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                    <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                    <asp:ListItem Text="20000" Value="20000"></asp:ListItem>
                                </asp:DropDownList>
                                <sub></sub></span>
                            <div style="background-color: red; height: 10px">
                           
                            </div>
                        </div>

                        <div class="card-body" style="background-color: black; text-align: center">
                              <asp:Button runat="server" Text="خرید" Width="50%"  OnClick="GetMCI_Click" ID="GetMCI" CssClass="btn-outline-success" />
                            <br />
                            <span style="color: white; font-size: xx-large; font-family: fantasy;">
                                <img src="images/oporator/mci.jpg" />
                            </span>
                        </div>
                    </div>
                    <%-- irancell --%>
                                        <div style="min-height: 360px" class="card pricing popular">
                        <div class="card-head">
                            <div style="font-size: xx-large; color: black; font-family: 'B Titr'">
                              ایرانسل
                            </div>

                            <br />
                            
                            <span style="font-size: x-large; " class="price">
                                <input type="tel" placeholder="شماره تلفن" id="MyTellmtn" class="text-center text-success alert-success" style="width:80%" runat="server" />
                                <asp:DropDownList Width="80%" runat="server" ID="MTNamount">
                                    <asp:ListItem Selected="True" Text="انتخاب" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1000" Value="1000"></asp:ListItem>
                                    <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                    <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                    <asp:ListItem Text="20000" Value="20000"></asp:ListItem>
                                </asp:DropDownList>
                                <sub></sub></span>
                            <div style="background-color: red; height: 10px">
                                
                            </div>
                        </div>

                        <div class="card-body" style="background-color: black; text-align: center">
                                <asp:Button runat="server" Text="خرید"  Width="50%" OnClick="GetMCI_Click" ID="GetMTN" CssClass="btn-outline-success" />
                            <br />
                            <span style="color: white; font-size: xx-large; font-family: fantasy;">
                                  <img src="images/oporator/mtn.jpg" />
                            </span>
                        </div>
                    </div>
                       <%-- irancell --%>
                                        <div style="min-height: 360px" class="card pricing popular">
                        <div class="card-head">
                            <div style="font-size: xx-large; color: black; font-family: 'B Titr'">
                             رایتل
                            </div>

                            <br />
                            
                            <span style="font-size: x-large; " class="price">
                                <input type="tel" placeholder="شماره تلفن" id="MyTellrtl" class="text-center text-success alert-success" style="width:80%" runat="server" />
                                <asp:DropDownList Width="80%" runat="server" ID="RTLamount">
                                    <asp:ListItem Selected="True" Text="انتخاب" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1000" Value="1000"></asp:ListItem>
                                    <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                    <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                    <asp:ListItem Text="20000" Value="20000"></asp:ListItem>
                                </asp:DropDownList>
                                <sub></sub></span>
                            <div style="background-color: red; height: 10px">
                                
                            </div>
                        </div>

                        <div class="card-body" style="background-color: black; text-align: center">
                                <asp:Button runat="server" Width="50%" Text="خرید" OnClick="GetMCI_Click" ID="GetRTL" CssClass="btn-outline-success" />
                            <br />
                            <span style="color: white; font-size: xx-large; font-family: fantasy;">
                                  <img src="images/oporator/rtl.jpg" />
                            </span>
                        </div>
                    </div>
                    <%--              <div class="card pricing">
                        <div class="card-head">
                            <small class="text-primary">شرکتی</small>
                            <span class="price">249000<sub>/تومان ماهانه</sub></span>
                        </div>
                        <ul class="list-group list-group-flush">
                            <div class="list-group-item">نامحدود پروژه</div>
                            <div class="list-group-item">فضای نامحدود</div>
                            <div class="list-group-item">همکاری گروهی</div>
                            <div class="list-group-item">گزارش ها و آمار</div>
                            <div class="list-group-item">وب هوک ها</div>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="btn btn-primary btn-lg btn-block">انتخاب پلن</a>
                        </div>
                    </div>--%>
                </div>
                <!-- // end .pricing -->


            </div>

        </div>
        <!-- // end .section -->



        <div style="display:none" class="section" id="pricing">
            <div class="container">
                <div class="section-title">
                    <small>ارز دیجیتال</small>
                    <h3>قیمت لحظه ای ارزهای دیجیتال</h3>
                </div>

                <div class="card-deck">
                    <%--      <div class="card pricing">
                        <div class="card-head">
                            <small class="text-primary">شخصی</small>
                            <span class="price">14000<sub>/تومان ماهانه</sub></span>
                        </div>
                        <ul class="list-group list-group-flush">
                            <div class="list-group-item">10 پروژه</div>
                            <div class="list-group-item">5 گیگابایت فضا</div>
                            <div class="list-group-item">پشتیبانی از طریق فروم</div>
                            <div class="list-group-item"><del>همکاری گروهی</del></div>
                            <div class="list-group-item"><del>گزارش و آمار</del></div>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="btn btn-primary btn-lg btn-block">انتخاب پلن</a>
                        </div>
                    </div>--%>
                    <% NM.Account.iindex naii = new NM.Account.iindex();
                        System.Data.DataView cdv = naii.coinsdv();
                        foreach (System.Data.DataRowView cdr in cdv)
                        {
                            // double[] coinm = naii.MandeCoin(cdr["Id"].ToString());
                            NM.Class.MttApi ma = new NM.Class.MttApi();
                            ma.getvalfromapi();
                            // double fiat = ma.getprice*coinm[2];
                            //   if(cdr["sample"].ToString() != "MTT") { //fiat = coinm[3] * coinm[2] * double.Parse(cdr["PriceUSD"].ToString()); }
                    %>
                    <div style="min-height: 360px" class="card pricing popular">
                        <div class="card-head">
                            <div style="font-size: xx-large; color: black; font-family: 'B Titr'">
                                <%=cdr["currencyname"].ToString() %>
                            </div>

                            <br />
                            <div style="background-color: red; height: 10px"></div>
                            <span style="font-size: x-large; font-family: fantasy;" class="price"><%=cdr["PriceUSD"].ToString()+"$" %><sub></sub></span>
                            <%--<br /><br /><hr />--%>
                        </div>

                        <div class="card-body" style="background-color: black; text-align: center">
                            <br />
                            <span style="color: white; font-size: xx-large; font-family: fantasy;"><%=cdr["sample"].ToString() %></span>
                        </div>
                    </div>
                    <%} %>


                    <%--              <div class="card pricing">
                        <div class="card-head">
                            <small class="text-primary">شرکتی</small>
                            <span class="price">249000<sub>/تومان ماهانه</sub></span>
                        </div>
                        <ul class="list-group list-group-flush">
                            <div class="list-group-item">نامحدود پروژه</div>
                            <div class="list-group-item">فضای نامحدود</div>
                            <div class="list-group-item">همکاری گروهی</div>
                            <div class="list-group-item">گزارش ها و آمار</div>
                            <div class="list-group-item">وب هوک ها</div>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="btn btn-primary btn-lg btn-block">انتخاب پلن</a>
                        </div>
                    </div>--%>
                </div>
                <!-- // end .pricing -->


            </div>

        </div>
        <!-- // end .section -->


        <div style="display: none" class="section pt-0 sec-faq">
            <div class="container">
                <div class="section-title">
                    <small>پاسخ به برخی</small>
                    <h3>سوالات متداول</h3>
                </div>

                <div class="row pt-4">
                    <div class="col-md-6">
                        <h4 class="mb-3">چرا باید در سایت اسپادان ثبت نام کنم؟</h4>
                        <p class="light-font mb-5">ثبت نام ( ایجاد حساب کاربری ) در وبسایت اسپادان موجب ارائه خدمات مطلوب و سهولت در پیگیری سفارش ها می گردد. تیم پشتیبانی اسپادان به تمامی مراحل خرید ، از زمان ثبت سفارش تا تحویل آن به مشتری ، نظارت مستقیم دارد.</p>
                        <h4 class="mb-3">برای سفارش کالا و خدمات به کمک نیاز دارم. چگونه و با چه کسی تماس بگیرم ؟</h4>
                        <p class="light-font mb-5">تیم پشتیبانی اسپادان ، در زمان ساعات اداری ( از ساعت 9 تا 18:30) پاسخگوی شما می باشد. اگر در خارج از این زمان سؤال یا ابهامی برای شما بوجود آمد میتوانید از طریق پنل کاربری خود به پشتیبانی ام آی ام تیکت ارسال کنید و یا برای ما پیغام (اس ام اس) بگذارید و یا میتوانید به پی وی پشتیبانی شرکت در صفحات اجتماعی مانند واتساپ و تلگرام مراجعه بفرمایید و درخواست خود را اعلام نمایید تا در اولین ساعات روز کاری بعد با شما تماس حاصل گردد. جهت کسب اطلاعات بیشتر می توانید از قسمت تماس با ما اقدام کنید.</p>

                    </div>
                    <div class="col-md-6">
                        <h4 class="mb-3">آیا میتوانم بعدا پلن خود را تغییر دهم؟</h4>
                        <p class="light-font mb-5">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع. </p>
                        <h4 class="mb-3">آیا قراردادی به من ارائه میشود؟</h4>
                        <p class="light-font mb-5">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع. </p>

                    </div>
                </div>
            </div>

        </div>
        <!-- // end .section -->



        <div class="section bg-gradient" style="padding-top: 0px; padding-bottom: 20px">
            <div class="call-to-action" style="width: 98%; text-align: center; padding-right: 20px">

                <%--<div class="box-icon"><span class="ti-mobile gradient-fill ti-3x"></span></div>--%>
                <h2>آدرس شرکت روی نقشه</h2>
                <p class="tagline"></p>
                <div class="my-4">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1372.0000330253129!2d51.63922853974812!3d32.66468666229755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3fbc3452fb5970d3%3A0x8b4d3a8787382!2zMzLCsDM5JzU0LjYiTiA1McKwMzgnMjEuMyJF!5e0!3m2!1sen!2s!4v1598432861464!5m2!1sen!2s" frameborder="0" style="border: 4; height: 545px; width: 100%" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
            <%--</div>--%>
        </div>

        <%--   </div>
             <div class="section bg-gradient">
            <div class="container">
                <div class="call-to-action">

                    <div class="box-icon"><span class="ti-mobile gradient-fill ti-3x"></span></div>
                    <h2>از هر کجا که مایلید دانلود کنید</h2>
                    <p class="tagline">اپلیکیشن ما را میتوانید بر روی انواع دیوایس ها اعم از موبایل ها و کامپیوترهای دسکتاپ مورد استفاده قرار دهید. لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. </p>
                    <div class="my-4">

                        <a href="#" class="btn btn-light">
                            <img src="images/appleicon.png" alt="icon">
                            اپ استور</a>
                        <a href="#" class="btn btn-light">
                            <img src="images/playicon.png" alt="icon">
                            گوگل پلی</a>
                    </div>
                    <p class="text-primary"><small><i>*نیازمند iOS 10.0.5+ و Android Kitkat و بالاتر. </i></small></p>
                </div>
            </div>

        </div>--%>
        <!-- // end .section -->

        <div class="light-bg py-5" id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 text-center text-lg-right">
                        <p class="mb-2">
                            <span class="ti-location-pin mr-2"></span>اصفهان_اصفهان_محله اشرفی اصفهانی خیابان آیت الله مدرسی نجفی نبش کوچه زرنگار پلاک ۱۱۵ طبقه دوم

کد ثبت : 64448 شناسه ملی: 14009095542
                        </p>
                        <div class=" d-block d-sm-inline-block">
                            <p class="mb-2">
                                <span class="ti-email mr-2"></span><a class="mr-4" href="mailto:info@espadannet.ir" style="margin-right: 20px !important;">info@espadannet.ir</a>
                            </p>
                        </div>
                        <div class="d-block d-sm-inline-block">
                            <p class="mb-0">
                                <span class="ti-headphone-alt mr-2"></span><a href="tel:03137735166" style="margin-right: 20px !important;">313-773-5166</a>
                            </p>
                        </div>

                    </div>
                    <div class="col-lg-6">
                        <div class="social-icons">
                            <a href="https://t.me/espadannett "><span class="ti-plus"></span></a>
                            <a href="#"><span class="ti-twitter-alt"></span></a>
                            <a href="https://instagram.com/espadan__net?igshid=d8ozwhl51mya"><span class="ti-instagram"></span></a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
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

