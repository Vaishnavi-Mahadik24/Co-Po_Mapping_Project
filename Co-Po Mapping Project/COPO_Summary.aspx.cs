using System;
using System.IO;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Org.BouncyCastle.Asn1.X509;

namespace Co_Po_Mapping_Project
{
    public partial class COPO_Summary : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummaryData();
            }
        }

        private void LoadSummaryData()
        {
            lblCO1Attempted.Text = Session["CO1_Attempted"]?.ToString() ?? "0";
            lblCO2Attempted.Text = Session["CO2_Attempted"]?.ToString() ?? "0";
            lblCO3Attempted.Text = Session["CO3_Attempted"]?.ToString() ?? "0";
            lblCO4Attempted.Text = Session["CO4_Attempted"]?.ToString() ?? "0";
            lblCO5Attempted.Text = Session["CO5_Attempted"]?.ToString() ?? "0";

            lblCO1Above50.Text = Session["CO1_Above50"]?.ToString() ?? "0";
            lblCO2Above50.Text = Session["CO2_Above50"]?.ToString() ?? "0";
            lblCO3Above50.Text = Session["CO3_Above50"]?.ToString() ?? "0";
            lblCO4Above50.Text = Session["CO4_Above50"]?.ToString() ?? "0";
            lblCO5Above50.Text = Session["CO5_Above50"]?.ToString() ?? "0";

            lblCO1Percent.Text = (Session["CO1_Percent"]?.ToString() ?? "0") + "%";
            lblCO2Percent.Text = (Session["CO2_Percent"]?.ToString() ?? "0") + "%";
            lblCO3Percent.Text = (Session["CO3_Percent"]?.ToString() ?? "0") + "%";
            lblCO4Percent.Text = (Session["CO4_Percent"]?.ToString() ?? "0") + "%";
            lblCO5Percent.Text = (Session["CO5_Percent"]?.ToString() ?? "0") + "%";

            lblCO1Level.Text = Session["CO1_Level"]?.ToString() ?? "Below Level 1";
            lblCO2Level.Text = Session["CO2_Level"]?.ToString() ?? "Below Level 1";
            lblCO3Level.Text = Session["CO3_Level"]?.ToString() ?? "Below Level 1";
            lblCO4Level.Text = Session["CO4_Level"]?.ToString() ?? "Below Level 1";
            lblCO5Level.Text = Session["CO5_Level"]?.ToString() ?? "Below Level 1";

            // Extract and convert Overall CO Attainment to double
            double overallCOAttainment;
            double.TryParse(Session["Overall_CO_Attainment"]?.ToString() ?? "0", out overallCOAttainment);

            lblCOAttainmentExternal.Text = "Overall CO Attainment: " + overallCOAttainment + "%";

            // Define target levels
            double level3 = 70;
            double level2 = 60;
            double level1 = 50;
            string achievedLevel;

            // Determine the achieved level
            if (overallCOAttainment >= level3)
                achievedLevel = "Level 3";
            else if (overallCOAttainment >= level2)
                achievedLevel = "Level 2";
            else if (overallCOAttainment >= level1)
                achievedLevel = "Level 1";
            else
                achievedLevel = "Below Level 1";

            // Store in session and display
            Session["TargetLevelAchieved"] = achievedLevel;
            lblTargetLevelAchieved.Text = "Overall Target Level Achieved: " + achievedLevel;
        }



        protected void btnGeneratePDF_Click(object sender, EventArgs e)
        {

            try
            {
                string fileName = "COPO_Report_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".pdf";
                string folderPath = Server.MapPath("~/Reports/");
                string filePath = Path.Combine(folderPath, fileName);



                // Ensure the directory exists
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Create PDF Document
                Document document = new Document(PageSize.A4);
                PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(filePath, FileMode.Create));

                document.Open();

                // Add Title
                Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16);
                Paragraph title = new Paragraph("CO-PO Summary Report\n\n", titleFont)
                {
                    Alignment = Element.ALIGN_CENTER
                };
                document.Add(title);

                // Ensure session values are set properly
                string co1Attempted = Session["CO1_Attempted"]?.ToString() ?? "0";
                string co2Attempted = Session["CO2_Attempted"]?.ToString() ?? "0";
                string co3Attempted = Session["CO3_Attempted"]?.ToString() ?? "0";
                string co4Attempted = Session["CO4_Attempted"]?.ToString() ?? "0";
                string co5Attempted = Session["CO5_Attempted"]?.ToString() ?? "0";

                string co1Above50 = Session["CO1_Above50"]?.ToString() ?? "0";
                string co2Above50 = Session["CO2_Above50"]?.ToString() ?? "0";
                string co3Above50 = Session["CO3_Above50"]?.ToString() ?? "0";
                string co4Above50 = Session["CO4_Above50"]?.ToString() ?? "0";
                string co5Above50 = Session["CO5_Above50"]?.ToString() ?? "0";

                string co1Percent = (Session["CO1_Percent"]?.ToString() ?? "0") + "%";
                string co2Percent = (Session["CO2_Percent"]?.ToString() ?? "0") + "%";
                string co3Percent = (Session["CO3_Percent"]?.ToString() ?? "0") + "%";
                string co4Percent = (Session["CO4_Percent"]?.ToString() ?? "0") + "%";
                string co5Percent = (Session["CO5_Percent"]?.ToString() ?? "0") + "%";

                string co1Level = Session["CO1_Level"]?.ToString() ?? "Below Level 1";
                string co2Level = Session["CO2_Level"]?.ToString() ?? "Below Level 1";
                string co3Level = Session["CO3_Level"]?.ToString() ?? "Below Level 1";
                string co4Level = Session["CO4_Level"]?.ToString() ?? "Below Level 1";
                string co5Level = Session["CO5_Level"]?.ToString() ?? "Below Level 1";

                string overallCOAttainment = Session["Overall_CO_Attainment"]?.ToString() ?? "0";
                string targetLevelAchieved = Session["TargetLevelAchieved"]?.ToString() ?? "Below Level 1";

                // Create Table for CO-PO Summary
                PdfPTable table = new PdfPTable(6);
                table.WidthPercentage = 100;
                table.SetWidths(new float[] { 2, 1, 1, 1, 1,1 });

                // Add Headers
                table.AddCell("Course Outcome");
                table.AddCell("CO1");
                table.AddCell("CO2");
                table.AddCell("CO3");
                table.AddCell("CO4");
                table.AddCell("CO5");

                // Add Data
                table.AddCell("Students Attempted");
                table.AddCell(co1Attempted);
                table.AddCell(co2Attempted);
                table.AddCell(co3Attempted);
                table.AddCell(co4Attempted);
                table.AddCell(co5Attempted);

                table.AddCell("Above 50");
                table.AddCell(co1Above50);
                table.AddCell(co2Above50);
                table.AddCell(co3Above50);
                table.AddCell(co4Above50);
                table.AddCell(co5Above50);

                table.AddCell("Percentage Above 50");
                table.AddCell(co1Percent);
                table.AddCell(co2Percent);
                table.AddCell(co3Percent);
                table.AddCell(co4Percent);
                table.AddCell(co5Percent);

                table.AddCell("Target Level Achieved");
                table.AddCell(co1Level);
                table.AddCell(co2Level);
                table.AddCell(co3Level);
                table.AddCell(co4Level);
                table.AddCell(co5Level);

                document.Add(table);

                // Add Overall CO Attainment
                document.Add(new Paragraph("\nOverall CO Attainment: " + overallCOAttainment + "%"));
                document.Add(new Paragraph("Target Level Achieved: " + targetLevelAchieved));

                document.Close();
                writer.Close();

                // Store report path in session for use in Analysis_Report.aspx
                Session["LatestReportPath"] = "Reports/" + fileName;

                // Redirect to analysis report page
                Response.Redirect("Analysis_Report.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error generating PDF: " + ex.Message + "');</script>");
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main_Page.aspx");
        }
    }
}
