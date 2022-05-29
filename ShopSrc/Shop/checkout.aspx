<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Shop.Shop.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">
    <!-- scripts start-->
    <script type="text/javascript">
        function deletfromcartItem(id) {
            Shop.Shop.Admin.ShopAdmin.Set_Get_BI("delete", "bascket-item", id, Set_Get_BI_SC00_cart, WAError);
        }
        function AddfromcartItem(id) {
            Shop.Shop.Admin.ShopAdmin.Set_Get_BI("Add", "bascket-item", id, Set_Get_BI_SC00_cart, WAError);
        }
        function Set_Get_BI_SC00_cart(r) {

            Shop.Shop.Admin.ShopAdmin.Set_Get_BI("get", "bascket", 0, Set_Get_BI_SC01_cart, WAError);
        };
        function deletfromcart_cart(id) {
            Shop.Shop.Admin.ShopAdmin.Set_Get_BI("delete", "bascket", id, Set_Get_BI_SC00_cart, WAError);
        }
        function Set_Get_BI_SC01_cart(r) {
            Set_Get_BI_SC00("");
            var rty = r;

            var sumtp = 0;
            var htll = "";
            var dvfac = "";
            fin("sabadcount").innerHTML = rty.length;
            for (var i = 0; i < rty.length; i++) {

                htll += '<tr class="cart_item">' +
                    '<td class="product-name">' +
                    '' + javalist(rty[i], "PName") + ' <span class="product-quantity"> × ' + javalist(rty[i], "CNT") + '</span>' +
                    '</td>' +
                    '<td class="product-total">' +
                    '<span class="amount">' + javalist(rty[i], "NPrice") + ' تومان</span>' +
                    '</td>' +
                    '</tr>';

                dvfac += ' <div class="col-12 checkoutrightpanel">' +
                    '<div class="row"><div class="col-4 col-md-2"><a target="_blank" href="product.aspx?PID=' + javalist(rty[i], "PId")+'"><img src="' + javalist(rty[i], "imageurl") + '" class="factor-img-mahsol img-fluid" /></a></div>' +
                    ' <div class="col-8 col-md-10 "><h6>' + javalist(rty[i], "PName") + '</h6>' +
                    //'<p class="mt-2"> تعداد:' + javalist(rty[i], "CNT") + '</p>' +
                    '<p style="white-space: pre;">' + javalist(rty[i], "Property") +'</p>'
                    +
                    '<div class="row mt-5"><div class="col-2"><div class="c-quantity-selector" style="float:right">'+
                    '<a class="Add-checkout-cart" href="javascript:AddfromcartItem(' + javalist(rty[i], "ID") + ')"><button type="button" class="fa fa-plus Add-checkout-cart " ></button></a>'+
                    ' <div class="c-quantity-selector__number js-quantity-selector-count" data-max="5" data-id="11677406" data-gtm-vis-first-on-screen-9070001_346="3924" data-gtm-vis-total-visible-time-9070001_346="100" data-gtm-vis-has-fired-9070001_346="1">' + javalist(rty[i], "CNT")+
                            
                        ' </div>'+
                    '<a class="Minus-checkout-cart" href="javascript:deletfromcartItem(' + javalist(rty[i], "ID") + ')"><button type="button" class="fa fa-minus Minus-checkout-cart"></button></a>'+
                      '</div></div ><div class="col-10 text-left">'
                    +
                    '<h5  > ' + javalist(rty[i], "NPrice") + ' تومان</h5></div>' +
                    '</div ></div > ' +
                    '</div >' +
                    '</div >';

                sumtp += parseInt(javalist(rty[i], "NPrice"));
            }

            var footer = '<tr class="cart-subtotal">' +
                '<th>جمع سبد خرید</th>' +
                '<td><span class="amount">' + sumtp + ' تومان</span></td>' +
                '</tr>' +
                '<tr class="order-total">' +
                '<th>سفارش</th>' +
                '<td><span class="total amount">' + sumtp + ' تومان</span>' +
                '</td>' +
                '</tr>';
            // fin("checkouttbb").innerHTML = "";
            //  fin("checkouttbb").innerHTML = htll;
            // fin("chekouttfoot").innerHTML = "";
            // fin("chekouttfoot").innerHTML = footer;
            fin("dvfac").innerHTML = dvfac;
            $(".totalsum").text(parseInt(sumtp + ((sumtp * 9) / 100)) + " تومان");
            $(".sumPrice").text(sumtp + " تومان");
            $(".maliat").text(parseInt((sumtp * 9) / 100) + " تومان");

        };
        function chekout() {
            Shop.Shop.Admin.ShopAdmin.CheckOut(chres, WAError);
        }
        function chres(r) {
            if (r[0] == "ok")
                window.open(r[1]);
            else
                alert(r[1]);
        }

        
        $(document).ready(function () {

            //fin("befSlideBox_BtnSubmitdiscount").click();
        });
    </script>
    <!-- scripts end-->

    <div id="containercheckout" runat="server" class="col-12">
        <!-- checkout-area start -->
       


                <div class="container-fluid">
                    <div class="row text-right">
                        <!-- right panel start-->
                        <div class="col-md-9 col-sm-12">
                            <!-- factor mahsolat start-->
                            <div class="col-12 justufy-content-center m-auto">
                                <div class="col-12">
                                    <h5 class="TitlesabadKharid">سبد خرید </h5>
                                   
                                    <div class="your-order-table table-responsive" id="dvfac" style="overflow: hidden;">
                                        <%--<table>
                                    <thead>
                                        <tr>
                                            <th class="product-name">محصولات </th>
                                            <th class="product-total">مجموع</th>
                                        </tr>
                                    </thead>
                                    <tbody id="checkouttbb">
                                    </tbody>
                                    <tfoot id="chekouttfoot">
                                    </tfoot>
                                </table>--%>
                                        
                                    </div>
                                    <!-- coupon-area start code takhfif -->
                                    
        <asp:UpdatePanel runat="server" ID="Checkout_UP" EnableViewState="true">
            <ContentTemplate>
                                    <div class="col-md-12" id="codeTakhfif" runat="server">
                                        <div class="coupon-accordion">

                                            <!-- ACCORDION START -->
                                            <h3> <span id="showcoupon">دارای کد تخفیف هستید؟</span></h3>
                                            <div id="checkout_coupon" class="coupon-checkout-content">
                                                <div class="coupon-info">
                                                    <p class="checkout-coupon">
                                                        <input runat="server" type="text" id="Inputdiscount" placeholder=" کد تخفیف خود را وارد کنید" class="form-control" />
                                                        <div class="text-left mt-2">
                                                            <input type="button" class="btn btn-success" runat="server" id="Btndiscount" value="اعمال تخفیف" />


                                                        </div>

                                                    </p>

                                                </div>
                                            </div>
                                            <!-- ACCORDION END -->
                                        </div>
                                    </div>
                   </ContentTemplate>
        </asp:UpdatePanel>

                                    <!-- coupon-area end -->


                                </div>
                            </div>
                            <!--factor mahsolat end -->
                            <!-- form Address start-->
                            <div class="col-12 justufy-content-center m-auto" id="FormAddress" runat="server">
                                <div class="checkoutrightpanel mt-3">
                                    <h6>آدرس ارسال مرسوله</h6>
                                    <div class="row">
                                        <%--                              <div style="display:none" class="col-md-12">
                                    <div class="country-select clearfix mb-30">
                                        <label>کشور <span class="required">*</span></label>
                                        <select class="wide">
                                            <option value="volvo">ایران</option>
                                            <option value="saab">انگلیس</option>
                                            <option value="mercedes">فرانسه</option>
                                            <option value="audi">چین</option>
                                            <option value="audi2">ژاپن</option>
                                            <option value="audi3">بحرین</option>
                                            <option value="audi4">آمریکا</option>
                                            <option value="audi5">ایتالیا</option>
                                        </select>
                                    </div>
                                </div>--%>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-sm-30">
                                                <label>نام <span class="required">*</span></label>
                                                <input runat="server" id="name" type="text" placeholder="" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>نام خانوادگی <span class="required">*</span></label>
                                                <input runat="server" id="Family" type="text" placeholder="" class="form-control" />
                                            </div>
                                        </div>
                                        <div style="display: none" class="col-md-12">
                                            <div class="checkout-form-list mb-30">
                                                <label>نام شرکت</label>
                                                <input type="text" placeholder="" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>آدرس <span class="required">*</span></label>
                                                <input runat="server" id="Address" type="text" placeholder="آدرس " class="form-control" />
                                            </div>
                                        </div>
                                        <div style="display: none" class="col-md-12">
                                            <div class="checkout-form-list mtb-30">
                                                <input type="text" placeholder="ایران ، تهران" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list mb-30">
                                                <label>استان <span class="required">*</span></label>
                                                <select runat="server" id="state" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>شهرستان <span class="required">*</span></label>
                                                <input runat="server" id="City" type="text" placeholder="" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>کدپستی <span class="required">*</span></label>
                                                <input runat="server" id="PostalCode" type="text" placeholder="کدپستی" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>ایمیل <span class="required">*</span></label>
                                                <input runat="server" id="Email" type="email" placeholder="" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>تلفن  <span class="required">*</span></label>
                                                <input runat="server" id="Mobile" type="text" placeholder="تلفن" class="form-control" />
                                            </div>
                                        </div>
                                        <div style="display: none" class="col-md-12">
                                            <div class="checkout-form-list create-acc mb-30">
                                                <input id="cbox" type="checkbox" class="form-control" />
                                                <label>ایجاد حساب کاربری؟</label>
                                            </div>
                                            <div id="cbox_info" class="checkout-form-list create-accounts mb-25">
                                                <p class="mb-10">برای ساختن حساب کاربری نیاز به وارد کردن پسورد دارید!</p>
                                                <label>رمز عبور حساب کاربری<span class="required">*</span></label>
                                                <input type="password" placeholder="password" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: none" class="different-address">
                                        <div class="ship-different-title">
                                            <h3>
                                                <label>آدرس مختلف</label>
                                                <input id="ship-box" type="checkbox" class="form-control" />
                                            </h3>
                                        </div>
                                        <div id="ship-box-info">
                                            <div class="row">
                                                <div style="display: none" class="col-md-12">
                                                    <%--                             <div class="country-select clearfix mb-30">
                                                <label>کشور <span class="required">*</span></label>
                                        <select class="wide">
                                            <option value="volvo">ایران</option>
                                            <option value="saab">انگلیس</option>
                                            <option value="mercedes">فرانسه</option>
                                            <option value="audi">چین</option>
                                            <option value="audi2">ژاپن</option>
                                            <option value="audi3">بحرین</option>
                                            <option value="audi4">آمریکا</option>
                                            <option value="audi5">ایتالیا</option>
                                        </select>
                                            </div>--%>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>نام <span class="required">*</span></label>
                                                        <input type="text" placeholder="" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-sm-30">
                                                        <label>نام خانوادگی <span class="required">*</span></label>
                                                        <input type="text" placeholder="" class="form-control" />
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-md-12">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>نام شرکت</label>
                                                        <input type="text" placeholder="" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>آدرس کامل <span class="required">*</span></label>
                                                        <input type="text" placeholder="آدرس " class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list mtb-30">
                                                        <input type="text" placeholder="ایران ، تهران" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>شهر <span class="required">*</span></label>
                                                        <input type="text" placeholder="شهر" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>شهرستان <span class="required">*</span></label>
                                                        <input type="text" placeholder="" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>کدپستی <span class="required">*</span></label>
                                                        <input type="text" placeholder="کدپستی" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>ایمیل <span class="required">*</span></label>
                                                        <input type="email" placeholder="" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-form-list mb-30">
                                                        <label>تلفن  <span class="required">*</span></label>
                                                        <input type="text" placeholder="تلفن" class="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-notes">
                                            <div class="checkout-form-list">
                                                <label>سفارشات یادداشت</label>
                                                <textarea class="form-control" id="checkout-mess" cols="30" rows="10" placeholder="سفارشات یادداشت خود را وارد نماید"></textarea>
                                            </div>
                                        </div>

                                        <input type="submit" class="information-register form-control" value="ثبت اطلاعات">
                                    </div>
                                </div>
                            </div>
                            <!--form address end -->
                        </div>
                        <!-- right panel end-->
                        <!-- left panel start-->
                        <div class="col-md-3 col-sm-12 p-0">
                            <!-- account START -->
                            <div runat="server" id="com2login" class="col-12 p-0 justify-content-center text-center">
                                <div class="col-12 m-0 pt-2 pb-2 checkoutleftpanel">
                                    <table class="table">
                                        <tr>
                                            <th class="text-right ">جمع کل</th>
                                            <td class="text-left sumPrice"></td>
                                        </tr>
                                        <tr>
                                            <th class="text-right ">مالیات</th>
                                            <td class="text-left maliat">0</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right ">کوپن تخفیف</th>
                                            <td class="text-left copen text-danger">0</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right ">مبلغ قابل پرداخت</th>
                                            <td class="text-left totalsum"></td>
                                        </tr>
                                    </table>
                                    <a class="btn btn-lg  btn-danger btn-block" href="../Account/Login.aspx?ComeBack=~/Shop/checkout.aspx" >ادامه فرآیند خرید</a>
                                    <a class="btn btn-lg btn-success btn-block" href="../Account/Register.aspx?ComeBack=~/Shop/checkout.aspx" >ثبت نام</a>
                                    <a href="/Shop/checkout.aspx" class="btn btn-secondary btn-block">بروزرسانی سبد خرید</a>
                                </div>
                            </div>
                            <!-- account End -->
                            <div class="payment-method " id="paymentmethod" runat="server">
                                <div class="checkoutleftpanel">
                                    <%--<p><span class="text-dark">پرداخت از طریق تمامی کارت های عضو شتاب</span></p>--%>
                                    <div style="display: none" onclick="chekout();" class="btn-info">پرداخت</div>
                                    <table class="table">
                                        <tr>
                                            <th class="text-right">جمع</th>
                                            <td class="text-left sumPrice"></td>
                                        </tr>
                                        <tr>
                                            <th class="text-right ">مالیات</th>
                                            <td class="text-left maliat">0</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right ">کوپن تخفیف</th>
                                            <td class="text-left copen text-danger">0</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">مبلغ قابل پرداخت</th>
                                            <td class="text-left totalsum"></td>
                                        </tr>
                                    </table>
                                    <asp:Button runat="server" Text="ایجاد صورتحساب" OnClick="CheckOut_Click" CssClass="btn btn-lg btn-danger btn-block" />
                                    <a href="/Shop/checkout.aspx" class="btn btn-secondary btn-block">بروزرسانی سبد خرید</a>
                                </div>
                                <!-- bedone estefadeh start -->
                                <div style="display: none" class="card">
                                    <div class="card-header" id="headingtwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                چک پرداخت
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingtwo" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.</p>
                                        </div>
                                    </div>
                                </div>
                                <div style="display: none;" class="card">
                                    <div class="card-header" id="headingthree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                حساب پی پال
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingthree" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- bedone estefadeh end -->
                            </div>
                        </div>

                    </div>
                    <!-- left panel end-->


                </div>

                </div>
    <!-- checkout-area end -->
         
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AftSlideBox" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BefDiscBoxPr" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AftDiscBox" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BefNewestBox" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="AftNewestBox" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="BefBotomBanerBox" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AftBotomBanerBox" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="BeffooterBox" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="Aftfooterbox" runat="server">
    <script type="text/javascript">
        Set_Get_BI_SC00_cart("");
    </script>
</asp:Content>
