using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _365_Portal.t
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if Product name is task
            if (WebConfigurationManager.AppSettings["ProductName"] == "TASK")
            {
                
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}