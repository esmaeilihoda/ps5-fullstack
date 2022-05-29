<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="ShowOrderItem.aspx.cs" Inherits="Shop.Shop.ShowOrderItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">
    <!-- scripts start-->

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
                                <% if (OID != null)
                                    {
                                        for (int i = 0; i < dtsh.Rows.Count; i++)
                                        { %>
                                <div class="col-12 checkoutrightpanel">
                                    <div class="row">
                                        <div class="col-4 col-md-2">
                                            <img src="<%  Response.Write(dtsh.Rows[i]["imageurl"].ToString()); %>" class="factor-img-mahsol img-fluid" />

                                        </div>
                                        <div class="col-8 col-md-10 ">
                                            <h6><%  Response.Write(dtsh.Rows[i]["PName"].ToString()); %></h6>
                                            <p class="mt-2">تعداد:  <%  Response.Write(dtsh.Rows[i]["CNT"].ToString()); %>  </p>
                                            <P style="white-space:pre"><%  Response.Write(dtsh.Rows[i]["Property"].ToString()); %></P>
                                            <h5 class="mt-5 text-left">تومان <%  Response.Write(dtsh.Rows[i]["NPrice"].ToString()); %></h5>
                                        </div>
                                    </div>
                                </div>
                                <% }
                                    }%>
                            </div>

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
                                        <input runat="server" id="name" type="text" placeholder="" class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>نام خانوادگی <span class="required">*</span></label>
                                        <input runat="server" id="Family" type="text" placeholder="" class="form-control" disabled="disabled" />
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
                                        <input runat="server" id="Address" type="text" placeholder="آدرس " class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div style="display: none" class="col-md-12">
                                    <div class="checkout-form-list mtb-30">
                                        <input type="text" placeholder="ایران ، تهران" class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>استان <span class="required">*</span></label>
                                        <select runat="server" id="state" class="form-control" disabled="disabled">
                                            <option>sdf</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>شهرستان <span class="required">*</span></label>
                                        <input runat="server" id="City" type="text" placeholder="" class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>کدپستی <span class="required">*</span></label>
                                        <input runat="server" id="PostalCode" type="text" placeholder="کدپستی" class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>ایمیل <span class="required">*</span></label>
                                        <input runat="server" id="Email" type="email" placeholder="" class="form-control" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>تلفن  <span class="required">*</span></label>
                                        <input runat="server" id="Mobile" type="text" placeholder="تلفن" class="form-control" disabled="disabled" />
                                    </div>
                                </div>

                            </div>
                            <div style="display: none" class="different-address">
                                <div class="ship-different-title">
                                    <h3>
                                        <label>آدرس مختلف</label>
                                        <input id="ship-box" type="checkbox" class="form-control" disabled="disabled" />
                                    </h3>
                                </div>
                                <div id="ship-box-info">
                                    <div class="row">
                                        <div style="display: none" class="col-md-12" disabled="disabled">
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
                                                <input type="text" placeholder="" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-sm-30">
                                                <label>نام خانوادگی <span class="required">*</span></label>
                                                <input type="text" placeholder="" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div style="display: none" class="col-md-12">
                                            <div class="checkout-form-list mb-30">
                                                <label>نام شرکت</label>
                                                <input type="text" placeholder="" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>آدرس کامل <span class="required">*</span></label>
                                                <input type="text" placeholder="آدرس " class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list mtb-30">
                                                <input type="text" placeholder="ایران ، تهران" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list mb-30">
                                                <label>شهر <span class="required">*</span></label>
                                                <input type="text" placeholder="شهر" class="form-control" readonly="readonly" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>شهرستان <span class="required">*</span></label>
                                                <input type="text" placeholder="" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>کدپستی <span class="required">*</span></label>
                                                <input type="text" placeholder="کدپستی" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>ایمیل <span class="required">*</span></label>
                                                <input type="email" placeholder="" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list mb-30">
                                                <label>تلفن  <span class="required">*</span></label>
                                                <input type="text" placeholder="تلفن" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-notes">
                                    <div class="checkout-form-list">
                                        <label>سفارشات یادداشت</label>
                                        <textarea class="form-control" id="checkout-mess" cols="30" rows="10" placeholder="سفارشات یادداشت خود را وارد نماید" disabled="disabled"></textarea>
                                    </div>
                                </div>

                                <input type="submit" class="information-register form-control" value="ثبت اطلاعات" disabled="disabled">
                            </div>
                        </div>
                    </div>
                    <!--form address end -->
                </div>
                <!-- right panel end-->
                <!-- left panel start-->
                <div class="col-md-3 col-sm-12 p-0">

                    <div class="payment-method " id="paymentmethod" runat="server">
                        <div class="checkoutleftpanel">

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
                            <a href="/Shop/factors.aspx" class="btn btn-secondary btn-block">بازگشت به صفحه فاکتورها</a>
                        </div>
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
