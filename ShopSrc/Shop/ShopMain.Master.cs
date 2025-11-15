using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Shop.Class;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;
using System.Net;

namespace Shop.Shop
{
    public partial class ShopMain : System.Web.UI.MasterPage
    {
        ShowMessage Sm = new ShowMessage();
         string[] Userlogin = null;
        private int MID = 0;
        public string IPAddress;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Userlogin = (string[])Session["Login"];
            
                Model.EXEQ ME = new Model.EXEQ();
            if (Userlogin != null)
            {
                MID = int.Parse(Userlogin[1]);
                ME.Q_Add(@"SELECT Name +' '+Family+' ('+UserName+')' AS NameUser FROM Marketers WHERE ID=@MID ");
                ME.ParamAdd("@MID", MID);
                NameUser.InnerHtml = ME.GetF2Str();
            }
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'topmenu' AND Status = 1 ");
            string lid = ME.GetF2Str();

            ME.Q_Add(@"SELECT Reagent FROM Marketers WHERE ID=@MID");
            ME.ParamAdd("@MID", MID);
            String Ragent = ME.GetF2Str();
            if (Userlogin !=null && Ragent == "")
            {
                UserAnsherli.Visible  = false;
            }

            if (Userlogin == null)
            {
                UserAnsherli.Visible = false;
            }

            ME.Q_Add(@"SELECT  TOP(1)  Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1 ");
            ME.ParamAdd("@LID", lid);

            headertopmenu.InnerHtml = ME.GetF2Str();
            ///////////////////////////////////////////////////////////////////verticalmenudesktop
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'VerticalDesktop'  AND Status = 1 ");
            lid = ME.GetF2Str();
            ME.Q_Add(@"SELECT  TOP(1)   Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1 ");
            ME.ParamAdd("@LID", lid);

            // verticalmenudesktop.InnerHtml = ME.GetF2Str();
            //------------------------------------------------ define strings
            string PCon = "";//verticalmenudesktop.InnerHtml;
            string input = PCon;
            string pattern = "fa fa-angle-left";
            string replace = "has-sub";
            string result = "";
            /////////////////////////////////////////////////////////MobVerticalMenu
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'MobVerticalMenu'  AND Status = 1 ");
            lid = ME.GetF2Str();
            ME.Q_Add(@"SELECT  TOP(1)   Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1 ");
            ME.ParamAdd("@LID", lid);
            //veritcalmobmenu.InnerHtml = ME.GetF2Str();
            //////////////////////////////////////////////////////////////////footer
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'footer'  AND Status = 1 ");
            lid = ME.GetF2Str();
            ME.Q_Add(@"SELECT  TOP(1)   Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1 ");
            ME.ParamAdd("@LID", lid);

            footer.InnerHtml = ME.GetF2Str();
            //////////////////////////////////////////////////////////////////
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'BaghalVerticalDesktop'  AND Status = 1 ");
            lid = ME.GetF2Str();
            ME.Q_Add(@"SELECT  TOP(1)   Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1");
            ME.ParamAdd("@LID", lid);

