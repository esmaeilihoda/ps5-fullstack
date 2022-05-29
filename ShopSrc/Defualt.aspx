<%@ Page Title="" Language="C#" MasterPageFile="~/NMS.Master" AutoEventWireup="true" CodeBehind="Defualt.aspx.cs" Inherits="Shop.Defualt" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BodyContent" runat="server">     
    <script type="text/javascript" src="Scripts/WeCan_LIB.js"></script>      
    <asp:ScriptManager runat="server" ID="SM">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager>        
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <nav class="nav">
          <div class="burger">
            <div class="burger__patty"></div>
          </div>

          <ul class="nav__list">
            <li class="nav__item">
              <a href="#1" class="nav__link c-blue"><img src="img/home-icon.png" alt=""></a>
            </li>
            <li class="nav__item">
              <a href="#2" class="nav__link c-yellow scrolly"><img src="img/about-icon.png" alt=""></a>
            </li>
            <li class="nav__item">
              <a href="#3" class="nav__link c-red"><img src="img/projects-icon.png" alt=""></a>
            </li>
            <li class="nav__item">
              <a href="Account/Login.aspx" class="nav__link c-green"><img src="img/Register.png" alt=""></a>
            </li>
          </ul>
        </nav>
            <nav class="nav" style="left:0;">
          <div style="color:white;" class="burger">  
          <asp:Literal id="US" runat="server" ></asp:Literal>
          <a href="Account/index.aspx">برگشت به پنل کاربری</a>
          </div>
           <asp:ImageButton style="width:30px;height:30px" runat="server" class="burger" ImageUrl="img/Register.png" OnClick="Unnamed_Click" />           
        </nav>

        <section class="panel b-blue" id="1">
          <article class="panel__wrapper">
            <div class="panel__content">
              <div class="container">
                <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="home-content">
                      <a href="http://CHECKIT.com:2020/" >فروشگاه اینترنتی CHECKIT</a>
					  <a style="margin-right:20px" href="Account/index.aspx">پنل کاربری</a>
                      <div class="home-heading">
                        <h1><em>CHECKIT</em>CHECKIT</h1>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="home-box-content">
                            <div class="left-text">
                              <h4>پدیده <em>CHECKIT</em> پدیده ای جدید</h4>
                              <p>محلی برای اجرا کردن قانون CHECKIT برای همه ایرانیان عزیز</p>
                              <div class="primary-button">
                                <a href="#2">اطلاعات بیشتر</a>
                              </div>
                            </div>
                            <div class="right-image">
                              <img src="img/right-home-image.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </section>
        <section class="panel b-yellow" id="2">
          <article class="panel__wrapper">
            <div class="panel__content">
              <div class="container">
                <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="about-content">
                      <div style="padding-top:15%" class="heading">
                        <h4>فتح قله ها</h4>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="about-box-content">
                            <img src="img/about-image.png" alt="">
                          </div>
                        </div>
                        <div class="col-md-7 col-md-offset-5">
                          <div class="about-box-text">
                            <h4>بلندترین قله ها در برابر تفکر مثبت چاره ای جز تسلیم ندارند</h4>
                            <p>بلندترین قله ها در برابر اراده تو همانند یک تپه میمانند.</p>
                            <div class="primary-button">
                              <a href="#3">اطلاعات بیشتر</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </section>
        <section class="panel b-red" id="3">
          <article class="panel__wrapper">
            <div class="panel__content">
              <div class="container">
                <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="projects-content">
                      <div style="padding-top:15%" class="heading">
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="owl-carousel owl-theme projects-container">
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-01.jpg" data-lightbox="image-1"><img src="img/project-item-01.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>فتح قله ها</h4>
                                    <h5><p>مسیرهای طولانی با قدم‌های کوتاه پیموده می‌شوند. مهم‌ترین گام اولین گام است. تصمیم بگیر و شروع کن. ناگهان خود را بر فراز قله‌ها خواهی یافت.</p></h5> 
                                  <div class="primary-button">
                                    <a href="#">اطلاعات بیشتر</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-02.jpg" data-lightbox="image-1"><img src="img/project-item-02.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>شروع کن</h4>
                                    <h5><p>برای شروع کردن، نباید فوق‌العاده باشید؛ اما برای فوق‌العاده بودن، بایدشروع کنید….</p></h5> 
                                  <div class="primary-button">
                                    <a href="#">اطلاعات بیشتر</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-03.jpg" data-lightbox="image-1"><img src="img/project-item-03.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>CHECKIT CHECKIT</h4>
                                    <h5>
                                        <p><p style="text-align: right;">
                                            <strong>شما آینده&zwnj;ی خود را نمی&zwnj;سازید،</strong><br>
                                            <strong>شما <span style="color: #00ff00;">عادت&zwnj;ها و رفتارهای روزانه خود را</span> می&zwnj;سازید و این عادت&zwnj;&zwnj;ها</strong><br>
                                            <strong>هستند که <span style="color: #ff0000;">آینده</span> را می&zwnj;سازند.</strong>
                                        </p>
                                    </h5>
                                        <div class="primary-button">
                                            <a href="#">اطلاعات بیشتر</a>
                                        </div>
                               </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-04.jpg" data-lightbox="image-1"><img src="img/project-item-04.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>پایداری کن</h4>
                                    <h5>
                                        <p>مردم فکر می‌کنند که نقطه‌ی مقابل موفقیت شکست است، اما اینطور نیست. شکست، بخشی از مسیر موفقیت است.</p>
                                        </h5>
                                        <div class="primary-button">
                                            <a href="#">اطلاعات بیشتر</a>
                                        </div>
                                  </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-05.jpg" data-lightbox="image-1"><img src="img/project-item-05.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>انتخاب کن</h4>
                                    <h5>
                                        <p>شما در انتخاب آزاد هستید؛ اما انتخاب‌های امروزتان، تعیین‌کننده‌ی این است که فردا چه چیزی دارید، چه کسی هستید و چه کار می‌کنید.</p>
                                        </h5>
                                        <div class="primary-button">
                                            <a href="#">اطلاعات بیشتر</a>
                                        </div>
                                </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-06.jpg" data-lightbox="image-1"><img src="img/project-item-06.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>تلاش کن</h4>
                                    <h5>
                                        <p>نمی‌شود در خانه استراحت کرد و به موفقیت رسید. موفقیت حاصل تلاش‌های سخت و مستمر است….</p>
                                        </h5>
                                        <div class="primary-button">
                                            <a href="#">اطلاعات بیشتر</a>
                                        </div>
                                </div>
                              </div>
                            </div>
                            <div>
                              <div class="project-item">
                                <a href="img/project-item-07.jpg" data-lightbox="image-1"><img src="img/project-item-07.jpg" alt=""></a>
                                <div class="text-content">
                                  <h4>کلید موفقیت</h4>
                                    <h5>
                                        <p><strong>موفقیت کلید خوشنودی نیست، بلکه خوشنودی کلید موفقیت است.<img draggable="false" class="emoji" alt="🗻"></strong>.</p>
                                    </h5>
                                        <div class="primary-button">
                                            <a href="#">اطلاعات بیشتر</a>
                                        </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </section>
        <section class="panel b-green" id="4">
          <article class="panel__wrapper">
            <div class="panel__content">
              <div class="container">
                <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="contact-content" style="height:100px;color:aqua;direction:rtl">
                         
                        <div style="padding-top:15%"  >                        
                      </div>
                      <div class="row">
                        <div class="col-md-8">
                          <div class="contat-form">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="more-info"  style="color:black">
                            <p>دفتر مرکزی<br><br>
                            <em>09123046635
								<br>شماره ثبت, 10550</em></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="footer">
                      <p> تمامی حقوق مادی و معنوی این وبسایت برای&copy; CHECKIT
                      | محفوظ است</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </section>       
</asp:Content>
