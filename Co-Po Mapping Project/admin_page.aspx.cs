using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using ExcelDataReader;

namespace Co_Po_Mapping_Project
{
    public partial class admin_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, FileUpload1.FileName);
                FileUpload1.SaveAs(filePath);

                try
                {
                    using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
                    {
                        using (var reader = ExcelReaderFactory.CreateReader(stream))
                        {
                            DataSet result = reader.AsDataSet();
                            DataTable dt = result.Tables[0]; // Read first sheet

                            string connStr = ConfigurationManager.ConnectionStrings["CoPoDB"].ConnectionString;
                            using (SqlConnection sqlConn = new SqlConnection(connStr))
                            {
                                sqlConn.Open();
                                foreach (DataRow row in dt.Rows)
                                {
                                    try
                                    {
                                        // ✅ Read only the required columns from Excel
                                        string seatNumber = row[0]?.ToString().Trim();  // Student Seat Number
                                        int marksCO1 = TryParseInt(row[1]);  // CO1 Marks
                                        int marksCO2 = TryParseInt(row[2]);  // CO2 Marks
                                        int marksCO3 = TryParseInt(row[3]);  // CO3 Marks
                                        int marksCO4 = TryParseInt(row[4]);  // CO4 Marks
                                        int marksCO5 = TryParseInt(row[5]);  // CO5 Marks
                                        int marksCO6 = TryParseInt(row[6]);  // CO6 Marks

                                        // ✅ Insert ONLY required columns into the database
                                        string query = "INSERT INTO Student__Marks (SeatNumber, CO1, CO2, CO3, CO4, CO5, CO6) " +
                                                       "VALUES (@SeatNumber, @CO1, @CO2, @CO3, @CO4, @CO5, @CO6)";

                                        using (SqlCommand cmd = new SqlCommand(query, sqlConn))
                                        {
                                            cmd.Parameters.AddWithValue("@SeatNumber", seatNumber);
                                            cmd.Parameters.AddWithValue("@CO1", marksCO1);
                                            cmd.Parameters.AddWithValue("@CO2", marksCO2);
                                            cmd.Parameters.AddWithValue("@CO3", marksCO3);
                                            cmd.Parameters.AddWithValue("@CO4", marksCO4);
                                            cmd.Parameters.AddWithValue("@CO5", marksCO5);
                                            cmd.Parameters.AddWithValue("@CO6", marksCO6);
                                            cmd.ExecuteNonQuery();
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        lblMessage.Text = "Error in row processing: " + ex.Message;
                                        return;
                                    }
                                }
                            }
                        }
                    }
                    lblMessage.Text = "Marksheet uploaded successfully!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Please select an Excel file!";
            }
        }

        // ✅ Function to safely convert string to int
        private int TryParseInt(object value)
        {
            int result;
            return int.TryParse(value?.ToString().Trim(), out result) ? result : 0;
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginForm.aspx");
        }
    }
}
