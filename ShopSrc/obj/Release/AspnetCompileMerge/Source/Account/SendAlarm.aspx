<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="SendAlarm.aspx.cs" Inherits="NM.Account.SendAlarm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>ارسال اطلاعیه</title>

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
                <h1 class="h4 text-gray-900 mb-4">ارسال اطلاعیه به کلیه کاربران!</h1>
                  <hr />
              </div>        
            <asp:ScriptManager runat="server" ID="saca">
                  <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
            </asp:ScriptManager>
            <%-- نننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننننن --%>
            <asp:UpdatePanel runat="server" ID="reguppanel">
                <ContentTemplate>
                                            <!-- end col -->
         
                    <div class="row">   
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
                             DataField="Id" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال" UniqueName="Id">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle  Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridButtonColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataTextField="Message" FilterControlAltText="Filter TemplateColumn column"
                             HeaderText="پیام" UniqueName="family">
                            <HeaderStyle  Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle  BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>
                        
                        <telerik:GridButtonColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataTextField="Delet" CommandName="Delete" FilterControlAltText="Filter TemplateColumn column"
                             HeaderText="حذف" UniqueName="family" ConfirmText="آیا برای حذف مطمئن هستید؟!" >
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
                </div>
                  <div class="form-group row">                        
                            <label for="Id" class="col-form-label-sm" >سریال</label>
                            <input name="Id" readonly="readonly" onchange="getnamesclick();" type="text" runat="server" 
                                class="form-control form-control-user"
                                 id="Id" placeholder="سریال">                                              
                    </div>
                    <div class="form-group row">                        
                            <label for="Mess" class="col-form-label-sm" >متن پیام</label>
                            <input name="Mess" type="text" runat="server" 
                                class="form-control form-control-user"
                                 id="Mess" placeholder="متن پیام">                                              
                    </div>
                <div class="form-group row">
                        <%--<telerik:RadCaptcha ID="RadCaptcha1" runat="server"></telerik:RadCaptcha>--%>
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ارسال" />                                                                 
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
