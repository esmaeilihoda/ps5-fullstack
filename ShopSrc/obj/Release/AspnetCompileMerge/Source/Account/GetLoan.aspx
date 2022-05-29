<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetLoan.aspx.cs" Inherits="NM.Account.GetLoan" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html lang="en">
    
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>فرم درخواست وام</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <%--<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">--%>

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
</head>

<body  style="background-color:black">

  <div class="container" style="background-color:black">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0" style="background-color:rgb(14 23 38)">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 mb-4" style="color:red">درخواست وام</h1>
                  <hr />
                  <%--<a href="index.aspx">برگشت به پنل کاربری</a>--%>
                  <hr />
              </div>
        <form id="form1" runat="server" class="user">
            <asp:ScriptManager runat="server" ID="saca">
                  <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
            </asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>
            <div style="display:none" class="form-group row">
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
                            <label for="name" class="col-form-label-sm" >نام</label>
                            <input name="name" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="name" placeholder="نام" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="Fname" class="col-form-label-sm" >نام خانوادگی</label>
                            <input name="Fname" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="Fname" placeholder="نام خانوادگی" required>
                        </div>
                    </div>
                   <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="sex" class="col-form-label-sm" >جنسیت</label>
                            <asp:DropDownList Enabled="false" runat="server" ID="sex" CssClass="form-control dropdown-list">
                                <asp:ListItem Selected="True" Text="انتخاب" Value="-1">
                                </asp:ListItem>
                                <asp:ListItem  Text="مرد" Value="0">
                                </asp:ListItem>
                                <asp:ListItem  Text="زن" Value="1">
                                </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="fathername" class="col-form-label-sm" >نام پدر</label>
                            <input name="fathername" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="fathername" placeholder="نام پدر" required>
                        </div>
                    </div>
              <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="ShShenas" class="col-form-label-sm" >ش.ش</label>
                            <input name="ShShenas" type="text" runat="server" class="form-control form-control-user"
                                 id="ShShenas" placeholder="شماره شناسنامه" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="BirthDate" class="col-form-label-sm" >تاریخ تولد</label><br />
                            <telerik:RadMaskedTextBox ReadOnly="true" runat="server" Mask="####/##/##" ID="BirthDate" class="form-control form-control-user" >
                            </telerik:RadMaskedTextBox>
            </div>
                    </div>
                  <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="city" class="col-form-label-sm" >شهر</label>
                            <input name="city" type="text" runat="server" readonly="readonly" class="form-control form-control-user"
                                 id="city" placeholder="شهر" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="address" class="col-form-label-sm" >آدرس</label>
                            <input name="address" type="text" readonly="readonly" runat="server" class="form-control form-control-user"
                                 id="address" placeholder="آدرس" required>
                        </div>
                    </div>
                     <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="postalcode" class="col-form-label-sm" >کد پستی</label>
                            <input name="postalcode" type="text" runat="server" readonly="readonly" class="form-control form-control-user"
                                 id="postalcode" placeholder="کد پستی" required>
                        </div>          
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            تعداد نفرات سمت راست
                            <input name="Rchild" type="text" readonly="readonly" runat="server" class="form-control form-control-user"
                                 id="Rchild" placeholder="" required>
                        </div>           
                    </div>    
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            تعداد نفرات سمت چپ
                            <input name="Lchild" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="Lchild" placeholder="" required>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="LegName" class="col-form-label-sm" >نام و نام خانوادگی لگ محترم</label>
                            <input name="LegName" type="text" runat="server" class="form-control form-control-user"
                                 id="LegName" placeholder="لگ" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="NationalCode" class="col-form-label-sm" >کد ملی</label>
                            <input name="NationalCode" readonly="readonly" type="text" runat="server" class="form-control form-control-user"
                                 id="NationalCode" placeholder="کد ملی">
                        </div>
                         <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="sex" class="col-form-label-sm" >نوع وام</label>
                            <asp:DropDownList OnSelectedIndexChanged="LoanType_SelectedIndexChanged"
                                 runat="server" ID="LoanType" CssClass="form-control dropdown-list" AutoPostBack="true" >
                                <asp:ListItem Selected="True" Text="انتخاب" Value="-1">
                                </asp:ListItem>
                                <asp:ListItem Text="کمک هزینه درمان و زیبایی 7،500،000 تومان" Value="0">
                                </asp:ListItem>
                                <asp:ListItem Text="مشارکت در طرح های اقتصادی شرکت 30،000،000 تومان" Value="1">
                                </asp:ListItem>
                                <asp:ListItem Text="کمک هزینه درمان و زیبایی 6،000،000 تومان" Value="2">
                                </asp:ListItem>
                            </asp:DropDownList>
                            <label runat="server" id="loantdsc" class="col-form-label-sm" ></label>
                        </div>
                         <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="CheckoutType" class="col-form-label-sm" >نوع تسویه حساب</label>
                            <asp:DropDownList runat="server" ID="CheckoutType" CssClass="form-control dropdown-list">
                                <asp:ListItem Selected="True" Text="انتخاب" Value="-1">
                                </asp:ListItem>
                                <asp:ListItem Text="12 ماهه سرمایه گذاری با سود 4 درصد ماهیانه" Value="1">
                                </asp:ListItem>
                                <asp:ListItem Text="12 ماهه آزاد" Value="2">
                                </asp:ListItem>
                                <asp:ListItem Text="24 ماهه سرمایه گذاری با سود 5 درصد ماهیانه" Value="3">
                                </asp:ListItem>
                                <asp:ListItem Text="24 ماهه آزاد" Value="4">
                                </asp:ListItem>
                      <%--          <asp:ListItem Text="36 ماهه سرمایه گذاری با سود 4 درصد ماهیانه" Value="5">
                                </asp:ListItem>
                                <asp:ListItem Text="36 ماهه فریز{فریز کل مبلغ به مدت 36 ماه نزد شرکت و پرداخت اقساط توسط خود شرکت} " Value="6">
                                </asp:ListItem>
                                <asp:ListItem Text="36 ماهه آزاد" Value="7">
                                </asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
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
                            <label for="Pfscan" class="col-form-label-sm" >اسکن عکس </label>
