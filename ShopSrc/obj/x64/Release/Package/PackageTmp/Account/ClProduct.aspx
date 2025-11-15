<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="~/Account/ClProduct.aspx.cs" Inherits="NM.Account.ClProduct" %>

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
            background: url('img/wse-logo.png');
            background-position: center;
            background-repeat: no-repeat;
            width: 500px;
            height: 500px;
        }
    </style>
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
        var modecode;
        function collectUrls(mode) {

            var selectedItems = $find("sdsd").get_selectedItems();
            var result = "";
            for (var i = 0; i < selectedItems.length; i++) {
                if (selectedItems[i].get_url())
                    result += selectedItems[i].get_url() + "©";
                if (modecode == 1)
                    fin("CCPH_Gallarys").value = result;
                else if (modecode == 0)
                    fin("CCPH_ImageUrl").value = result;
                else if (modecode == 2)
                    fin("CCPH_ImageUrl2").value = result;
                fin("sdsd").style.display = "none";
                fin("selectpic").style.display = "none";
            }
        }
        function showimagexplor(mode) {
            modecode = mode;
            fin("sdsd").style.display = "";
            fin("selectpic").style.display = "";
        }

        function SETDiSC() {
            fin('CCPH_VPrice').value = fin('CCPH_Price').value - (fin('CCPH_Price').value * fin('CCPH_Disc').value / 100);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CCPH" runat="server">   
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-12">
                            <div class="col-12 p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">تعریف محصولات</h1>
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
                                <div class="form-group row col-12">
                                    <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="Shop_ListItemsGrd" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="Shop_ListItemsGrd_NeedDataSource" OnItemCommand="Shop_ListItemsGrd_ItemCommand" Skin="Metro"
                                        BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="PId" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="PId">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                               <%-- <telerik:GridBoundColumn DataField="PName" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام محصول"
                                                    UniqueName="PName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>--%>

                                                <telerik:GridBoundColumn DataField="Price" FilterControlAltText="Filter TemplateColumn column" HeaderText="قیمت"
                                                    UniqueName="Price">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="VPrice" FilterControlAltText="Filter TemplateColumn column" HeaderText="قیمت ویژه"
                                                    UniqueName="VPrice">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridButtonColumn CommandName="ProuductEdit" FilterControlAltText="Filter column9 column" HeaderText="عملیات"
                                                    UniqueName="Dsc" DataTextField="PName" HeaderTooltip="برای اصلاح لیست روی نام لیست کلیک کنید">
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridButtonColumn>

                                                <telerik:GridButtonColumn CommandName="delet" FilterControlAltText="Filter column9 column" HeaderText="حذف"
                                                    UniqueName="delet" DataTextField="delet" ConfirmText="برای حذف محصول مطمئن هستید؟!">
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridButtonColumn>

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>
                                <hr />
                                <hr />
                                <hr />
                                <div onclick="fin('PId').value = '';" style="cursor: pointer; color: blue">+جدید</div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="PId" class="col-form-label-sm">سریال</label>
                                        <input name="PId" clientidmode="Static" readonly="readonly" type="number"
                                            runat="server" class="form-control form-control-user"
                                            id="PId" placeholder="" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="GRP" class="col-form-label-sm">دسته</label>
                                        <asp:DropDownList runat="server" ID="GRP" DataTextField="GName" DataValueField="Id">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="PName" class="col-form-label-sm">نام محصول</label>
                                        <input name="PName" runat="server" class="form-control form-control-user"
                                            id="PName" placeholder="نام محصول" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Price" class="col-form-label-sm">قیمت <small>(تومان)</small></label>
                                        <input name="Price" runat="server" class="form-control form-control-user"
                                            id="Price" placeholder="قیمت را بدون (, یا /) وارد نمایید" type="number" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="VPrice" class="col-form-label-sm">قیمت ویژه <small>(تومان)</small></label>
                                        <input name="VPrice" runat="server" class="form-control form-control-user"
                                            id="VPrice" placeholder="قیمت ویژه را بدون (, یا /) وارد نمایید" type="number"/>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Disc" class="col-form-label-sm">درصد تخفیف</label>
                                        <input type="number" name="Disc" runat="server" onkeyup="SETDiSC();" class="form-control form-control-user"
                                            id="Disc" placeholder=" درصد تخفیف را به صورت عددی وارد نمایید مثال:5" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label style="display:none" for="Disc" class="col-form-label-sm">درصد بالاسری</label>
                                        <input name="Disc" runat="server" class="form-control form-control-user"
                                            id="PPercent" placeholder="درصد بالاسری" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label style="display:none" for="Disc" class="col-form-label-sm">درصد خودشخص</label>
                                        <input name="Disc" runat="server" class="form-control form-control-user"
                                            id="SPercent" placeholder="درصد خودشخص" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="EndDDate" class="col-form-label-sm">تاریخ اتمام تخفیف</label>
                                        <telerik:RadMaskedTextBox runat="server" Mask="####/##/##" ID="EndDDate" class="form-control form-control-user">
                                        </telerik:RadMaskedTextBox>
                                    </div>

                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ViewGroup" class="col-form-label-sm">دسته بندی نمایشی</label>
                                        <%--<asp:DropDownList runat="server" ID="ViewGroup">
                                            <asp:ListItem Text="برترین ها" Value="Bests"></asp:ListItem>
                                            <asp:ListItem Text="جدید ترینها" Value="Newest"></asp:ListItem>
                                            <asp:ListItem Text="پر فروش ترینها" Value="Bestselling"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                        <asp:DropDownList AutoPostBack="false"  CssClass="form-control" ID="ViewGroup" runat="server" >
                  
                                         </asp:DropDownList>
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrl" class="col-form-label-sm">تصویر اول</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrl" placeholder="تصویر اول" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0" style="display:none">
                                        <label for="ImageUrl2" class="col-form-label-sm">تصویر دوم</label>
                                           <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrl2" placeholder="تصویر دوم" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Dsc" class="col-form-label-sm">توضیح کوتاه محصول</label>
                                        <input name="Dsc" runat="server" class="form-control form-control-user"
                                            id="Dsc" placeholder="توضیح کوتاه محصول" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Size" class="col-form-label-sm">سایز</label>
                                        <input name="Size" runat="server" class="form-control form-control-user"
                                            id="Size" placeholder="سایز محصول" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Stock" class="col-form-label-sm">میزان موجودی</label>
                                        <input name="Stock" runat="server" class="form-control form-control-user"
                                            id="Stock" placeholder="موجودی" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="SHave" class="col-form-label-sm">دارای موجودی</label>
                                        <asp:CheckBox runat="server" ID="SHave" Text="" />
                                    </div>
                                </div>
                                <%--(PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl, ImageUrl2, Gallarys, Color, Byable, Details)--%>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Stock" class="col-form-label-sm">انتخاب رنگ</label>
                                        <input name="Stock" type="color" runat="server" class="form-control form-control-user"
                                            id="Color" placeholder="رنگ" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="Stock" class="col-form-label-sm">قابل خرید</label>
                                        <asp:CheckBox runat="server" ID="Byable" Text="" />
                                    </div>
                                </div>

                                <div class="form-group row" style="display:none">
                                    <label for="Gallarys" class="col-form-label-sm">تصاویر گالری</label>
                                    <input name="Gallarys" runat="server" class="form-control form-control-user"
                                        id="Gallarys" placeholder="تصویر گاری" />
                                    <button type="button" style="display: inline-block;" onclick="showimagexplor(1);"><i class="lnr lnr-magnifier"></i></button>
                                    <telerik:RadFileExplorer Style="display: none" runat="server" EnableFilterTextBox="true"
                                        Skin="MetroTouch" FilterTextBoxLabel="فیلتر" Configuration-ViewPaths="~/Shop/ShopImages"
                                        Configuration-AllowMultipleSelection="true" LocalizationPath="~/Shop/ShopImages"
                                        ID="sdsd" ClientIDMode="Static" ExplorerMode="Default">
                                    </telerik:RadFileExplorer>
                                    <div style="display: none" id="selectpic" onclick="collectUrls(1);">انتخاب تصویر</div>
                                </div>

                                <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg1" class="col-form-label-sm">تصویر گالری اول</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg1" placeholder="تصور گالری اول" />
                                 </div> 
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg2" class="col-form-label-sm">تصویر گالری دوم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg2" placeholder="تصور گالری دوم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg3" class="col-form-label-sm">تصویر گالری سوم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg3" placeholder="تصور گالری سوم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg4" class="col-form-label-sm">تصویر گالری چهارم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg4" placeholder="تصور گالری چهارم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg5" class="col-form-label-sm">تصویر گالری پنجم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg5" placeholder="تصور گالری پنجم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg6" class="col-form-label-sm">تصویر گالری ششم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg6" placeholder="تصور گالری ششم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg7" class="col-form-label-sm">تصویر گالری هفتم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg7" placeholder="تصور گالری هفتم" />
                                 </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg8" class="col-form-label-sm">تصویر گالری هشتم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg8" placeholder="تصور گالری هشتم" />
                                 </div><div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg9" class="col-form-label-sm">تصویر گالری نهم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg9" placeholder="تصور گالری نهم" />
                                 </div><div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="ImageUrlg10" class="col-form-label-sm">تصویر گالری دهم</label>
                                        <asp:FileUpload  runat="server" CssClass="form-control form-control-user"
                                            ID="ImageUrlg10" placeholder="تصور گالری دهم" />
                                 </div>
                                    </div>

                                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                                <asp:Literal runat="server" ID="lit"></asp:Literal>
                            </div>
                            <%-- -----%>
                        </div>
                    </div>
                </div>
                <%-- tabs start --%>
                <div class="col-12">
                   <%-- <ul class="nav nav-tabs">
                        <li class="active ml-2"><a data-toggle="tab" href="#HeadBox" id="headboxclick">سر دسته</a></li>
                        <li class="ml-2"><a data-toggle="tab" href="#vizhegi" id="vizheghiclick">ویژگی</a></li>
                        <li class="ml-2"><a data-toggle="tab" href="#ezafekardan" id="ezafekardanclick">اضافه کردن</a></li>

                    </ul>--%>

                    <div class="tab-content">
                        <div id="HeadBox" class=" col-12 mt-3 mb-3">
                             <h6> ویژگی سر دسته را وارد نمایید<small> (به عنوان مثال :رنگ)</small></h6>
                            <div class="row">
                                <div class="col-10 ">
                                
                                <input runat="server" id="PHead"   type="text" class="form-control"  placeholder="سر دسته را وارد نمایید"/>
                            </div>
                            <div class="col-2">
                                <asp:Button Enabled="false" runat="server" ID="PheadSave"  OnClick="PheadSave_Click" class="btn btn-success btn-block"  Text="ثبت"/>
                            </div>
                            </div>
                        </div>
                        <div id="vizhegi" class="col-12 mt-3 mb-3">
                             <h6> ویژگی سر دسته را انتخاب کنید و مقدار این ویژگی را وارد نمایید.<small> (به عنوان مثال : رنگ -> زرد)</small></h6>
                            <div class="row">
                                
                             <div class="col-5">
                               <asp:DropDownList runat="server" ID="PropSelect" AutoPostBack="true" OnSelectedIndexChanged="PropSelect_SelectedIndexChanged" CssClass="form-control">
                                   <asp:ListItem Text="Select" Value="0"></asp:ListItem> 
                               </asp:DropDownList>
                            </div>
                                <div class="col-10">
                                <input runat="server" id="PropertyDsc"  type="text" class="form-control"  placeholder="ویژگی را وارد نمایید"/>
                            </div>
                            <div class="col-2">
                                <asp:Button Enabled="false" runat="server" id="propertysave" OnClick="Propertysave_Click" class="btn btn-success btn-block"  Text="ثبت"/>
                            </div>
                            </div>
                        </div>
                        <div id="ezafekardan" class="col-12 mt-3 mb-3">
                             <h6> مقدار تعریف شده در بالا را از کادر زیر انتخاب کنید و ارزش آن را در صورت متفاوت بودن قیمت آن با قیمت اصلی وارد نمایید در غیر اینصورت صفر وارد نمایید.<small> (به عنوان مثال : زرد -> 50000)</small></h6>
                            <div class="row">
                           <div class="col-5">
                               <asp:DropDownList runat="server" ID="PropSS" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="PropSS_SelectedIndexChanged1">
                                   <asp:ListItem Text="Select" Value="0"></asp:ListItem> 
                               </asp:DropDownList>
                            </div>
                            <div class="col-5">
                               <input runat="server" id="PropValue"  type="text" class="form-control"  placeholder="ارزش"/>
                            </div>
                            <div class="col-2">
                                <asp:Button runat="server" id="PropValSave" OnClick="PropValSave_Click"
                                    class="btn btn-success btn-block"  Text="ثبت"/>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-12">
                    <div class="col-md-6 col-12">
                            <table>
                                <tr>
                                    <td>
                                        <label for="TypeReq" class="col-form-label-sm">نوع درخواست</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="TypeReq" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal" >
                                <asp:ListItem Text="کالا" Value="1" Selected ></asp:ListItem>
                                <asp:ListItem Text="خدمات" Value="2" ></asp:ListItem>
                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        
                       
                        </div>
                     <div class="col-12">
                        <label for="DescAllProduct" class="col-form-label-sm"> *توضیحات کامل تر در مورد محصول را در کادر زیر وارد نمایید</label>
                        <textarea cols="6" id="DescAllProduct" runat="server" class="form-control mb-3" rows="6" placeholder="لطفا توضیحات کامل از جمله اینکه محصول چه کارایی دارد .خصوصیات محصول.ویژگی محصول از جمله رنگ ، سایز، ابعاد و غیره را وارد نمایید."></textarea>
                    </div>
                    <h5>مجوز ها</h5>
                    <div class="row">
                        <div class="col-md-6 col-12">
                            <table>
                                <tr>
                                    <td>
                                        <label for="FoodDrugLicens" class="col-form-label-sm">مجوز غذاو دارو</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="FoodDrugLicens" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal">
                                <asp:ListItem Text="دارد" Value="1"></asp:ListItem>
                                <asp:ListItem Text="ندارد" Value="0" Selected></asp:ListItem>
                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        
                       
                        </div> 
                        <div class="col-md-6 col-12">
                            <table>
                                <tr>
                                    <td>
                                        <label for="BusinessLicens" class="col-form-label-sm">پروانه کسب</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="BusinessLicens" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal">
                                <asp:ListItem Text="دارد" Value="1"></asp:ListItem>
                                <asp:ListItem Text="ندارد" Value="0" Selected></asp:ListItem>
                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        
                       
                        </div>
                        <div class="col-md-6 col-12">
                            <table>
                                <tr>
                                    <td>
                                        <label for="OperationLicens" class="col-form-label-sm">پروانه بهره برداری</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="OperationLicens" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal">
                                <asp:ListItem Text="دارد" Value="1"></asp:ListItem>
                                <asp:ListItem Text="ندارد" Value="0" Selected></asp:ListItem>
                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        
                       
                        </div>
                        <div class="col-md-6 col-12">
                            <table>
                                <tr>
                                    <td>
                                        <label for="PhysicalStore " class="col-form-label-sm">فروشگاه فیزیکی</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="PhysicalStore" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal">
                                <asp:ListItem Text="دارد" Value="1"></asp:ListItem>
                                <asp:ListItem Text="ندارد" Value="0" Selected></asp:ListItem>
                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        
                       
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="DescLicens" class="col-form-label-sm">توضیحات کامل تر درباره مجوزها و گواهینامه های مربوطه را در کادر زیر وارد نمایید</label>
                        <textarea  id="DescLicens" runat="server" class="form-control mb-3" rows="6"></textarea>
                    </div> 
                    <div class="col-12">
                        <label for="Address" class="col-form-label-sm"> آدرس( کارخانه، کارگاه، فروشگاه، دفتر یا منزل)</label>
                        <asp:DropDownList AutoPostBack="true"  CssClass="form-control" ID="DropState" runat="server" OnSelectedIndexChanged="DropState_SelectedIndexChanged" >
                  
                        </asp:DropDownList>
                        <asp:DropDownList AutoPostBack="false"  CssClass="form-control mt-3 mb-3" ID="DropCity" runat="server" style="">
                  
                        </asp:DropDownList>
                        <textarea  id="Address" runat="server" class="form-control mb-3" rows="6" placeholder="آدرس را به صورت کامل وارد نمایید"></textarea>
                    </div>
                    <div class="col-12">
                        <label for="condation" class="col-form-label-sm"> قوانین و مقررات</label>
                        <textarea   id="condation" class="form-control mb-3" rows="6" >مقدمه 
1.	طرف اول : شرکت پدیدآوران فکر و ثروت اسپادان
2.	طرف دوم : دارنده فروشگاه زنجیره ای به آدرس فوق

در صورت تایید اولیه محصول طرف اول قبل از بارگذاری در دامنه خود باید نمونه محصول خود را به آدرس شرکت ارسال نمایند تا به عنوان نمونه قابل استفاده در دفتر شرکت قرار گیرد.
محصول ارسال شده توسط طرف دوم از لحاظ کیفیتی باید با نمونه موجود در دفتر شرکت مطابقت داشته باشد در صورت عدم کیفیت طرف دوم موظف است هزینه ارسال و برگشت کالا را متقبل شود و برای طرف دوم نمره منفی در نظر گرفته می شود که در صورت گرفتن حد نصاب نمرات منفی از طرف اول ، طرف دوم دیگر قادر به قرار دادن محصول بر روی سایت خود نمی باشد .
پس از خرید کاربر در سایت از زمان پرداخت هفت روز کاری وجه در حساب طرف اول قرار می گیرد زیرا محصولات بر اساس قوانین سایت هفت روز کاری تضمین مرجوعی کالا را دارا می باشند و پس از هفت روز کاری در صورت تایید دریافت مشتری و رضایت از کیفیت وجه به شماره حساب اعلام شده توسط طرف دوم واریز خواهد شد .
نکته: پس از هر بار ویرایش ، محصول از حالت فعال خارج می شود و در دست بررسی مجدد قرار می گیرد و بعد از بررسی دوباره فعال خواهد شد.
                        </textarea>
                    </div>
                    <div class="form-group row">
                <asp:CheckBox Font-Size="Medium" TextAlign="Right" ID="gconfirm"  runat="server" class="mr-5"
                     Text="قوانین  را خوانده و مورد قبول اینجانب میباشد" />
              </div>
                </div>

                <%-- tabs end --%>
             <script>
                     setTimeout(function(){
                    $("#headboxclick").click();
                    },2000);
                    
                    $("#headboxclick").click(function(){
                       $("#vizheghi").hide();
                         $("#ezafekardan").hide();
                         $("#HeadBox").show();

                     });
                        $("#vizheghiclick").click(function(){
                       $("#vizheghi").show();
                         $("#ezafekardan").hide();
                         $("#HeadBox").hide();

                     });
                        $("#ezafekardanclick").click(function(){
                       $("#vizheghi").hide();
                         $("#ezafekardan").show();
                         $("#HeadBox").hide();

                        });
                 $("#CCPH_gconfirm").change(function () {
                     if ($(this).is(':checked')) {
                         $("#CCPH_saveitems").prop("disabled", false);
                         $("#CCPH_saveitems").show();
                     } else {
                         $("#CCPH_saveitems").prop("disabled", true);
                         $("#CCPH_saveitems").hide();
                     }
                 });
                 setTimeout(function () {
                     $("#CCPH_gconfirm").change();
                 }, 1000);
                
                 
                    

             </script>
                <div>
                  <%--  <telerik:RadEditor ImageManager-UploadPaths="~/Shop/ShopImages"
                        ImageManager-DeletePaths="~/Shop/ShopImages"
                        ImageManager-ViewPaths="~/Shop/ShopImages"
                        MediaManager-ViewPaths="~/Shop/ShopImages" ID="P_Content"
                        MediaManager-SearchPatterns="*.mp4, *.mp3"
                        MediaManager-DeletePaths="~/Shop/ShopImages"
                        MediaManager-UploadPaths="~/Shop/ShopImages" MediaManager-MaxUploadFileSize="150000000"
                        ImageManager-MaxUploadFileSize="150000000"
                        Width="100%" runat="server">
                    </telerik:RadEditor>--%>
                    <asp:Button runat="server" OnClick="saveitems_Click" ID="saveitems"
                        class="btn btn-primary btn-user btn-block" Text="ذخیره" disable Style="display:none"/>
                </div>
            </div>

</asp:Content>

   
