<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="NM.Account.SendMessage" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>ارسال پیامک</title>

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
        function textcounter() {
            var rezcounter = fin("CCPH_MContent").value.length;            
            var cc = rezcounter / 70;            
            cc = parseInt(cc);
            if (cc == 0) cc = 1; else if ((rezcounter / 70) > 1) cc++;
            fin("pmlen").innerText = cc + "/" + rezcounter;
        }
        function getnamesclick() {
            fin("getnames").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">          
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">ارسال پیامک!</h1>
                  <hr />
              </div>        
            <asp:ScriptManager runat="server" ID="saca"></asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>
                    <div class="form-group row">
                           <div class="col-md-4">
                                                <div class="float-right d-md-block">
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="ti-filter mr-1"></i> فیلتر
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated">
                                                            <asp:Button runat="server" ID="hame" OnClick="hame_Click"
                                                                 Text="انتخاب همه" class="dropdown-item" />
                                                            <div class="dropdown-divider"></div>
                                                            <asp:Button runat="server" ID="Nha" OnClick="Nha_Click"
                                                                 Text="پاک کردن همه" class="dropdown-item" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                             </div>
                                            <!-- end col -->
         
                    <div class="form-group row">   
          <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Marketers_Grid" runat="server" AutoGenerateColumns="False"
                Font-Names="BK" 
               AllowFilteringByColumn="True" 
            OnNeedDataSource="Marketers_Grid_NeedDataSource" OnPageIndexChanged="Marketers_Grid_PageIndexChanged"
               OnItemCommand="Marketers_Grid_ItemCommand"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="name" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام" UniqueName="name">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle  Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="family" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام خانوادگی" UniqueName="family">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="Mobile" FilterControlAltText="Filter column3 column" HeaderText="موبایل" UniqueName="Mobile">
                            <HeaderStyle Width="40px" HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridNumericColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="انتخاب" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:CheckBox runat="server" Checked='<%# Eval("CHK") %>' ID="CHK" />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
                </div>
                    <div class="form-group row">                        
                            <label for="Number" class="col-form-label-sm" >شماره موبایل</label>
                            <input name="Number" onchange="getnamesclick();" type="text" runat="server" 
                                class="form-control form-control-user"
                                 id="Number" placeholder="درصورت تمایل به ارسال بیش از یک شماره آنها را با , جداکنید"> 
                           <label id="names" runat="server" for="Number" class="col-form-label-sm" >شماره موبایل</label>                    
                    </div>
                <div class="form-group row">
                            <label for="MContent" class="col-form-label-sm" >متن پیام</label>
                            <textarea name="MContent" type="text" runat="server" class="form-control form-control-user"
                               id="MContent" style="min-height:200px" onkeyup="textcounter();" placeholder="متن پیام"></textarea>
                    <label id="pmlen" for="Attachment" class="col-form-label-sm" ></label>         
                </div><label for="MContent" class="col-form-label-sm" >جهت قراردادن نام از name و جهت قرار دادن نام خانوادگی از family استفاده کنید!</label>
                     <div class="form-group row">                                                                                              
                     </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ارسال" />                        
                     <asp:Button runat="server" OnClick="send2grid_Click" ID="send2grid" class="btn btn-primary btn-user btn-block" Text="ارسال به جدول" />                        
                         <asp:Button ClientIDMode="Static" runat="server" OnClick="getnames_Click" ID="getnames" style="display:none" />                        
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
                  </ContentTemplate>
            </asp:UpdatePanel>
                <asp:Literal runat="server" ID="lit"></asp:Literal>
    </div>
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>    
</asp:Content>
