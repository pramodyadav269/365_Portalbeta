﻿using _365_Portal.Models;
using System;
using System.Web;

namespace Life
{
    public partial class course_preview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                if (Convert.ToString(Session["RoleName"]) == "superadmin")
                {
                    Response.Redirect("~/t/dashboard.aspx");
                }
                else if (HttpContext.Current.Session["RoleName"].ToString() == ConstantMessages.Roles.companyadmin)
                {
                  //  dvAdminTasks.Visible = true;
                }
                // Take UserName from Session.
                // dvUserName.InnerText = "Hey " + HttpContext.Current.Session["FirstName"] + "!";
                dvUserName.InnerText = "Welcome " + HttpContext.Current.Session["FirstName"] + "! Let's learn something new today :)";
            }
            else if (Request.Url.ToString().ToUpper().Contains("/t/course_preview.aspx".ToUpper()))
            {
                //Proceed with page redirection
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

    }
}