<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AdMan.Master" AutoEventWireup="true" CodeBehind="AdInvests.aspx.cs" Inherits="NM.Account.AdInvests" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>تراکنشهای مالی</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CCPH" runat="server">
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
    </style>
    <asp:ScriptManager runat="server" ID="SM">
          <Services>
                <asp:ServiceReference Path="~/Shop/Admin/ShopAdmin.asmx" />
            </Services>
    </asp:ScriptManager> 
    <asp:UpdatePanel runat="server" ID="ZeratUp"><ContentTemplate>
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-title-box">
                                        <div class="row align-items-center">
                                            <div class="col-md-8">
                                                <h4 runat="server" id="disnmae" class="page-title m-0">میز کار</h4>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="float-right d-md-block">
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="ti-filter mr-1"></i> فیلتر
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated">
                                                            <a class="dropdown-item" href="CPayReqs.aspx?mode=0">فقط درخواست های واریز نشده</a>
                                                            <a class="dropdown-item" href="CPayReqs.aspx?mode=1">فقط درخواست های واریز شده</a> 
                                                                              <label for="UserName" class="col-form-label-sm" >نام کاربری</label>
                          
                               <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="UserName" placeholder="نام کاربری"></asp:TextBox>

                     <label for="Name" class="col-form-label-sm" >نام </label>
                            <asp:TextBox runat="server" class="form-control form-control-user"
                               ID="Name" placeholder="نام "></asp:TextBox>
                    
                    <label for="Family" class="col-form-label-sm" >نام خانوادگی</label>
                            <asp:TextBox  runat="server" class="form-control form-control-user"
                               ID="Family" placeholder="نام خانوادگی"></asp:TextBox>
                     <asp:Button runat="server" ID="FilterMe" OnClick="UserName_TextChanged" Text="فیتر" />        
                                                            <asp:Button runat="server" ID="exporttoexcel" OnClick="exporttoexcel_Click" Text="آماده سازی برای خروجیها" />
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="CPayReqs.aspx">همه</a>
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
                            </ContentTemplate></asp:UpdatePanel>
                            </div>
                            <!-- end page title -->
<asp:UpdatePanel runat="server" ID="UP"><ContentTemplate>
         <div class="row">
             <div class="col-xl-9">       
                  <asp:Button runat="server" OnClick="Register_Click" ID="Register" 
                            class="btn btn-primary btn-user btn-block" Text="تایید همه" />   
          <telerik:RadGrid AllowPaging="true" PageSize="40" ClientSettings-AllowKeyboardNavigation="true" 
           ID="Marketers_Grid" runat="server" AutoGenerateColumns="true" GroupPanelPosition="Top" Font-Names="BK" Font-Overline="False" 
              ClientSettings-AllowColumnHide="true" FilterMenu-EnableAutoScroll="true"
            OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"
          
           BorderStyle="Inset" AllowSorting="True">
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <HeaderStyle Font-Size="Small" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridButtonColumn CommandName="Confirm" FilterControlAltText="Filter column9 column" HeaderText="تایید پرداخت"
                             ConfirmText="آیا برای تایید پرداخت مطمئن هستید؟!!!"                          
                             UniqueName="CD_DL" DataTextField="CD_DL" HeaderTooltip="تایید پرداخت">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>

                        <telerik:GridButtonColumn CommandName="Llogin" FilterControlAltText="Filter column9 column" HeaderText="ورود"                                                    
                             UniqueName="Llogin" DataTextField="Llogin" HeaderTooltip="Llogin">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>

                        <telerik:GridButtonColumn CommandName="Detail" FilterControlAltText="Filter column9 column" HeaderText="Detail"                                                    
                             UniqueName="Detail" DataTextField="Detail" HeaderTooltip="Detail">
                            <HeaderStyle HorizontalAlign="Center" Font-Names="BK" />
                            <ItemStyle ForeColor="#0066FF" Font-Underline="false" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center" BorderStyle="Outset" Font-Names="B Nazanin" />
                        </telerik:GridButtonColumn>

                        <telerik:GridTemplateColumn DataField="SMS" FilterControlAltText="Filter TemplateColumn column" HeaderText="SMS" UniqueName="SMS">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID ="SMSCH" />
                            </ItemTemplate>
                            <HeaderStyle Font-Names="BK" HorizontalAlign="Center" />
                            <ItemStyle BorderStyle="Outset" Font-Names="BK" HorizontalAlign="Center" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
       <asp:TextBox runat="server" ID="Detail" class="btn btn-success btn-user btn-block" ></asp:TextBox>
                  </div>
             </div>
                 <%--OnNeedDataSource="Marketers_Grid_NeedDataSource" OnItemCommand="Marketers_Grid_ItemCommand"--%>          
</ContentTemplate></asp:UpdatePanel>
                            <!-- end row -->
            
                            <div class="row" style="display:none">
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
            
                            <div class="row" style="display:none">
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
            
                            <div class="row" style="display:none">
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
                                                            <p class="text-muted mb-0">dolor sit amet</p></td>
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
                                                            <p class="text-muted mb-0">dolor sit amet</p></td>
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
                                                            <p class="text-muted mb-0">pretium quis</p></td>
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
                                                            <p class="text-muted mb-0">ultricies nec</p></td>
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
                           <!-- end row -->
</asp:Content>
