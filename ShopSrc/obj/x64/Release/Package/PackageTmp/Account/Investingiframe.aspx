<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Investingiframe.aspx.cs" Inherits="NM.Account.Investingiframe" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>پنل کاربری</title>
        <meta content="Admin Dashboard" name="description" />
        <meta content="ThemeDesign" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=0.5">
        <link rel="shortcut icon" href="../img/wse-logo.png">

        <!-- morris css -->
        <link rel="stylesheet" href="../plugins/morris/morris.css">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css">
     <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <style type="text/css">
          *{
            direction:rtl;
            font-family:BK;
        }
        @font-face {
	font-family: 'BK';
	src: 
	url('../Fonts/BKoodakBold.ttf') 
	format('opentype');
}
        body{
            background-color:rgb(14 23 38);
            text-align:center;
        }
    </style>
    <script type="text/javascript">
        function showhide() {
            if (document.getElementById("EndOmidDetail").style.display == "")
                document.getElementById("EndOmidDetail").style.display = "none";
            else
                document.getElementById("EndOmidDetail").style.display = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <style type="text/css">
        * {
            direction: rtl;
            font-family: BK;
        }

        @font-face {
            font-family: 'BK';
            src: url('../Fonts/BKoodakBold.ttf') format('opentype');
        }
    </style>
    <asp:ScriptManager runat="server" ID="SM">
        <Services>
            <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
        </Services>
    </asp:ScriptManager>
    <div class="container-fluid">

        <div class="row" style="text-align:center;zoom:0.7">
            <div class="col-sm-12">
                <div class="page-title-box">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h4 runat="server" id="disnmae" class="page-title m-0 text-danger">تراکنش های هبه در طرح های خدماتی و تولیدی شرکت</h4>
                        </div>
                        <div style="display: none" class="col-md-4">
                            <div class="float-right d-md-block">
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="ti-filter mr-1"></i>فیلتر
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated">
                                        <%-- <a class="dropdown-item" href="Actions.aspx?mode=1">فقط پاداشها</a>
                                                            <a class="dropdown-item" href="Actions.aspx?mode=2">فقط کیف پول</a>
                                                            <a class="dropdown-item" href="Actions.aspx?mode=3">فقط وامها</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="Actions.aspx">همه</a>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end page-title-box -->
            </div>
        </div>
    </div>
    <!-- end page title -->
    <asp:UpdatePanel runat="server" ID="UP">
        <ContentTemplate>
            <div class="row">
                <div class="col-xl-9" style="text-align:center;zoom:0.4">
                    <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="Marketers_Grid" runat="server" AutoGenerateColumns="False" Skin="WebBlue"
                        GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="ش.تراکنش"
                                    UniqueName="Id">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="PDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="PDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="مبلغ"
                                    UniqueName="Amt" DataField="Amt" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="درصد" UniqueName="Perecent"
                                    DataField="Perecent" HeaderTooltip="سود ماهیانه با احتساب 4 درصد">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                         Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="سود ماهیانه"
                                    UniqueName="Benefit" DataField="Benefit" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="تعداد" UniqueName="DollarCount"
                                    DataField="DollarCount" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نوع تراکنش"
                                    UniqueName="Type" DataField="Type" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" HeaderText="بابت" UniqueName="DSC" DataField="DSC" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                            <hr />
                    <div class="col-md-12" style="text-align:-webkit-center;">
                            <div  class="btn-dark" style="border-radius:25px">
                                <h5 runat="server" id="H1"  style="color:white">معرف 1</h5>
                            </div><hr style="color:coral;font-size:10px" />
                     </div>
                     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="InvA_Grid" runat="server" AutoGenerateColumns="False" Skin="WebBlue"
                        GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="InvA_Grid_NeedDataSource" OnItemCommand="InvA_Grid_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="ش.تراکنش"
                                    UniqueName="Id">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                    UniqueName="UserName">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="PDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="PDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="مبلغ"
                                    UniqueName="Amt" DataField="Amt" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="درصد" UniqueName="Perecent"
                                    DataField="Perecent" HeaderTooltip="سود ماهیانه با احتساب 4 درصد">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                         Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="سود ماهیانه"
                                    UniqueName="Benefit" DataField="Benefit" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="تعداد" UniqueName="DollarCount"
                                    DataField="DollarCount" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نوع تراکنش"
                                    UniqueName="Type" DataField="Type" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" HeaderText="بابت" UniqueName="DSC" DataField="DSC" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>

                    </telerik:RadGrid>
                    <hr />
                      <div class="col-md-12" style="text-align:-webkit-center;">
                            <div  class="btn-dark" style="border-radius:25px">
                                <h5 runat="server" id="H2" class="page-title m-3" style="color:white">معرف 2</h5>
                            </div><hr style="color:coral;font-size:10px" />
                     </div>
                     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="InvB_Grid" runat="server" AutoGenerateColumns="False" Skin="WebBlue"
                        GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="InvB_Grid_NeedDataSource" OnItemCommand="InvB_Grid_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="ش.تراکنش"
                                    UniqueName="Id">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                    UniqueName="UserName">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="PDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="PDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="مبلغ"
                                    UniqueName="Amt" DataField="Amt" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="درصد" UniqueName="Perecent"
                                    DataField="Perecent" HeaderTooltip="سود ماهیانه با احتساب 4 درصد">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                         Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="سود ماهیانه"
                                    UniqueName="Benefit" DataField="Benefit" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="تعداد" UniqueName="DollarCount"
                                    DataField="DollarCount" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نوع تراکنش"
                                    UniqueName="Type" DataField="Type" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" HeaderText="بابت" UniqueName="DSC" DataField="DSC" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <hr />
                      <div class="col-md-12" style="text-align:-webkit-center;">
                            <div  class="btn-dark" style="border-radius:25px">
                                <h5 runat="server" id="H3" class="page-title m-3" style="color:white">معرف 3</h5>
                            </div><hr style="color:coral;font-size:10px" />
                     </div>
                     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="InvC_Grid" runat="server" AutoGenerateColumns="False" Skin="WebBlue"
                        GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="InvC_Grid_NeedDataSource" OnItemCommand="InvC_Grid_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="ش.تراکنش"
                                    UniqueName="Id">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                    UniqueName="UserName">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="PDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="PDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="مبلغ"
                                    UniqueName="Amt" DataField="Amt" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="درصد" UniqueName="Perecent"
                                    DataField="Perecent" HeaderTooltip="سود ماهیانه با احتساب 4 درصد">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                         Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataFormatString="{0:###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="سود ماهیانه"
                                    UniqueName="Benefit" DataField="Benefit" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="تعداد" UniqueName="DollarCount"
                                    DataField="DollarCount" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="نوع تراکنش"
                                    UniqueName="Type" DataField="Type" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" HeaderText="بابت" UniqueName="DSC" DataField="DSC" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid> <br />
                    
 

     <div class="col-md-12" style="text-align:-webkit-center;">
                            <div class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:red">
                                <h5 runat="server" id="HMah" class="page-title m-3" style="color:white">Level 2</h5>
                            </div><hr style="color:coral;font-size:10px" />
                    <div div class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:red">
                                <h5 runat="server" id="Hsal" class="page-title m-3" style="color:white">Level 2</h5>
                    </div><hr style="color:coral;font-size:10px" />
     </div>
                    <br />
                               <hr />
                    <div onclick="showhide();" class="col-md-12" style="text-align:-webkit-right;">
                            <div div class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:cornflowerblue;background-color:black;cursor:pointer">
                                <h5 runat="server" id="H4" class="page-title m-3" style="color:white">جزئیات هبه مشارکت</h5>
                            </div><hr style="color:coral;font-size:10px" />
                     </div>
                    <div id="EndOmidDetail" style="display:none">
                     <telerik:RadGrid AllowPaging="true" PageSize="20" ClientSettings-AllowKeyboardNavigation="true"
                        ID="HebeDetail" runat="server" AutoGenerateColumns="False" Skin="WebBlue"
                        GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False"
                        OnNeedDataSource="HebeDetail_NeedDataSource" OnItemCommand="HebeDetail_ItemCommand"
                        BorderStyle="Inset" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <HeaderStyle Font-Size="Small" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="ش.تراکنش"
                                    UniqueName="Id">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="UserName" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام کاربری"
                                    UniqueName="UserName">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                                <telerik:GridNumericColumn DataFormatString="{0:####/##/##}" DataField="PDate" CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column3 column" HeaderText="تاریخ" UniqueName="PDate">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset"
                                        Font-Names="B Nazanin" />
                                </telerik:GridNumericColumn>


                                <telerik:GridBoundColumn DataFormatString="{0:###/###تومان}" FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="سود"
                                    UniqueName="Benefit" DataField="Benefit" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false"
                                    FilterControlAltText="Filter column9 column" HeaderText="روز" UniqueName="Days"
                                    DataField="Days" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column"
                                    CurrentFilterFunction="Contains" ShowFilterIcon="false" HeaderText="درصد"
                                    UniqueName="Type" DataField="Type" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterControlAltText="Filter column9 column" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" HeaderText="منبع تراکنش" UniqueName="DSC" DataField="DSC" HeaderTooltip="">
                                    <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                                    <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true"
                                        Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>

                    </telerik:RadGrid>
                    <hr />
                         <div class="col-md-12" style="text-align:-webkit-center;">
                            <div  class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:red">
                                <h5 runat="server" id="SUMMT" class="page-title m-3" style="color:white">Level 2</h5>
                            </div><hr style="color:coral;font-size:10px" />
                    <div  class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:red">
                                <h5 runat="server" id="Payed" class="page-title m-3" style="color:white">Level 2</h5>
                    </div><hr style="color:coral;font-size:10px" />
                              <div  class="btn btn-outline-dark" style="border-radius:25px;border:double;border-color:red">
                                <h5 runat="server" id="SStock" class="page-title m-3" style="color:white">Level 2</h5>
                    </div><hr style="color:coral;font-size:10px" />
     </div></div></div></div>
                    <%--OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"--%>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- end row -->

    <div class="row" style="display: none">
        <div class="col-xl-9">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title">Sales Report</h4>
                    <div class="row">
                        <div class="col-lg-8">
                            <div id="morris-line-example" class="morris-chart" style="height: 300px"></div>
                        </div>
                        <div class="col-lg-4">
                            <div>
                                <h5 class="font-14 mb-5">Yearly Sales Report</h5>

                                <div>
                                    <h5 class="mb-3">2018 : $19523</h5>
                                    <p class="text-muted mb-4">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis atque quos dolores et</p>
                                    <a href="#" class="btn btn-primary btn-sm">Read more <i class="mdi mdi-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title">Sales Analytics</h4>
                    <div id="morris-donut-example" class="morris-chart" style="height: 300px"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->

    <div class="row" style="display: none">
        <div class="col-xl-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title mb-4">Latest Messages</h4>
                    <div class="latest-massage">
                        <a href="#" class="latest-message-list">
                            <div class="border-bottom position-relative">
                                <div class="float-left user mr-3">
                                    <h5 class="bg-primary text-center rounded-circle text-white mt-0">v</h5>
                                </div>
                                <div class="message-time">
                                    <p class="m-0 text-muted">Just Now</p>
                                </div>
                                <div class="massage-desc">
                                    <h5 class="font-14 mt-0 text-dark">Victor Zamora</h5>
                                    <p class="text-muted">Hey! there I'm available...</p>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="latest-message-list">
                            <div class="border-bottom mt-3 position-relative">
                                <div class="float-left user mr-3">
                                    <h5 class="bg-success text-center rounded-circle text-white mt-0">p</h5>
                                </div>
                                <div class="message-time">
                                    <p class="m-0 text-muted">2 Min. ago</p>
                                </div>
                                <div class="massage-desc">
                                    <h5 class="font-14 mt-0 text-dark">Patrick Beeler</h5>
                                    <p class="text-muted">I've finished it! See you so...</p>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="latest-message-list">
                            <div class="border-bottom mt-3 position-relative">
                                <div class="float-left user mr-3">
                                    <img src="assets/images/users/avatar-3.jpg" alt="" class="rounded-circle mb-3">
                                </div>
                                <div class="message-time">
                                    <p class="m-0 text-muted">6 Min. ago</p>
                                </div>
                                <div class="massage-desc">
                                    <h5 class="font-14 mt-0 text-dark">Ralph Ramirez</h5>
                                    <p class="text-muted">This theme is awesome!</p>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="latest-message-list">
                            <div class="border-bottom mt-3 position-relative">
                                <div class="float-left user mr-3">
                                    <h5 class="bg-pink text-center rounded-circle text-white mt-0">b</h5>
                                </div>
                                <div class="message-time">
                                    <p class="m-0 text-muted">01:34 pm</p>
                                </div>
                                <div class="massage-desc">
                                    <h5 class="font-14 mt-0 text-dark">Bryan Lacy</h5>
                                    <p class="text-muted">I've finished it! See you so...</p>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="latest-message-list">
                            <div class="mt-3 position-relative">
                                <div class="float-left user mr-3">
                                    <img src="assets/images/users/avatar-4.jpg" alt="" class="rounded-circle mb-3">
                                </div>
                                <div class="message-time">
                                    <p class="m-0 text-muted">02:05 pm</p>
                                </div>
                                <div class="massage-desc">
                                    <h5 class="font-14 mt-0 text-dark">James Sorrells</h5>
                                    <p class="text-muted">Hey! there I'm available...</p>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>

        </div>
        <!-- end col -->

        <div class="col-xl-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title mb-4">Recent Activity</h4>
                    <ol class="activity-feed mb-0">
                        <li class="feed-item">
                            <div class="feed-item-list">
                                <span class="date text-white-50">Jan 10</span>
                                <span class="activity-text text-white">Responded to need “Volunteer Activities”</span>
                            </div>
                        </li>
                        <li class="feed-item">
                            <div class="feed-item-list">
                                <span class="date text-white-50">Jan 09</span>
                                <span class="activity-text text-white">Added an interest “Volunteer Activities”</span>
                            </div>
                        </li>
                        <li class="feed-item">
                            <div class="feed-item-list">
                                <span class="date text-white-50">Jan 08</span>
                                <span class="activity-text text-white">Joined the group “Boardsmanship Forum”</span>
                            </div>
                        </li>
                        <li class="feed-item">
                            <div class="feed-item-list">
                                <span class="date text-white-50">Jan 07</span>
                                <span class="activity-text text-white">Responded to need “In-Kind Opportunity”</span>
                            </div>
                        </li>
                    </ol>

                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-xl-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title mb-4">Social Source</h4>
                    <div class="text-center">
                        <div class="social-source-icon lg-icon mb-3">
                            <i class="mdi mdi-facebook h2 bg-primary text-white"></i>
                        </div>
                        <h5 class="font-16"><a href="#" class="text-dark">Facebook - <span class="text-muted">125 sales</span> </a></h5>
                        <p class="text-muted">Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis tincidunt.</p>
                        <a href="#" class="text-primary font-14">Learn more <i class="mdi mdi-chevron-right"></i></a>
                    </div>
                    <div class="row mt-5">
                        <div class="col-md-4">
                            <div class="social-source text-center mt-3">
                                <div class="social-source-icon mb-2">
                                    <i class="mdi mdi-facebook h5 bg-primary text-white"></i>
                                </div>
                                <p class="font-14 text-muted mb-2">125 sales</p>
                                <h6>Facebook</h6>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="social-source text-center mt-3">
                                <div class="social-source-icon mb-2">
                                    <i class="mdi mdi-twitter h5 bg-info text-white"></i>
                                </div>
                                <p class="font-14 text-muted mb-2">112 sales</p>
                                <h6>Twitter</h6>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="social-source text-center mt-3">
                                <div class="social-source-icon mb-2">
                                    <i class="mdi mdi-instagram h5 bg-pink text-white"></i>
                                </div>
                                <p class="font-14 text-muted mb-2">104 sales</p>
                                <h6>Instagram</h6>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->

    <div class="row" style="display: none">
        <div class="col-xl-9">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title mb-4">Latest Trasaction</h4>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">ID No.</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">#14567</th>
                                    <td>Michael Mitchell</td>
                                    <td>14 Jan</td>
                                    <td>$74</td>
                                    <td>2</td>
                                    <td>
                                        <div class="progress" style="height: 5px;">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 89%;" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>$148</td>
                                </tr>
                                <tr>
                                    <th scope="row">#14568</th>
                                    <td>Dennis Cervantes</td>
                                    <td>15 Jan</td>
                                    <td>$72</td>
                                    <td>2</td>
                                    <td>
                                        <div class="progress" style="height: 5px;">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 64%;" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>$144</td>
                                </tr>
                                <tr>
                                    <th scope="row">#14569</th>
                                    <td>Bernard Moats</td>
                                    <td>16 Jan</td>
                                    <td>$86</td>
                                    <td>1</td>
                                    <td>
                                        <div class="progress" style="height: 5px;">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>$86</td>
                                </tr>
                                <tr>
                                    <th scope="row">#14570</th>
                                    <td>Patrick Esquivel</td>
                                    <td>17 Jan</td>
                                    <td>$59</td>
                                    <td>2</td>
                                    <td>
                                        <div class="progress" style="height: 5px;">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 64%;" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>$118</td>
                                </tr>
                                <tr>
                                    <th scope="row">#14571</th>
                                    <td>Michael Barger</td>
                                    <td>18 Jan</td>
                                    <td>$62</td>
                                    <td>2</td>
                                    <td>
                                        <div class="progress" style="height: 5px;">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>$124</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-xl-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title mb-4">Document files</h4>
                    <table class="table table-striped mb-0">
                        <tbody>
                            <tr>
                                <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                <td>
                                    <h6 class="mt-0">2015</h6>
                                    <p class="text-muted mb-0">dolor sit amet</p>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                <td>
                                    <h6 class="mt-0">2016</h6>
                                    <p class="text-muted mb-0">dolor sit amet</p>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                <td>
                                    <h6 class="mt-0">2017</h6>
                                    <p class="text-muted mb-0">pretium quis</p>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td><i class="far fa-file-pdf text-primary h2"></i></td>
                                <td>
                                    <h6 class="mt-0">2018</h6>
                                    <p class="text-muted mb-0">ultricies nec</p>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
