<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="esppack.aspx.cs" Inherits="NM.Account.esppack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>پلن سرمایه گذاری</title>

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
label{
    color:white;
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
    <asp:UpdatePanel runat="server" ID="up1"><ContentTemplate>
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-11">
            <div class="p-5" style="background-color:rgb(14 23 38);border-radius:25px;border-style:double;border-color:red">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4 text-danger">پک در آمدی شرکت</h1>
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
                 <div runat="server" id="coinsprice" class="row">
                     
                  </div> 
                    <div style="display:none" class="form-group row">                        
                            <label for="CoinsList" class="col-form-label-sm" >معرف اصلی</label>
                        <input name="Introduced" runat="server"
                                 class="form-control form-control-user" onchange="document.getElementById('Introduced_Change').click();"
                               id="Introduced" placeholder="Introduced UserName" />
                         <label runat="server" id="Introduced_Name" style="color:red" for="Introduced" class="col-form-label-sm" ></label>
                        <asp:Button runat="server" ID="Introduced_Change" OnClick="Introduced_Change_Click" ClientIDMode="Static" style="display:none" />
                    
                        <label for="CoinsList" class="col-form-label-sm" > معرف فرعی</label>
                        <input name="FariCode" runat="server"
                                 class="form-control form-control-user" onchange="document.getElementById('Introduced_Change').click();"
                               id="FariCode" placeholder="Introduced UserName" />
                    </div>
                <div class="form-group row">
               <label for="scan" class="col-form-label-sm" >کسب درآمد</label>
                <textarea readonly="readonly" class="form-control form-control" style="height:700px;font-size:large" >
                    بسمه تعالی

موضوع و نحوه ی فعالیت شرکت پدیدآوران فکروثروت اسپادان


خدمات، برنامه نویسی ، راه اندازی و پشتیبانی نرم افزار و اپلیکیشن ، ایجاد فروشگاههای اینترنتی و ایجاد باشگاه مشتریان 

1- ارائه وبسایت وقالب فروشگاهی به انتخاب مشتری 
2- ارائه پنل پیامکی برای تبلیغ شغل مورد نظر در وب سایت 
3- معرفی وب سایت ایجاد شده به تمامی کاربران باشگاه مشتریان جهت تسهیل خرید در سرارکشور 
4- قرارداد باسازمان رزکارت جهت تخفیفات و تسهیلات و خدمات به باشگاه مشتریان و ایجاد گردش اقتصادی و رونق تولید ملی در کشور
5- آموزش استفاده از وب سایت فروشگاهی و نرم افزارهای کاربردی 
6- داشتن فروشگاه اینترنتی جهت معرفی محصولات تولیدکنندگان ایرانی 
7- شناسایی مشاغل خانگی موثر در اقتصاد خانواده و معرفی آنها به باشگاه مشتریان ایجاد شده 
8- قرارداد با مراکزو ارگانها و سازمانها برای ارائه خدمات به عموم افراد جامعه (باشگاه مشتریان شرکت)
9- ایجاد بستر مناسب در فضای مجازی برای تسریع و رونق کسب و کارهای راکد سنتی 
10- ایجاد بستر مناسب برای خانواده ها جهت استفاده از طرحهای قراردادی شرکت در موضوع خرید مایحتاج خانواده ها بصورت اقساطی و معرفی به مراکز مربوطه (از طریق رزکارت)
11- کمک به اقشار آسیب پذیر جامعه و زنان سرپرست خانوار برای کسب درآمد از طریق ایجاد فروشگاههای مجازی و راه اندازی کسب و کار و معرفی آنها به صاحبین مشاغل 
12- رفع مشکل اشتغال برای کلیه افراد با توانمندیهای مختلف جهت راه اندازی کسب و کار در راستای کمک به اجرای اهداف جمهوری اسلامی در ریشه کن کردن فقر و بیکاری در جامعه ( در نتیجه کاهش بزهکاری و نارضایتی در جامعه) 
- ایجاد طرح های ترغیبی برای باشگاه مشتریان برای استفاده از مراکز ایجاد شده ی فروشگاهی، رفاهی، تفریحی، درمانی، تخفیفی 
 
14- ارائه پورسانت تک سطحی در قالب معرفی مستقیم به ازای معرفی هر مشتری 13% حق معرفی به شخص معرف 
	کاربر: به شخصی گفته میشود که از شرکت خرید کرده و عضو باشگاه مشتریان شرکت میباشد.
	حق معرفی: پورسانتی که بصورت تک سطحی به شخصی که فردی را به عنوان مشتری با کد کاربری ایجاد شده در سیستم به شرکت معرفی خواهد کرد.
	مبلغ حق معرفی: 13% از مبلغ اصلی خرید از شرکت بدون احتساب مالیات ارزش افزوده 
	پورسانتها بصورت مشتری ارجاعی در قالب حق معرفی در یک سطح محاسبه خواهد شد که به حساب معرفی شده توسط کاربر پرداخت خواهد شد. 


                </textarea>
                    <img style="width:100%" src="img/plan.JPG" />
                <asp:CheckBox Style="display:none" ID="gconfirm" OnCheckedChanged="gconfirm_CheckedChanged" runat="server" AutoPostBack="true"
                     Text="قوانین و مقررات را خوانده و مورد قبول اینجانب میباشد" />
            </div>
                 <div style="display:none" class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button Enabled="false" runat="server" OnClick="sabt_Click" ID="sabt" 
                            class="btn btn-primary btn-user btn-block" Text="ثبت" />                                               
                </div>
                   <div style="display:none" class="form-group row">
                            <label for="TContent" class="col-form-label-sm" >مبلغ واریزی</label>
                            <input name="TContent" runat="server" onchange="document.getElementById('amtchanege').click();"
                                 class="form-control form-control-user"
                               id="TContent" placeholder="مبلغ واریزی" />
                           <label style="display:none" for="ShFish" class="col-form-label-sm" >شماره فیش</label>
                            <input style="display:none" name="ShFish" runat="server"
                                 class="form-control form-control-user"
                                  id="ShFish" placeholder="شماره فیش" />
                   </div>
                <div style="display:none" class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" 
                            class="btn btn-primary btn-user btn-block" Text="ایجاد پک" />                        
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
        </ContentTemplate></asp:UpdatePanel>  
</asp:Content>
