<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="AddPack.aspx.cs" Inherits="NM.Account.AddPack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
  <title>مخفی کردن جایگاه</title>

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
        <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">                  
          </div>          
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">تعریف پک درآمدی!</h1>
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
                <asp:Panel runat="server" ID="alarm" style="font-size:xx-large" CssClass="btn btn-danger btn-user btn-block">
                </asp:Panel>
                <a href="AddPack.aspx" >+جدید</a>
                <div class="form-group row">
                       <label for="Pass" class="col-form-label-sm" >Pass</label>
                            <asp:TextBox runat="server" class="form-control form-control-user"
                               ID="Pass" placeholder="Pass"></asp:TextBox>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                         <input name="PackName" type="text" runat="server" class="form-control form-control-user"
                                 id="PackName" placeholder="نام پک" required>
                    </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                         <input name="PackDsc" type="text" runat="server" class="form-control form-control-user"
                                 id="PackDsc" placeholder="توضیحات پک" required>
                    </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                         <input name="PackPrice" type="number" runat="server" class="form-control form-control-user"
                                 id="PackPrice" placeholder="قیمت پک" required>
                    </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="PackPic" class="col-form-label-sm" >عکس محصول</label>
                            <asp:FileUpload runat="server" ToolTip="عکس محصول"
                                 CssClass="form-control form-control-user" ID="PackPic" placeholder="عکس محصول" />
                        </div>
                     <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:DropDownList CssClass="dropdown" 
                                         runat="server" ID="PackType">
                                        <asp:ListItem Value="0" Selected="True" Text="انتخاب پک پایه"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="برنز"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="2" Text="برنز پلاس"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="نقره ای"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="4" Text="نقره ای پلاس"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="طلایی"></asp:ListItem>
                                        <asp:ListItem Enabled="false" Value="6" Text="طلایی پلاس"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="پلاتینیوم"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="PackId" runat="server"
                                    Style="color: red; font-size: large; font-family: 'BK'; font-style: italic;" CssClass="alert-success"></asp:Label>                                                                
                      </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:Button runat="server" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" Text="ذخیره" />                        
                <a class="small" href="index.aspx">برگشت به پنل کاربری</a>
            </div>
                </div>
                  <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                <asp:Literal runat="server" ID="lit"></asp:Literal>
                       <telerik:RadGrid AllowPaging="true" PageSize="40" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Packs_Grid" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"
             OnItemCommand="Packs_Grid_ItemCommand" OnItemDataBound="Packs_Grid_ItemDataBound"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="سریال" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:Label runat="server" ID="textid" Text='<%# Eval("Id") %>' />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                        
                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackName" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام پک" UniqueName="PackName">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackDsc" FilterControlAltText="Filter TemplateColumn column" HeaderText="توضیحات" UniqueName="PackDsc">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackType" FilterControlAltText="Filter TemplateColumn column" HeaderText="نوع پک" UniqueName="PackType">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="PackPrice" FilterControlAltText="Filter TemplateColumn column" HeaderText="قیمت" UniqueName="PackPrice">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                        <telerik:GridButtonColumn CommandName="Confirm" FilterControlAltText="Filter column9 column" HeaderText="اصلاح"                                                    
                             UniqueName="Confirm" DataTextField="Confirm" HeaderTooltip="اصلاح">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>
                          <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="انتخاب" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:Image Height="50px" Width="50px" runat="server" ID="packimg" />
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
        <%-- -----%>          
            </div>
        </div>
      </div>
    </div>    
</asp:Content>
