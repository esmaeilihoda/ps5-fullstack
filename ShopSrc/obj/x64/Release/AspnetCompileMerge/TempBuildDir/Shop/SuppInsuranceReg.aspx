<%@ Page Title="" Language="C#" MasterPageFile="~/Shop/ShopMain.Master" AutoEventWireup="true" CodeBehind="SuppInsuranceReg.aspx.cs" Inherits="NM.Shop.SuppInsuranceReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="befSlideBox" runat="server">
   
    <form>
        <div class="col-12 ">
            <div class="row">
                <div class="col-md-8 col-12 m-auto" style="border-radius: 10px;border: 1px solid #cabfbfb5;padding: 15px;">
                   <div class="row">
                        <div class="col-12 col-md-6 mb-3">
                            <lable for="Name">نام </lable>
                            <input type="text" class="form-control" placeholder="نام  را وارد نمایید" id="Name" runat="server" />
                        </div>
                        <div class="col-12 mb-3 col-md-6">
                            <lable for="Family">نام خانوادگی </lable>
                            <input type="text" class="form-control" placeholder="نام خانوادگی را وارد نمایید" id="Family" runat="server" />
                        </div>
                   </div>
                    <div class="row">
                        <div class="col-12 col-md-6 mb-3">
                            <lable for="FatherName">نام پدر </lable>
                            <input type="text" class="form-control" placeholder="نام پدر را وارد نمایید" id="FatherName" runat="server" />
                        </div>
                        <div class="col-12 mb-3 col-md-6">
                            <lable for="DateBirth">تاریخ تولد </lable>
                            <input type="text" class="form-control" placeholder="تاریخ تولد را وارد نمایید" id="DateBirth" runat="server" />
                        </div>
                   </div>
                    <div class="row">
                        <div class="col-12 col-md-6 mb-3">
                            <lable for="Sex">جنسیت </lable>
                            <asp:DropDownList  class="form-control" placeholder="جنسیت  را انتخاب نمایید" id="Sex" runat="server" >
                                <asp:ListItem text="مرد" value="1"></asp:ListItem>
                                <asp:ListItem text="زن" value="2"></asp:ListItem>
                                <asp:ListItem text="دوجنسی/نامشخص" value="3"></asp:ListItem>
                                <asp:ListItem text="تعیین نشده" value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 mb-3 col-md-6">
                            <lable for="MarriedStatus"> وضعیت تاهل</lable>
                            <asp:DropDownList  class="form-control" placeholder="وضعیت تاهل را انتخاب نمایید" id="MarriedStatus" runat="server" >
                                <asp:ListItem text="مجرد" value="2"></asp:ListItem>
                                <asp:ListItem text="متاهل" value="3"></asp:ListItem>
                                <asp:ListItem text="سایر" value="5"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                   </div>
                    <div class="row">
                        <div class="col-12 col-md-6 mb-3">
                            <lable for="Name">نام </lable>
                            <input type="text" class="form-control" placeholder="نام  را وارد نمایید" id="Text5" runat="server" />
                        </div>
                        <div class="col-12 mb-3 col-md-6">
                            <lable for="Family">نام خانوادگی </lable>
                            <input type="text" class="form-control" placeholder="نام خانوادگی را وارد نمایید" id="Text6" runat="server" />
                        </div>
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
