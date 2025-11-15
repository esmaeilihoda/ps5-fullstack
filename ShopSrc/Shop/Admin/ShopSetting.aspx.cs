using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Library;

namespace Shop.Shop.Admin
{
    public partial class ShopSetting : System.Web.UI.Page
    {
        string[] login; Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //    Response.Redirect("Login.aspx");
            //else
            //{
            //    login = (string[])Session["Login"];
            //    if (login[0] != "OK")
            //        Response.Redirect("Login.aspx");
            //}
            if (!IsPostBack)
            {
                ME.Q_Add(@"SELECT      SlidePics ,BannerUrl,PicLeftOne,PicleftTwo,BanerBottomRight,BanerBottomLeft,BanerCenter,linkSlide,LinkBannerPic,Linkpicleftone,Linkpiclefttwo,LinkBanerBottomRight,LinkBanerBottomLeft,LinkBanerCenter
                               FROM            Shop_Setting");
                DataView dv = ME._GetDataView();
                if (dv.Count > 0)
                {
                    SlidePics.Value = dv[0]["SlidePics"].ToString();
                    BannerPic.Value = dv[0]["BannerUrl"].ToString();
                    picleftone.Value = dv[0]["PicLeftOne"].ToString();
                    piclefttwo.Value = dv[0]["PicleftTwo"].ToString();
                    BanerBottomRight.Value = dv[0]["BanerBottomRight"].ToString();
                    BanerBottomLeft.Value = dv[0]["BanerBottomLeft"].ToString();
                    BanerCenter.Value = dv[0]["BanerCenter"].ToString();
                    linkSlide.Value = dv[0]["linkSlide"].ToString();
                    LinkBannerPic.Value = dv[0]["LinkBannerPic"].ToString();
                    Linkpicleftone.Value = dv[0]["Linkpicleftone"].ToString();
                    Linkpiclefttwo.Value = dv[0]["Linkpiclefttwo"].ToString();
                    LinkBanerBottomRight.Value = dv[0]["LinkBanerBottomRight"].ToString();
                    LinkBanerBottomLeft.Value = dv[0]["LinkBanerBottomLeft"].ToString();
                    LinkBanerCenter.Value = dv[0]["LinkBanerCenter"].ToString();
                }
            }            
        }
           

