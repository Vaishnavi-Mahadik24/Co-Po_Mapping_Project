using System;
using System.Web.UI;

namespace Co_Po_Mapping_Project
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Add logic to handle password reset (e.g., sending reset link to email)
            string userEmail = txtEmail.Text.Trim();
            if (!string.IsNullOrEmpty(userEmail))
            {
                // Implement email validation and reset password logic here
                Response.Write("<script>alert('Password reset instructions have been sent to your email.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
            }
        }
    }
}
