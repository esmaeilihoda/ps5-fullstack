<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="ProccessPercentHost.aspx.cs" Inherits="Shop.Account.ProccessPercentHost" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">

    <div class="col-12 " style="margin-top: 85px; width: 100%; overflow-x: auto;">
        <asp:ScriptManager runat="server" ID="UCCPH"></asp:ScriptManager>
        <telerik:RadGrid allowpaging="true" height="100%" width="100%" liveresize="true" visibleduringinit="false" pagesize="20" clientsettings-allowkeyboardnavigation="true"
            id="ShowProccessPercentHost" runat="server" autogeneratecolumns="False" grouppanelposition="Top" font-names="BK" font-overline="False"
            OnNeedDataSource="ShowProccessPercentHost_NeedDataSource" OnItemCommand="ShowProccessPercentHost_ItemCommand"
            skin="Glow"
            BorderStyle="Inset" allowsorting="True">
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
                                                <telerik:GridBoundColumn DataField="MID" FilterControlAltText="Filter TemplateColumn column" HeaderText="کد کاربر"
                                                    UniqueName="MID">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                               <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="تغییر وضعیت پرداخت"  >
                                  
                                                    <ItemTemplate>
                                                       
                                                        <%--<select class="form-control" style="width:100px;" onchange="ChangeSend(this,<%# Eval("Id")  %>)">
                                                            <option value="-1" selected>انتخاب کنید</option>
                                                            <option value="0">پرداخت نشده</option>
                                                            <option value="1">پرداخت شد</option>
                                                            
                                                        </select>--%>
                                                        <asp:DropDownList class="form-control" style="width:100px;" ID="ChangePay" runat="server" SelectedValue='<%# Eval("PayStatus") %>'>
                                                            <asp:ListItem Value="-1" Text="انتخاب کنید"></asp:ListItem>
                                                            <asp:ListItem Value="0" Text="پرداخت نشده"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="پرداخت شد"></asp:ListItem>
                                                            
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="توضیحات"  >
                                                        
                                                    <ItemTemplate>
                                                       <asp:TextBox runat="server" Text='  <%# Eval("Dsc")  %>' ID="Dscc" Width="210" CssClass="form-control" style="color:black"></asp:TextBox>
                                                       
                                                        
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="کد رهگیری"  >
                                  
                                                    <ItemTemplate>
                                                       <asp:TextBox runat="server" Text='  <%# Eval("TrackingCode")  %>' ID="tracingcode" Width="110" CssClass="form-control" style="color:black"></asp:TextBox>
                                                        
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="تاریخ پرداخت"  >
                                  
                                                    <ItemTemplate>
                                                       <telerik:RadMaskedTextBox runat="server" Mask="####/##/##" ID="DatePPay" Width="80" class="form-control-user" CssClass="form-control" Text='  <%# Eval("DatePPay")  %>'>
                                        </telerik:RadMaskedTextBox>
                                                        
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                                                <telerik:GridButtonColumn HeaderText="ثبت" DataTextField="ok" UniqueName="ok" CommandName="BtnChangeState">
                                                    
                                                </telerik:GridButtonColumn>

                                                <telerik:GridBoundColumn DataField="FullName"  FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربر"
                                                    UniqueName="FullName">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridBoundColumn DataField="Income" FilterControlAltText="Filter TemplateColumn column" HeaderText="مبلغ درخواستی"
                                                    UniqueName="Income">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>

                                                  <telerik:GridBoundColumn DataField="DatePReq" DataFormatString="{0:####/##/##}" FilterControlAltText="Filter TemplateColumn column" HeaderText="تاریخ"
                                                    UniqueName="DatePReq">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                 <telerik:GridBoundColumn DataField="TPAYSTATUS" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                                    UniqueName="TPAYSTATUS">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                <telerik:GridBoundColumn DataField="DRsubdomain"  FilterControlAltText="Filter TemplateColumn column" HeaderText="دامنه"
                                                    UniqueName="DRsubdomain">
                                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                                </telerik:GridBoundColumn>
                                                
                                                  
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
       <%-- <asp:Button ID="BtnSendChange" OnClick="BtnSendChange_Click" runat="server" Style="display: none" />
        <asp:HiddenField runat="server" ID="SendChangeHide" />--%>
    </div>
</asp:Content>
