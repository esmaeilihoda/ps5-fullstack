<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="ShowOrders.aspx.cs" Inherits="Shop.Shop.Admin.ShowOrders" %>
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
                                                <telerik:GridBoundColumn DataField="Id"  FilterControlAltText="Filter TemplateColumn column"
                                                    HeaderText="سریال" UniqueName="Id" AllowFiltering="true">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center"  />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="USendStatus" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت ارسال"
                                                    UniqueName="USendStatus">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                               <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="تغییر وضعیت ارسال"  >
                                  
                                                    <ItemTemplate>
                                                        <%--<span class="fa fa-bank" onclick="Pay_Java(<%# Eval("Id")  %>, 0,<%# Eval("AmtNoDisc")  %>)"  id="PayVoucher_click" style="font-weight: bold; color: #425a42; border: 1px dashed; padding: 2px;cursor: pointer;" > درگاه بانک</span>--%>
                                                        <select class="form-control" style="width:100px;" onchange="ChangeSend(this,<%# Eval("Id")  %>)">
                                                            <option value="-1" selected>انتخاب کنید</option>
                                                            <option value="0">در حال بررسی</option>
                                                            <option value="1">ارسال به پست</option>
                                                            <option value="2">ارسال به آدرس پستی</option>
                                                            <option value="3">رسیده مرکز پستی</option>
                                                            <option value="4">تحویل شده</option>
                                                        </select>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 

                                                <telerik:GridBoundColumn DataField="UserName"  FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                                    UniqueName="UserName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridBoundColumn DataField="fullname" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربر"
                                                    UniqueName="fullname">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                  <telerik:GridBoundColumn DataField="OrderDate" DataFormatString="{0:####/##/##}" FilterControlAltText="Filter TemplateColumn column" HeaderText="تاریخ"
                                                    UniqueName="OrderDate">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                 <telerik:GridBoundColumn DataField="FStatus" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                                    UniqueName="FStatus">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                <telerik:GridBoundColumn DataField="mobile"  FilterControlAltText="Filter TemplateColumn column" HeaderText="تلفن همراه"
                                                    UniqueName="mobile">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                  <telerik:GridBoundColumn DataField="HostName" FilterControlAltText="Filter TemplateColumn column" HeaderText="دامنه"
                                                    UniqueName="HostName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                 
                                                 <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="نمایش محصولات فاکتور"  >
                                  
                                                    <ItemTemplate>
                                                        <a href="showorderitems?oid=<%# Eval("Id")  %>" target="_blank">نمایش</a>
                                                        
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                                                
                                               
                                               
                                                
                                                


                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                      <asp:Button ID="BtnSendChange" OnClick="BtnSendChange_Click" runat="server" Style="display:none" /> 
                                       <asp:HiddenField runat="server" ID="SendChangeHide" />
                                    </div>
</asp:Content>

