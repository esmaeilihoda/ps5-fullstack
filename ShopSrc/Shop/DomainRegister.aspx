<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="DomainRegister.aspx.cs" Inherits="Shop.Shop.DomainRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">
   
    <form>
        <div class="col-12 ">
            <div class="row">
                <div class="col-md-8 col-12 m-auto" style="border-radius: 10px;border: 1px solid #cabfbfb5;padding: 15px;">
                    <div class="col-12 mb-3">
                        <lable>نام کاربری</lable>
                        <input type="text" class="form-control" placeholder="نام کاربری را وارد نمایید" id="DRusername" runat="server" />
                    </div>
                    <div class="col-12">
                        <div class="row" style="direction: ltr">
                            <div class="col-md-6 col-12 mr-md-0 pr-md-0">

                                <input type="text" class="form-control" placeholder="نام دامنه را وارد نمایید مثال: CHECKIT" id="DRsubdomain" runat="server" />
                            </div>
                            <div class="col-md-3 col-12 ml-md-0 pl-md-0 mr-md-0 pr-md-0">
                                <select class="form-control" id="DRdomain" runat="server">
                                    <option value="CHECKITshop">CHECKITshop</option>
                                </select>

                            </div>
                            <div class="col-md-3 col-12 ml-md-0 pl-md-0">
                                <select class="form-control" id="DRtypedomain" runat="server">
                                    <option value="com" >.com</option>
                                </select>
                            </div>

                        </div>

                    </div>
                     <div class="col-12 mt-3">
                    
                    <input type="text" class="form-control" maxlength="11" minlength="11" id="DRmobile" runat="server"  placeholder="شماره موبایل را با صفر وارد نمایید"/>
                </div>
                    <div class="col-12 mt-3" > 
                        
                        <asp:Button runat="server" Text="ارسال درخواست" ID="save"  CssClass="btn btn-success btn-block" OnClick="save_Click" Style="display:none;"/>
                        <input type="button" value="ارسال درخواست" ID="savebutton"  Class="btn btn-success btn-block" />
                    </div>
                </div>
            </div>
        </div>
    </form>
   
    <script type="text/javascript">

        function phonenumber(inputtxt) {
            var phoneno = /^\d{11}$/;
            if (inputtxt.match(phoneno)) {
               
                
                return true;
            }
            else {
                alert("فرمت تلفن همراه صحیح نمی باشد");
                return false;
            }
        }
        
        $(document).ready(function () {
            $("#befSlideBox_DRmobile").mask('09999999999', {
                translation: {
                    '0': {
                        pattern: /0/,
                        fallback: '0',
                        optional: false
                    }
                }
            });
            $("#savebutton").click(function () {
               
                if (phonenumber($("#befSlideBox_DRmobile").val()) == true) {
                    fin("befSlideBox_save").click();
                } else {
                    return;
                }
              
                
               
            });
        });

    </script>
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
