<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="UPGPacks.aspx.cs" Inherits="NM.Account.UPGPacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CCPH" runat="server">
    <style type="text/css">   
    .col-lg-4{
        text-align:center;
        font-size:larger;
        
    }
    .text-white{
     cursor:pointer; 
     text-align:center;
     border-radius:30px;
    }
     </style>
    
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
        function RCode_Change() {
            document.getElementById("GetRName").click();
        }
    </script>

     <script type="text/javascript">
         function packclick(packno) {
             document.getElementById("PNO").value = packno;
             document.getElementById("ByPack").click();
         }
     </script>
    <asp:ScriptManager runat="server" ID="SMH">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager>
      <div id="content">
                <div class="col-lg-4" style="min-width:50%">
              <!-- Background Gradient Utilities -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" style="font-size:x-large">ارتقا جایگاه</h6>
                </div>
                <div class="card-body">
                    
                  <div onclick="packclick(1)" style="background-color:burlywood;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-light text-white">
                      پک برنز 640000 تومان خرید یک وب سایت اختصاصی با قالب فروشگاهی +یک پنل پیامکی +کارت ویزیت اکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی و تفریحی طرف قرارداد شرکت. ۱برابر امتیاز کیف شارژ میشود
                  </div>
                  <div onclick="packclick(2)" style="background-color:burlywood;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-light text-white">
                      پک برنز پلاس 1280000تومان خرید دو وب سایت اختصاصی با قالب فروشگاهی +دو پنل پیامکی +دو کارت ویزیت اکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی و ورزشی طرف قرارداد شرکت.1.2برابررقم امتیاز کیف شارژ میشود
                  </div>
                    
                  <div onclick="packclick(3)" style="background-color:silver;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-info text-white">
                      پک نقره 1920000 تومان خرید سه وب سایت اختصاصی با قالب فروشگاهی +سه پنل پیامکی +سه کارت ویزیت الکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی و آموزشی طرف قرارداد شرکت .1.5برابر رقم امتیاز کیف شارژمیشود
                  </div>
                  <div onclick="packclick(4)" style="background-color:silver;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-info text-white">
                      پک نقره پلاس 2560000تومان خرید چهار وب سایت اختصاصی با قالب فروشگاهی +چهار پنل پیامکی +چهار کارت ویزیت اکترونیکی +استفاده از کلیه تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی ،ورزشی وآموزشی طرف قرارداد شرکت .2برابر رقم امتیاز کیف شارژ میشود
                  </div>

                  <div onclick="packclick(5)" style="background-color:darkgoldenrod;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-warning text-white">
                      پک گلد 3200000تومان خرید پنج وب سایت اختصاصی با قالب فروشگاهی +پنج پنل پیامکی +پنج کارت ویزیت الکترونیکی + استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی، آموزشی ودرمانی طرف قرارداد شرکت .2.5 برابر رقم امتیاز کیف شارژ میشود . هزینه ی یکسال بیمه ی عمر  رایگان برای یک نفر ، برای کسانی که حداقل 6ماه از عضویت آنها گذشته و مجموع فروش از رقم 256 میلیون گذشته باشد.
                  </div>
                  <div onclick="packclick(6)" style="background-color:darkgoldenrod;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-warning text-white">
                      پک گلد پلاس 3840000 خرید شش وب سایت اختصاصی با قالب فروشگاهی +شش پنل پیامکی +شش کارت ویزیت الکترونیکی  +استفاده از کلیه ی تخفیفات طرف قراردادبانکی و تخفیفات امتیازی فروشگاهی، تفریحی،ورزشی ،آموزشی ، درمانی وزیبایی طرف قرارداد شرکت.3برابر رقم امتیاز کیف شارژ میشود .هزینه ی یکسال بیمه ی  عمر رایگان برای دو نفر ،برای کسانی که حداقل 6ماه از عضویت آنها گذشته و مجموع فروش از رقم 352میلیون گذشته باشد .
                  </div>
                    
                  <div onclick="packclick(7)"  style="background-color:lightslategrey;margin-bottom:10px;display:none"
                       class="px-3 py-5 bg-gradient-dark text-white">
                      پک پلاتینیوم 4480000 خرید هفت وب سایت اختصاصی با قالب فروشگاهی +هفت پنل پیامکی +هفت کارت ویزیت الکترونیکی  +استفاده از کلیه تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی ، آموزشی ، درمانی و زیبایی طرف قرارداد شرکت . 4 برابر رقم امتیاز کیف شارژ میشود .هزینه ی یکسال بیمه ی عمر برای 3نفر ، برای کسانی که حداقل 6ماه از عضویت آنها گذشته و فروش از رقم 448میلیون گذشته باشد .
                  </div>
                  <asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>
                    <asp:Button runat="server" ID="ByPack" ClientIDMode="Static" OnClick="ByPack_Click" style="display:none;" />
                  <asp:HiddenField runat="server" ID="PNO" ClientIDMode="Static" />
                    <div class="row"><div class="col-xl-9">
                        <a runat="server" visible="false" id="ffa" class="btn btn-danger btn-icon-split">
                                    <span class="icon text-white-50"></span>
                                    <span runat="server" onclick="alarmclick();" style="" id="alarm" class="text"></span>
                                    </a>
                     </div></div>
                     <div class="row">
                        <div runat="server" id="DivPay" class="col-xl-9">
                            <div class="form-group row">
                                <asp:Label ID="D_Name" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>                                                                
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList CssClass="dropdown" OnSelectedIndexChanged="PackNo_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server" ID="PackNo">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب پک"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="1" Text="برنز"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="2" Text="برنز پلاس"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="3" Text="نقره ای"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="4" Text="نقره ای پلاس"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="5" Text="طلایی"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="6" Text="طلایی پلاس"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="پلاتینیوم"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="PackLbl" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>                                                                
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList CssClass="dropdown" runat="server" ID="PayType">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب نحوه پرداخت"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled ="false" Text="از محل وام"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="زرین پال"></asp:ListItem>
                                        <asp:ListItem Value="3" Enabled="false" Text="کیف پول"></asp:ListItem>
                                        <asp:ListItem Value="5" Enabled="false" Text="رایگان"></asp:ListItem>
                                        <asp:ListItem Value="4" Enabled="false" Text="استارت آپ"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:Button runat="server" OnClick="ByPack_Click" ID="Register" OnClientClick="document.forms[0].target = '_blank';" class="btn btn-primary btn-user btn-block" Text="خرید پک درآمدی" />
                                    <%--<asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />--%>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                </div>
                </div>
                </div>
     </div>
</asp:Content>
