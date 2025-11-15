<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/Admin/SAM.Master" AutoEventWireup="true" CodeBehind="ShowOrderItems.aspx.cs" Inherits="Shop.Shop.Admin.ShowOrderItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">

    <div class="col-12 bg-dangeer " style="margin-top: 85px;overflow-x: auto;">

        <%--   <%
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {%>
        
        <div class="your-order-table table-responsive" id="dvfac" style="overflow: hidden;">
            <div class="col-12 checkoutrightpanel">
                <div class="row">
                    <div class="col-4 col-md-2">
                        <img src="/Shop/ShopImages/mahsoolat/frecnhleadr.jpg" class="factor-img-mahsol img-fluid"></div>
                    <div class="col-8 col-md-10 ">
                        <h6><%  Response.Write(dt.Rows[i]["PName"].ToString()); %></h6>
                        <p class="mt-2">تعداد: <%  Response.Write(dt.Rows[i]["Qty"].ToString()); %></p>
                        <h5 class="mt-5 text-left"><%  Response.Write(dt.Rows[i]["Amt"].ToString()); %> تومان</h5>
                    </div>
                </div>
            </div>
        </div>
        <%             }
        %>--%>

        <asp:ScriptManager runat="server" ID="UCCPH"></asp:ScriptManager>
        <telerik:RadGrid AllowPaging="true" Height="100%" Width="100%" LiveResize="true" VisibleDuringInit="false" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
            ID="ShowOrderItemsGrid" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
            OnNeedDataSource="ShowOrderItemsGrid_NeedDataSource" OnItemCommand="ShowOrderItemsGrid_ItemCommand"
            Skin="WebBlue"
            BorderStyle="Inset" AllowSorting="True">
            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <HeaderStyle Font-Size="Small" />
            <MasterTableView AllowFilteringByColumn="true">
                <Columns>
                   
                    <telerik:GridBoundColumn DataField="OId" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال فاکتور"
                        UniqueName="OId" >
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center" Width="20px" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="PId" FilterControlAltText="Filter TemplateColumn column" HeaderText="سریال محصول"
                        UniqueName="PId">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center"  Width="20px" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="PName" FilterControlAltText="Filter TemplateColumn column" HeaderText=" محصول"
                        UniqueName="PName">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Property" FilterControlAltText="Filter TemplateColumn column" HeaderText=" ویژگی"
                        UniqueName="Property" ColumnValidationSettings-ModelErrorMessage-CssClass="whitespace:pre">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center"  />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center"  />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CNT" FilterControlAltText="Filter TemplateColumn column" HeaderText=" تعداد"
                        UniqueName="CNT">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="NPrice" FilterControlAltText="Filter TemplateColumn column" HeaderText=" مبلغ"
                        UniqueName="NPrice">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="OrderDate" DataFormatString="{0:####/##/##}" FilterControlAltText="Filter TemplateColumn column" HeaderText="تاریخ"
                        UniqueName="OrderDate">
                        <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                        <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br/>
        <div class="col-12" >
            <table    style="width:100%" class="table table-strinped text-left">
                <tr>
                    <th style="width:120px;" >شماره فاکتور</th>
                    <td> <% Response.Write(dv[0]["Fid"].ToString()); %> </td>
                </tr>
                <tr>
                    <th style="width:120px;" >نام و نام خانوادگی</th>
                    <td> <% Response.Write(dv[0]["fullname"].ToString()); %> </td>
                </tr>
                <tr>
                    <th>آدرس</th>
                    <td><% Response.Write(dv[0]["Address"].ToString()); %> </td>
                </tr>
                <tr>
                    <th>کد پستی</th>
                    <td> <% Response.Write(dv[0]["postalcode"].ToString()); %> </td>
                </tr>
                <tr>
                    <th>تلفن تماس</th>
                    <td> <% Response.Write(dv[0]["Mobile"].ToString()); %> </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

