using _365_Portal.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _365_Portal.t
{
    public partial class sessionlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActiveUsersCache objSession = new ActiveUsersCache();
            List<ActiveUser> lstActiveUsers = new List<ActiveUser>();
            if (Cache["ActiveUsers"] != null)
            {
                lstActiveUsers = (List<ActiveUser>)Cache["ActiveUsers"];
            }
            lstActiveUsers = objSession.GetActiveUsers(lstActiveUsers);
            gvSessions.DataSource = lstActiveUsers;
            gvSessions.DataBind();
        }
    }
}