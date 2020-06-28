using _365_Portal.Models;
using System;
using System.Web;
using System.Web.Configuration;

namespace Life
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                //if (Convert.ToString(Session["RoleName"]) == "superadmin")
                //{
                //    Response.Redirect("~/t/dashboard.aspx");
                //}
                if (HttpContext.Current.Session["RoleName"].ToString() == ConstantMessages.Roles.companyadmin)
                {
                    //dvAdminTasks.Visible = true;
                }
                // Take UserName from Session.
                // dvUserName.InnerText = "Hey " + HttpContext.Current.Session["FirstName"] + "!";
                // dvUserName.InnerText = "Welcome " + HttpContext.Current.Session["FirstName"] + "! Let's learn something new today :)";

                // if Product name is task
                if (WebConfigurationManager.AppSettings["ProductName"] == "TASK")
                {
                    Response.Redirect("Projects.aspx");
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}