﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _365_Portal.Admin
{
    public partial class Groups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["UserId"] != null &&
              (
              Convert.ToString(Session["RoleName"]) == "superadmin"
              || Convert.ToString(Session["RoleName"]) == "companyadmin"
              ))
            {

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}