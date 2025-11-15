<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="NM.Shop.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">
     <script type="text/javascript">
        function Set_Get_BI_SC00_cart(r) {

            NM.Shop.Admin.ShopAdmin.Set_Get_BI("get", "bascket", 0, Set_Get_BI_SC01_cart, WAError);            
        };
        function deletfromcart_cart(id) {
            NM.Shop.Admin.ShopAdmin.Set_Get_BI("delete", "bascket", id, Set_Get_BI_SC00_cart, WAError);
        }
        function Set_Get_BI_SC01_cart(r) {
            Set_Get_BI_SC00("");
            var rty = r;
            var sumtp = 0;           
            var htll = "";
            fin("sabadcount").innerHTML = rty.length;
            for (var i = 0; i < rty.length; i++) {

                htll += '<tr class="cart_item">'+
                        '<td class="product-name">'+
                        '' + javalist(rty[i], "PName") + ' <span class="product-quantity"> × ' + javalist(rty[i], "CNT") + '</span>' +
                        '</td>'+
                        '<td class="product-total">'+
                        '<span class="amount">' + javalist(rty[i], "NPrice") + ' تومان</span>' +
                        '</td>'+
                        '</tr>';
                sumtp += parseInt(javalist(rty[i], "NPrice"));
            }            
            
            var footer = '<tr class="cart-subtotal">'+
                         '<th>جمع سبد خرید</th>'+
                         '<td><span class="amount">' + sumtp + ' تومان</span></td>' +
                         '</tr>'+
                         '<tr class="order-total">'+
                         '<th>سفارش</th>'+
                         '<td><span class=" total amount">' + sumtp + ' تومان</span>' +
                         '</td>'+
                         '</tr>';
            fin("checkouttbb").innerHTML = "";
            fin("checkouttbb").innerHTML = htll;
            fin("chekouttfoot").innerHTML = "";
            fin("chekouttfoot").innerHTML = footer;
            
        };        
    </script>       
    <!-- coupon-area start -->
        <div class="coupon-area pt-100 pt-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="coupon-accordion">
                            <!-- ACCORDION START -->
                            <h3 runat="server" id="com2login">بازگشت به مشتریان؟ <span id="showlogin">اینجا را کلیک کنید برای ورود به سایت</span></h3>
                            <div id="checkout-login" class="coupon-content">
                                <div class="coupon-info">
                                    <p class="coupon-text">وارد شوید یا یک  ثبت نام کنید!</p>
                                    <form action="#">
                                        <p class="form-row-first">
                                            <label>نام کاربری یا ایمیل <span class="required">*</span></label>
                                            <input type="text" />
                                        </p>
                                        <p class="form-row-last">
                                            <label>رمز عبور  <span class="required">*</span></label>
                                            <input type="text" />
                                        </p>
                                        <p class="form-row">
                                            <input type="submit" value="ورود" />
                                            <label>
											<input type="checkbox" />
											 مرا به خاطر بسپار
										</label>
                                        </p>
                                        <p class="lost-password">
                                            <a href="#">رمز خود را فراموش کرده اید؟</a>
                                        </p>
                                    </form>
                                </div>
                            </div>
                            <!-- ACCORDION END -->
                            <!-- ACCORDION START -->
                            <h3>دارای کد تخفیف هستید؟ <span id="showcoupon">اینجا را کلیک کنید تا کد خود را وارد کنید</span></h3>
                            <div id="checkout_coupon" class="coupon-checkout-content">
                                <div class="coupon-info">
                                    <form action="#">
                                        <p class="checkout-coupon">
                                            <input type="text" class="code" placeholder=" کد تخفیف خود را وارد کنید" />
                                            <input type="submit" value="اعمال تخفیف" />
                                        </p>
                                    </form>
                                </div>
                            </div>
                            <!-- ACCORDION END -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- coupon-area end -->
        <!-- checkout-area start -->
        <div class="checkout-area pb-100 pt-15 pb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="checkbox-form mb-sm-40">
                            <h3>اطلاعات قبض</h3>
                            <div class="row">
                                <div class="col-md-12">
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
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-sm-30">
                                        <label>نام <span class="required">*</span></label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>نام خانوادگی <span class="required">*</span></label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>نام شرکت</label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>آدرس <span class="required">*</span></label>
                                        <input type="text" placeholder="آدرس " />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mtb-30">
                                        <input type="text" placeholder="ایران ، تهران" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>شهر <span class="required">*</span></label>
                                        <input type="text" placeholder="شهر" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>شهرستان <span class="required">*</span></label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>کدپستی <span class="required">*</span></label>
                                        <input type="text" placeholder="کدپستی" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>ایمیل <span class="required">*</span></label>
                                        <input type="email" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>تلفن  <span class="required">*</span></label>
                                        <input type="text" placeholder="تلفن" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list create-acc mb-30">
                                        <input id="cbox" type="checkbox" />
                                        <label>ایجاد حساب کاربری؟</label>
                                    </div>
                                    <div id="cbox_info" class="checkout-form-list create-accounts mb-25">
                                        <p class="mb-10">برای ساختن حساب کاربری نیاز به وارد کردن پسورد دارید!</p>
                                        <label>رمز عبور حساب کاربری  <span class="required">*</span></label>
                                        <input type="password" placeholder="password" />
                                    </div>
                                </div>
                            </div>
                            <div class="different-address">
                                <div class="ship-different-title">
                                    <h3>
                                        <label>آدرس مختلف</label>
                                        <input id="ship-box" type="checkbox" />
                                    </h3>
                                </div>
                                <div id="ship-box-info">
                                    <div class="row">
                                        <div class="col-md-12">
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
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>نام <span class="required">*</span></label>
                                                <input type="text" placeholder="" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                    <div class="checkout-form-list mb-sm-30">
                                        <label>نام خانوادگی <span class="required">*</span></label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>نام شرکت</label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>آدرس <span class="required">*</span></label>
                                        <input type="text" placeholder="آدرس " />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mtb-30">
                                        <input type="text" placeholder="ایران ، تهران" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>شهر <span class="required">*</span></label>
                                        <input type="text" placeholder="شهر" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>شهرستان <span class="required">*</span></label>
                                        <input type="text" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>کدپستی <span class="required">*</span></label>
                                        <input type="text" placeholder="کدپستی" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>ایمیل <span class="required">*</span></label>
                                        <input type="email" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>تلفن  <span class="required">*</span></label>
                                        <input type="text" placeholder="تلفن" />
                                    </div>
                                </div>
                                    </div>
                                </div>
                                <div class="order-notes">
                                    <div class="checkout-form-list">
                                        <label>سفارشات یادداشت</label>
                                        <textarea id="checkout-mess" cols="30" rows="10" placeholder="سفارشات یادداشت خود را وارد نماید"></textarea>
                                    </div>
                                </div>
                                
                                <input type="submit" class="information-register" value="ثبت اطلاعات">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="your-order">
                            <h3>سفارش خود </h3>
                            <div class="your-order-table table-responsive">
                                <table>
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
                                </table>
                            </div>
                            <div class="payment-method">
                                <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" id="headingone">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                  انتقال به درگاه بانکی
                                                </button>
                                            </h5>
                                        </div>

                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingone" data-parent="#accordion">
                                            <div class="card-body">
                                                <p><del class="prev">پرداخت از طریق تمامی کارت های عضو شتاب</del></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display:none" class="card">
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
                                    <div style="display:none;" class="card">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- checkout-area end -->
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
