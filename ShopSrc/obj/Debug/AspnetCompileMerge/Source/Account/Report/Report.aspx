<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="NM.Account.Report.Report" %>

<%@ Register Assembly="Stimulsoft.Report.WebDesign" Namespace="Stimulsoft.Report.Web" TagPrefix="cc2" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../../styles/WECSS.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div >
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Checked="true" />
      <cc1:stiwebviewer FullScreenMode="true" Zoom="90" ToolbarFontFamily="B Yekan" ShowTooltips="false" Localization="~/Localization/fa.xml" Theme="SimpleGray" UseCompression="true" BorderColor="#ff0000" BackgroundColor="#cccccc" ToolbarDisplayMode="Separated" ShowAboutButton="false" ShowTooltipsHelp="false" ForeColor="Yellow"  ID="StiWebViewer1" runat="server" MenuAnimation="true" ViewMode="Continuous" ShowExportToDocument="false" ShowExportToOpenDocumentWriter="false"></cc1:stiwebviewer>
     <cc2:StiWebDesigner Visible="false" OnSaveReportAs="StiWebDesigner1_SaveReportAs1" ID="StiWebDesigner1" runat="server" Theme="Office2013VeryDarkGrayGreen" />
        </div>
    <br />
            </div>
    </form>
</body>
</html>
