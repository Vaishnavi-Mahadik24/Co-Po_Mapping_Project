using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class COPO_Calculation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UploadedData"] != null)
            {
                BindCoPoScoreTable((DataTable)Session["UploadedData"]);
            }


        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                lblMessage.Text = "Please select an Excel file to upload.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                string filePath = Server.MapPath("~/ExcelFile/") + Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(filePath);

                DataTable dt = ReadExcelData(filePath);
                if (dt == null || dt.Rows.Count == 0)
                {
                    lblMessage.Text = "No data found in the uploaded file.";
                    return;
                }

                if (!ValidateColumnNames(dt))
                {
                    lblMessage.Text = "Error: Required columns are missing.";
                    return;
                }

                Session["UploadedData"] = dt;
                BindCoPoScoreTable(dt);
                lblMessage.Text = "File uploaded successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void BindCoPoScoreTable(DataTable dt)
        {
            DataTable formattedTable = new DataTable();
            formattedTable.Columns.Add("SeatNumber", typeof(string));
            formattedTable.Columns.Add("External_CO1", typeof(int));
            formattedTable.Columns.Add("External_CO2", typeof(int));
            formattedTable.Columns.Add("External_CO3", typeof(int));
            formattedTable.Columns.Add("External_CO4", typeof(int));
            formattedTable.Columns.Add("External_CO5", typeof(int));
            formattedTable.Columns.Add("Internal_CO1", typeof(int));
            formattedTable.Columns.Add("Internal_CO2", typeof(int));

            foreach (DataRow row in dt.Rows)
            {
                DataRow newRow = formattedTable.NewRow();
                newRow["SeatNumber"] = row["SeatNumber"].ToString().Trim();

                try
                {
                    // Ensure correct column mapping
                    newRow["External_CO1"] = ValidateMarks(row, "Q1", 12); // Q1 maps to CO1
                    newRow["External_CO2"] = ValidateMarks(row, "Q2", 12); // Q2 maps to CO2
                    newRow["External_CO3"] = ValidateMarks(row, "Q3", 12); // Q3 maps to CO3
                    newRow["External_CO4"] = ValidateMarks(row, "Q4", 12); // Q4 maps to CO4
                    newRow["External_CO5"] = ValidateMarks(row, "Q5", 12); // Q5 maps to CO5

                    newRow["Internal_CO1"] = ValidateMarks(row, "Class test", 20);
                    newRow["Internal_CO2"] = ValidateMarks(row, "other tools", 20);
                }
                catch
                {
                    lblMessage.Text = "Error: Invalid data in file. Please check marks format.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                formattedTable.Rows.Add(newRow);
            }

            rptCoPoScores.DataSource = formattedTable;
            rptCoPoScores.DataBind();
        }

        private object ValidateMarks(DataRow row, string columnName, int maxLimit)
        {
            if (!row.Table.Columns.Contains(columnName))
            {
                return 0;  // Default to 0 if column is missing
            }

            if (row[columnName] == DBNull.Value || string.IsNullOrEmpty(row[columnName].ToString()))
            {
                return 0;  // Default to 0 for empty values
            }

            if (!int.TryParse(row[columnName].ToString(), out int marks))
            {
                return 0;  // Default to 0 if the value is not a valid number
            }

            return (marks >= 0 && marks <= maxLimit) ? (object)marks : 0;  // Ensure marks stay within limits
        }

        private bool ValidateColumnNames(DataTable dt)
        {
            string[] requiredColumns = { "SeatNumber", "Q1", "Q2", "Q3", "Q4", "Q5", "Class test", "other tools" };
            foreach (string column in requiredColumns)
                if (!dt.Columns.Contains(column)) return false;
            return true;
        }

        private DataTable ReadExcelData(string filePath)
        {
            string connString = GetExcelConnectionString(filePath);
            using (OleDbConnection conn = new OleDbConnection(connString))
            {
                conn.Open();
                OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT * FROM [marks$]", conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }

        private string GetExcelConnectionString(string filePath)
        {
            return Path.GetExtension(filePath).ToLower() == ".xls"
                ? @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties='Excel 8.0;HDR=YES;'"
                : @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties='Excel 12.0 Xml;HDR=YES;'";
        }




        protected void btnShowSummary_Click(object sender, EventArgs e)
        {

            DataTable dt = Session["UploadedData"] as DataTable;

            if (dt == null || dt.Rows.Count == 0)
            {
                lblMessage.Text = "No data available for summary.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int totalStudents = dt.Rows.Count;
            int attemptedStudents = 0;
            int studentsAbove50 = 0;

            int co1Attempted = 0, co2Attempted = 0, co3Attempted = 0, co4Attempted = 0, co5Attempted = 0;
            int co1Above50 = 0, co2Above50 = 0, co3Above50 = 0, co4Above50 = 0, co5Above50 = 0;

            foreach (DataRow row in dt.Rows)
            {
                bool attempted = false;

                if (row.Table.Columns.Contains("Q1") && int.TryParse(row["Q1"].ToString(), out int q1Marks))
                {
                    attempted = true;
                    co1Attempted++;
                    if (q1Marks >= 6) co1Above50++;
                }
                if (row.Table.Columns.Contains("Q2") && int.TryParse(row["Q2"].ToString(), out int q2Marks))
                {
                    attempted = true;
                    co2Attempted++;
                    if (q2Marks >= 6) co2Above50++;
                }
                if (row.Table.Columns.Contains("Q3") && int.TryParse(row["Q3"].ToString(), out int q3Marks))
                {
                    attempted = true;
                    co3Attempted++;
                    if (q3Marks >= 6) co3Above50++;
                }
                if (row.Table.Columns.Contains("Q4") && int.TryParse(row["Q4"].ToString(), out int q4Marks))
                {
                    attempted = true;
                    co4Attempted++;
                    if (q4Marks >= 6) co4Above50++;
                }
                if (row.Table.Columns.Contains("Q5") && int.TryParse(row["Q5"].ToString(), out int q5Marks))
                {
                    attempted = true;
                    co5Attempted++;  // ✅ FIXED: Now correctly increments co5Attempted
                    if (q5Marks >= 6) co5Above50++;
                }

                if (attempted) attemptedStudents++;
            }

            // ✅ FIX: Prevent Division by Zero
            double co1Percent = totalStudents > 0 ? (co1Above50 / (double)totalStudents) * 100 : 0;
            double co2Percent = totalStudents > 0 ? (co2Above50 / (double)totalStudents) * 100 : 0;
            double co3Percent = totalStudents > 0 ? (co3Above50 / (double)totalStudents) * 100 : 0;
            double co4Percent = totalStudents > 0 ? (co4Above50 / (double)totalStudents) * 100 : 0;
            double co5Percent = totalStudents > 0 ? (co5Above50 / (double)totalStudents) * 100 : 0;

            string co1Level = GetTargetLevel(co1Percent);
            string co2Level = GetTargetLevel(co2Percent);
            string co3Level = GetTargetLevel(co3Percent);
            string co4Level = GetTargetLevel(co4Percent);
            string co5Level = GetTargetLevel(co5Percent);

            double overallAttainment = (co1Percent + co2Percent + co3Percent + co4Percent + co5Percent) / 5;

            // Store values in Session
            Session["CO1_Attempted"] = co1Attempted;
            Session["CO2_Attempted"] = co2Attempted;
            Session["CO3_Attempted"] = co3Attempted;
            Session["CO4_Attempted"] = co4Attempted;
            Session["CO5_Attempted"] = co5Attempted;

            Session["CO1_Above50"] = co1Above50;
            Session["CO2_Above50"] = co2Above50;
            Session["CO3_Above50"] = co3Above50;
            Session["CO4_Above50"] = co4Above50;
            Session["CO5_Above50"] = co5Above50;

            Session["CO1_Percent"] = co1Percent.ToString("F2");
            Session["CO2_Percent"] = co2Percent.ToString("F2");
            Session["CO3_Percent"] = co3Percent.ToString("F2");
            Session["CO4_Percent"] = co4Percent.ToString("F2");
            Session["CO5_Percent"] = co5Percent.ToString("F2");

            Session["CO1_Level"] = co1Level;
            Session["CO2_Level"] = co2Level;
            Session["CO3_Level"] = co3Level;
            Session["CO4_Level"] = co4Level;
            Session["CO5_Level"] = co5Level;

            Session["Overall_CO_Attainment"] = overallAttainment.ToString("F2");

            // Store new metrics
            Session["Attempted_Students"] = attemptedStudents;
            Session["Students_Above_50"] = studentsAbove50;

            Response.Redirect("COPO_Summary.aspx");
        }

        // Function to Determine Target Level Based on Percentage
        private string GetTargetLevel(double percent)
        {
            if (percent >= 70) return "Level 3";
            if (percent >= 60) return "Level 2";
            if (percent >= 50) return "Level 1";
            return "Below Level 1";
        }
    }
}
