using System;
using System.Net.Mail;
using System.Web.UI;

namespace Co_Po_Mapping_Project
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string message = txtMessage.Text.Trim();

                // Store data in session (optional)
                Session["ContactName"] = name;
                Session["ContactEmail"] = email;
                Session["ContactMessage"] = message;

                // Send an email (optional)
                SendEmail(name, email, message);

                // Display success message
                lblMessage.Text = "Your message has been sent successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Clear form fields
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void SendEmail(string name, string email, string message)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("your-email@example.com"); // Replace with your email
            mail.To.Add("admin@example.com"); // Replace with admin email
            mail.Subject = "New Contact Form Submission";
            mail.Body = $"Name: {name}\nEmail: {email}\nMessage: {message}";

            SmtpClient smtp = new SmtpClient("smtp.example.com"); // Replace with SMTP server
            smtp.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-password");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main_Page.aspx");
        }
    }
}
