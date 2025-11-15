<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="TeamDiagram.aspx.cs" Inherits="NM.Account.TeamDiagram" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript">
        (function (global, undefined) {
            var diagram;

            function diagram_load(sender, args) {
                diagram = sender.get_kendoWidget();
            }

            function changeLayoutHandler(dropDown, args) {
                var itemValue = args,
                    layoutType = parseLayoutType(itemValue);

                diagram.layout({
                    type: layoutType.type,
                    subtype: layoutType.subtype,
                    animate: true
                });
            }

            function parseLayoutType(value) {
                var valueSplit = value.split('-');

                return {
                    type: valueSplit[0],
                    subtype: valueSplit[1]
                };
            }

            global.diagram_load = diagram_load;
            global.changeLayoutHandler = changeLayoutHandler;
        })(window);
    </script>
    <asp:ScriptManager runat="server" ID="SMTD">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager>
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <div style="direction:ltr;overflow:scroll">
        <telerik:RadDiagram BackColor="White"  ID="theDiagram" EnableAjaxSkinRendering="true"
            SkinID="Metro" Selectable="false" Editable="false" Height="4000" Width="4000" runat="server" >
            <LayoutSettings Enabled="false" RadialFirstLevelSeparation="90" HorizontalSeparation="200" RadialSeparation="50" />
            <ClientEvents OnLoad="diagram_load" />
            <ShapeDefaultsSettings Width="40" Height="40" Type="Circle">
                <FillSettings Color="green" />
            </ShapeDefaultsSettings>
            <ShapesCollection>
            </ShapesCollection>
            <ConnectionsCollection>
            </ConnectionsCollection>
        </telerik:RadDiagram>
    </div>
    <input type="button" onclick="changeLayoutHandler(null, 'tree-right');" value="tree-right" />
<%--    <qsf:ConfiguratorPanel runat="server">
        <Views>
            <qsf:View runat="server">
                <qsf:DropDownList ID="layoutChooser" Label="Choose Layout" OnClientItemSelected="changeLayoutHandler" ExpandDirection="Up" runat="server">
                    <Items>
                        <telerik:DropDownListItem Text="Tree Down" Value="tree-down" />
                        <telerik:DropDownListItem Text="Tree Up" Value="tree-up" />
                        <telerik:DropDownListItem Text="Tree Left" Value="tree-left" />
                        <telerik:DropDownListItem Text="Tree Right" Value="tree-right" />
                        <telerik:DropDownListItem Text="Tip-Over Tree" Value="tree-tipover" />
                        <telerik:DropDownListItem Text="Radial Tree" Value="tree-radial" />
                        <telerik:DropDownListItem Text="Layered Horizontal" Value="layered-horizontal" />
                        <telerik:DropDownListItem Text="Layered Vertical" Value="layered-vertical" />
                        <telerik:DropDownListItem Text="Force-directed" Value="force" />
                        <telerik:DropDownListItem Text="Mindmap Horizontal" Value="tree-mindmaphorizontal" />
                        <telerik:DropDownListItem Text="Mindmap Vertical" Value="tree-mindmapvertical" />
                    </Items>
                </qsf:DropDownList>
            </qsf:View>
        </Views>
    </qsf:ConfiguratorPanel>--%>
</asp:Content>
