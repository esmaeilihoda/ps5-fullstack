<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="MyTeamTree.aspx.cs" Inherits="NM.Account.MyTeamTree" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript" src="../Scripts/java2.js"></script>
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

        function selectNode(text) {
    var treeView = $find("<%= RadTree.ClientID %>");
    var node = treeView.findNodeByText(text);
    node.select();
}

        function FindNode() {
            var tree = $find("<%= RadTree.ClientID %>");
            var node = tree.findNodeByText("Child RadTreeNode 1");
            //... or ...
            var node1 = tree.findNodeByValue("3");
            //... or ...
            var node2 = tree.findNodeByAttribute("MyCustomAttribute", "Some Value");
            node.get_parent().expand();
            node.select();
        }

        function AddNode() {

            var tree = $find("<%= RadTree.ClientID %>");
        //    tree.trackChanges();

            var selected = tree.get_selectedNode();
            NM.Account.TWS.GetChild(selected.get_value(), rtsult, WAError);
            
           
        };
        function rtsult(r) {
            var tree = $find("<%= RadTree.ClientID %>");
            var selected = tree.get_selectedNode();

            //tree.trackChanges();
            selected.set_value("checked");

            for (var i = 0; i < r.length; i++) {
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text(javalist(r[i], "UserName") + "[" + javalist(r[i], "R") + "]" + "[" + javalist(r[i], "L") + "]"
                    + "[" + javalist(r[i], "Name") + "_" + javalist(r[i], "Family") + "]");
                node.set_value(javalist(r[i], "UserName"));
                // var nodep = tree.findNodeByText("Humor");
                selected.get_nodes().add(node);
            }
      //      tree.commitChanges();

            console.log(selected.get_value());
        };

    </script>
 <asp:ScriptManager runat="server" ID="AXM">
           <Services>
                <asp:ServiceReference Path="~/Account/TWS.asmx" />
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
     </asp:ScriptManager>
    <div style="overflow:scroll;">
    <telerik:RadTreeView OnClientNodeClicked="AddNode" Skin="MetroTouch" 
        RenderMode="Lightweight" CollapseAnimation-Type="InExpo" EnableDragAndDrop="true" ID="RadTree" runat="server" >
<%--        <Nodes>
            <telerik:RadTreeNode runat="server" Text="Products" ExpandMode="ClientSide">
                <Nodes>
                    <telerik:RadTreeNode runat="server" Text="Books" ExpandMode="ClientSide">
                        <Nodes>
                            <telerik:RadTreeNode runat="server" Text="Fiction">
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode runat="server" Text="Non-Fiction">
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode runat="server" Text="Biography">
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode runat="server" Text="Humor">
                            </telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeNode>
        </Nodes>--%>
    </telerik:RadTreeView>
    <%--<a href="javascript: selectNode('Fiction');" class="RadTreeView_Hay">Find Fiction</a>
    <a href="javascript: selectNode('Non-Fiction');" class="RadTreeView_Hay">Find Non-Fiction</a>
    <a href="javascript: selectNode('Biography');" class="RadTreeView_Hay">Find Biography</a>
    <a href="javascript: selectNode('Humor');" class="RadTreeView_Hay">Find Humor</a>
        <a href="javascript: AddNode();" class="RadTreeView_Hay">ADD</a>--%>
</div>
    <%--<input type="button" onclick="changeLayoutHandler(null, 'tree-right');" value="tree-right" />--%>
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
    <style type="text/css">
        .RadTreeView .rtUL{
            width:0;
        }
    </style>
</asp:Content>
