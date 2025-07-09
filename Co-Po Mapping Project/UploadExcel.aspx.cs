using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "Please select an Excel file to upload.";
                Label1.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string department = ddlDepartment.SelectedValue;
            if (string.IsNullOrEmpty(department))
            {
                Label1.Text = "Please select a department.";
                Label1.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string fileName = Path.GetFileName(FileUpload1.FileName);
            string uploadFolder = Server.MapPath($"~/ExcelFile/{department}/");

            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }

            string filePath = Path.Combine(uploadFolder, fileName);
            FileUpload1.SaveAs(filePath);

            // Delete old department data
            DeleteExistingDepartmentData(department);

            // Process and insert new data
            ProcessExcelData(filePath, department);

            Label1.Text = $"Data for {department} department has been uploaded successfully!";
            Label1.ForeColor = System.Drawing.Color.Green;
        }

        private void DeleteExistingDepartmentData(string department)
        {
            string connectionString = "Server=(localdb)\\COPO_Map;Database=CoPoMappingDB_DB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM markss WHERE Department = @Department";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Department", department);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void ProcessExcelData(string filePath, string department)
        {
            string connectionString = "Server=(localdb)\\COPO_Map;Database=CoPoMappingDB_DB;Integrated Security=True;";

            using (OleDbConnection conn = new OleDbConnection(GetExcelConnectionString(filePath)))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [marks$]", conn);
                using (OleDbDataReader dr = cmd.ExecuteReader())
                {
                    using (SqlConnection sqlConn = new SqlConnection(connectionString))
                    {
                        sqlConn.Open();
                        while (dr.Read())
                        {
                            string SeatNumber = dr["SeatNumber"]?.ToString().Trim();
                            int Q1 = Convert.ToInt32(dr["Q1"]);
                            int Q2 = Convert.ToInt32(dr["Q2"]);
                            int Q3 = Convert.ToInt32(dr["Q3"]);
                            int Q4 = Convert.ToInt32(dr["Q4"]);
                            int Q5 = Convert.ToInt32(dr["Q5"]);
                            int ClassTest = Convert.ToInt32(dr["Class test"]);
                            int OtherTools = Convert.ToInt32(dr["other tools"]);

                            if (!string.IsNullOrEmpty(SeatNumber))
                            {
                                string query = "INSERT INTO markss (SeatNumber, Department, Q1, Q2, Q3, Q4, Q5, ClassTest, OtherTools) " +
                                               "VALUES (@SeatNumber, @Department, @Q1, @Q2, @Q3, @Q4, @Q5, @ClassTest, @OtherTools)";
                                using (SqlCommand sqlCmd = new SqlCommand(query, sqlConn))
                                {
                                    sqlCmd.Parameters.AddWithValue("@SeatNumber", SeatNumber);
                                    sqlCmd.Parameters.AddWithValue("@Department", department);
                                    sqlCmd.Parameters.AddWithValue("@Q1", Q1);
                                    sqlCmd.Parameters.AddWithValue("@Q2", Q2);
                                    sqlCmd.Parameters.AddWithValue("@Q3", Q3);
                                    sqlCmd.Parameters.AddWithValue("@Q4", Q4);
                                    sqlCmd.Parameters.AddWithValue("@Q5", Q5);
                                    sqlCmd.Parameters.AddWithValue("@ClassTest", ClassTest);
                                    sqlCmd.Parameters.AddWithValue("@OtherTools", OtherTools);
                                    sqlCmd.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                }
            }
        }

        private string GetExcelConnectionString(string filePath)
        {
            string fileExtension = Path.GetExtension(filePath).ToLower();

            if (fileExtension == ".xls")
            {
                return "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1';";
            }
            else if (fileExtension == ".xlsx")
            {
                return "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=1';";
            }
            else
            {
                throw new Exception("Invalid Excel file format. Only .xls and .xlsx are supported.");
            }
        }
    }
}
