using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class UserRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserRecords();
            }
        }

        private void LoadUserRecords()
        {
            string connectionString = "Server=(localdb)\\COPO_Map;Database=CoPoMappingDB_DB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT UserName, Email, Department FROM Register_login";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Database Error: " + ex.Message);
                }
            }
        }
    }
}
