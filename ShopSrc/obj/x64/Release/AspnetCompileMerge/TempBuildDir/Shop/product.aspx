<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="NM.Shop.product" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">       
    <asp:UpdatePanel runat="server" ID="UPMC"></asp:UpdatePanel>
    <ContentTemplate>
                   <!-- Product Thumbnail Start -->
     <% NM.Shop.ShopMain SSM = new NM.Shop.ShopMain();
         string pid = "";
         if (Request.QueryString["PID"] != null)
             pid = Request.QueryString["PID"];
         System.Data.DataView DV = SSM.GetPrDetails(pid);
         if (DV.Count > 0)
         {
             System.Data.DataRowView SDDR = DV[0];
             string[] gpics = SDDR["Gallarys"].ToString().Split("©".ToCharArray());
                             %>
    
        <div class="main-product-thumbnail ptb-100 ptb-sm-60">
            <div class="container">
                <div class="thumb-bg">
                    <div class="row">
                        <!-- Main Thumbnail Image Start -->
                        <div class="col-lg-5 mb-all-40">
                            <!-- Thumbnail Large Image start -->
                            <div class="tab-content" style="border-bottom:1px solid #ded3d3">
                             
                                <div id="thumb0" class="tab-pane fade show active">
                                   <%-- <a data-fancybox="images" href="<%=SDDR["ImageUrl"].ToString() %>"><img src="<%=SDDR["ImageUrl"].ToString() %>" alt="product-view"></a>--%>
                                    <a class="fancybox"   href="<%=SDDR["ImageUrl"].ToString() %>"><img src="<%=SDDR["ImageUrl"].ToString() %>" alt="product-view"></a>
                                </div>
                                                                 
                            </div>
                            <!-- Thumbnail Large Image End -->
                            <!-- Thumbnail Image End -->
                            <div class="product-thumbnail mt-15">
                                <div class="thumb-menu owl-carousel nav tabs-area" role="tablist">
                                     
                                    <a class="fancybox" data-fancybox-group="gallery" href="<%=SDDR["ImageUrl"].ToString() %>"><img src="<%=SDDR["ImageUrl"].ToString() %>" alt="product-thumbnail"  style="    display: block;
    width: 135px;
    margin: auto;
    border-radius: 5px;
    object-fit: contain;
    height: 150px;"></a>
                                    <%int cd0 = 1; foreach (string gpi in gpics)
                                        { if (gpi != "")
                                            { %>
                                    <a class="fancybox"  data-fancybox-group="gallery" href="<%=gpi %>"><img src="<%=gpi %>"" alt="product-thumbnail" style="width:130px;height:130px;"></a>
                                    <%
                                                    } cd0++; } %>
                                </div>
                            </div>
                            <!-- Thumbnail image end -->
                        </div>
                        <!-- Main Thumbnail Image End -->
                        <!-- Thumbnail Description Start -->
                        <!-- tozihat mahsol start-->
                        <div class="col-lg-7 " style="border-right:1px solid #ded3d3">
                            <div class="thubnail-desc ">
                                <h3 class="product-header"><%=SDDR["PName"].ToString() %></h3>
                                <div class="rating-summary fix mtb-10">
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="rating-feedback">
                                        <a href="#">(1 بررسی)</a>
                                        <a href="#">اضافه کردن</a>
                                    </div>
                                </div>
                                <div class="pro-price mtb-30">
                                  <%--  <p class="d-flex align-items-center"><span class="prev-price"><%=SDDR["Price"].ToString() %> تومان</span>--%>
                                        <%if (SDDR["NPrice"].ToString() != "0")
                                            { %>
                                        <span class="price"><%=SDDR["NPrice"].ToString() %> تومان</span><span class="saving-price">تخفیف <%=SDDR["Disc"].ToString() %>%</span></p>
                                    <%} %>
                                </div>
                                <p class="mb-20 pro-desc-details"><%=SDDR["Dsc"].ToString() %></p>
                                <%-- hided by programer --%>
                                <div style="display:none" class="product-size mb-20 clearfix">
                                    <label>سایز</label>
                                    <select class="">
                                      <option>S</option>
                                      <option>M</option>
                                      <option>L</option>
                                    </select>
                                </div>
                                 <%-- hided by programer --%>
                                <div  class="color clearfix mb-20">
                                    <label>ویژگی</label>
                                     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="ProductProperty" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ProductProperty_NeedDataSource" OnItemCommand="ProductProperty_ItemCommand"
                                         OnItemDataBound="ProductProperty_ItemDataBound"  Skin="Metro"
                                          BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView>
                                            <Columns>
                                                <telerik:GridBoundColumn Display="false" DataField="Id" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="Id">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="PName" FilterControlAltText="Filter TemplateColumn column" HeaderText="ویژگی"
                                                    UniqueName="PName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn DataField="PName" FilterControlAltText="Filter TemplateColumn column" HeaderText="انتخاب"
                                                    UniqueName="VPrice">
                                                    <ItemTemplate>
                                                    <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="propsel_SelectedIndexChanged" CssClass="form-control" runat="server" ID="propsel" >
                                                        <asp:ListItem Text="dsa" Value="ds"></asp:ListItem>
                                                         <asp:ListItem Text="rthty" Value="tyty"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridTemplateColumn>                                              

                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                     <span class="in-stock" runat="server" id="ppvalueshower"></span>
                                </div>
                                <div class="box-quantity d-flex hot-product2">
                                    <form action="#">
                                        <input runat="server" id="count" class="quantity ml-15" type="number" min="1" value="1">
                                    </form>
                                    <div class="pro-actions">
                                        <div class="actions-primary">
                                            <%-- href="javascript:addtocart(<%= SDDR["PId"].ToString() %>);" --%>
                                            <a  title="" onclick="fin('befSlideBox_AddTCart').click();" data-original-title="افزودن به سبد خرید"> اضافه کردن به سبد خرید</a>
                                        <asp:Button runat="server" ID="AddTCart" OnClick="AddTCart_Click" style="display:none" />
                                        </div>
                                        <div class="actions-secondary">
                                            <a style="display:none" href="compare.html" title="" data-original-title="مقایسه"><i class="lnr lnr-sync"></i> <span>افزودن برای مقایسه </span></a>
                                            <a href="javascript:addtointerest(<%= SDDR["PId"].ToString() %>);" title="" data-original-title="علاقمندی"><i class="lnr lnr-heart"></i> <span>افزودن به لیست علاقه مندی</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-ref mt-20">
                                    <p><span class="in-stock">
                                        <%if (SDDR["SHave"].ToString() == "1")
                                            { %>
                                        <i class="ion-checkmark-round"></i> موجود در انبار</span>
                                        <%} %>
                                           <%else
                                            { %>
                                        <i class="ion-close-round"></i> ناموجود</span>
                                        <%} %>
                                    </p>
                                   
                    
                                    
                                </div>
                                <div class="socila-sharing mt-25">
                                    <ul class="d-flex">
                                        <li>اشتراک گذاری</li>
                                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus-official" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                                        
                        <!-- tozihat mahsol end-->
                        <!-- Thumbnail Description End -->
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Product Thumbnail End -->
        <!-- Product Thumbnail Description Start -->
            <!-- Product Thumbnail Description Start -->
        <div class="thumnail-desc pb-100 pb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="main-thumb-desc nav tabs-area" role="tablist">
                            <li><a class="active" data-toggle="tab" href="#dtail">جزئیات محصول</a></li>
                            <li><a data-toggle="tab" href="#review">بررسی </a></li>
                        </ul>
                        <!-- Product Thumbnail Tab Content Start -->
                        <div class="tab-content thumb-content border-default">
                            <div id="dtail" class="tab-pane fade show active">
                                <p><%= SDDR["Details"].ToString() %></p>
                            </div>
                            <div style="display:none" id="review" class="tab-pane fade">
                                <!-- Reviews Start -->
                                <div class="review border-default universal-padding">
                                    <div class="group-title">
                                        <h2>بررسی کاربر</h2>
                                    </div>
                                    <h4 class="review-mini-title">Truemart</h4>
                                    <ul class="review-list">
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>کیفیت</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <label>Truemart</label>
                                        </li>
                                        <!-- Single Review List End -->
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>قیمت</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <label>بررسی <a href="https://themeforest.net/user/hastech">Truemart</a></label>
                                        </li>
                                        <!-- Single Review List End -->
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>ارزش</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <label>ارسال شده در 7/20/18</label>
                                        </li>
                                        <!-- Single Review List End -->
                                    </ul>
                                </div>
                                <!-- Reviews End -->
                                <!-- Reviews Start -->
                                <div class="review border-default universal-padding mt-30">
                                    <h2 class="review-title mb-30">نظر خود: <br><span>تیشرت آستین کوتاه</span></h2>
                                    <p class="review-mini-title">امتیاز شما</p>
                                    <ul class="review-list">
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>کیفیت</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </li>
                                        <!-- Single Review List End -->
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>قیمت</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </li>
                                        <!-- Single Review List End -->
                                        <!-- Single Review List Start -->
                                        <li>
                                            <span>ارزش</span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </li>
                                        <!-- Single Review List End -->
                                    </ul>
                                    <!-- Reviews Field Start -->
                                    <div class="riview-field mt-40">
                                        <form autocomplete="off" action="#">
                                            <div class="form-group">
                                                <label class="req" for="sure-name">نام</label>
                                                <input type="text" class="form-control" id="sure-name" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label class="req" for="subject">خلاصه</label>
                                                <input type="text" class="form-control" id="subject" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label class="req" for="comments">بررسی</label>
                                                <textarea class="form-control" rows="5" id="comments" required="required"></textarea>
                                            </div>
                                            <button type="submit" class="customer-btn">ارسال نظر</button>
                                        </form>
                                    </div>
                                    <!-- Reviews Field Start -->
                                </div>
                                <!-- Reviews End -->
                            </div>
                        </div>
                        <!-- Product Thumbnail Tab Content End -->
                    </div>
                </div>
                <!-- Row End -->
            </div>
            <!-- Container End -->
        </div>
    <%} %>


    </ContentTemplate>
     
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
</asp:Content>


