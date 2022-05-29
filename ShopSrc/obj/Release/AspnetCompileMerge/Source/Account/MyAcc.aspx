<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="MyAcc.aspx.cs" Inherits="NM.Account.MyAcc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>اصلاح اطلاعات کاربری</title>

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
label{
    color:white;
}
    </style>
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server" style="background-color:rgb(14 23 38);height:99vh">
    <br />
        <div class="card o-hidden border-0 shadow-lg my-5" style="">
      <div class="card-body p-0"  style="background-color:rgb(14 23 38)">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4 text-danger"> اطلاعات بانکی</h1>
                  <hr />
             
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
            <div  style="display:none" class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="UserName" class="col-form-label-sm" >نام کاربری سیستمی</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moaref" class="col-form-label-sm" >نام معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefusername" class="col-form-label-sm" >نام کاربری معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefphone" class="col-form-label-sm" >شماره تماس معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="Tsabt" class="col-form-label-sm" >تاریخ ثبت</label>                            
                        </div>
              </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="HesabName" class="col-form-label-sm" >نام دارنده حساب</label>
                            <input name="HesabName" type="text" runat="server" class="form-control form-control-user"
                                 id="HesabName" placeholder="نام دارنده حساب" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="HesabFamily" class="col-form-label-sm" >نام خانوادگی دارنده حساب</label>
                            <input name="HesabFamily" type="text" runat="server" class="form-control form-control-user"
                                 id="HesabFamily" placeholder="نام خانوادگی دارنده حساب" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="ShHesab" class="col-form-label-sm" >شماره حساب</label>
                        <input name="ShHesab" type="text" runat="server" class="form-control form-control-user"
                                 id="ShHesab" placeholder="شماره حساب">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="HCardNumber" class="col-form-label-sm" >شماره کارت</label>
                            <input name="HCardNumber" type="text" runat="server" class="form-control form-control-user"
                                 id="HCardNumber" placeholder="شماره کارت" required>
                        </div>
                    </div>
                <div class="form-group row">
                    <label for="shaba" class="col-form-label-sm">شماره شبا</label>
                    <input name="shaba" type="text" runat="server" class="form-control form-control-user"
                        id="shaba" placeholder="شماره شبا" required>
                </div>
               <div class="form-group row">
                    <label for="MVAdress" class="col-form-label-sm">آدرس ولت MTT</label>
                    <input name="MVAdress" type="text" runat="server" class="form-control form-control-user"
                        id="MVAdress" placeholder="آدرس ولت MTT" required>
                </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="اصلاح اطلاعات کاربری" />                       
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
                  <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
    </div>
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>    
</asp:Content>