        protected void saveitems_Click(object sender, EventArgs e)
        {
            //--------------------------------create array to save database --> page hiden list
            ME.Q_Add(@"SELECT   TOP(1)     CPE
                                FROM            Shop_Setting");
            string cpe = ME.GetF2Str();
            string[] cppages = cpe.Split(",".ToCharArray());
            string newitel = "";
            for (int i = 0; i < ElemntsGrid.Items.Count; i++)
            {
                CheckBox chkk = (CheckBox)ElemntsGrid.Items[i].FindControl("CHK");
                if (chkk.Checked)
                {
                    newitel += ElemntsGrid.Items[i]["elementname"].Text + ":";                    
                }
            }
            int control = 0;
            for (int pagi = 0; pagi < cppages.Length; pagi++)
            {
                string[] hidedlemnts = cppages[pagi].Split(":".ToCharArray());
                if (hidedlemnts[0] == PageList.SelectedValue)
                {
                    cppages[pagi] = hidedlemnts[0] + ":" + newitel;
                    control++;
                }
            }
            string pagiinser = "";
            int plen = 0;
            foreach(string pag in cppages)
            {                
                pagiinser += pag;
                if (plen < cppages.Length - 1)
                    pagiinser += ",";
                plen++;
            }
            if (control == 0)
                if (cppages.Length != 0 && cppages[0] !="")
                    pagiinser += "," + PageList.SelectedValue + ":" + newitel;
                else
                    pagiinser += PageList.SelectedValue + ":" + newitel;

            ///////////////////////////////////////////////////////////////////////
            string PCon = P_Content.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.RejectTrackChanges);
            ME.Q_Add(@"SELECT      COUNT(*)
                               FROM            Shop_Setting");
            if (ME.Counter() == 0)
            {
                ME.Q_Add(@"INSERT INTO Shop_Setting(SlidePics, BannerUrl, CPE,PicLeftOne,PicleftTwo,BanerBottomRight,BanerBottomLeft,BanerCenter,linkSlide,LinkBannerPic,Linkpicleftone,Linkpiclefttwo,LinkBanerBottomRight,LinkBanerBottomLeft,LinkBanerCenter)
                               VALUES(@SlidePics, @BannerUrl, @CPE,@PicLeftOne,@PicleftTwo,@BanerBottomRight,@BanerBottomLeft,@BanerCenter,@linkSlide,@LinkBannerPic,@Linkpicleftone,@Linkpiclefttwo,@LinkBanerBottomRight,@LinkBanerBottomLeft,@LinkBanerCenter)");
                
                ME.ParamAdd("@SlidePics", SlidePics.Value);
                ME.ParamAdd("@BannerUrl", BannerPic.Value);
                ME.ParamAdd("@CPE", pagiinser.Trim());
                ME.ParamAdd("@PicLeftOne", picleftone.Value);
                ME.ParamAdd("@PicleftTwo", piclefttwo.Value);
                ME.ParamAdd("@BanerBottomRight", BanerBottomRight.Value);
                ME.ParamAdd("@BanerBottomLeft", BanerBottomLeft.Value);
                ME.ParamAdd("@BanerCenter", BanerCenter.Value);
                ME.ParamAdd("@linkSlide", linkSlide.Value);
                ME.ParamAdd("@LinkBannerPic", LinkBannerPic.Value);
                ME.ParamAdd("@Linkpicleftone", Linkpicleftone.Value);
                ME.ParamAdd("@Linkpiclefttwo", Linkpiclefttwo.Value);
                ME.ParamAdd("@LinkBanerBottomRight", LinkBanerBottomRight.Value);
                ME.ParamAdd("@LinkBanerBottomLeft", LinkBanerBottomLeft.Value);
                ME.ParamAdd("@LinkBanerCenter", LinkBanerCenter.Value);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("تنظیمات اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت تنظیمات", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Shop_Setting SET SlidePics = @SlidePics,  BannerUrl = @BannerUrl, CPE = @CPE ,PicLeftOne=@PicLeftOne ,PicleftTwo=@PicleftTwo,BanerBottomRight=@BanerBottomRight,BanerBottomLeft=@BanerBottomLeft,BanerCenter=@BanerCenter,

                    linkSlide=@linkSlide,LinkBannerPic=@LinkBannerPic,Linkpicleftone=@Linkpicleftone,Linkpiclefttwo=@Linkpiclefttwo,LinkBanerBottomRight=@LinkBanerBottomRight,LinkBanerBottomLeft=@LinkBanerBottomLeft,LinkBanerCenter=@LinkBanerCenter");

                ME.ParamAdd("@SlidePics", SlidePics.Value);
                ME.ParamAdd("@BannerUrl", BannerPic.Value);
                ME.ParamAdd("@CPE", pagiinser);
                ME.ParamAdd("@PicLeftOne", picleftone.Value);
                ME.ParamAdd("@PicleftTwo", piclefttwo.Value);
                ME.ParamAdd("@BanerBottomRight", BanerBottomRight.Value);
                ME.ParamAdd("@BanerBottomLeft", BanerBottomLeft.Value);
                ME.ParamAdd("@BanerCenter", BanerCenter.Value);
                ME.ParamAdd("@linkSlide", linkSlide.Value);
                ME.ParamAdd("@LinkBannerPic", LinkBannerPic.Value);
                ME.ParamAdd("@Linkpicleftone", Linkpicleftone.Value);
                ME.ParamAdd("@Linkpiclefttwo", Linkpiclefttwo.Value);
                ME.ParamAdd("@LinkBanerBottomRight", LinkBanerBottomRight.Value);
                ME.ParamAdd("@LinkBanerBottomLeft", LinkBanerBottomLeft.Value);
                ME.ParamAdd("@LinkBanerCenter", LinkBanerCenter.Value);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("تنظیمات اصلاح شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در اصلاح تنظیمات", sender);
            }
        }

        protected void ElemntsGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void PageList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable elemdt = new DataTable();
            elemdt.Columns.Add("elementname", typeof(string));
            elemdt.Columns.Add("CHK", typeof(bool));
            string[] masterelemnts = Constants.shopmainclist.Split(",".ToCharArray());
            if (Constants.shopmainclist == "")
            {
                SMM.CreateMessageAlert("یک بار صفحه فروشگاه را باز کنید!", sender);
                return;
            }
            else
            {
                foreach(string pelemn in masterelemnts)
                {
                    elemdt.Rows.Add(pelemn, 0);
                }
            }
            ElemntsGrid.DataSource = elemdt;
            ElemntsGrid.DataBind();

            ME.Q_Add(@"SELECT   TOP(1)     CPE
                                FROM            Shop_Setting");
            string cpe = ME.GetF2Str();
            string[] cppages = cpe.Split(",".ToCharArray());

            foreach(string pag in cppages)
            {
                string[] hidedlemnts = pag.Split(":".ToCharArray());
                if (hidedlemnts[0] == PageList.SelectedValue)
                {                    
                    foreach(string hideelemnt in hidedlemnts)
                    {
                        for(int i = 0; i< ElemntsGrid.Items.Count; i++)
                        {
                            if(ElemntsGrid.Items[i]["elementname"].Text == hideelemnt)
                            {
                                CheckBox chkk = (CheckBox)ElemntsGrid.Items[i].FindControl("CHK");
                                chkk.Checked = true;
                            }
                        }
                    }
                }
            }

        }
    }
}