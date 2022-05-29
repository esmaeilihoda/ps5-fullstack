using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Library;

namespace Shop.Account
{
    public partial class HomeManager : System.Web.UI.Page
    {

        Model.EXEQ ME = new Model.EXEQ();
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
                ME.Q_Add(@"SELECT      SlidePics, BannerUrl, lisnks, Certificats
                               FROM            Home_Manager");
                DataView dv = ME._GetDataView();
                if (dv.Count > 0)
                {
                    SlidePics.Value = dv[0]["SlidePics"].ToString();
                    BannerPic.Value = dv[0]["BannerUrl"].ToString();
                    lisnks.Value = dv[0]["lisnks"].ToString();
                    Certificats.Value = dv[0]["Certificats"].ToString();
                }
            }

            string dd = Constants.shopmainclist;
        }
           

        protected void saveitems_Click(object sender, EventArgs e)
        {
            //--------------------------------create array to save database --> page hiden list
            ME.Q_Add(@"SELECT   TOP(1)     CPE
                                FROM            Home_Manager");
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
                               FROM            Home_Manager");
            if (ME.Counter() == 0)
            {
                ME.Q_Add(@"INSERT INTO Home_Manager(SlidePics, BannerUrl, CPE)
                               VALUES(@SlidePics, @BannerUrl, @CPE ");
                
                ME.ParamAdd("@SlidePics", SlidePics.Value);
                ME.ParamAdd("@BannerUrl", BannerPic.Value);
                ME.ParamAdd("@CPE", pagiinser);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("تنظیمات اضافه شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در ثبت تنظیمات", sender);
            }
            else
            {
                ME.Q_Add(@"UPDATE Home_Manager SET SlidePics = @SlidePics,  BannerUrl = @BannerUrl, CPE = @CPE,
                             Certificats = @Certificats, lisnks = @lisnks ");

                ME.ParamAdd("@SlidePics", SlidePics.Value);
                ME.ParamAdd("@BannerUrl", BannerPic.Value);
                ME.ParamAdd("@CPE", pagiinser);
                ME.ParamAdd("@Certificats", Certificats.Value);
                ME.ParamAdd("@lisnks", lisnks.Value);

                if (ME.Run() == "runed")
                    SMM.CreateMessageAlert("تنظیمات اصلاح شد", sender);
                else
                    SMM.CreateMessageAlert("اشکال در اصلاح تنظیمات", sender);
            }
        }

        protected void ElemntsGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add("SELECT * FROM SiteContent ");
            RadGrid1.DataSource = ME._GetDataTable();
        }
        public DataView GETHOMESETTING()
        {
            ME.Q_Add("SELECT * FROM    Home_Manager");
            return ME._GetDataView();
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
                                FROM            Home_Manager");
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

        protected void addcontent_Click(object sender, EventArgs e)
        {
            string PCon = P_Content.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.RejectTrackChanges);
            string message = string.Empty;
            ME.Q_Add("SELECT COUNT(*) FROM SiteContent WHERE Id = @Id  ");
            ME.ParamAdd("@Id", SID.Value);
            if (ME.Counter() > 0)
            {
                ME.Q_Add(@"UPDATE     SiteContent SET Number = @Number, head=@head, contentt=@contentt, FullContent=@FullContent
                             ,TNews = @TNews
                              WHERE Id = @Id ");
                ME.ParamAdd("@Id", SID.Value);
                message = "اصلاح شد";
            }
            else
            {
                ME.Q_Add(@"INSERT       INTO              SiteContent(Number, head, contentt, FullContent, TNews)
                               VALUES       (@Number, @head, @contentt, @FullContent, @TNews)");
                message = "اضافه شد";
            }
            ME.ParamAdd("@Number", Number.Text);
            ME.ParamAdd("@head", head.Text);
            ME.ParamAdd("@contentt", contentt.Text);
            ME.ParamAdd("@FullContent", PCon);
            ME.ParamAdd("@TNews", (NEWS.Checked ? 1 : 0));
            if (ME.Run() == "runed")
                SMM.CreateMessageAlert(message, sender);
            else
                SMM.CreateMessageAlert("مشکل در ثبت اطلاعات", sender);
            radbind();
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "ED")
            {
                int iindex = e.Item.ItemIndex;
                string Idd = RadGrid1.Items[iindex]["SSId"].Text;
                ME.Q_Add(@"SELECT       TOP (200) Id, Number, head, contentt, FullContent, ISNULL(TNews, 0) AS TNews
                         FROM            SiteContent WHERE Id = @Id");
                ME.ParamAdd("@Id", Idd);
                DataView DTV = ME._GetDataView();
                DataRowView SDRV = DTV[0];
                SID.Value = SDRV["Id"].ToString();
                Number.Text = SDRV["Number"].ToString();
                head.Text = SDRV["head"].ToString();
                contentt.Text = SDRV["contentt"].ToString();
                P_Content.Content = SDRV["FullContent"].ToString();
                SID.Value = SDRV["Id"].ToString();
                NEWS.Checked = (SDRV["TNews"].ToString() == "1" ? true : false);
            }
        }

        protected void CDELETE_Click(object sender, EventArgs e)
        {
            ME.Q_Add("DELETE FROM SiteContent WHERE Id = @Id");
            ME.ParamAdd("@Id", SID.Value);
            if (ME.Run() == "runed")
                SMM.CreateMessageAlert("DELETED", sender);
            else
                SMM.CreateMessageAlert("ERROR:0*1253", sender);
            radbind();
        }
        protected void radbind()
        {
            ME.Q_Add("SELECT * FROM SiteContent ");
            RadGrid1.DataSource = ME._GetDataTable();
            RadGrid1.DataBind();
        }
    }
}