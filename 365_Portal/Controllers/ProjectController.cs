using _365_Portal.Code;
using _365_Portal.Code.BL;
using _365_Portal.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace _365_Portal.Controllers
{
    public class ProjectController : ApiController
    {
        private System.Web.Script.Serialization.JavaScriptSerializer jsSerializer;

        private ProjectController()
        {
            jsSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        }

        [Route("api/Project/ProjectCRUD")]
        [HttpPost]
        public IHttpActionResult ProjectCRUD(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    //Deserialize JSON data into calss object
                    Project project = requestParams.ToObject<Project>();
                    project.p_CompID = identity.CompId;
                    project.p_UserId = Convert.ToInt32(identity.UserID);

                    if (project.p_Action == 1)//View Action
                    {
                        if (identity.Role != "enduser")
                        {
                            project.p_UserId = 0;
                        }
                    }

                    var ds = ProjectBL.ProjectCRUD(project);

                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }
    }
}
