<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="ActivePlace.aspx.cs" Inherits="NM.Account.ActivePlace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CCPH" runat="server">
    <style type="text/css">   
    .col-lg-4{
        text-align:center;
        font-size:larger;
        
    }
    .text-white{
     cursor:pointer; 
     text-align:center;
     border-radius:30px;
    }
     </style>
    
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
        function RCode_Change() {
            document.getElementById("GetRName").click();
        }
    </script>

     <script type="text/javascript">
         function packclick(packno) {
             document.getElementById("PNO").value = packno;
             document.getElementById("ByPack").click();
         }
     </script>
    <asp:ScriptManager runat="server" ID="SMH">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager>
      <div id="content">
                <div class="col-lg-4" style="min-width:50%">
              <!-- Background Gradient Utilities -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" style="font-size:x-large">لیست پک های موجود درآمدزایی جهت خریداری</h6>
                </div>
                <div class="card-body">
                    
                  <asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>
                    <asp:Button runat="server" ID="ByPack" ClientIDMode="Static" OnClick="ByPack_Click" style="display:none;" />
                  <asp:HiddenField runat="server" ID="PNO" ClientIDMode="Static" />
                    <div class="row"><div class="col-xl-9">
                        <a runat="server" visible="false" id="ffa" class="btn btn-danger btn-icon-split">
                                    <span class="icon text-white-50"></span>
                                    <span runat="server" onclick="alarmclick();" style="" id="alarm" class="text"></span>
                                    </a>
                     </div></div>
                     <div class="row">
                        <div runat="server" id="DivPay" class="col-xl-9">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input visible="false" name="D_Code" type="text" onchange="RCode_Change();" runat="server" class="form-control form-control-user"
                                        id="D_Code" placeholder="کد ثبت موقعیت">
                                </div>
                                <asp:Label ID="D_Name" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>                                                                
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList Visible="false" CssClass="dropdown" OnSelectedIndexChanged="PackNo_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server" ID="PackNo">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب پک"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="برنز"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="برنز پلاس"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="نقره ای"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="نقره ای پلاس"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="طلایی"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="طلایی پلاس"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="پلاتینیوم"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="PackLbl" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic" CssClass="alert-success"></asp:Label>                                                                
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList Visible="false" CssClass="dropdown" runat="server" ID="PayType">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب نحوه پرداخت"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled ="false" Text="از محل وام"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="زرین پال"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="کیف پول"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="مقروضی"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="MTT"></asp:ListItem>
                                        <asp:ListItem Value="4" Enabled="false" Text="استارت آپ"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />                                    

                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                                    <asp:Button runat="server" OnClick="ByPack_Click" ID="Register" OnClientClick="document.forms[0].target = '_blank';" class="btn btn-primary btn-user btn-block" Text="خرید پک درآمدی" />
                </div>
                </div>
                </div>
     </div>
</asp:Content>
