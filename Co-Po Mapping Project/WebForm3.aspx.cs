using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml; // EPPlus for Excel operations

namespace Co_Po_Mapping_Project
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProcessedFiles(); // Load files into dropdown on page load
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string filePath = Server.MapPath("~/ExcelFile/") + fileName;
                    FileUpload1.SaveAs(filePath);
                    Label1.Text = "File uploaded successfully!";
                    Label1.ForeColor = System.Drawing.Color.Green;

                    DataTable dt = ReadExcelData(filePath);
                    DataTable processedDt = PerformCoPoCalculation(dt);

                    string processedFilePath = Server.MapPath("~/ProcessedFiles/") + "Processed_" + fileName;
                    ExportToExcel(processedDt, processedFilePath);

                    LoadProcessedFiles(); // Refresh dropdown
                    Label1.Text = "File processed successfully!";
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error: " + ex.Message;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label1.Text = "Please select an Excel file to upload.";
            }
        }

        private DataTable ReadExcelData(string filePath)
        {
            string connString = GetExcelConnectionString(filePath);
            using (OleDbConnection conn = new OleDbConnection(connString))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [marks$]", conn);
                OleDbDataAdapter adapter = new OleDbDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }

        private string GetExcelConnectionString(string filePath)
        {
            string fileExt = Path.GetExtension(filePath).ToLower();
            if (fileExt == ".xls")
                return @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1';";
            else if (fileExt == ".xlsx")
                return @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=1';";
            else
                throw new Exception("Invalid file format.");
        }

        private DataTable PerformCoPoCalculation(DataTable dt)
        {
            DataTable newTable = dt.Copy();
            newTable.Columns.Add("CO-PO Score", typeof(double));

            foreach (DataRow row in newTable.Rows)
            {
                double sum = 0;
                int count = 0;

                for (int i = 1; i <= 6; i++)
                {
                    if (row["CO" + i] != DBNull.Value)
                    {
                        sum += Convert.ToDouble(row["CO" + i]);
                        count++;
                    }
                }
                row["CO-PO Score"] = count > 0 ? sum / count : 0;
            }
            return newTable;
        }

        private void ExportToExcel(DataTable dt, string filePath)
        {
            FileInfo file = new FileInfo(filePath);
            if (file.Exists)
                file.Delete();

            using (ExcelPackage package = new ExcelPackage(file))
            {
                ExcelWorksheet ws = package.Workbook.Worksheets.Add("Processed Data");
                ws.Cells["A1"].LoadFromDataTable(dt, true);
                package.Save();
            }
        }

        private void LoadProcessedFiles()
        {
            string folderPath = Server.MapPath("~/ProcessedFiles/");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string[] files = Directory.GetFiles(folderPath, "*.xlsx");
            ddlFiles.Items.Clear();
            foreach (string file in files)
            {
                ddlFiles.Items.Add(new ListItem(Path.GetFileName(file), file));
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string filePath = ddlFiles.SelectedValue;
            if (!string.IsNullOrEmpty(filePath) && File.Exists(filePath))
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}