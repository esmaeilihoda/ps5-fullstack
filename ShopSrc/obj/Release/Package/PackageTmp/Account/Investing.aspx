<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="Investing.aspx.cs" Inherits="NM.Account.Investing" %>
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
                <h1 class="h4 text-gray-900 mb-4 text-danger">شرکت در طرح های اقتصادی شرکت</h1>
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
                                <%
                                    NM.Account.iindex ind = new NM.Account.iindex();
                                    System.Data.DataView cdv = ind.coinsdv();
                                    foreach (System.Data.DataRowView cdr in cdv)
                                    {
                                        if (cdr["currencyname"].ToString() == "تتر")
                                        {
                                         %>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><%=cdr["currencyname"].ToString() %></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cdr["PriceUSD"].ToString() + "$" %></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-coins fa-2x text-gray-300" style="color:cornflowerblue"><%=cdr["sample"].ToString() %></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}
    } %>
                  </div> 
                    <div class="form-group row">                        
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
               <label for="scan" class="col-form-label-sm" >قوانین و مقررات</label>
                <textarea readonly="readonly" class="form-control form-control" style="height:500px" >- مسئولیت صحت اطلاعات وارده بر اساس شناسنامه و کارت ملی در فرم ثبت نام به عهده شخص متقاضی ثبت نام بوده وشرکت اسپادان هیچگونه مسئولیتی نسبت به ورود اطلاعات غلط و ناقص نخواهد داشت.
-کلیه مبالغ پرداختی توسط مشریان در قبال دریافت کالا / خدمات دریافتی می باشد.
- قطعی شدن خرید و واریز پورسانت منوط به واریز کل وجه به حساب بانکی شرکت اسپادان خواهد بود.
- در صورتیکه پس از واریز وجه، خریدار از خرید منصرف گردد، در قوانین باشگاه آمده است اجازه لغو سفارش فقط تا 48 ساعت می باشد و فرد پس از این تایم نمی تواند فسخ انجام دهد . مبلغ واریز شده فرد بابت کالا و یا خدمات فسخ شده تا ۴۵ روز کاری پس از کسر هزینه ها به حساب اعلامی فرد واریز می گردد.
- با توجه به اهداف شرکت در جلب رضایت مشتریان، در صورت درخواست فسخ قرارداد قبل از پایان مدت قرارداد،کلیه وجوه پرداختی که طی مدت گذشته از قرارداد، به حساب شخص بابت سود مشارکت/ پورسانت پرداخت شده از مبلغ کل کسر و مابقی به حساب شخص واریز می گردد.
- با توجه به اینکه از طریق وب سایت ESPADANNET.IR امکان ارتباط با درگاه پرداخت اینترنتی شرکت های پرداخت الکترونیک  با استفاده از کلیه کارتهای بانکی  عضو شبکه شتاب مهیا شده است، مجددا تاکید می گردد جهت جلوگیری از بروز مشکلات آتی نسبت به ورود اطلاعات دقیق طبق شناسنامه و کارت ملی اقدام نمائید.
- کلیه مشتریان موظف به رعایت مقررات و قوانین حاکم برجمهوری اسلامی ایران خواهند بود.
- تمام همکاران تجاری، برای انکه بتوانند کمیسیون حق معرفی و فروش مستقیم  خود را در حساب بانکی خویش دریافت نمایند ، موظف هستند تصویر واضح از کارت ملی و شناسنامه خود را که اطلاعات مندرج روی آن با مشخصات صاحب پنل کاربری مطابقت کامل دارد، برای شرکت ارسال کنند.
- شخص متقاضی تائید می نماید که در کمال صحت و سلامت کلیه مفاد مندرج در قرارداد را بررسی و موافقت خود را اعلام میکند 

                </textarea>
                <asp:CheckBox ID="gconfirm" OnCheckedChanged="gconfirm_CheckedChanged" runat="server" AutoPostBack="true"
                     Text="قوانین و مقررات را خوانده و مورد قبول اینجانب میباشد" />
            </div>
                 <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button Enabled="false" runat="server" OnClick="sabt_Click" ID="sabt" 
                            class="btn btn-primary btn-user btn-block" Text="ثبت" />                                               
                </div>
                   <div class="form-group row">
                            <label for="TContent" class="col-form-label-sm" >مبلغ واریزی</label>
                            <input name="TContent" runat="server" onchange="document.getElementById('amtchanege').click();"
                                 class="form-control form-control-user"
                               id="TContent" placeholder="مبلغ واریزی" />
                           <label style="display:none" for="ShFish" class="col-form-label-sm" >شماره فیش</label>
                            <input style="display:none" name="ShFish" runat="server"
                                 class="form-control form-control-user"
                                  id="ShFish" placeholder="شماره فیش" />
                   </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" 
                            class="btn btn-primary btn-user btn-block" Text="سرمایه گذاری" />                        
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
