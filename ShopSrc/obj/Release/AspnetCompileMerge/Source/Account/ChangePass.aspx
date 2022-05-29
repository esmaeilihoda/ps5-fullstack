<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="NM.Account.ChangePass" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-7">
            <div class="p-5" style="background-color:rgb(14 23 38);border-radius:25px;border-style:double;border-color:red">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4 text-danger">درخواست تغییر رمز کاربری</h1>
                  <hr />
              </div>        
            <asp:ScriptManager runat="server" ID="saca"></asp:ScriptManager>
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
                            <label for="Pass" class="col-form-label-sm" >پسورد قبلی</label>
                            <input name="Pass" type="text" runat="server" class="form-control form-control-user"
                                 id="Pass" placeholder="پسورد قبلی" required>                        
                    </div>
                <div class="form-group row">
                            <label for="NPass" class="col-form-label-sm" >پسورد جدید</label>
                            <input name="NPass" type="text" runat="server" class="form-control form-control-user"
                               id="NPass" placeholder="پسورد جدید" required></input>
                </div>
                     <div class="form-group row">                        
                           <label for="RNPass" class="col-form-label-sm" >تکرار پسورد جدید</label>
                            <input name="RNPass" type="text" runat="server" class="form-control form-control-user"
                               id="RNPass" placeholder="تکرار پسورد جدید" required></input>                        
                     </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="تغییر رمز" />                        
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
</asp:Content>
