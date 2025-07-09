using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class MappingTool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        

        

        protected void btnGoToNextPage_Click(object sender, EventArgs e)
        {

            Response.Redirect("COPO_Calculation.aspx");
        }

       

        protected void btnGoToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main_Page.aspx");
        }
    }
}