&nbsp;<asp:FileUpload Enabled="false" runat="server" ToolTip="اسکن عکس پرسنلی"
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
                            <asp:FileUpload Enabled="false" runat="server" ToolTip="اسکن کارت ملی"
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
               <label for="scan" class="col-form-label-sm" >قوانین و مقررات</label>
                <textarea runat="server" id="texra" class="form-control form-control" style="height:500px" >
                    1.اطلاعات پروفایل خود را در بخش پروفایل تکمیل نمایید چون اطلاعات موجود از بخش پروفایل میز کار شما فراخوانی میشود و صحت اطلاعات موجود برعهده شخص وام گیرنده میباشد
                    در صورت مغایرت هر کدام از اطلاعات اظهار شده تمامی عواقب آن برعهده شخص وام گیرنده خواهد بود.
                    2.مدارکی که ثابت بکند شما میتوانید اقساط را پرداخت کنید را بهمراه داشته باشد (گردش حساب یا پروانه کسب و یا فیش حقوقی)
                </textarea>
                <asp:CheckBox ID="gconfirm" runat="server" Text="قوانین و مقررات را خوانده و مورد قبول اینجانب میباشد" />
            </div>
            <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ارسال درخواست" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetRName" OnClick="GetRName_Click" Style="display: none" />
                        <asp:Button runat="server" ClientIDMode="Static" ID="GetMN" OnClick="GetMN_Click" Style="display: none" />
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
                 <div class="row">
             <div class="col-xl-9">        
          <telerik:RadGrid AllowPaging="true" PageSize="40" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Loans_Grid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
            OnItemCommand="Loans_Grid_ItemCommand"             
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="Id" UniqueName="Id">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" Font-Size="Small"  HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="LoanType" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نوع وام" UniqueName="LoanType">
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" Font-Size="Small"  HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridNumericColumn DataField="LoanTypeText" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlAltText="Filter column3 column" HeaderText="شرح وام" UniqueName="LoanTypeText">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridNumericColumn>

                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نوع تسویه" UniqueName="CheckoutText" DataField="CheckoutText" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="وضعیت" UniqueName="RStatus" DataField="RStatus" HeaderTooltip="">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" Font-Size="Small"  />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Small" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridBoundColumn>
                                             
                        <telerik:GridButtonColumn CommandName="Maghroozi" FilterControlAltText="Filter column9 column" HeaderText="ت.م"
                             ConfirmText="آیا برای اصلاح مطمئن هستید؟!!!"                          
                             UniqueName="Maghroozi" DataTextField="Id" HeaderTooltip="اصلاح وام">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" 
                                HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>


                    </Columns>
                </MasterTableView>
            </telerik:RadGrid></div></div>
                  </ContentTemplate>
            </asp:UpdatePanel>
            </form>
    </div>
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
    <script type="text/javascript">

    </script>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
