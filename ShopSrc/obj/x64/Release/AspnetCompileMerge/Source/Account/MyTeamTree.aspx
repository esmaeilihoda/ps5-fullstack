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
        var jjkj = "";
        function AddNode() {

            var tree = $find("<%= RadTree.ClientID %>");
        //    tree.trackChanges();

            var selected = tree.get_selectedNode();
            jjkj = selected.get_value();
            NM.Account.TWS.GetChild(selected.get_value(), rtsult, WAError);            
           
        };
        function rtsult(r) {
            var tree = $find("<%= RadTree.ClientID %>");
            var selected = tree.get_selectedNode();

            //tree.trackChanges();
            selected.set_value("checked");

            for (var i = 0; i < r.length; i++) {
                var olm = "";
                if (i == 0)
                    olm = "[LineA]***";
                else
                    olm = "[LineB]***";
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text(olm+javalist(r[i], "UserName") + "[A" + javalist(r[i], "R") + "]" + "[B" + javalist(r[i], "L") + "]"
                    + "[" + javalist(r[i], "Name") + "_" + javalist(r[i], "Family") + "]" + "_" + javalist(r[i], "Poor"));
                node.set_value(javalist(r[i], "UserName"));
                // var nodep = tree.findNodeByText("Humor");
                selected.get_nodes().add(node);
            }
            selected.toggle();
             
            console.log(selected.get_value());
        };
        var modeli = "";
        function GetLFM(mode) {
            modeli = mode;
     <%--       var tree = $find("<%= RadTree.ClientID %>");
        //    tree.trackChanges();

            var selected = tree.get_selectedNode();--%>
            NM.Account.TWS.getloanANDFree(jjkj, mode, rtsultomid, WAError);

        }
        function rtsultomid(r) {
            if(modeli == "FrP")
                fin("FRC").innerText = r;
            else if (modeli == "Loans")
                fin("Loans").innerText = r;

            var tedad = r.split("/");

            if (modeli == "FrP")
                fin("maghroozi").innerText = tedad.length + " مقروضی";
            else if (modeli == "Loans")
                fin("vami").innerText = tedad.length + " وامی";;
        }
    </script>
 <asp:ScriptManager runat="server" ID="AXM">
           <Services>
                <asp:ServiceReference Path="~/Account/TWS.asmx" />
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
     </asp:ScriptManager>
  
        <asp:UpdatePanel runat="server" ID="OJUP"><ContentTemplate>
            <br /><br /><br />
      <div style="overflow:scroll;">
    <telerik:RadTreeView OnClientNodeClicked="AddNode" Skin="WebBlue" BackColor="#142338" ForeColor="White"
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
    <div style="min-height:99vh;background-color:rgb(14 23 38);border-radius:25px;width:85%">
    <div class="row" >
         <div class="col-sm-6 mb-3 mb-sm-0">
            <input name="D_Code" type="text" runat="server" class="form-control form-control-user"
               id="D_Code" placeholder="نام کاربری یا نام و نام خانوادگی">
         </div>
                    <div style="display:block;text-align:center;width:100%" class="form-group row">
<asp:Button runat="server" OnClick="Register_Click" ID="Register" 
    OnClientClick="document.forms[0].target = '_blank';" class="btn btn-outline-success"
     Text="جستجو.." />

                        </div>
       </div> 
        <br />
             <div runat="server" id="coinsprice" class="row">
         <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true" 
           ID="Packs_Grid" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"                   
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="UserName" FilterControlAltText="Filter column3 column" HeaderText="نام کاربری" UniqueName="UserName">
                          <ItemTemplate>
                                <asp:Label runat="server" ID="textid" Text='<%# Eval("UserName") %>' />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                        
                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="Name" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام" UniqueName="Name">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                             DataField="Family" FilterControlAltText="Filter TemplateColumn column" HeaderText="نام خانوادگی" UniqueName="Family">
                            <HeaderStyle Width="40px" Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle Width="40px" BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>

                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="CHK" FilterControlAltText="Filter column3 column" HeaderText="انتخاب" UniqueName="CHK">
                          <ItemTemplate>
                                <asp:CheckBox OnCheckedChanged="CHK_CheckedChanged" AutoPostBack="true" runat="server" ID="CHK" />
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
            <div class="row">
           <div class="col-xl-3 col-md-6 mb-4" style="">
                                    <div class="card border-left-primary shadow h-100 py-2" 
                                        style="background-color:rgb(14 23 38);border-color:red;border-radius:25px;border-style:double"">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div onclick="GetLFM('FrP')" style="cursor:pointer;text-align:center;height:50px;
                                                      vertical-align:central;border-radius:15px" class="btn-dark">
                                                        <span id="maghroozi" style="margin-top:25%;font-size:large">مقروضی</span></div>                                            
                                                </div>                                               
                                            </div>
                                             <p class="font-14 m-0" id="FRC" style="display:block;direction:ltr;font-family:Tahoma;color:white"></p>
                                            
                                            <br />
                                        </div>
                                    </div>
                                </div>
           <div class="col-xl-3 col-md-6 mb-4" >
                                    <div class="card border-left-primary shadow h-100 py-2" 
                                        style="background-color:rgb(14 23 38);border-color:red;border-radius:25px;border-style:double"">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div  onclick="GetLFM('Loans')" style="cursor:pointer;text-align:center;height:50px;
                                                        vertical-align:central;border-radius:15px"  class="btn-dark">
                                                        <span id="vami" style="margin-top:25%;font-size:large">وامی</span></div>                                            
                                                </div>                                               
                                            </div>
                                             <p class="font-14 m-0" id="Loans" style="display:block;direction:ltr;font-family:Tahoma;color:white"></p>
                                            
                                            <br />
                                        </div>
                                    </div>
                                </div>
            </div>  </div>
        </ContentTemplate></asp:UpdatePanel>
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
        /*.RadTreeView .rtUL{
            width:0;
        }*/
    </style>
</asp:Content>
