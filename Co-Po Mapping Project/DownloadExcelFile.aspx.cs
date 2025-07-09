using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class DownloadExcelFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string department = ddlDepartment.SelectedValue;
            if (string.IsNullOrEmpty(department))
            {
                lblMessage.Text = "Please select a department.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string folderPath = Server.MapPath($"~/ExcelFile/{department}/");
            if (!Directory.Exists(folderPath))
            {
                lblMessage.Text = "No files found for the selected department.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string[] files = Directory.GetFiles(folderPath, "*.xlsx");
            if (files.Length == 0)
            {
                lblMessage.Text = "No Excel files found in this department folder.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string latestFile = files.OrderByDescending(f => new FileInfo(f).LastWriteTime).FirstOrDefault();
            if (latestFile == null || !File.Exists(latestFile))
            {
                lblMessage.Text = "No valid file found.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (IsFileLocked(latestFile))
            {
                lblMessage.Text = "File is currently in use. Try again later.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string fileExtension = Path.GetExtension(latestFile).ToLower();
            if (fileExtension == ".xls")
            {
                Response.ContentType = "application/vnd.ms-excel";
            }
            else if (fileExtension == ".xlsx")
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            }
            else
            {
                lblMessage.Text = "Invalid file type.";
                return;
            }

            string fileName = Path.GetFileName(latestFile);

            try
            {
                Response.Clear();
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.WriteFile(latestFile);
                Response.End();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error downloading file: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Check if the file is in use
        bool IsFileLocked(string filePath)
        {
            try
            {
                using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.None))
                {
                    return false;
                }
            }
            catch (IOException)
            {
                return true;
            }
        }

    }
}
