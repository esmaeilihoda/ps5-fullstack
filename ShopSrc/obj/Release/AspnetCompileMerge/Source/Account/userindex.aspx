<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="userindex.aspx.cs" Inherits="NM.Account.userindex" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript">
        function hidealarm() {
            document.getElementById("Alarms").style.display = "none";
        }
    </script>
     <asp:ScriptManager runat="server" ID="ASM">
           <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
     </asp:ScriptManager>
    <div class="alert-info" runat="server" id="Alarms" style="font-size:20px;
direction:rtl;text-align:right;color:red;border-radius:20px" onclick="hidealarm();" clientidmode="Static"></div>
                        <div class="container-fluid">
                            <hr /><hr />
                            <div class="col-md-8">
                                <h4 runat="server" id="disnmae" class="page-title m-0">میز کار</h4>
                            </div>
                            <div class="row">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات باشگاه A</div>
                                                    <div runat="server" id="Rchild" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300" style="color:orangered"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات باشگاه B</div>
                                                    <div runat="server" id="Lchild" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"  style="color:cornflowerblue"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات رزرو باشگاه A</div>
                                                    <div runat="server" id="DivSR" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color:orangered"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات رزرو باشگاه B</div>
                                                    <div runat="server" id="DivSL" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color:cornflowerblue"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div runat="server" id="coinsprice" class="row">
                                <% NM.Account.userindex nau = new NM.Account.userindex();
                                    System.Data.DataView cdv = nau.coinsdv();
                                    foreach (System.Data.DataRowView cdr in cdv)
                                    {
                                        double[] coinm = nau.MandeCoin(cdr["Id"].ToString());

                                         %>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><%=cdr["currencyname"].ToString() %></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cdr["PriceUSD"].ToString()+"$" %></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-coins fa-2x text-gray-300" style="color:cornflowerblue"><%=cdr["sample"].ToString() %></i>
                                                </div>                                               
                                            </div><hr style="font-size:10px" />
                                             <p class="font-14 m-0" style="display:block;direction:ltr;font-family:Tahoma">IN <%=coinm[0] %></p>
                                            <p class="font-14 m-0" style="display:block;direction:ltr;font-family:Tahoma">OUT<%= "-" + coinm[1]  %></p>
                                            <p class="font-14 m-0" style="display:block;direction:ltr;font-family:Tahoma">P<%= "="+ coinm[2] %></p>
                                            معادل
                                            <br />
                                            <p class="font-14 m-0" style="display:block;direction:ltr;font-family:Tahoma"><%=coinm[3]*coinm[2]*double.Parse(cdr["PriceUSD"].ToString()) %>تومان</p>
                                        </div>
                                    </div>
                                </div>
                                <%} %>
                                </div> 
                            <div class="row">            
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-info mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">پاداش های دریافتی</h6>
                                                <h4 runat="server" id="Pdaryafti" class="mb-3 mt-0 float-right">$0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-danger"> </span> <span class="ml-2"> پاداش های دریافتی</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-buffer h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین پاداش دریافتی : $0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-pink mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">واریز شده</h6>
                                                <h4 runat="server" id="varizi" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین واریزی : 0</p>
                                        </div>
                                    </div>
                                </div>      
                               <div class="col-xl-3 col-md-6">
                                    <div class="card bg-pink mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">درخواست واریز</h6>
                                                <h4 runat="server" id="DarxasVariz" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین واریزی : 0</p>
                                        </div>
                                    </div>
                                </div>                         
                                    <div class="col-xl-3 col-md-6">
                                    <div class="card bg-white mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-success">مانده پورسانت</h6>
                                                <h4 runat="server" id="mandepoor" class="mb-3 mt-0 float-right text-success">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"></span> <span class="ml-2"></span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین واریزی : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-dark mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">کیف پول</h6>
                                                <h4 runat="server" id="kife" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-dark mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">برداشتی از کیف پول</h6>
                                                <h4 runat="server" id="PazKif" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-dark mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">مانده کیف پول</h6>
                                                <h4 runat="server" id="MandeKif" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-light text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">وام</h6>
                                                <h4 runat="server" id="loan" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                            <div>
                                                <span class="badge badge-danger text-primary"> 0% </span> <span class="ml-2">درصد افزایش نسبت به قبل</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">جمع فروش تیم</h6>
                                                <h4 runat="server" id="hajmforoosh" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">فروش تیم A</h6>
                                                <h4 runat="server" id="TeamAsale" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">جمع فروش تیم B</h6>
                                                <h4 runat="server" id="TeamBsale" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-muted mini-stat text-white">
                                        <div class="p-3 mini-stat-desc">
                                            <div class="clearfix">
                                                <h6 class="text-uppercase mt-0 float-left text-white-50">پورسانت تبدیل شده به کوین</h6>
                                                <h4 runat="server" id="TCoin" class="mb-3 mt-0 float-right">0</h4>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                                            </div>
                                            <p class="font-14 m-0">آخرین تراکنش : 0</p>
                                        </div>
                                    </div>
                                </div>
                            </div>                              
                            <!-- end row -->
                            <div class="row">
                                <telerik:RadHtmlChart runat="server"
                                     PlotArea-YAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     PlotArea-XAxis-LabelsAppearance-DataFormatString="{0:####/##/##}"
                                     PlotArea-XAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     Font-Names="BK" Width="100%" ID="PayDayChart"
                                    Skin="Black" >
   <Navigator Visible="true"></Navigator>
                                    <PlotArea><AdditionalYAxes> <telerik:AxisY Color="#00ffff"></telerik:AxisY></AdditionalYAxes></PlotArea>                         
                                    <PlotArea>
                                        <Series>
                                            <telerik:ColumnSeries StackType="Stack100" DataFieldY="DayP" Name="DayP">
                                                <TooltipsAppearance Color="White"  DataFormatString="{0:###,###,###}" />
                                            </telerik:ColumnSeries>
                                        </Series>
                                        <XAxis DataLabelsField="Date">
                                            <LabelsAppearance DataFormatString="{0:####/##/##}" RotationAngle="75" Color="Red">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis>
                                            <TitleAppearance Text="">
                                            </TitleAppearance>
                                        </YAxis>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Visible="false">
                                        </Appearance>
                                    </Legend>
                                    <ChartTitle Text="PAY">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                            </div>
                            <!-- end row -->
                            <div class="row">
                                <telerik:RadHtmlChart runat="server"
                                     PlotArea-YAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     PlotArea-XAxis-LabelsAppearance-DataFormatString="{0:####/##/##}"
                                     PlotArea-XAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     Font-Names="BK" Width="100%" ID="PepoleChart"
                                    Skin="Black" ><PlotArea><AdditionalYAxes><telerik:AxisY Color="#00ffff"></telerik:AxisY></AdditionalYAxes></PlotArea>
                                    <PlotArea>
                                        <Series>
                                            <telerik:ColumnSeries StackType="Normal" DataFieldY="L" Name="L">
                                                <TooltipsAppearance Color="White"  DataFormatString="{0:###,###,###}" />
                                            </telerik:ColumnSeries>                                            
                                            <telerik:ColumnSeries StackType="Normal" DataFieldY="R" Name="R">
                                                <TooltipsAppearance Color="red"  DataFormatString="{0:###,###,###}" />
                                            </telerik:ColumnSeries>                                                                                        
                                            <telerik:ColumnSeries StackType="Normal" DataFieldY="P" Name="P">
                                                <TooltipsAppearance Color="red"  DataFormatString="{0:###,###,###}" />
                                            </telerik:ColumnSeries>
                                        </Series>
                                        <XAxis DataLabelsField="Date">
                                            <LabelsAppearance DataFormatString="{0:####/##/##}" RotationAngle="75" Color="#ff0066">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis>
                                            <TitleAppearance Text="">
                                            </TitleAppearance>
                                        </YAxis>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Visible="false">
                                        </Appearance>
                                    </Legend>
                                    <ChartTitle Text="BALANCE">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                            </div>
                            <div class="row" style="display:none">
                                <div class="col-xl-9">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title">Sales Report</h4>
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div id="morris-line-example" class="morris-chart" style="height: 300px"></div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div>
                                                        <h5 class="font-14 mb-5">Yearly Sales Report</h5>
                                                        <div>
                                                            <h5 class="mb-3">2018 : $19523</h5>
                                                            <p class="text-muted mb-4">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis atque quos dolores et</p>
                                                            <a href="#" class="btn btn-primary btn-sm">Read more <i class="mdi mdi-chevron-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title">Sales Analytics</h4>
                                            <div id="morris-donut-example" class="morris-chart" style="height: 300px"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
            
                            <div class="row" style="display:none">
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title mb-4">Latest Messages</h4>
                                            <div class="latest-massage">
                                                <a href="#" class="latest-message-list">
                                                    <div class="border-bottom position-relative">
                                                        <div class="float-left user mr-3">
                                                            <h5 class="bg-primary text-center rounded-circle text-white mt-0">v</h5>
                                                        </div>
                                                        <div class="message-time">
                                                            <p class="m-0 text-muted">Just Now</p>
                                                        </div>
                                                        <div class="massage-desc">
                                                            <h5 class="font-14 mt-0 text-dark">Victor Zamora</h5>
                                                            <p class="text-muted">Hey! there I'm available...</p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-message-list">
                                                    <div class="border-bottom mt-3 position-relative">
                                                        <div class="float-left user mr-3">
                                                            <h5 class="bg-success text-center rounded-circle text-white mt-0">p</h5>
                                                        </div>
                                                        <div class="message-time">
                                                            <p class="m-0 text-muted">2 Min. ago</p>
                                                        </div>
                                                        <div class="massage-desc">
                                                            <h5 class="font-14 mt-0 text-dark">Patrick Beeler</h5>
                                                            <p class="text-muted">I've finished it! See you so...</p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-message-list">
                                                    <div class="border-bottom mt-3 position-relative">
                                                        <div class="float-left user mr-3">
                                                            <img src="assets/images/users/avatar-3.jpg" alt="" class="rounded-circle mb-3">
                                                        </div>
                                                        <div class="message-time">
                                                            <p class="m-0 text-muted">6 Min. ago</p>
                                                        </div>
                                                        <div class="massage-desc">
                                                            <h5 class="font-14 mt-0 text-dark">Ralph Ramirez</h5>
                                                            <p class="text-muted">This theme is awesome!</p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-message-list">
                                                    <div class="border-bottom mt-3 position-relative">
                                                        <div class="float-left user mr-3">
                                                            <h5 class="bg-pink text-center rounded-circle text-white mt-0">b</h5>
                                                        </div>
                                                        <div class="message-time">
                                                            <p class="m-0 text-muted">01:34 pm</p>
                                                        </div>
                                                        <div class="massage-desc">
                                                            <h5 class="font-14 mt-0 text-dark">Bryan Lacy</h5>
                                                            <p class="text-muted">I've finished it! See you so...</p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-message-list">
                                                    <div class="mt-3 position-relative">
                                                        <div class="float-left user mr-3">
                                                            <img src="assets/images/users/avatar-4.jpg" alt="" class="rounded-circle mb-3">
                                                        </div>
                                                        <div class="message-time">
                                                            <p class="m-0 text-muted">02:05 pm</p>
                                                        </div>
                                                        <div class="massage-desc">
                                                            <h5 class="font-14 mt-0 text-dark">James Sorrells</h5>
                                                            <p class="text-muted">Hey! there I'm available...</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
            
                                        </div>
                                    </div>
            
                                </div>
                                <!-- end col -->
            
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title mb-4">Recent Activity</h4>
                                            <ol class="activity-feed mb-0">
                                                <li class="feed-item">
                                                    <div class="feed-item-list">
                                                        <span class="date text-white-50">Jan 10</span>
                                                        <span class="activity-text text-white">Responded to need “Volunteer Activities”</span>
                                                    </div>
                                                </li>
                                                <li class="feed-item">
                                                    <div class="feed-item-list">
                                                        <span class="date text-white-50">Jan 09</span>
                                                        <span class="activity-text text-white">Added an interest “Volunteer Activities”</span>
                                                    </div>
                                                </li>
                                                <li class="feed-item">
                                                    <div class="feed-item-list">
                                                        <span class="date text-white-50">Jan 08</span>
                                                        <span class="activity-text text-white">Joined the group “Boardsmanship Forum”</span>
                                                    </div>
                                                </li>
                                                <li class="feed-item">
                                                    <div class="feed-item-list">
                                                        <span class="date text-white-50">Jan 07</span>
                                                        <span class="activity-text text-white">Responded to need “In-Kind Opportunity”</span>
                                                    </div>
                                                </li>
                                            </ol>
            
                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->
            
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title mb-4">Social Source</h4>
                                            <div class="text-center">
                                                <div class="social-source-icon lg-icon mb-3">
                                                    <i class="mdi mdi-facebook h2 bg-primary text-white"></i>
                                                </div>
                                                <h5 class="font-16"><a href="#" class="text-dark">Facebook - <span class="text-muted">125 sales</span> </a></h5>
                                                <p class="text-muted">Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis tincidunt.</p>
                                                <a href="#" class="text-primary font-14">Learn more <i class="mdi mdi-chevron-right"></i></a>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-md-4">
                                                    <div class="social-source text-center mt-3">
                                                        <div class="social-source-icon mb-2">
                                                            <i class="mdi mdi-facebook h5 bg-primary text-white"></i>
                                                        </div>
                                                        <p class="font-14 text-muted mb-2">125 sales</p>
                                                        <h6>Facebook</h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="social-source text-center mt-3">
                                                        <div class="social-source-icon mb-2">
                                                            <i class="mdi mdi-twitter h5 bg-info text-white"></i>
                                                        </div>
                                                        <p class="font-14 text-muted mb-2">112 sales</p>
                                                        <h6>Twitter</h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="social-source text-center mt-3">
                                                        <div class="social-source-icon mb-2">
                                                            <i class="mdi mdi-instagram h5 bg-pink text-white"></i>
                                                        </div>
                                                        <p class="font-14 text-muted mb-2">104 sales</p>
                                                        <h6>Instagram</h6>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                            <!-- end row -->
            
                            <div class="row" style="display:none">
                                <div class="col-xl-9">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title mb-4">Latest Trasaction</h4>
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID No.</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Date</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">#14567</th>
                                                            <td>Michael Mitchell</td>
                                                            <td>14 Jan</td>
                                                            <td>$74</td>
                                                            <td>2</td>
                                                            <td>
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 89%;" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                            <td>$148</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">#14568</th>
                                                            <td>Dennis Cervantes</td>
                                                            <td>15 Jan</td>
                                                            <td>$72</td>
                                                            <td>2</td>
                                                            <td>
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 64%;" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                            <td>$144</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">#14569</th>
                                                            <td>Bernard Moats</td>
                                                            <td>16 Jan</td>
                                                            <td>$86</td>
                                                            <td>1</td>
                                                            <td>
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                            <td>$86</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">#14570</th>
                                                            <td>Patrick Esquivel</td>
                                                            <td>17 Jan</td>
                                                            <td>$59</td>
                                                            <td>2</td>
                                                            <td>
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 64%;" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                            <td>$118</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">#14571</th>
                                                            <td>Michael Barger</td>
                                                            <td>18 Jan</td>
                                                            <td>$62</td>
                                                            <td>2</td>
                                                            <td>
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                            <td>$124</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="mt-0 header-title mb-4">Document files</h4>
                                            <table class="table table-striped mb-0">
                                                <tbody>
                                                    <tr>
                                                        <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                                        <td>
                                                            <h6 class="mt-0">2015</h6>
                                                            <p class="text-muted mb-0">dolor sit amet</p></td>
                                                        <td>
                                                            <a href="#" class="btn btn-primary btn-sm">
                                                                <i class="fas fa-download"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                                        <td>
                                                            <h6 class="mt-0">2016</h6>
                                                            <p class="text-muted mb-0">dolor sit amet</p></td>
                                                        <td>
                                                            <a href="#" class="btn btn-primary btn-sm">
                                                                <i class="fas fa-download"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                                        <td>
                                                            <h6 class="mt-0">2017</h6>
                                                            <p class="text-muted mb-0">pretium quis</p></td>
                                                        <td>
                                                            <a href="#" class="btn btn-primary btn-sm">
                                                                <i class="fas fa-download"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                                        <td>
                                                            <h6 class="mt-0">2018</h6>
                                                            <p class="text-muted mb-0">ultricies nec</p></td>
                                                        <td>
                                                            <a href="#" class="btn btn-primary btn-sm">
                                                                <i class="fas fa-download"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <!-- end row -->

                        </div>
</asp:Content>
