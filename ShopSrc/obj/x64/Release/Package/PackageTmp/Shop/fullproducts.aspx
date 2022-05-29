<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="fullproducts.aspx.cs" Inherits="NM.Shop.fullproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">

    <script>
        $(document).ready(function () {
            $(".pageNumber").click(function () {
                $("#befSlideBox_hidepage").val($(this).attr('vals'));
                $("#befSlideBox_btnpagenumber").click();
            });
        });
    </script>
    <div class="col-lg-2 d-lg-block d-none  h-100  p-2">
        <div class="col-12 border border-white " style="border-radius:10px;">
            <a href="#">
                <img src="../images/dualphone.png" class="img-fluid" style="border-radius:10px; " />
            </a>

        </div>
    </div>
    <!--------------------------------show mahsolat------------------------------------------->
    <div class="col-lg-10 col-md-12  h-100 ">
        <div class="row" style="width: 98%; margin-right: 1%; margin-left: 1%;">
            <% NM.Shop.ShopMain NSS = new NM.Shop.ShopMain();
                
                // int gid = int.Parse(Library.Constants.ValInt(GetParam("cat")));
                int gid = 0;
                gid= (Request.QueryString["cat"]) !=null ? int.Parse(Request.QueryString["cat"]):0;
                string mod= Request.QueryString["mod"];

                System.Data.DataView PDV =  new System.Data.DataView();
                if(gid != 0)
                    PDV = NSS.search("",Get_PN,gid,"cat","");//mode show categori
                else
                    PDV = NSS.search("",Get_PN,0,"normal","");//mode normall wich show all products

                // mode search
                if (mod == "se")
                {
                    PDV = NSS.search(Get_Seva,Get_PN,0,"search","");
                }

                //mode view group wich show all products viewGroup
                if (mod == "vg")
                {
                    int vgv= int.Parse(Request.QueryString["vgv"]);
                    string Viewgroup = "";
                    //vgv 4=amazing(shegeftangiz) 1=Bests=behtarinha  2=Newest=jadidtarinha  3=Bestselling=porforoshha
                    switch (vgv)
                    {
                        case 1:
                            Viewgroup = "Bests";
                            break;
                        case 2:
                            Viewgroup = "Newest";
                            break;
                        case 3:
                            Viewgroup = "Bestselling";
                            break;
                        case 4:
                            Viewgroup = "amazing";
                            break;

                    }
                    PDV = NSS.search("",Get_PN,0,"showViewGroup",Viewgroup);
                }
                if (PDV.Count > 0)
                {
                    foreach (System.Data.DataRowView onp in PDV)
                    {
                %>
            <div class="col-sm-6` col-md-3 wrapershowonemahsol">
                <div class="showOneProuduct">
                    <a href="product.aspx?PID=<%= onp["PId"].ToString() %>" target="_blank">
                        <div class="showoneproducttextup"></div>
                        <div style="height:230px">
                            <img src="<%= onp["ImageUrl"].ToString() %>" alt="Lights" class="showoneProuducimg">
                        </div>

                        <div class="showoneProuducCaption">
                            <h7><%= onp["PName"].ToString() %></h7>
                        </div>
                        <div class="showoneProuducStar text-left">
                            <span>4.4 (98)</span> <i class="fa fa-star"></i>
                        </div>
                        <div class="showonepruductPrice">
                             <% if (onp["VPrice"].ToString() != "0")
                                 { %>
                            <div class="showonepruductDefultprice text-left">
                                <span class="showonepruductlinePrice"><%= onp["Price"].ToString() %></span><span class="badge badge-pill badge-danger showonepruductBadge"><%= onp["Disc"].ToString() %>%</span>
                            </div>
                            <div class="showonepruductoffprice text-left">
                                <span class="showonepruductPrice"><%= onp["VPrice"].ToString() %> تومان   </span>
                            </div>
                            <%}
                                else
                                { %>
                             <div class="showonepruductoffprice text-left">
                                <span class="showonepruductPrice"><%= onp["Price"].ToString() %> تومان   </span>
                            </div>
                           
                            <%} %>
                        </div>
                    </a>
                </div>
            </div>
            <% }
                }
                else { %>
                       <div class="alert alert-primary alert-dismissible fade show m-auto">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>یافت نشد!</strong> محصولی جهت نمایش وجود ندارد
                      </div>
                <%}%>
        </div>
    <!--------------------------------end show mahsolat------------------------------------------->

        <!-- Pagination start -->
        <div class="col-12 mt-4">
             <ul class="pagination justify-content-center">
                 <%  int TotalPages=  (PDV.Count>0) ?int.Parse( PDV[0]["TotalPages"].ToString()):1; %>
  <li class="page-item <% if (TotalPages == 1 || Get_PN==1) Response.Write("disabled"); %>" style="cursor:pointer;"><a class="page-link pageNumber" vals="<% Response.Write(Get_PN-1); %>"><i class="fa fa-angle-double-right"></i></a></li>
    <% for (int i = 1; i <= TotalPages; i++)
        {
           %>
              <li class="page-item  <% if (i == Get_PN) Response.Write("active"); %>" style="cursor:pointer;"><a class="page-link pageNumber"  vals="<% Response.Write(i); %>"><% Response.Write(i); %></a></li>          
     <% }
          %>
  <li class="page-item <% if (TotalPages == 1  || TotalPages==Get_PN) Response.Write("disabled"); %>"  style="cursor:pointer;"><a class="page-link pageNumber" vals="<% Response.Write(Get_PN+1); %>"><i class="fa fa-angle-double-left"></i></a></li>
</ul> 
        </div>
        <asp:HiddenField  ID="hidepage" runat="server"/>
        <asp:Button ID="btnpagenumber" OnClick="btnpagenumber_Click" runat="server" Style="display:none"></asp:Button>
        <!-- Pagination end -->

    </div>
    



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
</asp:Content>
