using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Co_Po_Mapping_Project
{
    public partial class COAttainment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
            private void LoadData()
            {
                // Simulate session data retrieval
                lblCOAttExternal.Text = Session["CO_Att_External"]?.ToString() ?? "1.6667";
                lblCOAttInternal.Text = Session["CO_Att_Internal"]?.ToString() ?? "3";

                lblWeightExternal.Text = "60%";
                lblWeightInternal.Text = "40%";

                lblPercentExternal.Text = "1";
                lblPercentInternal.Text = "1.2";

                lblFinalCOAttainment.Text = Session["Final_CO_Attainment"]?.ToString() ?? "2.2";
                lblTargetLevel.Text = Session["Target_Level"]?.ToString() ?? "2";
                lblAchievement.Text = "Target Achieved";
            }

            //protected void btnPrint_Click(object sender, EventArgs e)
            //{
            //    // Redirect to a printable version
            //    Response.Redirect("PrintReport.aspx");
            //}
        }

    }
    
