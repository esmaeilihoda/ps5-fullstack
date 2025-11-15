<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="InvestProccess.aspx.cs" Inherits="NM.Account.InvestProccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>پلن سرمایه گذاری</title>

  <!-- Custom fonts for this template-->
  <!-- Custom styles for this template-->
    <style type="text/css">
        @font-face {
	font-family: 'BK';
	src: 
	url('../Fonts/BKoodakBold.ttf') 
	format('opentype');
}
*{
    font-family:BK;
    direction:rtl;
}
.bg-register-image {
    background: url('img/wse-logo.png');
     background-position: center; 
    background-repeat:no-repeat;
    width:500px;
    height:500px;
}
    </style>
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <asp:UpdatePanel runat="server" ID="up1"><ContentTemplate>
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-11">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Investing!</h1>
                  <hr />
              </div>        
            <asp:ScriptManager runat="server" ID="saca">
                  <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
            </asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <%--<asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>--%>  
                 <div runat="server" id="coinsprice" class="row">
                                <%
                                    NM.Account.iindex ind = new NM.Account.iindex();
                                    System.Data.DataView cdv = ind.coinsdv();
                                    foreach (System.Data.DataRowView cdr in cdv)
                                    {
                                        if (cdr["currencyname"].ToString() == "تتر")
                                        {
                                         %>
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><%=cdr["currencyname"].ToString() %></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cdr["PriceUSD"].ToString() + "$" %></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-coins fa-2x text-gray-300" style="color:cornflowerblue"><%=cdr["sample"].ToString() %></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}
    } %>
                  </div> 
                   <div class="form-group row">
                            <label for="TContent" class="col-form-label-sm" >تاریخ پردازش</label>
                            <input name="TContent" runat="server" onchange="document.getElementById('amtchanege').click();"
                                 class="form-control form-control-user"
                               id="TP" placeholder="تاریخ پردازش" />
                   </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" 
                            class="btn btn-primary btn-user btn-block" Text="شروع پردازش" />                        
                        <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
                </div>
                  <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                <asp:Literal runat="server" ID="lit"></asp:Literal>
    </div>
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>  
        </ContentTemplate></asp:UpdatePanel>  
</asp:Content>
