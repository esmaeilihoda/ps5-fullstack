<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="ShopSetting.aspx.cs" Inherits="Shop.Shop.Admin.ShopSetting" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>اصلاح اطلاعات کاربری</title>

    <!-- Custom fonts for this template-->
    <!-- Custom styles for this template-->
    <style type="text/css">
        @font-face {
            font-family: 'BK';
            src: url('../Fonts/BKoodakBold.ttf') format('opentype');
        }

        * {
            font-family: BK;
            direction: rtl;
        }

        .bg-register-image {
            background: url('img/CHECKITLOGO.png');
            background-position: center;
            background-repeat: no-repeat;
            width: 500px;
            height: 500px;
        }
    </style>
    <link rel="stylesheet" href="../css/linearicons.css">
    <script type="text/javascript" src="../../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript" src="../../Account/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
        //window.onload += rr();
        function clear() {
            var data = "{'tt':''}";
            var url = "ShopAdmin.asmx/HW";
            alert(ShopAdmin.HW(''));
            //alert(Ajax_Wecan(data, url));
        }
        function collectUrls(mode) {
            if (mode == 1) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() + "©";
                }
                fin("SlidePics").value = result;
                fin("sdsd").style.display = "none";
                fin("selectpic").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 2) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() + "©";
                }
                fin("BannerPic").value = result;
                fin("sdsd").style.display = "none";
                fin("selecbtpic").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 3) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() ;
                }
                fin("picleftone").value = result;
                fin("sdsd").style.display = "none";
                fin("selectlt").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 4) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() ;
                }
                fin("piclefttwo").value = result;
                fin("sdsd").style.display = "none";
                fin("selectlb").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 5) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() ;
                }
                fin("BanerBottomRight").value = result;
                fin("sdsd").style.display = "none";
                fin("selectbrb").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 6) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() ;
                }
                fin("BanerBottomLeft").value = result;
                fin("sdsd").style.display = "none";
                fin("selectblb").style.display = "none";
                $(".btnselectpic").hide();
            }
            if (mode == 7) {
                var selectedItems = $find("sdsd").get_selectedItems();
                var result = "";
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].get_url())
                        result += selectedItems[i].get_url() ;
                }
                fin("BanerCenter").value = result;
                fin("sdsd").style.display = "none";
                fin("selectbcenter").style.display = "none";
                $(".btnselectpic").hide();
            }
        }
        function showimagexplor(mode) {
            if (mode == 1) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectpic").style.display = "";
            }
            if (mode == 2) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selecbtpic").style.display = "";
            }
            if (mode == 3) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectlt").style.display = "";
            }
            if (mode == 4) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectlb").style.display = "";
            }
            if (mode == 5) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectbrb").style.display = "";
            }
            if (mode == 6) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectblb").style.display = "";
            }
            if (mode == 7) {
                fin("sdsd").style.display = "";
                $(".btnselectpic").hide();
                fin("selectbcenter").style.display = "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CCPH" runat="server">
    <asp:UpdatePanel runat="server" ID="as">
        <ContentTemplate>
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-12">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">تنظیمات فروشگاه!</h1>
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
                                
                                <hr />
                                <%--<div onclick="fin('IId').value = '';" style="cursor: pointer; color: blue">+جدید</div>--%>
                                <div class="form-group row">
                                    <div class="col-md-6 col-12">
                                            <label for="SlidePics" class="col-form-label-sm">تصاویر اسلایدر</label>
                                        <input name="SlidePics" clientidmode="Static" readonly="readonly"
                                            runat="server" class="form-control form-control-user"
                                            id="SlidePics" placeholder="" />
                                        <button type="button" style="display: inline-block;" onclick="showimagexplor(1);"><i class="lnr lnr-magnifier"></i></button>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <label for="linkSlide" class="col-form-label-sm">لینک اسلایدر</label>
                                        <input type="text" id="linkSlide" class="form-control" runat="server"/>
                                    </div>
                                                                       
                                    <%--<a target="_blank" href="/Shop/Admin/Telerik.Web.UI.DialogHandler.aspx?DialogName=ImageManager&renderMode=1&Skin=Default&Title=Image+Manager&doid=247b8e4e-d9c3-4631-bbb1-32591027aeea&dpptn=&isRtl=true&dp=dBE7NXhxCSIMFihMeWx7BQl3Hg1nMxh4eDUhM140SV5hICZrUnkqPSVVZQ5hDwA9fysvPHh3NCwiYThieWN3ODJ3Q2xkPH94dyUhMFkgXWBYFjpSe2UpIj4IcRZZGy5KfCoVLkZjKyEiYx5PR2NkMiYGU1xfM155exYPAmkcHGxhPV1wYXU%2bYyZvUzVqbTYOdRA%2fFUBwFTM4FRlBbGBFDzIdQ2teI1U%2bdCo5AlsOXVluSgAIbXIQFihvWwBhDw8CajgSd29gAiwjYQ1BbnBFBwkobVRfI3sKTk4HMGNoc0JZP1VWbWIQFihvWwBhDw8AajkNLkBsDTchFTReQVlVcDIST1FxIXcgTzUlKXYdZEZsFA8OU2cyBiVsE01pC00SfxEvKnBzcjI0ch5deWNjFQp3R0heHVUPdCoTP2AKUk93Pj5HU3Y9ZiNgS0phBDIPfysvA0NzBSgMFyhMdnN3cQoGU3pkM1Uydy4cMnYdUX9YSSJMVnZdBBMLdRBaHwA9fysvPHh3NCEiYBZeQXx%2fLSR1fUhkM2c7dyg9MWM0c15hPzpVZkwuKytubUpeCwAWRU4%2fKnh8Eig8SApFQAZkMiY8U2heCnskYk09MGMOb0ZhLQBKbnYMPSNvcQpfG0EDajkNLkBsDTciYQFFdXx7cDERX39fI1U%2bSU1adFgRd0VYPxRSYhM%2bIitvbUpaC0EPajkNLkBsDTciYQFFcVl3Mgh3fgprPG87T08tLm8eYwVaMCFNYWkiYCtrVA13GggORwYBEXAUGRI6FCRdd2EAFyUdcWdcDxgMeE9aDm0fb0F1LypmZXUpZD4JeQphBBw0RE4FKm5hGTMMbQJab3B4MiYBX3dfM2smdyg9LlsBd0NYEwQOU2kqGChvFhFZGy4DcCQdNW5hGTMMbQJab3BwMiR1R0lkM0kkfyo5NV4eHExpFQBNbXcmYCtVeQpeHwA9fysvPHh3NCwiYytMdlkIKj0%2fbU1yVFU%2bdE8tNlsBVV1fPwBIVU0qORV%2fRAlpMT4JRU4CNW9nNGw4YhpFeWx7MQo8HnhcM2s7T08PAGAOf0VZFQAOVnZRJD1TcQpiCwAMfE0Fc0FjFRQ3cn1ab3FrKQkNZVFxIGw7exYPElloVWxoFi5WUnU%2bCCZURzBfCiIsR08BFXQVCSw0YC8DRmFJMz4raWdrV0V6ehcpCl40b0BuFgBXek8AZyV%2fVwlfGhQifDsvE3QUGWo5cyhdQXN%2fMz4raWdrV0V6ehMHdmBof31tFiJfYGQYJihgSEtsGggidSQBEXRzNyE9cBZXQXN%2fND8raVRwDnx9eSobB18cEHF1MBxzVko%2bZCVtcQhfCU0%2fcCQZDHBxdyM3TiRlbmN%2fNT0RR1RfMnQwdzgDDlseb3FfSghoZGcyIShTRwlaMDUDcBYBEXBeLyI5SS8GbGEAFDgdQ1xfMXc7eRMbK18cEERtFQBkYWRdIyVTZkNrCAw8RBERL0BjFQ4PbRpCelkEKQoSU3BcMxg6TCpeK3Ycf11ZMCJSe2UlIidwaUthCAwtRysBdXdjBWsPbQFFdXx7cDEWXEpxIl08TAc9Emhpf3xvSQRVY3RZBz9geSBaN00%2bc05mDXViCS8gcgpucWBwdA%3d%3d" >آپلود </a>--%>
                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 col-12">
                                    <label for="BannerPic" class="col-form-label-sm">تصویر بنر</label>
                                    <input name="BannerPic" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="BannerPic" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(2);"><i class="lnr lnr-magnifier"></i></button>
                                    </div>
                                     <div class="col-md-6 col-12">
                                        <label for="LinkBannerPic" class="col-form-label-sm">لینک بنر</label>
                                        <input type="text" id="LinkBannerPic" class="form-control" runat="server" />
                                    </div>
                                    
                                </div>

                                 <div class="form-group row">
                                     <div class="col-md-6 col-12">
                                    <label for="picleftone" class="col-form-label-sm">تصویر سمت چپ سایت بالا</label>
                                    <input name="picleftone" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="picleftone" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(3);"><i class="lnr lnr-magnifier"></i></button>
                                         </div>
                                      <div class="col-md-6 col-12">
                                        <label for="Linkpicleftone" class="col-form-label-sm">لینک تصویر سمت چپ سایت بالا</label>
                                        <input type="text" id="Linkpicleftone" class="form-control" runat="server" />
                                    </div>
                                    
                                </div>
                                 <div class="form-group row">
                                     <div class="col-md-6 col-12">
                                    <label for="piclefttwo" class="col-form-label-sm">تصویر سمت چپ سایت پایین</label>
                                    <input name="piclefttwo" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="piclefttwo" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(4);"><i class="lnr lnr-magnifier"></i></button>
                                         </div>
                                      <div class="col-md-6 col-12">
                                        <label for="Linkpiclefttwo" class="col-form-label-sm">لینک تصویر سمت چپ سایت پایین</label>
                                        <input type="text" id="Linkpiclefttwo" class="form-control"  runat="server"/>
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 col-12">
                                    <label for="BanerBottomRight" class="col-form-label-sm">بنر پایین صفحه سمت راست</label>
                                    <input name="BanerBottomRight" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="BanerBottomRight" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(5);"><i class="lnr lnr-magnifier"></i></button>
                                        </div>
                                     <div class="col-md-6 col-12">
                                        <label for="LinkBanerBottomRight" class="col-form-label-sm">لینک بنر پایین صفحه سمت راست</label>
                                        <input type="text" id="LinkBanerBottomRight" class="form-control" runat="server"/>
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 col-12">
                                    <label for="BanerBottomLeft" class="col-form-label-sm">بنر پایین صفحه سمت چپ</label>
                                    <input name="BanerBottomLeft" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="BanerBottomLeft" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(6);"><i class="lnr lnr-magnifier"></i></button>
                                        </div>
                                     <div class="col-md-6 col-12">
                                        <label for="LinkBanerBottomLeft" class="col-form-label-sm">لینک بنر پایین صفحه سمت چپ</label>
                                        <input type="text" id="LinkBanerBottomLeft" class="form-control" runat="server"/>
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 col-12">
                                    <label for="BanerCenter" class="col-form-label-sm">بنر وسط صفحه</label>
                                    <input name="BanerCenter" clientidmode="Static" readonly="readonly"
                                        runat="server" class="form-control form-control-user"
                                        id="BanerCenter" placeholder="" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(7);"><i class="lnr lnr-magnifier"></i></button>
                                        </div>
                                     <div class="col-md-6 col-12">
                                        <label for="LinkBanerCenter" class="col-form-label-sm">لینک بنر وسط صفحه</label>
                                        <input type="text" id="LinkBanerCenter" class="form-control" runat="server" />
                                    </div>
                                   
                                </div>
                                <telerik:RadFileExplorer Style="display: none" runat="server" EnableFilterTextBox="true"
                                        Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Shop/ShopImages"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                        ID="sdsd" ClientIDMode="Static" ExplorerMode="Default">
                                    </telerik:RadFileExplorer>
                                <div style="display: none" class="btn btn-success btnselectpic" id="selectpic" onclick="collectUrls(1);">انتخاب تصویر</div>
                                <div style="display: none" class="btn btn-success btnselectpic" id="selecbtpic" onclick="collectUrls(2);">انتخاب تصویر</div>
                                <div style="display: none" class="btn btn-success btnselectpic" id="selectlt" onclick="collectUrls(3);">انتخاب تصویر</div>
                                 <div style="display: none" class="btn btn-success btnselectpic" id="selectlb" onclick="collectUrls(4);">انتخاب تصویر</div>
                                 <div style="display: none" class="btn btn-success btnselectpic" id="selectbrb" onclick="collectUrls(5);">انتخاب تصویر</div>
                                 <div style="display: none" class="btn btn-success btnselectpic" id="selectblb" onclick="collectUrls(6);">انتخاب تصویر</div>
                                 <div style="display: none" class="btn btn-success btnselectpic" id="selectbcenter" onclick="collectUrls(7);">انتخاب تصویر</div>
                                <%-- <div class="form-group row">
                                    <label for="Name" class="col-form-label-sm">نام زیر فهرست</label>
                                    <input name="Name" runat="server" class="form-control form-control-user"
                                        id="Name" placeholder="نام فهرست" />
                                </div>
                                <div class="form-group row">
                                    <label for="ParentId" class="col-form-label-sm">مادر</label>
                                    <input name="ParentId" runat="server" class="form-control form-control-user"
                                        id="ParentId" placeholder="سریال لیست مادر" />
                                </div>
                                 <div class="form-group row">
                                    <label for="Istaus" class="col-form-label-sm">وضعیت</label>
                                    <input name="Istaus" runat="server" class="form-control form-control-user"
                                        id="Istaus" placeholder="وضعیت" />
                                </div>--%>
                                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                                <asp:Literal runat="server" ID="lit"></asp:Literal>
                            </div>
                            <%-- -----%>
                        </div>
                    </div>
                </div>

                <div>
                    <telerik:RadEditor ImageManager-UploadPaths="~/Shop/ShopImages"
                        ImageManager-DeletePaths="~/Shop/ShopImages"
                        ImageManager-ViewPaths="~/Shop/ShopImages"
                        MediaManager-ViewPaths="~/Shop/ShopImages" ID="P_Content"
                        MediaManager-SearchPatterns="*.mp4, *.mp3"
                        MediaManager-DeletePaths="~/Shop/ShopImages"
                        MediaManager-UploadPaths="~/Shop/ShopImages" MediaManager-MaxUploadFileSize="150000000"
                        ImageManager-MaxUploadFileSize="150000000"
                        Width="100%" runat="server">
                    </telerik:RadEditor>

                    <asp:DropDownList AutoPostBack="true" runat="server" ID="PageList" OnSelectedIndexChanged="PageList_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Text="انتخاب" Value="select"></asp:ListItem>
                        <asp:ListItem Text="صفحه اصلی" Value="index.aspx"></asp:ListItem>
                        <asp:ListItem Text="صفحه فروشگاه" Value="shop.aspx"></asp:ListItem>
                        <asp:ListItem Text="صفحه نمایش جزئیات محصول" Value="product.aspx"></asp:ListItem>
                        <asp:ListItem Text="نهایی کردن خرید" Value="checkout.aspx"></asp:ListItem>
                        <asp:ListItem Text="صفحه سبد خرید" Value="cart.aspx"></asp:ListItem>
                        <asp:ListItem Text="فاکتورها" Value="Factors.aspx"></asp:ListItem>
                        <asp:ListItem Text="صفحه پرداخت" Value="ShopZarPayment.aspx"></asp:ListItem>
                        <asp:ListItem Text="نمایش دسته بندی محصولات" Value="fullproducts.aspx"></asp:ListItem>
                        <asp:ListItem Text="ثبت دامین" Value="DomainRegister.aspx"></asp:ListItem>
                        <asp:ListItem Text="مشاهده محصولات فاکتور" Value="showorderitem.aspx"></asp:ListItem>
                       <%-- <asp:ListItem Text="ثبت اطلاعات بیمه تکمیلی" Value="SuppInsuranceReg.aspx"></asp:ListItem>--%>
                    </asp:DropDownList>


                    <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true"
                        ID="ElemntsGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="ElemntsGrid_NeedDataSource"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>

                                <telerik:GridBoundColumn DataField="elementname" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام المان"
                                    UniqueName="elementname">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn AllowFiltering="false"
                                    DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="مخفی کردن المان" UniqueName="CHK">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" Checked='<%# Eval("CHK") %>' ID="CHK" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridTemplateColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>


                    <asp:Button runat="server" OnClick="saveitems_Click" ID="saveitems"
                        class="btn btn-primary btn-user btn-block" Text="ذخیره" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
