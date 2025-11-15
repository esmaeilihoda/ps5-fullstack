using Stimulsoft.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Account.Report
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string reportname = Request.QueryString["ReportName"];
            DataTable WE_DATA = new DataTable();
            WE_DATA = (DataTable)Session["GSS"];
            String applicationDirectory = HttpContext.Current.Server.MapPath(string.Empty);
            string reportPath = string.Format(applicationDirectory + "\\"+ reportname + ".mrt");
            Stimulsoft.Report.StiReport report = new Stimulsoft.Report.StiReport();
            if (File.Exists(reportPath))
                report.Load(reportPath);
            else
                report.ReportName = reportname;
            WE_DATA.TableName = "WE_DATA";
            report.ResetRenderedState();
            report.Dictionary.Clear();
            report.RegData("دیتا", WE_DATA);
          //  report.Dictionary.Variables.Add("CompanyName", AccountPro.Class.CachData.GetFiledSt("SELECT Name FROM AccCompany", 0));
            report.Dictionary.Variables.Add("Rest", typeof(long));
            report.Dictionary.Variables.Add("Qty", typeof(double));
            report.Dictionary.Variables.Add("SumIn", typeof(double));
            report.Dictionary.Variables.Add("SumOut", typeof(double));
            report.Dictionary.Synchronize();
            report.ScriptLanguage = Stimulsoft.Report.StiReportLanguageType.CSharp;
            report.ScriptNew();
            if (CheckBox1.Checked)
                StiWebViewer1.Report = report;
            else
            {
                StiWebViewer1.FullScreenMode = false;
                StiWebDesigner1.Visible = true;
                //report.Load(Server.MapPath(@"Reports\KardexRep.mrt"));
                StiWebDesigner1.Report = report;
            }
        }
        protected void StiWebDesigner1_SaveReportAs()
        {
            Stimulsoft.Report.Web.StiWebDesigner e = new Stimulsoft.Report.Web.StiWebDesigner();
            var reportString = e.Report.SaveToString();
        }
        //StiReportDataEventArgs e
        protected void StiWebDesigner1_SaveReportAs1(object sender, Stimulsoft.Report.Web.StiReportDataEventArgs e)
        {
            //    Stimulsoft.Report.Web.StiWebDesigner e = new Stimulsoft.Report.Web.StiWebDesigner();
            var reportString = e.Report.SaveToString();
            IStiReport orep = e.Report;
            //string rep
            string RFN = e.RequestParams.Designer.FileName;
            string applicationDirectory = HttpContext.Current.Server.MapPath(string.Empty) + "\\" + RFN + "";
            File.WriteAllText(applicationDirectory, reportString);
        }
    }
}