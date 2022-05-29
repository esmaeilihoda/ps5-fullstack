<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="showTurbo.aspx.cs" Inherits="Shop.Shop.Admin.showTurbo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript">
        function ChangeSend(sel, rowid) {
            if (sel.value == "-1") {
                alert("لطفا یکی از وضعیت های ارسال را انتخاب نمایید");
                return;
            }
            var res = confirm("آیا از تغییر وضعیت ارسال این فاکتور اطمینان دارید؟");
            if (res == true) {
                $("#CCPH_SendChangeHide").val(sel.value + ',' + rowid);
                $("#CCPH_BtnSendChange").click();
            }
           
        }
        
    </script>
    <div class="col-12 " style="margin-top:85px;width: 100%; overflow-x: auto;" >
         <asp:ScriptManager runat="server" ID="UCCPH"></asp:ScriptManager>
                                       <telerik:RadGrid AllowPaging="true" Height="100%" Width="100%" LiveResize="true" VisibleDuringInit="false" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                                        ID="ShowOrdersGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                                        OnNeedDataSource="ShowOrdersGrid_NeedDataSource" OnItemCommand="ShowOrdersGrid_ItemCommand"
                                                     Skin="Glow"
                                          BorderStyle="Inset" AllowSorting="True">
                                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <HeaderStyle Font-Size="Small" />
                                        <MasterTableView AllowFilteringByColumn="true">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="USERNAME"  FilterControlAltText="Filter TemplateColumn column"
                                                    HeaderText="نام کاربری" UniqueName="USERNAME" AllowFiltering="true">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center"  />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                                                             

                                                <telerik:GridBoundColumn DataField="FullName"  FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربر"
                                                    UniqueName="FullName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridBoundColumn DataField="income" FilterControlAltText="Filter TemplateColumn column" HeaderText="درآمد"
                                                    UniqueName="income">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                  <telerik:GridBoundColumn DataField="DateP" DataFormatString="{0:####/##/##}" FilterControlAltText="Filter TemplateColumn column" HeaderText="تاریخ"
                                                    UniqueName="DateP">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                     
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                     
                                    </div>
</asp:Content>

