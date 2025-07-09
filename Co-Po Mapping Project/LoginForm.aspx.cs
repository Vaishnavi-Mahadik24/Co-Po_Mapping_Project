using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Co_Po_Mapping_Project
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();
            string password = TextBox3.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["CoPoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT UserRole FROM Register_login WHERE UserName = @UserName AND PasswordHash = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        string userRole = result.ToString().Trim();

                        // Store username in session
                        Session["username"] = username;

                        if (userRole == "Admin")
                        {
                            Response.Write("<script>alert('Admin Login Successful');</script>");
                            Response.Redirect("admin_page.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('User Login Successful');</script>");
                            Response.Redirect("Main_Page.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Username or Password');</script>");
                    }
                }
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();  // Remove all session variables
            Session.Abandon(); // End session

            // Prevent back button from accessing previous pages
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            Response.Redirect("LoginForm.aspx");
        }

    }

}






