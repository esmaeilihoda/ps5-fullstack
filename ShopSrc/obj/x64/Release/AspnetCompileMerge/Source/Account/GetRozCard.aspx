<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Man.Master" AutoEventWireup="true" CodeBehind="GetRozCard.aspx.cs" Inherits="NM.Account.GetRozCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CCPH" runat="server">
    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
    <style type="text/css">   
    .col-lg-4{
        text-align:center;
        font-size:larger;
        
    }
    .text-white{
     cursor:pointer; 
     text-align:center;
     border-radius:30px;
    }
     </style>
    
    <script type="text/javascript">
        function alarmclick() {
            document.getElementById("alarm").style.display = "none";
        }
        function RCode_Change() {
            document.getElementById("GetRName").click();
        }
    </script>

     <script type="text/javascript">
         function packclick(packno) {
             document.getElementById("PNO").value = packno;
             document.getElementById("ByPack").click();
         }
     </script>
    <asp:ScriptManager runat="server" ID="SMH">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager>
      <div id="content">
                <div class="col-lg-4" style="min-width:100%;background-color:rgb(0 0 0)">
              <!-- Background Gradient Utilities -->
              <div class="card shadow mb-4" style="background-color:rgb(0 0 0)">
               
                  <div style="font-size:x-large;color:red;stroke:white;text-align:center">فعال کردن رز کارت </div>
               
                <div class="card-body">
                    
                  <div
                       class="px-3 py-5 bg-gradient-light text-white" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;">
                      <asp:ImageButton OnClick="Silver_Click" runat="server" ID="Silver" ImageUrl="img/RozCards/Silver.jpeg" style="width:50%" />
                  </div>
                  <div
                       class="px-3 py-5 bg-gradient-light text-white" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;">
                      <asp:ImageButton OnClick="Silver_Click" runat="server" ID="Gold" ImageUrl="img/RozCards/gold.jpeg" style="width:50%" />
                  </div>
                  <div 
                       class="px-3 py-5 bg-gradient-light text-white" style="background-color:rgb(14 23 38);margin-bottom:10px;border-color:red;border-style: double;">
                      <asp:ImageButton OnClick="Silver_Click" runat="server" ID="Plat" ImageUrl="img/RozCards/Plat.jpeg" style="width:50%" />
                  </div>

                  <asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>
                  <asp:HiddenField runat="server" ID="PNO" ClientIDMode="Static" />
                    <div class="row"><div class="col-xl-9">
                        <a runat="server" visible="false" id="ffa" class="btn btn-danger btn-icon-split">
                                    <span class="icon text-white-50"></span>
                                    <span runat="server" onclick="alarmclick();" style="" id="alarm" class="text"></span>
                                    </a>
                     </div></div>
                     
                </ContentTemplate>
                </asp:UpdatePanel>                                 
                </div>
                </div>
                </div>
     </div>
</asp:Content>