            BaghalList.InnerHtml = ME.GetF2Str();
            //-----------------------------------
            ME.Q_Add(@"SELECT TOP(1) Id, ListName, ParentId, Position
                         FROM    Shop_Lists WHERE Position = 'MobVerticalMenu'  AND Status = 1 ");
            lid = ME.GetF2Str();
            ME.Q_Add(@"SELECT  TOP(1)   Contents
                          FROM            Shop_ListItems WHERE LID =@LID  AND Status = 1");
            ME.ParamAdd("@LID", lid);
            MobBaghalList.InnerHtml = ME.GetF2Str();


            //mobilemenu;
            ///////////////////////////////////////////////////////////////

            //ME.Q_Add(@"SELECT   Id, GName FROM   Shop_PGroups ");
            //pgroup.Items.Clear();
            //DataView DVP = ME._GetDataView();
            //foreach (DataRowView drv in DVP)
            //{
            //    ListItem li = new ListItem();
            //    li.Text = drv["GName"].ToString();
            //    li.Value = drv["Id"].ToString();
            //    pgroup.Items.Add(li);
            //}
            ///////////////////////////////////////////////////////////////////////
            //ME.Q_Add(@"SELECT      BannerUrl
            //            FROM            Shop_Setting");
            //string burl = ME.GetF2Str();
            //if (burl != "")
            //{
            //    burl = burl.Replace("©", "");
            //    bdiv.Visible = true;
            //    bpic.Src = burl;
            //}


            ///////////////////////////////chek domain active////////////////////////////////////////
            ME.Q_Add("SELECT Dsc AS CCBN FROM shop_domainregister WHERE Status = 0 AND DRsubdomain = @DRsubdomain ");
            ME.ParamAdd("@DRsubdomain", CookieControl.GetDomainName);
            DataView ress = ME._GetDataView();
            if(ress.Count !=0 )
            {
                if (ress[0][0].ToString() != "")
                    Sm.RunAnyScript(@"document.body.innerHTML = '" + ress[0][0].ToString() + "';", sender);
                else
                    Sm.RunAnyScript(@"document.body.innerHTML = 'دامنه شما فعال نمیباشد';", sender);
                return;
            }
            //----------------------------------- ثبت بازدید از سایت -----------------
             IPAddress = GetIPAddress();
            
            string DomainName = Class.CookieControl.GetDomainName;
            
            
            ME.Q_Add(@"INSERT INTO [dbo].[Shop_DomainVisit]  ([DomainName] ,[Count] ,[PDate],[IP])
                         VALUES
                         (@DomainName,@Count,@PDate,@IP)");
            ME.ParamAdd("@DomainName", DomainName);
            ME.ParamAdd("@Count", 1);
            ME.ParamAdd("@PDate", Constants.CurDate());
            ME.ParamAdd("@IP", IPAddress);
            ME.Run();

            ME.Q_Add("SELECT Count(*)+100000 AS CountVisit FROM Shop_DomainVisit WHERE DomainName IN('CHECKITshop.com','www.CHECKITshop.com')");
            CountVisit.InnerText = ME.GetF2Str();
            
          





            //----------------------------------- ثبت بازدید از سایت پایان -----------------
            ///
            IList<string> ids = Request.GetFriendlyUrlSegments();
            string df =  Request.MapPath("");

            string[] sPagePath = System.Web.HttpContext.Current.Request.Url.AbsolutePath.Split("/".ToCharArray());
            string sPageName = sPagePath[sPagePath.Length-ids.Count-1];
            //string
            //System.IO.FileInfo oFileInfo = new System.IO.FileInfo(sPagePath);

            if (Constants.shopmainclist == "" /*&& sPageName.ToLower() == "shop.aspx".ToLower()*/)
                foreach (Control ff in Controls)
                {
                    if (ff.ID != null && ff.ID != string.Empty)
                        Constants.shopmainclist += ff.ID + ",";
                    foreach (Control parent in ff.Controls)
                    {
                        if (parent.ID != null && parent.ID != string.Empty)
                            Constants.shopmainclist += parent.ID + ",";
                    }
                }
            ///////////////////////////////////////////////////////////////////////////
            ME.Q_Add(@"SELECT      CPE
                        FROM            Shop_Setting");
            string controlpageelemnt = ME.GetF2Str();
            string[] cpe = controlpageelemnt.Split(",".ToCharArray());


            foreach (string cpp in cpe)
            {
                string[] cpcc = cpp.Split(":".ToCharArray());
                if (cpcc[0].ToLower() == sPageName.ToLower()+".aspx")
                {
                    foreach (string element in cpcc)
                        if (element.ToLower() != sPageName.ToLower() + ".aspx")
                            try
                            {
                                if (element != null && element != string.Empty)
                                {
                                    FindControl(element).EnableViewState = false;
                                    //FindControl(element) = false;
                                    FindControl(element).Visible = false;
                                }
                            }
                            catch
                            {

                            }
                }
            }

            if (!IsPostBack && Request.QueryString["email"] != null)
            {
                ShowMessage SMM = new ShowMessage();
                ME.Q_Add(@"INSERT
                   INTO      Shop_Mail_News(UserMail)
                   VALUES        (@UserMail)");
                ME.ParamAdd("@UserMail", Request.QueryString["email"]);
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("ایمیل شما در خبرنامه ثبت شد", sender);
                else
                    SMM.CreateMessageAlert("دوباره امتحان کنید احتمالا شما قبلا عضو خبرنامه شده اید!", sender);
            }
            
            if (!IsPostBack)
            {
                string[] cook = Get_SetCookie();
            }
        }

        public int Get_MID
        {
            get { 
                string[] GMID = (string[])Session["Login"];
                if (GMID != null)
                    return int.Parse(GMID[1]);
                else
                    return 0;
            } 
        }
        
        public string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }
            
            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        public DataView getpv(int top, string sort, int pgroup, string ViewGroup)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT   TOP(@TOP)   PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                        ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                          FROM            Shop_Products WHERE GRP = @GRP AND ViewGroup = @ViewGroup AND CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1)  ");
            ME.ParamAdd("@TOP", top);
            ME.ParamAdd("@GRP", pgroup);
            ME.ParamAdd("@sort", sort);
            ME.ParamAdd("@ViewGroup", ViewGroup);
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            return ME._GetDataView();
        }
        public DataView getpv(int top, string sort, string ViewGroup)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT   TOP(@TOP)   PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                        ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                          FROM            Shop_Products WHERE ViewGroup = @ViewGroup AND CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1) ");
            ME.ParamAdd("@TOP", top);
            ME.ParamAdd("@sort", sort);
            ME.ParamAdd("@ViewGroup", ViewGroup);
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            return ME._GetDataView();
        }
        public DataView getpv(int top, string sort)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT   TOP(@TOP)   PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                        ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                          FROM            Shop_Products WHERE CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1)");
            ME.ParamAdd("@TOP", top);
            ME.ParamAdd("@sort", sort);
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            return ME._GetDataView();
        }
        public DataView getpv(int top, string sort, int pgroup)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT   TOP(@TOP)   PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                        ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                          FROM            Shop_Products WHERE GRP = @GRP AND CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1) ");
            ME.ParamAdd("@TOP", top);
            ME.ParamAdd("@GRP", pgroup);
            ME.ParamAdd("@sort", sort);
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            return ME._GetDataView();
        }
        public DataView getslider()
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT      SlidePics,PicLeftOne,PicleftTwo,BanerBottomRight,BanerBottomLeft,BanerCenter,linkSlide,LinkBannerPic,Linkpicleftone,Linkpiclefttwo,LinkBanerBottomRight,LinkBanerBottomLeft,LinkBanerCenter
                        FROM            Shop_Setting");
            //ME.ParamAdd("@TOP", top);
            //ME.ParamAdd("@GRP", pgroup);
            //ME.ParamAdd("@sort", sort);
            return ME._GetDataView();
        }
        public DataView GetPrDetails(string pid)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT        *, CASE  WHEN EndDDate >= @CurDate  AND VPrice > 0 THEN VPrice WHEN VPrice > 0 
                                  AND  EndDDate=0 THEN VPrice ELSE Price END 
                                     AS NPrice
                                       FROM            Shop_Products WHERE PId = @PId AND CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1)");
            ME.ParamAdd("@PId", pid);
            ME.ParamAdd("@CurDate", Constants.CurDate());
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            return ME._GetDataView();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns>Current User Session</returns>
        public string[] Get_SetCookie()
        {
            string[] Rt = new string[2];
            if (this.Context.Request.Cookies["CL_Req"] != null)
                Rt[0] = this.Context.Request.Cookies["CL_Req"].Value;
            else
            {
                string SessionID = HttpContext.Current.Session.SessionID;
                var cookie = new HttpCookie("CL_Req", SessionID);
                Response.AppendCookie(cookie);
                cookie.Expires = DateTime.Now.AddMonths(3);
                Rt[0] = SessionID;
            }
            return Rt;
        }
        public string Userdomaincontrol(string username)
        {

            string rtt = "0";
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT COUNT(*) FROM MPay WHERE " +
                    "MID IN(SELECT Id FROM Marketers WHERE UserName = @NationalCode AND PayType IN("
                               + Constants.get_pack_paytypes
                                  + ")  ) ");

            ME.ParamAdd("@NationalCode", username);
            if (ME.Counter() > 0)
            {
                rtt = "1";
            }
            else
                rtt = "0";
            return rtt;
        }
        public DataView search(string searchval,int pageNumber, int GRP,string Mod,string ViewGroup)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"--pageing
                       --searchFullproduct
                         CREATE TABLE #Product       
                         (   
	                         PId INT, GRP INT, PName NVARCHAR(500), Price BIGINT, VPrice BIGINT, Disc INT, Dsc NVARCHAR(1000), Size NVARCHAR(1000), Stock INT, SHave INT, ImageUrl NVARCHAR(700),
	                         ImageUrl2  NVARCHAR(700), Gallarys NVARCHAR(1000), Color NVARCHAR(50), Byable TINYINT, Details NVARCHAR(MAX), EndDDate NVARCHAR(20)     
	                         ,RowNumber INT IDENTITY(1,1)       
                         ) 
                      
                         DECLARE @intTotal INT             
                         DECLARE @SQL VARCHAR(MAX)       
                              SET @intTotal = @PageSize * @PageNumber 
	                      
                         IF @mod ='search'
                         BEGIN    
 	                         INSERT INTO #Product  
	                         SELECT PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
							                         ImageUrl2, Gallarys, Color, Byable, Details, EndDDate FROM Shop_Products  
							                         WHERE (PName lIKE N'%'+@seva+'%' OR Dsc LIKE N'%'+@seva+'%') AND Byable=1 AND CStatus=1 AND (Domain IS NULL OR
							                          Domain = @Domain OR AllShops = 1)   
                         END
                         ELSE IF @mod = 'cat' AND @GRP <> 0
                         BEGIN
 
	                        INSERT INTO #Product 
	                        SELECT    PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                                                ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                                                  FROM            Shop_Products WHERE GRP = @GRP AND CStatus =1 AND (Domain IS NULL OR
                                                 Domain = @Domain OR AllShops = 1) 
                         END 
                         ELSE IF @mod = 'normal'
                         BEGIN
	                        INSERT INTO #Product 
	                        SELECT   PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                                                ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                                                  FROM            Shop_Products WHERE CStatus =1 AND (Domain IS NULL OR
                                                 Domain = @Domain OR AllShops = 1) 
                         END  
						 ELSE IF @mod = 'showViewGroup'
                         BEGIN
	                        INSERT INTO #Product 
	                        SELECT    PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
											ImageUrl2, Gallarys, Color, Byable, Details, EndDDate
                          FROM            Shop_Products WHERE ViewGroup = @shvgv AND CStatus =1 AND (Domain IS NULL OR
                         Domain = @Domain OR AllShops = 1)
						 END           
                   
                         DECLARE @TotalRecords INTEGER             
                         DECLARE @TotalPage INTEGER                         
                         SELECT @TotalRecords=MAX(RowNumber) FROM #Product              
                         IF(@TotalRecords is not NULL)             
                         BEGIN             
	                          IF(@TotalRecords%@PageSize = 0)             
		                          BEGIN             
				                        SET @TotalPage = @TotalRecords/@PageSize             
		                          END             
	                          ELSE              
		                          BEGIN             
				                        SET @TotalPage = @TotalRecords/@PageSize + 1             
		                          END             
                        END             
                        ELSE             
	                         BEGIN             
		                         SET @TotalPage = 1             
                             END  
             
                          SELECT         
                           PId, GRP, PName, Price, VPrice, Disc, Dsc, Size, Stock, SHave, ImageUrl,
                                                 ImageUrl2, Gallarys, Color, Byable, Details, EndDDate,@TotalPage [TotalPages], @TotalRecords [TotalRecords] ,RowNumber 
						                         FROM #Product           
                          WHERE  RowNumber between ((@PageNumber * @PageSize)-(@PageSize- 1)) AND (@PageNumber * @PageSize)                        
                         DROP TABLE #Product      ");
            ME.ParamAdd("@PageNumber", pageNumber);
            ME.ParamAdd("@PageSize", 12);
            ME.ParamAdd("@seva", searchval);
            ME.ParamAdd("@Domain", CookieControl.GetDomainName);
            ME.ParamAdd("@GRP", GRP);
            ME.ParamAdd("@mod", Mod);
            ME.ParamAdd("@shvgv", ViewGroup);
            return ME._GetDataView();

        }

        protected void BtnEmailReg_Click(object sender, EventArgs e)
        {
            if(txtEmail.Value != "")
            {
                Model.EXEQ ME = new Model.EXEQ();
                ShowMessage SMM = new ShowMessage();
                ME.Q_Add(@"INSERT
                   INTO      Shop_Mail_News(UserMail)
                   VALUES        (@UserMail)");
                ME.ParamAdd("@UserMail", txtEmail.Value.ToString());
                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("ایمیل شما در خبرنامه ثبت شد", sender);
                else
                    SMM.CreateMessageAlert("دوباره امتحان کنید احتمالا شما قبلا عضو خبرنامه شده اید!", sender);
            }
        }

    }
}