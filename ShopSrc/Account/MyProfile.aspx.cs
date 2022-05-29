using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using System.Data;

namespace Shop.Account
{
    public partial class MyProfile : System.Web.UI.Page
    {
        ShowMessage SM = new ShowMessage();
        string[] login = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                login = (string[])Session["Login"];
                if (login[0] != "OK")
                    Response.Redirect("Login.aspx");
                if (!IsPostBack)
                {
                    Model.EXEQ ME = new Model.EXEQ();
                    ME.Q_Add(@"SELECT UserName, Name, Family, EName, EFamily,
                             NationalCode, Mobile, Email, shaba, ShHesab, 
                              scan, PStatus, sex, fathername, varesname, varescode, city,
                               postalcode, PositionRecord, Address, PFS, BirthDate,Nationality
                                FROM      Marketers WHERE Id = @Id ");
                    ME.ParamAdd("@Id", login[1]);
                    DataView dv = ME._GetDataView();
                    DataRowView DRV = dv[0];

                    //ME.Q_Add(@"SELECT Name, UserName, Family, EName, EFamily, Mobile                          
                    //   FROM  Marketers WHERE UserName = '" + DRV["PositionRecord"].ToString() + "' ");
                    //DataView baladv = ME._GetDataView();
                    //if (baladv.Count > 0)
                    //{
                    //    moaref.InnerText += ":" + baladv[0]["Name"].ToString() + " " +
                    //        baladv[0]["Family"].ToString();
                    //    moarefusername.InnerText += ":" + baladv[0]["UserName"].ToString();
                    //    moarefphone.InnerText += ":" + baladv[0]["Mobile"].ToString();
                 
                    //}
                    UserName.InnerText += ":" + DRV["UserName"].ToString();
                    name.Value = DRV["Name"].ToString();
                    Fname.Value = DRV["Family"].ToString();
                    Ename.Value = DRV["EName"].ToString();
                    EFname.Value = DRV["EFamily"].ToString();
                    NationalCode.Value = DRV["NationalCode"].ToString();
                    Tell.Value = DRV["Mobile"].ToString();
                    email.Value = DRV["Email"].ToString();
                    sex.SelectedValue = DRV["sex"].ToString();
                    fathername.Value = DRV["fathername"].ToString();
                    city.Value = DRV["city"].ToString();
                    varename.Value = DRV["varesname"].ToString();
                    varescode.Value = DRV["varescode"].ToString();
                    postalcode.Value = DRV["postalcode"].ToString();
                    address.Value = DRV["Address"].ToString();
                    BirthDate.Text = DRV["BirthDate"].ToString();
                    if( DRV["Nationality"].ToString()=="1")
                    {
                        Nationality1.Checked = true;
                        Nationality2.Checked = false;
                    }
                    if (DRV["Nationality"].ToString() == "2")
                    {
                        Nationality1.Checked = false;
                        Nationality2.Checked = true;
                    }
                    if (login[1] == "4962")
                    {
                        name.Attributes.Remove("readonly");
                        Fname.Attributes.Remove("readonly");
                    }
                    //string apppath = Request.PhysicalApplicationPath;
                    if (DRV["scan"].ToString() != "")
                    {
                        byte[] ss = (byte[])DRV["scan"];
                        string base64String = Convert.ToBase64String(ss, 0, ss.Length);
                        scanimage.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    if (DRV["PFS"].ToString() != "")
                    {
                        byte[] ss = (byte[])DRV["PFS"];
                        string base64String = Convert.ToBase64String(ss, 0, ss.Length);
                        PFIMG.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    // File.Delete(apppath + "Account\\img\\TempImg\\" + login[1] + "ncs.jpg");

                }
            }

        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.clear();



            byte[] Fbyte = scan.FileBytes;
            byte[] PFSBYTE = Pfscan.FileBytes;
            string scanfilenamae = scan.FileName;
            string fileformat = scanfilenamae.Split(".".ToCharArray())[scanfilenamae.Split(".".ToCharArray()).Length - 1].ToLower();

            if (sex.SelectedValue == "-1")
            {
                SM.CreateMessageAlert("نوع جنسیت را مشخص کنید!!", sender);
                sex.Focus();
            }
            bool isChecked1 = Nationality1.Checked;
            bool isChecked2 = Nationality2.Checked;
            if (isChecked1==false && isChecked2 == false)
            {
               
                SM.CreateMessageAlert("لطفا ملیت را انتخاب نمایید!", sender);
                return;
            }
            if (NationalCode.Value == "" && isChecked1 == true)
            {
                 SM.CreateMessageAlert("لطفا کد ملی را وارد نمایید", sender);
                return;
            }
            if (NationalCode.Value == "" && isChecked2 == true)
            {
                 SM.CreateMessageAlert("لطفا کد اختصاصی مرتبط با اقامت خود را وارد نمایید", sender);
                return;
            }
            if (scanfilenamae != "")
            {
                if (fileformat != "jpg")
                {
                    ffa.Visible = true;
                    alarm.InnerText = "فرمت فایل کارت ملی فقط باید jpg باشد";
                    ffa.Focus();
                    return;
                }
                if (Fbyte.Length / 1024 > 300)
                {
                    ffa.Visible = true;
                    alarm.InnerText = "حداکثر حجم فایل انتخابی کارت ملی نباید بیشتر از 300 کیلوبایت باشد";
                    ffa.Focus();
                    return;
                }
            }
            if (Pfscan.FileName != "")
            {
                fileformat = Pfscan.FileName.Split(".".ToCharArray())[Pfscan.FileName.Split(".".ToCharArray()).Length - 1].ToLower();
                if (fileformat != "jpg")
                {
                    ffa.Visible = true;
                    alarm.InnerText = "فرمت فایل عکس پروفایل فقط باید jpg باشد";
                    ffa.Focus();
                    return;
                }
                if (PFSBYTE.Length / 1024 > 300)
                {
                    ffa.Visible = true;
                    alarm.InnerText = "حداکثر حجم فایل انتخابی عکس پروفایل نباید بیشتر از 300 کیلوبایت باشد";
                    ffa.Focus();
                    return;
                }
            }
            string nationalcardscan = "scan=@scan,";
            if (scanfilenamae == "")
                nationalcardscan = "";

            string pfsf = ",PFS = @PFS";
            if (Pfscan.FileName == "")
                pfsf = "";


            ME.Q_Add(@"UPDATE Marketers SET Name=@Name, Family=@Family, EName=@EName, EFamily=@EFamily,
                             NationalCode=@NationalCode, Mobile=@Mobile, Email=@Email, " + nationalcardscan + " PStatus = 1, "
                                 + "sex = @sex , fathername =@fathername "
                                 + " , varesname=@varesname, varescode=@varescode, city=@city,Nationality=@Nationality, "
                                 + " postalcode = @postalcode, Address = @Address, BirthDate = @BirthDate " + pfsf + " "
                                 + " WHERE Id = @Id  ");

            //sex, fathername, varesname, varescode, city, postalcode
            ME.ParamAdd("@Name", name.Value.Trim());
            ME.ParamAdd("@Family", Fname.Value.Trim());
            ME.ParamAdd("@EName", Ename.Value.Trim());
            ME.ParamAdd("@EFamily", EFname.Value.Trim());
            ME.ParamAdd("@Id", login[1]);
            ME.ParamAdd("@NationalCode",Constants.PersianDigit2English(NationalCode.Value));
            ME.ParamAdd("@Mobile",Constants.PersianDigit2English( Tell.Value.Trim()));
            ME.ParamAdd("@Email", email.Value.Trim());
            ME.ParamAdd("@scan", Fbyte);
            ME.ParamAdd("@PFS", PFSBYTE);

            ME.ParamAdd("@sex", sex.SelectedValue.Trim());
            ME.ParamAdd("@fathername", fathername.Value.Trim());
            ME.ParamAdd("@varesname", varename.Value.Trim());
            ME.ParamAdd("@varescode",Constants.PersianDigit2English(varescode.Value.Trim()));
            ME.ParamAdd("@city", city.Value.Trim());
            ME.ParamAdd("@postalcode", Constants.PersianDigit2English( postalcode.Value.Trim()));
            ME.ParamAdd("@Address", address.Value.Trim());
            ME.ParamAdd("@BirthDate",Constants.PersianDigit2English( BirthDate.Text.Trim()));
            
            int natval = 0;
            if (isChecked1)
            {
                natval = 1;
            }
            if (isChecked2)
            {
                natval = 2;
            }
            ME.ParamAdd("@Nationality", natval);

            if (ME.Run() == "runed")
            {
                ffa.Visible = true;
                alarm.InnerText = ("اطلاعات کاربری با موفقیت اصلاح شد.");
                savedimageshow();
                Response.Redirect("index.aspx");
            }
            else
            {
                ffa.Visible = true;
                alarm.InnerText = ("اشکالی در ثبت اطلاعات بوجود آمده");
                savedimageshow();
            }
        }
        private void savedimageshow()
        {
            Model.EXEQ ME = new Model.EXEQ();
            ME.Q_Add(@"SELECT scan, PFS
                       FROM            Marketers WHERE Id = @Id ");
            ME.ParamAdd("@Id", login[1]);
            DataView dv = ME._GetDataView();
            DataRowView DRV = dv[0];
            if (DRV["scan"].ToString() != "")
            {
                string apppath = Request.PhysicalApplicationPath;
                byte[] ss = (byte[])DRV["scan"];
                string base64String = Convert.ToBase64String(ss, 0, ss.Length);
                scanimage.ImageUrl = "data:image/png;base64," + base64String;
                ffa.Focus();
            }
            if (DRV["PFS"].ToString() != "")
            {
                byte[] ss = (byte[])DRV["PFS"];
                string base64String = Convert.ToBase64String(ss, 0, ss.Length);
                PFIMG.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
        protected void GetRName_Click(object sender, EventArgs e)
        {

            //Model.EXEQ ME = new Model.EXEQ();
            //ME.clear();
            //ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            //ME.ParamAdd("@UN", D_Code.Value);
            //D_Name.Text = ME.GetF2Str();
            //if (D_Name.Text == "")
            //{
            //    D_Code.Focus();
            //    SM.CreateMessageAlert("کد معرف اشتباه است", sender);
            //}
            //else
            //    Pass.Focus();
        }

        protected void GetMN_Click(object sender, EventArgs e)
        {
            //Model.EXEQ ME = new Model.EXEQ();
            //ME.clear();
            //ME.Q_Add("SELECT Name+'-'+Family FROM Marketers WHERE UserName = @UN ");
            //ME.ParamAdd("@UN", RG_Code.Value);
            //RG_LBL.Text = ME.GetF2Str();
            //if (RG_LBL.Text == "")
            //    SM.CreateMessageAlert("کد ثبت موقعیت اشتباه است", sender);
        }

    }
}