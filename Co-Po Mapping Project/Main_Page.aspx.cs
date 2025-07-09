using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class Main_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (Session["username"] == null) // If session is null, redirect to login
                {
                    Response.Redirect("LoginForm.aspx");
                }
            

            if (!IsPostBack)
            {
                // Fetch the logged-in username from Session
                if (Session["UserName"] != null)
                {
                    lblUsername.Text = Session["UserName"].ToString();
                }
                else
                {
                    lblUsername.Text = "User"; // Default if session is empty
                }
            }


        }
    }
}