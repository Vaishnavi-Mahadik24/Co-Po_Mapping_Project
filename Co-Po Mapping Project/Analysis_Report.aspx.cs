using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class Analysis_Report : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReport();
            }

        }

        private void LoadReport()
        {
            string reportPath = Session["LatestReportPath"]?.ToString();
            
            if (!string.IsNullOrEmpty(reportPath))
            {
                // Show the report in an iframe
                pdfViewer.Attributes["src"] = reportPath;
            }
            else
            {
                lblMessage.Text = "No report available.";
            }
        }
    }
}
