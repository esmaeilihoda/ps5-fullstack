<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="NM.Account.MyProfile" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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
                <h1 class="h4 text-gray-900 mb-4 text-danger">اصلاح اطلاعات کاربری</h1>
                  <hr />
                 <%-- <a href="index.aspx">برگشت به پنل کاربری</a>--%>
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
            <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="UserName" class="col-form-label-sm" >نام کاربری سیستمی</label>                            
                        </div>
                        <div style="display:none" class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moaref" class="col-form-label-sm" >نام معرف</label>                            
                        </div>
                        <div style="display:none" class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefusername" class="col-form-label-sm" >نام کاربری معرف</label>                            
                        </div>
                        <div style="display:none" class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="moarefphone" class="col-form-label-sm" >شماره تماس معرف</label>                            
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label runat="server" id="Tsabt" class="col-form-label-sm" >تاریخ ثبت</label>                            
                        </div>
              </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="name" class="col-form-label-sm" >نام</label>
                            <input name="name" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="name" placeholder="نام" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Fname" class="col-form-label-sm" >نام خانوادگی</label>
                            <input name="Fname" type="text" readonly="readonly" runat="server" class="form-control form-control-user"
                                 id="Fname" placeholder="نام خانوادگی" required>
                        </div>
                    </div>
                   <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="sex" class="col-form-label-sm" >جنسیت</label>
                            <asp:DropDownList runat="server" ID="sex" CssClass="form-control dropdown-list">
                                <asp:ListItem Selected="True" Text="انتخاب" Value="-1">
                                </asp:ListItem>
                                <asp:ListItem Text="مرد" Value="0">
                                </asp:ListItem>
                                <asp:ListItem Text="زن" Value="1">
                                </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="fathername" class="col-form-label-sm" >نام پدر</label>
                            <input name="fathername" type="text" runat="server" class="form-control form-control-user"
                                 id="fathername" placeholder="نام پدر" required>
                        </div>
                    </div>
              <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="varename" class="col-form-label-sm" >نام وارث</label>
                            <input name="varename" type="text" runat="server" class="form-control form-control-user"
                                 id="varename" placeholder="نام وارث" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="varescode" class="col-form-label-sm" >کد ملی وارث</label>
                            <input name="varescode" type="text" runat="server" class="form-control form-control-user"
                                 id="varescode" placeholder="کد ملی وارث" required>
                        </div>
                    </div>
                  <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="city" class="col-form-label-sm" >شهر</label>
                            <input name="city" type="text" runat="server" class="form-control form-control-user"
                                 id="city" placeholder="شهر" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="address" class="col-form-label-sm" >آدرس</label>
                            <input name="address" type="text" runat="server" class="form-control form-control-user"
                                 id="address" placeholder="آدرس" required>
                        </div>
                    </div>
                     <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="postalcode" class="col-form-label-sm" >کد پستی</label>
                            <input name="postalcode" type="text" runat="server" class="form-control form-control-user"
                                 id="postalcode" placeholder="کد پستی" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label style="display:none" for="companysign" class="col-form-label-sm" >استفاده از امضای شرکت</label>
                            <input visible="false" name="companysign" type="text" runat="server" class="form-control form-control-user"
                                 id="companysign" placeholder="استفاده از امضای شرکت" required>
                          <label for="BirthDate" class="col-form-label-sm" >تاریخ تولد</label><br />
                            <telerik:RadMaskedTextBox EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false"
                                 runat="server" Mask="####/##/##" ID="BirthDate" class="form-control form-control-user" >
                            </telerik:RadMaskedTextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Name" class="col-form-label-sm" >Name</label>
                            <input name="Ename" type="text" runat="server" class="form-control form-control-user"
                                 id="Ename" placeholder="Name" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Family" class="col-form-label-sm" >Family</label>
                            <input name="EFname" type="text" runat="server" class="form-control form-control-user"
                                 id="EFname" placeholder="Family" required>
                        </div>
                    </div>
                <script>
                    $(document).ready(function () {
                        $('.Nationality').on('change', function () {
                            if ($("input[name='ctl00$CCPH$NationalityGroup']:checked").val() == 2) {
                                $("label[for='NationalCode']").text("کد اختصاصی هر فرد یا شماره گذرنامه");
                            }
                            if ($("input[name='ctl00$CCPH$NationalityGroup']:checked").val() == 1) {
                                $("label[for='NationalCode']").text("کد ملی");
                            }
                            //if ($("input[name='ctl00$CCPH$NationalityGroup']").is(':checked')) {
                            //    $("#CCPH_NationalCode").prop("disabled", false);
                            //}
                        });
                    });
                </script>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label class="col-form-label-sm" >ملیت: </label>
                            <asp:RadioButton id="Nationality1" class="Nationality" runat="server" GroupName="NationalityGroup" Text="ایرانی" value="1"></asp:RadioButton>
                            <asp:RadioButton id="Nationality2" class="Nationality" runat="server" GroupName="NationalityGroup" Text="اتباع" value="2"></asp:RadioButton>
                            <br/>
                            <label for="NationalCode" class="col-form-label-sm" >کد ملی</label>
                            <input name="NationalCode" type="text" runat="server" class="form-control form-control-user"
                                 id="NationalCode" placeholder="کد ملی"  >
                        </div>
                       
                        <div class="col-sm-6 mb-3 mb-sm-0">
                             <br/>
                            <br/>
                            <label for="email" class="col-form-label-sm" >ایمیل</label>
                            <input name="email" type="email" runat="server" class="form-control form-control-user"
                                 id="email" placeholder="ایمیل" required>
                        </div>
                    </div>
<%--                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="ShHesab" class="col-form-label-sm" >شماره حساب</label>
                        <input name="ShHesab" type="text" runat="server" class="form-control form-control-user"
                                 id="ShHesab" placeholder="شماره حساب">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="shaba" class="col-form-label-sm" >شماره شبا</label>
                            <input name="shaba" type="text" runat="server" class="form-control form-control-user"
                                 id="shaba" placeholder="شماره شبا" required>
                        </div>
                    </div>--%>
                     <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Pfscan" class="col-form-label-sm" >اسکن عکس پرسنلی</label>
                            <asp:FileUpload runat="server" ToolTip="اسکن عکس پرسنلی"
                                 CssClass="form-control form-control-user" ID="Pfscan" placeholder="اسکن عکس پرسنلی" />
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="PFIMG" class="col-form-label-sm">نمایش فایل اسکن شده پروفایل</label>
                            <asp:Image CssClass="form-control rounded-circle" Height="100" Width="120"
                                  runat="server" ID="PFIMG" />
                        </div>
                    </div>
                  
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Tell" class="col-form-label-sm" >شماره موبایل</label>
                            <input name="Tell" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="Tell" placeholder="شماره موبایل" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="scan" class="col-form-label-sm" >اسکن کارت ملی</label>
                            <asp:FileUpload runat="server" ToolTip="اسکن کارت ملی"
                                 CssClass="form-control form-control-user" ID="scan" placeholder="اسکن کارت ملی" />
                        </div>
                    </div>
            <div class="form-group row">
                <a runat="server" visible="false" id="ffa" href="#" class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50"></span>
                    <span runat="server" onclick="alarmclick();" id="alarm" class="text"></span>
                </a>
                <label for="scanimage" class="col-form-label-sm"> نمایش فایل اسکن شده کارت شناسایی</label>
                <asp:Image Height="200" Width="100%" runat="server" ID="scanimage" />
            </div>
            <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="اصلاح اطلاعات کاربری" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetMN" OnClick="GetMN_Click" Style="display: none" />
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
