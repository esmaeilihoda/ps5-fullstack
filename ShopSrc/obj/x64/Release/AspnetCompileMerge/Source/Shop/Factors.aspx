<%@ Page Title="فاکتورها - صورتحسابها" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="Factors.aspx.cs" Inherits="NM.Shop.Factors" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


  
<asp:Content ID="Cart" ContentPlaceHolderID="befSlideBox" runat="server">
    
            <!-- Cart Main Area Start -->
    <script type="text/javascript">
        function Pay_Java(fid, mod, AtmNoDesc) {
            fin("befSlideBox_PayHide").value = fid + "," + mod;
            if (mod == 1) {
                var res = confirm("تذکر: در صورت پرداخت از طریق کیف پول تخفیف محصول در نظر گرفته نمی شود."+"آیا با تسویه فاکتور خود با کیف پول به مبلغ:  " + AtmNoDesc + " تومان اطمینان دارید؟");
                if (res == true) {
                    fin("befSlideBox_Payment").click();
                }
            }
            if (mod == 0) {
                fin("befSlideBox_Payment").click();
            }

        }
        function Set_Get_BI_SC00_cart(r) {

            NM.Shop.Admin.ShopAdmin.Set_Get_BI("get", "bascket", 0, Set_Get_BI_SC01_cart, WAError);
        };
        function deletfromcart_cart(id) {
            NM.Shop.Admin.ShopAdmin.Set_Get_BI("delete", "bascket", id, Set_Get_BI_SC00_cart, WAError);
        }
        //function Set_Get_BI_SC01_cart(r) {
        //    Set_Get_BI_SC00("");
        //    var rty = r;
        //    var sumtp = 0;           
        //    var htll = "";
        //    fin("sabadcount").innerHTML = rty.length;
        //    for (var i = 0; i < rty.length; i++) {
        //        var pprt = parseInt(javalist(rty[i], "NPrice")) / parseInt(javalist(rty[i], "CNT"));
        //        htll += '<tr> ' +
        //                '<td class="product-thumbnail"> ' +
        //                 '<a href="#"><img src="' + javalist(rty[i], "imageurl") + '" alt="cart-image" /></a>' +
        //                '</td>' +
        //                '<td class="product-name"><a href="#">' + javalist(rty[i], "PName") + '</a></td>' +
        //                '<td class="product-price"><span class="amount">' + pprt + ' تومان</span></td>' +
        //                '<td class="product-quantity"><input readonly="readonly" type="number" value="' + javalist(rty[i], "CNT") + '" /></td>' +
        //                '<td class="product-subtotal">' + javalist(rty[i], "NPrice") + ' تومان</td>' +
        //                '<td class="product-remove"> <a href="javascript:deletfromcart_cart(' + javalist(rty[i], "PId") + ') "><i class="fa fa-times" aria-hidden="true"></i></a></td>' +
        //               '</tr>';
        //        sumtp += parseInt(javalist(rty[i], "NPrice"));
        //    }            
        //    var footer = '<tr class="cart-subtotal">'+
        //                 '<th>جمع :</th>'+
        //                  '<td><span class="amount">' + sumtp + ' تومان</span></td>' +
        //                 '</tr>'+
        //                 '<tr class="order-total">'+
        //                 '<th>مجموع :</th>'+
        //                 '<td>'+
        //                 '<strong><span class="amount">' + sumtp + ' تومان</span></strong>' +
        //                 '</td>'+
        //                 '</tr>';
        //    fin("carttbody").innerHTML = "";
        //    fin("carttbody").innerHTML = htll;
        //    fin("carttfooterbody").innerHTML = "";
        //    fin("carttfooterbody").innerHTML = footer;

        //};        
    </script>
       


       <div class="col-12 p-0">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 p-0">
                        <!-- Form Start -->
                         <asp:UpdatePanel runat="server" ID="UP">
        <ContentTemplate>
                <div  class="col-12 text-center" style="border: 1px solid #6663;border-radius: 10px;padding: 5px;margin-top:10px;">
                    <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="Factors_Grid" runat="server" AutoGenerateColumns="False" Skin="Metro" CssClass="table table-hover"
                        GroupPanelPosition="Top" Font-Names="IRANSans" Font-Overline="False" OnItemDataBound="Factors_Grid_ItemDataBound"
                        OnNeedDataSource="Factors_Grid_NeedDataSource" OnItemCommand="Factors_Grid_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="FId" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="شماره فاکتور"
                                    UniqueName="FId">
                                    <HeaderStyle Font-Names="IRANSans" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="IRANSans" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="FDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="FDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>

                                <telerik:GridBoundColumn  FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="جمع کل"
                                    UniqueName="AmtNODisc" DataField="AmtNoDisc" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                    <ItemStyle ForeColor="#e01717" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn  FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="مبلغ فاکتور"
                                    UniqueName="AMT" DataField="AMT" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                    <ItemStyle ForeColor="#e01717" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn  FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="وضعیت پرداخت"
                                    UniqueName="FStatus" DataField="FStatus"  HeaderTooltip="" >
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                    <ItemStyle ForeColor="#242931" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin"  />
                                </telerik:GridBoundColumn>
                                

                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    DataField="CHK1" FilterControlAltText="Filter column9 column" HeaderText="انتخاب روش پرداخت"  UniqueName="CHK1">
                                                   <ItemTemplate>
                                                        <span class="fa fa-bank" onclick="Pay_Java(<%# Eval("FId")  %>, 0,<%# Eval("AmtNoDisc")  %>)"  id="PayVoucher_click" style="font-weight: bold; color: #425a42; border: 1px dashed; padding: 2px;cursor: pointer;" > درگاه بانک</span>
                                                        <span class="fa fa-shopping-bag" onclick="Pay_Java(<%# Eval("FId")  %>, 1,<%# Eval("AmtNoDisc")  %>)"  id="CHK2" style="font-weight: bold; color: brown; border: 1px dashed; padding: 2px;cursor: pointer;" > کیف پول</span>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn>    

                                <telerik:GridBoundColumn  FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="پیگیری"
                                    UniqueName="SendStatus"  DataField="SendStatus"  HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                    <ItemStyle ForeColor="#242931" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn AllowFiltering="false"
                                                    HeaderText="مشاهده"  >
                                  
                                                    <ItemTemplate>
                                                        <a href="showorderitem?oid=<%# Eval("FId")  %>" style="color:#1c4b0b;" >نمایش جزئیات</a>
                                                        
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Names="IRANSans" />
                                                    <ItemStyle ForeColor="#1c4b0b" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                                </telerik:GridTemplateColumn> 
                               


                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:Button runat="server" ID="Payment" OnClick="Payment_Click" style="display:none" />
                    <asp:HiddenField runat="server" ID="PayHide" />
                    
                </div>
                    <%--OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"--%>
        </ContentTemplate>
    </asp:UpdatePanel>
                        <!-- Form End -->
                    </div>
                </div>
                 <!-- Row End -->
            </div>
        </div>
        <!-- Cart Main Area End -->

    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AftSlideBox" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BefDiscBoxPr" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AftDiscBox" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BefNewestBox" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="AftNewestBox" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="BefBotomBanerBox" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AftBotomBanerBox" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="BeffooterBox" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="Aftfooterbox" runat="server">
    <script type="text/javascript">
        Set_Get_BI_SC00_cart("");

        

    </script>
    <script >
        function pardakhtnashode() {
            var myText = 'پرداخت نشده هم اکنون جهت پرداخت اقدام  کنيد';
            var regExp = new RegExp(myText, 'g')
            $('td').each(function () {
                var html = $(this).html();
                var newHtml = html.replace(regExp, '<span class="text-danger" style="font-weight: bolder;">' + myText + '</span>');
                $(this).html(newHtml);
            })
        }
        function pardakhtshodebakhshi() {
            var myText = 'بخشي از فاکتور با کيف پول پرداخت شده جهت تسويه فاکتور هم اکنون از طريق درگاه بانک اقدام کنيد';
            var regExp = new RegExp(myText, 'g')
            $('td').each(function () {
                var html = $(this).html();
                var newHtml = html.replace(regExp, '<span class="text-info" style="font-weight: bolder;">' + myText + '</span>');
                $(this).html(newHtml);
            })
        }
        function pardakhtshode() {
            var myText = 'پرداخت شده';
            var regExp = new RegExp(myText, 'g')
            $('td').each(function () {
                var html = $(this).html();
                var newHtml = html.replace(regExp, '<span class="text-success" style="font-weight: bolder;">' + myText + '</span>');
                $(this).html(newHtml);
            })
        }
        setInterval(function () {
           // pardakhtshodebakhshi();
           // pardakhtnashode();
           // pardakhtshode();

        }, 1500);
        function confirmation() {
            return confirm("ok");
        }
    </script>
     
</asp:Content>
