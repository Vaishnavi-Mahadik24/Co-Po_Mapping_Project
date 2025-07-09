using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            // Check if password and confirm password match
            if (TextBox4.Text != TextBox5.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CoPoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "INSERT INTO Register_login (UserName, Email, Department, PasswordHash, Confirm_Password, Mobile) VALUES (@Name, @Email, @Department, @Password, @Confirm_Password, @Mobile)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@Department", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Password", TextBox4.Text); // Consider hashing
                    cmd.Parameters.AddWithValue("@Confirm_Password", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@Mobile", TextBox6.Text);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Registration Successful');</script>");
                        Response.Redirect("LoginForm.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Registration Failed');</script>");
                    }
                }
            }
        }
    }
}