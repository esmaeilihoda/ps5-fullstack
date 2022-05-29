<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="ShowPHost.aspx.cs" Inherits="Shop.Account.ShowPHost" %>

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
             
       
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CCPH" runat="server">   
            <div class="card o-hidden border-0 shadow-lg my-5">
               
                   
                    
                 <div class="col-xl-3 col-md-6">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="cardico">
                            <img src="../images/cradbody/TeamIco.png" style="height: 147px;margin-right: 114px;" />
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

             
                
            </div>

</asp:Content>

   
