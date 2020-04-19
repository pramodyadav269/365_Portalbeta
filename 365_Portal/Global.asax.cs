using _365_Portal.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace _365_Portal
{
    public class WebApiApplication : System.Web.HttpApplication
    {

        //public static ActiveUsersCache ActiveUsersCache { get; } = new ActiveUsersCache();
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        //Added by pramod on 24 Oct 19 to read session values
        protected void Application_PostAuthorizeRequest()
        {
            System.Web.HttpContext.Current.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.Required);
        }

        //protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        //{
        //    if (User != null && User.Identity.IsAuthenticated)
        //    {
        //        // Only update when the request is for an .aspx page

        //        if (Session["UserId"] != null && Session.SessionID != null)
        //            ActiveUsersCache.AddOrUpdate(Convert.ToString(Session["UserId"]), Convert.ToString(Session["EmailID"]), Convert.ToString(Session["FirstName"]) + " " + Convert.ToString(Session["LastName"]), Session.SessionID);
        //        //if (Context.Handler is System.Web.UI.Page)
        //        //{
        //        //    ActiveUsersCache.AddOrUpdate(User.Identity.Name);
        //        //}
        //    }
        //}
    }
}
