<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="ByPacks.aspx.cs" Inherits="NM.Account.ByPacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CCPH" runat="server">
    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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
                <div class="col-lg-4" style="min-width:100%;background-color:rgb(0 0 0)">
              <!-- Background Gradient Utilities -->
              <div class="card shadow mb-4" style="background-color:rgb(0 0 0)">
               
                  <div style="font-size:x-large;color:red;stroke:white;text-align:center">لیست پک های درآمدزایی </div>
               
                <div class="card-body">
                    
                  <div onclick="packclick(1)" 
                       class="px-3 py-5 bg-gradient-light text-white" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;">
                      پک برنز 640000 تومان خرید یک پنل پیامکی +کارت ویزیت اکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی و تفریحی طرف قرارداد شرکت. ۱برابر امتیاز کیف شارژ میشود
                  </div>
                  <div onclick="packclick(2)" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;display:none"
                       class="px-3 py-5 bg-gradient-light text-white">
                      پک برنز پلاس 1280000تومان خرید دو پنل پیامکی +دو کارت ویزیت اکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی و ورزشی طرف قرارداد شرکت.1.2برابررقم امتیاز کیف شارژ میشود
                  </div>
                    
                  <div onclick="packclick(3)" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;"
                       class="px-3 py-5 bg-gradient-info text-white">
                      پک نقره 1920000 تومان خرید سه پنل پیامکی +سه کارت ویزیت الکترونیکی  +استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی و آموزشی طرف قرارداد شرکت .1.5برابر رقم امتیاز کیف شارژمیشود
                  </div>
                  <div onclick="packclick(4)" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;display:none"
                       class="px-3 py-5 bg-gradient-info text-white">
                      پک نقره پلاس 2560000تومان خرید چهار پنل پیامکی +چهار کارت ویزیت اکترونیکی +استفاده از کلیه تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی ،ورزشی وآموزشی طرف قرارداد شرکت .2برابر رقم امتیاز کیف شارژ میشود
                  </div>

                  <div onclick="packclick(5)" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;"
                       class="px-3 py-5 bg-gradient-warning text-white">
                      پک گلد 3200000تومان خرید پنج پنل پیامکی +پنج کارت ویزیت الکترونیکی + استفاده رایگان از کلیه ی تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی، آموزشی ودرمانی طرف قرارداد شرکت .2.5 برابر رقم امتیاز کیف شارژ میشود . هزینه ی یکسال بیمه ی عمر  رایگان برای یک نفر ، برای کسانی که حداقل 6ماه از عضویت آنها گذشته و مجموع فروش از رقم 256 میلیون گذشته باشد.
                  </div>
                  <div onclick="packclick(6)" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;display:none"
                       class="px-3 py-5 bg-gradient-warning text-white">
                      پک گلد پلاس 3840000 خرید شش پنل پیامکی +شش کارت ویزیت الکترونیکی  +استفاده از کلیه ی تخفیفات طرف قراردادبانکی و تخفیفات امتیازی فروشگاهی، تفریحی،ورزشی ،آموزشی ، درمانی وزیبایی طرف قرارداد شرکت.3برابر رقم امتیاز کیف شارژ میشود .هزینه ی یکسال بیمه ی  عمر رایگان برای دو نفر ،برای کسانی که حداقل 6ماه از عضویت آنها گذشته و مجموع فروش از رقم 352میلیون گذشته باشد .
                  </div>
                    
                  <div onclick="packclick(7)"  style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;"
                       class="px-3 py-5 bg-gradient-dark text-white">
                      پک پلاتینیوم 4480000 خرید هفت پنل پیامکی +هفت کارت ویزیت الکترونیکی  +استفاده از کلیه تخفیفات طرف قرارداد بانکی و تخفیفات امتیازی فروشگاهی ،تفریحی،ورزشی ، آموزشی ، درمانی و زیبایی طرف قرارداد شرکت . 4 برابر رقم امتیاز کیف شارژ میشود .هزینه ی یکسال بیمه ی عمر برای 3نفر ، برای کسانی که حداقل 6ماه از عضویت آنها گذشته و فروش از رقم 448میلیون گذشته باشد .
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
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input name="D_Code" type="text" onchange="RCode_Change();" runat="server" class="form-control form-control-user"
                                        id="D_Code" placeholder="کد ثبت موقعیت">
                                </div>
                                <asp:RadioButtonList ForeColor="White" OnSelectedIndexChanged="packtype_SelectedIndexChanged" AutoPostBack="true"
                                     runat="server" ID="packtype">
                                    <asp:ListItem Selected="True" Text="خدمات" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="محصول" Value="1">
                                    </asp:ListItem></asp:RadioButtonList>
                                <asp:Label ID="D_Name" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>                                                                
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList CssClass="dropdown" OnSelectedIndexChanged="PackNo_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server" ID="PackNo">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب پک"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="برنز"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="2" Text="برنز پلاس"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="نقره ای"></asp:ListItem>
                                        <asp:ListItem Value="4" Enabled="false" Text="نقره ای پلاس"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="طلایی"></asp:ListItem>
                                        <asp:ListItem Value="6" Enabled="false" Text="طلایی پلاس"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="پلاتینیوم"></asp:ListItem>
                                    </asp:DropDownList>
         <telerik:RadGrid style="display:none" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Packs_Grid" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"
             OnItemDataBound="Packs_Grid_ItemDataBound"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="Id" Visible="false" FilterControlAltText="Filter column3 column" HeaderText="سریال" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:Label runat="server" ID="textid" Text='<%# Eval("Id") %>' />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                        
                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackName" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام پک" UniqueName="PackName">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackDsc" FilterControlAltText="Filter TemplateColumn column" HeaderText="توضیحات" UniqueName="PackDsc">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                                                
                          <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="انتخاب" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:Image Height="100px" Width="100px" runat="server" ID="packimg" />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="انتخاب" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:CheckBox AutoPostBack="true" OnCheckedChanged="CHK_CheckedChanged" runat="server" ID="CHK" />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
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
                                        <asp:ListItem Value="3" Text="کیف پول"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="مقروضی"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="MTT"></asp:ListItem>
                                        <asp:ListItem Value="4" Enabled="false" Text="استارت آپ"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />                                    

                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                                    <asp:Button runat="server" OnClick="ByPack_Click" ID="Register" OnClientClick="document.forms[0].target = '_blank';" class="btn btn-primary btn-user btn-block" Text="خرید پک درآمدی" />
                </div>
                </div>
                </div>
     </div>
</asp:Content>
