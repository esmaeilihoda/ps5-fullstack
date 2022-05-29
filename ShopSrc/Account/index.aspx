<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="Shop.Account.iindex" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript">
        function hidealarm() {
            document.getElementById("Alarms").style.display = "none";
        }
        function tabs(mode) {
            if (mode == "Services") {
                fin("Turbodiv").style.display = "none";
                fin("Services").style.display = "";
                fin("investsdiv").style.display = "none";
                fin ("PHostdiv").style.display = "none";
            }
            else if (mode == "Turbo") {
                fin("Turbodiv").style.display = "";
                fin("Services").style.display = "none";
                fin("investsdiv").style.display = "none";
                fin ("PHostdiv").style.display = "none";
            } else if (mode == "PHost") {
                fin("PHostdiv").style.display = "";
                fin("Services").style.display = "none";
                fin("investsdiv").style.display = "none";
                fin("Turbodiv").style.display = "none";
            }
            else if (mode == "INV") {
                fin("Turbodiv").style.display = "none";
                fin("Services").style.display = "none";
                //width:100%;height:99vh
                fin("investsdiv").style.display = "";
                fin("investsdiv").style.width = "100%";
                fin("investsdiv").style.height = "99vh";
                fin("PHostdiv").style.display = "none";
            }
        }
    </script>
    <style type="text/css">
        .cardico {
            height: 20%;
            width: 100%;
            text-align: center;
            margin-top: 10px;
        }

        .cardcontent {
            height: 33%;
            width: 100%;
        }

        .cardat {
            padding-top: 20px;
            color: white;
            padding-right: 20px;
        }

        .cardab {
            padding-top: 45px;
            color: white;
            padding-left: 10px;
        }

        .cardbt {
            color: white;
            padding-right: 20px;
        }

        .cardbb {
            margin-top: 20px;
            color: white;
            padding-top: 25px;
            padding-left: 10px;
        }
    </style>
    <asp:ScriptManager runat="server" ID="ASM">
        <Services>
            <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
        </Services>
    </asp:ScriptManager>

    <div class="btn btn-primary btn-icon-split" runat="server" id="Alarms" style="font-size: 20px; direction: rtl; text-align: right;"
        onclick="hidealarm();" clientidmode="Static">
    </div>
    <div class="container-fluid">
        <hr />
        <div style="display: none" class="col-md-8">
            <h4 runat="server" id="sefareshimohammad" class="page-title m-0"></h4>
        </div>
        <hr />
        <div style="display: none" class="col-md-8">
            <h4 runat="server" id="disnmae" class="page-title m-0">میز کار</h4>
        </div>
        <hr />
        <div class="row">
            <div onclick="tabs('Services')" style="cursor: pointer; text-align: center; height: 50px; vertical-align: central; border-radius: 15px; display: inline-block;margin-right:5px" class="btn-dark"><span style="margin-top: 25%; font-size: x-large">کالا/خدمات</span></div>
            <div onclick="tabs('Turbo')" runat="server" id="tuuur" style="cursor: pointer; text-align: center; height: 50px; vertical-align: central; border-radius: 15px; display: inline-block;margin-right:5px" class="btn-dark"><span style="margin-top: 25%; font-size: x-large">پک توربو</span></div>
            <div onclick="tabs('INV')" runat="server" id="hebeee" style="cursor: pointer; text-align: center; height: 50px; vertical-align: central; border-radius: 15px; display: inline-block;margin-right:5px" class="btn-dark"><span style="margin-top: 25%; font-size: x-large">هبه مشارکت</span></div>
            <div onclick="tabs('PHost')" runat="server" id="percentHost" style="cursor: pointer; text-align: center; height: 50px; vertical-align: central; border-radius: 15px; display: inline-block;margin-right:5px" class="btn-dark"><span style="margin-top: 25%; font-size: x-large">مشارکت در فروش</span></div>
        </div>
        <br />

        <div class="row">
            <div id="investsdiv" style="width: 100%; height: 99vh; border-style: double; border-color: red; border-radius: 25px; zoom: 0.8">
                <iframe style="width:100%; height: 99vh; overflow: hidden;" src="Investingiframe.aspx"></iframe>
            </div>
        </div>
         <div id="PHostdiv" style="width: 100%; height: 99vh;  border-radius: 25px; zoom: 0.8">
       
               
                   
                    
                 <div class="col-xl-3 col-md-6" style="float:right">
                    <div class="card border-left-primary shadow  py-2" style="height:810px;">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamIco.png" style="height: 147px;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">جمع فروش خودش</h6>
                            <br />
                            <h4 runat="server" id="pkhodesh" class="mb-3 mt-0 float-right cardab"></h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">جمع فروش یک سطحی</h6>
                            <h4 runat="server" id="pbalasari" class="mb-3 mt-0 float-right cardbb"></h4>
                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">جمع دریافتی </h6>
                            <h4 runat="server" id="sumIncomeHost" class="mb-3 mt-0 float-right cardbb"></h4>
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">جمع کل</h6>
                            <h4 runat="server" id="SumAll" class="mb-3 mt-0 float-right cardbb"></h4>
                        </div>
                    </div>
                </div>
              <div class="col-xl-3 col-md-6" style="float:right">
                    <div class="card border-left-primary shadow  py-2" >
                       
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">تعداد بازدید از سایت شما:</h6>
                            <br />
                            <h4 runat="server" id="visitCountshow" class="mb-3 mt-0 float-right cardab"></h4>

                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent text-center" id="showshop" runat="server">
                            
                        </div>
                        
                    </div>
                </div>

             
                
            
    </div>
        <div id="Services">
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamCount.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">تعداد نفرات باشگاه A</h6>
                            <h4 runat="server" id="Rchild" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">

                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">تعداد نفرات باشگاه B</h6>
                            <h4 runat="server" id="Lchild" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
                <div style="display: none" class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body" style="background-image: url('../images/cradbody/bakline.png'); background-size: cover">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <%-- <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات باشگاه B</div>
                                                    <div runat="server" id="Lchild" class="h5 mb-0 font-weight-bold text-gray-800">0</div>--%>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300" style="color: cornflowerblue"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/Rezerv.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">تعداد نفرات رزرو باشگاه A</h6>
                            <h4 runat="server" id="DivSR" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">تعداد نفرات رزرو باشگاه B</h6>
                            <h4 runat="server" id="DivSL" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamSale.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat" style="margin-bottom: 3px">فروش تیم A</h6>
                            <h4 runat="server" id="TeamAsale" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt"> فروش تیم B</h6>
                            <br />
                            <h4 runat="server" id="TeamBsale" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamIco.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">جمع فروش تیم</h6>
                            <br />
                            <h4 runat="server" id="hajmforoosh" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">پاداش های دریافتی</h6>
                            <h4 runat="server" id="Pdaryafti" class="mb-3 mt-0 float-right cardbb">$0</h4>
                        </div>
                    </div>
                </div>
                <div style="display: none" class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body" style="background-image: url('../images/cradbody/bakline.png'); background-size: cover">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <%--<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">تعداد نفرات رزرو باشگاه B</div>
                                                    <div runat="server" id="DivSL" class="h5 mb-0 font-weight-bold text-gray-800">0</div>--%>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calculator fa-2x text-gray-300" style="color: cornflowerblue"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgba(241, 30, 30, 0.69);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">درخواست واریز</h6>
                                <br />
                                <h4 runat="server" id="DarxasVariz" class="mb-3 mt-0 float-right">0</h4>
                                <h4 runat="server" id="CDarxasVariz" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary"></span><span class="ml-2">به تومان</span>
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
                <%--<div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="cardico">
                                <img src="../images/cradbody/TeamIco.png" style="height: 80%;" />
                            </div>
                            <img src="../images/cradbody/AL.png" style="width: 100%" />
                            <div class="cardcontent">
                                <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">واریز شده</h6>
                                <br />
                                <h4 runat="server" id="varizi" class="mb-3 mt-0 float-right cardab">0</h4>

                            </div>
                            <img src="../images/cradbody/BL.png" style="width: 100%" />
                            <div class="cardcontent">
                            </div>
                        </div>
                    </div>
                </div>--%>
                <%-- 
                    ..................................
                     /////...........----____-----____-----_____----_____----____----_____----____----____-----_____
                    ..................................
                    --%>
                  <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamIco.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">مانده پورسانت</h6>
                            <br />
                            <h4 runat="server" id="mandepoor" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">واریز شده</h6>
                            <h4 runat="server" id="varizi" class="mb-3 mt-0 float-right cardbb">$0</h4>
                        </div>
                    </div>
                </div>
                <%-- !!!!!!!!!!!!!!!!!!!!!!!!!!!...................................................!!!!!!!!!!!!!!!!!!!!!!! --%>
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/kif.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">کیف پول</h6>
                            <h4 runat="server" id="kife" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">برداشتی از کیف پول</h6>
                            <h4 runat="server" id="PazKif" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgb(110, 131, 229);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">مانده کیف پول</h6>
                                <h4 runat="server" id="MandeKif" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary">0% </span><span class="ml-2">درصد افزایش نسبت به قبل</span>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%-- <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
                        </div>
                    </div>
                </div>
                
          
                

                <%--                         <div class="col-xl-3 col-md-6">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                         <div class="card-body" style="background-image:url('../images/cradbody/bakline.png');background-size:cover">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
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
                                </div>--%>
                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card bg-muted mini-stat text-white">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">وام</h6>
                                <h4 runat="server" id="loan" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-danger text-primary">0% </span><span class="ml-2">درصد افزایش نسبت به قبل</span>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%--    <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
                        </div>
                    </div>
                </div>

                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgba(64, 180, 28, 0.98)">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <%--<h6 class="text-uppercase mt-0 float-left text-white-50">جمع فروش تیم B</h6><br />
                                                <h4 runat="server" id="TeamBsale" class="mb-3 mt-0 float-right">0</h4>--%>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%--<p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
                        </div>
                    </div>
                </div>

                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgb(57, 142, 31)">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">پورسانت تبدیل شده به کوین</h6>
                                <br />
                                <h4 runat="server" id="TCoin" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%--  <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
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
                    BackColor="#142338"
                    PlotArea-Appearance-FillStyle-BackgroundColor="#142338"
                    Appearance-FillStyle-BackgroundColor="#142338"
                    ChartTitle-Appearance-BackgroundColor="#142338"
                    Font-Names="BK" Width="100%" ID="PayDayChart"
                    Skin="Black">
                    <Navigator Visible="true"></Navigator>
                    <PlotArea>
                        <AdditionalYAxes>
                            <telerik:AxisY Color="#00ffff"></telerik:AxisY>
                        </AdditionalYAxes>
                    </PlotArea>
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries StackType="Stack100" DataFieldY="DayP" Name="DayP">
                                <TooltipsAppearance Color="White" DataFormatString="{0:###,###,###}" />
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
                    BackColor="#142338"
                    PlotArea-Appearance-FillStyle-BackgroundColor="#142338"
                    Appearance-FillStyle-BackgroundColor="#142338"
                    ChartTitle-Appearance-BackgroundColor="#142338"
                    Skin="Black">
                    <PlotArea>
                        <AdditionalYAxes>
                            <telerik:AxisY Color="#00ffff"></telerik:AxisY>
                        </AdditionalYAxes>
                    </PlotArea>
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="L" Name="L">
                                <TooltipsAppearance Color="White" DataFormatString="{0:###,###,###}" />
                            </telerik:ColumnSeries>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="R" Name="R">
                                <TooltipsAppearance Color="red" DataFormatString="{0:###,###,###}" />
                            </telerik:ColumnSeries>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="P" Name="P">
                                <TooltipsAppearance Color="red" DataFormatString="{0:###,###,###}" />
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
    </div>
    <div id="Turbodiv">
        <div runat="server" id="turbodv">
            <hr />
            <%--  <div class="col-md-12" style="background-color:black;display: grid;text-align: center;border-style: dotted;border-color: white;">
                                <h4 runat="server" id="H1" class="page-title m-3" style="color:white">Turbo Report</h4>
                            </div>--%>
            <hr style="color: coral; font-size: 10px" />
            <div class="row">
                 <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamCount.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">تعداد نفرات باشگاه A</h6>
                            <h4 runat="server" id="ATurbo" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">

                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">تعداد نفرات باشگاه B</h6>
                            <h4 runat="server" id="BTurbo" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
                 <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/Rezerv.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">تعداد نفرات رزرو باشگاه A</h6>
                            <h4 runat="server" id="ASave" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">تعداد نفرات رزرو باشگاه B</h6>
                            <h4 runat="server" id="BSave" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>    
            
                <%-- .........................................../d./ --%>

                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgba(241, 30, 30, 0.69);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">درخواست واریز</h6>
                                <h4 runat="server" id="Darxastvariz5" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary"></span><span class="ml-2">به کوین</span>
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
                <div style="display:none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgba(241, 30, 30, 0.83);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">واریز شده+درخواست واریز</h6>
                                <br />
                                <h4 runat="server" id="PadashVariz5" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
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

                <div style="" class="col-xl-3 col-md-6">
                    <div class="card bg-white mini-stat text-white">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-success">مانده پورسانت</h6>
                                <h4 runat="server" id="MandePadash5" class="mb-3 mt-0 float-right text-success">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary"></span><span class="ml-2"></span>
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
  <%--              <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgb(87, 114, 238);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">کیف پول</h6>
                                <h4 runat="server" id="KifPool5" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary">0% </span><span class="ml-2">درصد افزایش نسبت به قبل</span>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                                 <p class="font-14 m-0">آخرین تراکنش : 0</p>
                        </div>
                    </div>
                </div>--%>
                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgb(110, 131, 229);">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">مانده کیف پول</h6>
                                <h4 runat="server" id="MandeKif5" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-light text-primary">0% </span><span class="ml-2">درصد افزایش نسبت به قبل</span>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%-- <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
                        </div>
                    </div>
                </div>
               
                <div style="display: none" class="col-xl-3 col-md-6">
                    <div class="card bg-muted mini-stat text-white">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">درخواست واریز</h6>
                                <h4 runat="server" id="TDVV" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                            <div>
                                <span class="badge badge-danger text-primary">0% </span><span class="ml-2">درصد افزایش نسبت به قبل</span>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%-- <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
                        </div>
                    </div>
                </div>
          
             <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamSale.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat" style="margin-bottom: 3px">فروش تیم A</h6>
                            <h4 runat="server" id="ForushA5" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt"> فروش تیم B</h6>
                            <br />
                            <h4 runat="server" id="ForushB5" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
          
                <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamIco.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">جمع فروش تیم</h6>
                            <br />
                            <h4 runat="server" id="JamForush5" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">پاداش های دریافتی</h6>
                            <h4 runat="server" id="Padash5" class="mb-3 mt-0 float-right cardbb">$0</h4>
                        </div>
                    </div>
                </div>
                 <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/kif.png" style="height: 80%;" />
                        </div>
                        <img src="../images/cradbody/AL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardat">کیف پول</h6>
                            <h4 runat="server" id="KifPool5" class="mb-3 mt-0 float-right cardab">0</h4>

                        </div>
                        <img src="../images/cradbody/BL.png" style="width: 100%" />
                        <div class="cardcontent">
                            <h6 class="text-uppercase mt-0 float-left text-white-5 cardbt">برداشتی از کیف پول</h6>
                            <h4 runat="server" id="Barsasht5Kif" class="mb-3 mt-0 float-right cardbb">0</h4>
                        </div>
                    </div>
                </div>
       
              <%--  <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgba(64, 180, 28, 0.98)">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">جمع فروش تیم</h6>
                                <h4 runat="server" id="" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                             <p class="font-14 m-0">آخرین تراکنش : 0</p>
                        </div>
                    </div>
                </div>--%>
                <div style="display:none" class="col-xl-3 col-md-6">
                    <div class="card mini-stat text-white" style="background-color: rgb(57, 142, 31)">
                        <div class="p-3 mini-stat-desc">
                            <div class="clearfix">
                                <h6 class="text-uppercase mt-0 float-left text-white-50">پورسانت تبدیل شده به کوین</h6>
                                <h4 runat="server" id="TabdilBCoin5" class="mb-3 mt-0 float-right">0</h4>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="float-right">
                                <a href="#" class="text-white-50"><i class="mdi mdi-tag-text-outline h5"></i></a>
                            </div>
                            <%--  <p class="font-14 m-0">آخرین تراکنش : 0</p>--%>
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
                    Font-Names="BK" Width="100%" ID="Pay5DayChart"
                    Skin="Black">
                    <Navigator Visible="true"></Navigator>
                    <PlotArea>
                        <AdditionalYAxes>
                            <telerik:AxisY Color="#00ffff"></telerik:AxisY>
                        </AdditionalYAxes>
                    </PlotArea>
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries StackType="Stack100" DataFieldY="DayP" Name="DayP">
                                <TooltipsAppearance Color="White" DataFormatString="{0:###,###,###}" />
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
                    Font-Names="BK" Width="100%" ID="Pepole5Chart"
                    Skin="Black">
                    <PlotArea>
                        <AdditionalYAxes>
                            <telerik:AxisY Color="#00ffff"></telerik:AxisY>
                        </AdditionalYAxes>
                    </PlotArea>
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="L" Name="L">
                                <TooltipsAppearance Color="White" DataFormatString="{0:###,###,###}" />
                            </telerik:ColumnSeries>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="R" Name="R">
                                <TooltipsAppearance Color="red" DataFormatString="{0:###,###,###}" />
                            </telerik:ColumnSeries>
                            <telerik:ColumnSeries StackType="Normal" DataFieldY="P" Name="P">
                                <TooltipsAppearance Color="red" DataFormatString="{0:###,###,###}" />
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

    </div>

   
    <br />
    <br />


    <style type="text/css">
        .py-2{
            border-style: double;
    border-color: white;
    border-radius: 25px;
    background: linear-gradient(135deg, rgb(58 21 99 / 62%) 0%, rgb( 20 20 20) 100%);
        }
    </style>
    <script type="text/javascript">
        setTimeout(function () {
            fin("Turbodiv").style.width = "100%";
            fin("Turbodiv").style.display = "none";
            fin("investsdiv").style.width = "100%";
            fin("investsdiv").style.display = "none";
            fin("PHostdiv").style.display = "none";
        }, 1000);


        var acolor = document.getElementsByClassName("waves-effect");
        for (var i = 0; i < acolor.length; i++) {
            acolor[i].style.backgroundColor = "rgb(0, 0, 0)";
        }
        var omidaziat = document.getElementsByTagName("*");
        for (var i = 0; i < omidaziat.length; i++) {
            omidaziat[i].style.color = "white";
        }
        var cradbody = document.getElementsByClassName("card-body")
        backgroundo(cradbody, "none", "400px");
        var cradbody = document.getElementsByClassName("card border-left-primary shadow h-100 py-2")
        backgroundo(cradbody, "rgb(14 23 38)", "400px");


        var cradbody = document.getElementsByClassName("card mini-stat text-white")
        backgroundo(cradbody, "rgb(14 23 38)", "400px");

        var cradbody = document.getElementsByClassName("col-xl-3 col-md-6 mb-4")
        backgroundo(cradbody, "rgb(14 23 38)", "400px", "25px");
        var cradbody = document.getElementsByClassName("col-xl-3 col-md-6")
        backgroundo(cradbody, "none", "400px", "25px");


        function backgroundo(docu, ocolor, hei, margingbutom) {
            for (var i = 0; i < docu.length; i++) {
                if (ocolor && ocolor != "none")
                    docu[i].style.backgroundColor = ocolor;
                if (hei && hei != "none")
                    docu[i].style.height = hei;
                if (margingbutom && margingbutom != "none")
                    docu[i].style.marginBottom = margingbutom;
            }
        }
    </script>

</asp:Content>
