<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="NM.Account.iindex" %>

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

    <div class="btn btn-primary btn-icon-split" runat="server" id="Alarms" style="font-size:20px;
direction:rtl;text-align:right;" onclick="hidealarm();" clientidmode="Static"></div>
                        <div class="container-fluid">
                            <hr />
                               <div class="col-md-8">
                                <h4 runat="server" id="sefareshimohammad" class="page-title m-0"></h4>                            
                               </div>
                            <hr />
                            <div class="col-md-8">
                                <h4 runat="server" id="disnmae" class="page-title m-0">میز کار</h4>
                            </div><hr />
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
                                <% NM.Account.iindex naii = new NM.Account.iindex();
                                    System.Data.DataView cdv = naii.coinsdv();
                                    foreach (System.Data.DataRowView cdr in cdv)
                                    {
                                        double[] coinm = naii.MandeCoin(cdr["Id"].ToString());
                                        NM.Class.MttApi ma = new NM.Class.MttApi();
                                        ma.getvalfromapi();
                                        double fiat = ma.getprice*coinm[2];
                                        if(cdr["sample"].ToString() != "MTT") { fiat = coinm[3] * coinm[2] * double.Parse(cdr["PriceUSD"].ToString()); }
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
                                            <p class="font-14 m-0" style="display:block;direction:ltr;font-family:Tahoma"><%= fiat %>تومان</p>
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
                                                <span class="badge badge-light text-danger"> </span> <span class="ml-2"> به تومان</span>
                                            </div>
                                        </div>
                                        <div class="p-3">
                                            <div class="float-right">
                                                <a href="#" class="text-white-50"><i class="mdi mdi-buffer h5"></i></a>
                                            </div>
                                         <%--   <p class="font-14 m-0">آخرین پاداش دریافتی : $0</p>--%>
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
                                            <p class="font-14 m-0">به تومان</p>
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
                                                <span class="badge badge-light text-primary"></span> <span class="ml-2">به تومان</span>
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
                                    <div class="card badge-success mini-stat text-white">
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
                                    <div class="card bg-danger mini-stat text-white">
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
                                    <div class="card badge-warning mini-stat text-white">
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
                                    <div class="card badge-purple mini-stat text-white">
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
                                    <div class="card badge-info mini-stat text-white">
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
                                    <div class="card bg-success mini-stat text-white">
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
                        
                             
                            </div>
                            <!-- end row -->
                                                 <hr />
                            <div class="col-md-12" style="background-color:black;display: grid;text-align: center;border-style: dotted;border-color: white;">
                                <h4 runat="server" id="H1" class="page-title m-3" style="color:white">Turbo Report</h4>
                            </div><hr style="color:coral;font-size:10px" />
     <div class="row">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات باشگاه A</div>
                                                    <div runat="server" id="ATurbo" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
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
                                                    <div runat="server" id="BTurbo" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
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
                                                    <div runat="server" id="ASave" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
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
                                                    <div runat="server" id="BSave" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color:cornflowerblue"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <telerik:RadHtmlChart runat="server"
                                     PlotArea-YAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     PlotArea-XAxis-LabelsAppearance-DataFormatString="{0:####/##/##}"
                                     PlotArea-XAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     Font-Names="BK" Width="100%" ID="Pay5DayChart"
                                    Skin="Metro" >
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
                            <!-- end row -->
                            <div class="row">
                                <telerik:RadHtmlChart runat="server"
                                     PlotArea-YAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     PlotArea-XAxis-LabelsAppearance-DataFormatString="{0:####/##/##}"
                                     PlotArea-XAxis-LabelsAppearance-TextStyle-FontFamily="BK"
                                     Font-Names="BK" Width="100%" ID="Pepole5Chart"
                                    Skin="Metro" ><PlotArea><AdditionalYAxes><telerik:AxisY Color="#00ffff"></telerik:AxisY></AdditionalYAxes></PlotArea>
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

</asp:Content>
