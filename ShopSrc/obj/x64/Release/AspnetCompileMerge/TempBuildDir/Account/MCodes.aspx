<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="MCodes.aspx.cs" Inherits="NM.Account.MCodes" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
    <script type="text/javascript" src="../Scripts/WeCan_LIB.js"></script>
    <script type="text/javascript" src="../Scripts/java2.js"></script>
    <script type="text/javascript">
    </script>
    <style type="text/css">
        body{
            height:99vh;
        }
    </style>
 <asp:ScriptManager runat="server" ID="AXM">
           <Services>
                <asp:ServiceReference Path="~/Account/TWS.asmx" />
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
     </asp:ScriptManager>
  
        <asp:UpdatePanel runat="server" ID="OJUP"><ContentTemplate>
            <br /><br />
            <div style="background-color:rgb(14 23 38);border-radius:25px;border-color:red;border-style:double;width:99%;zoom:0.7;min-height:99vh">
             <h5 style="text-align:center;color:red">کدهای بازاریابی شما</h5><br /> 
            <h5 style="text-align:center;color:white">(قرمز:هیچ بازاریابی وجود ندارد-زرد:یک لاین وجود دارد-سبز:دولاین وجود دارد)</h5><br /> 
           <div " style="text-align:center">
             <asp:TextBox Enabled="false" runat="server" Style="text-align:center" id="mycode"></asp:TextBox> 
               </div>  <br />
            <div >
         <div class="col-sm-3 mb-3 mb-sm-0">                
        <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true"  Skin="WebBlue" Width="90%"
           ID="TeamA" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"                   
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                         <telerik:GridTemplateColumn AllowFiltering="false" 
                             DataField="UserName" FilterControlAltText="Filter column3 column" HeaderText="گروه A" UniqueName="UserName">
                          <ItemTemplate>
                                <asp:Label runat="server" ID="UserName" Text='<%# Eval("UserName") %>' />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                                                
                                <telerik:GridBoundColumn DataField="Status" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                    UniqueName="Status">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                          
                         <telerik:GridBoundColumn DataField="LineA" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="LineA"
                                    UniqueName="LineA">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="LineB" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="LineB"
                                    UniqueName="LineB">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
             </div>   
                </div> 
            <br /><br /><br />
                <div >
             <div class="col-sm-3 mb-3 mb-sm-0">   
             <telerik:RadGrid ClientSettings-AllowKeyboardNavigation="true"  Skin="WebBlue"
           ID="TeamB" runat="server" AutoGenerateColumns="false" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"                   
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                         <telerik:GridTemplateColumn AllowFiltering="false"
                             DataField="UserName" FilterControlAltText="Filter column3 column" HeaderText="گروه B" UniqueName="UserName">
                          <ItemTemplate>
                                <asp:Label runat="server" ID="UserName" Text='<%# Eval("UserName") %>' />
                          </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridTemplateColumn>
                                                
                                <telerik:GridBoundColumn DataField="Status" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="وضعیت"
                                    UniqueName="Status">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LineA" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="LineA"
                                    UniqueName="LineA">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="LineB" CurrentFilterFunction="Contains"
                                    ShowFilterIcon="false" FilterControlAltText="Filter TemplateColumn column" HeaderText="LineB"
                                    UniqueName="LineB">
                                    <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                                    <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    </div></div></div>
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
        .RadTreeView .rtUL{
            width:0;
        }
    </style>
</asp:Content>
