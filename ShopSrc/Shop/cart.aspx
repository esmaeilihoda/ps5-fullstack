<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Shop.Shop.cart" %>
<asp:Content ID="Cart" ContentPlaceHolderID="befSlideBox" runat="server">
            <!-- Cart Main Area Start -->
    <script type="text/javascript">
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
            fin("sabadcount").innerHTML = rty.length;
            for (var i = 0; i < rty.length; i++) {
                var pprt = parseInt(javalist(rty[i], "NPrice")) / parseInt(javalist(rty[i], "CNT"));
                htll += '<tr> ' +
                        '<td class="product-thumbnail"> ' +
                         '<a href="#"><img src="' + javalist(rty[i], "imageurl") + '" alt="cart-image" /></a>' +
                        '</td>' +
                        '<td class="product-name"><a href="#">' + javalist(rty[i], "PName") + '</a></td>' +
                        '<td class="product-price"><span class="amount">' + pprt + ' تومان</span></td>' +
                        '<td class="product-quantity"><input readonly="readonly" type="number" value="' + javalist(rty[i], "CNT") + '" /></td>' +
                        '<td class="product-subtotal">' + javalist(rty[i], "NPrice") + ' تومان</td>' +
                        '<td class="product-remove"> <a href="javascript:deletfromcart_cart(' + javalist(rty[i], "PId") + ') "><i class="fa fa-times" aria-hidden="true"></i></a></td>' +
                       '</tr>';
                sumtp += parseInt(javalist(rty[i], "NPrice"));
            }            
            var footer = '<tr class="cart-subtotal">'+
                         '<th>جمع :</th>'+
                          '<td><span class="amount">' + sumtp + ' تومان</span></td>' +
                         '</tr>'+
                         '<tr class="order-total">'+
                         '<th>مجموع :</th>'+
                         '<td>'+
                         '<strong><span class="amount">' + sumtp + ' تومان</span></strong>' +
                         '</td>'+
                         '</tr>';
            fin("carttbody").innerHTML = "";
            fin("carttbody").innerHTML = htll;
            fin("carttfooterbody").innerHTML = "";
            fin("carttfooterbody").innerHTML = footer;
            
        };        
    </script>
        <div class="cart-main-area ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <!-- Form Start -->
                        <form action="#">
                            <!-- Table Content Start -->
                            <div class="table-content table-responsive mb-45">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">تصویر</th>
                                            <th class="product-name">محصولات</th>
                                            <th class="product-price">قیمت</th>
                                            <th class="product-quantity">مقدار</th>
                                            <th class="product-subtotal">مجموع</th>
                                            <th class="product-remove">حذف</th>
                                        </tr>
                                    </thead>
                                    <tbody id="carttbody">
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- Table Content Start -->
                            <div class="row">
                               <!-- Cart Button Start -->
                                <div class="col-md-8 col-sm-12">
                                    <div class="buttons-cart">
                                        <input style="display:none" type="submit" value="به روز رسانی سبد خرید" />
                                        <a href="#">ادامه خرید</a>
                                    </div>
                                </div>
                                <!-- Cart Button Start -->
                                <!-- Cart Totals Start -->
                                <div class="col-md-4 col-sm-12">
                                    <div class="cart_totals float-md-left text-md-left">
                                        <h2>مجموع سبد خرید</h2>
                                        <br />
                                        <table class="float-md-left">
                                            <tbody id="carttfooterbody">                                                
                                            </tbody>
                                        </table>
                                        <div class="wc-proceed-to-checkout">
                                            <a href="checkout.aspx">پرداخت نهایی</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Cart Totals End -->
                            </div>
                            <!-- Row End -->
                        </form>
                        <!-- Form End -->
                    </div>
                </div>
                 <!-- Row End -->
            </div>
        </div>
        <!-- Cart Main Area End -->    
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
