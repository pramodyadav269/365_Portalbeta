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
using static _365_Portal.Models.ConstantMessages;

namespace _365_Portal.Controllers
{
    public class ProjectController : ApiController
    {
        private System.Web.Script.Serialization.JavaScriptSerializer jsSerializer;
        private string UserName = string.Empty;

        private ProjectController()
        {
            jsSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            UserName = Convert.ToString(System.Web.HttpContext.Current.Session["UserFullName"]);
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


                    if (project.p_Action == 2 || project.p_Action == 3 || project.p_Action == 4)
                    {
                        ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Project.ToString(), project.p_Action, project.p_CompID, project.p_UserId
                          , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, project.p_ProjectName);
                        var dsActivityLog = ActivityLogBL.LogCRUD(objlog);
                    }
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

        [Route("api/Project/ProjectStatusCRUD")]
        [HttpPost]
        public IHttpActionResult ProjectStatusCRUD(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    //Deserialize JSON data into calss object
                    TaskStatus taskStatus = requestParams.ToObject<TaskStatus>();
                    taskStatus.p_CompID = identity.CompId;
                    taskStatus.p_UserId = Convert.ToInt32(identity.UserID);

                    if (taskStatus.p_Action == 1)//View Action
                    {
                        if (identity.Role != "enduser")
                        {
                            taskStatus.p_UserId = 0;
                        }
                    }

                    var ds = ProjectBL.ProjectStatusCRUD(taskStatus);

                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);


                    if (taskStatus.p_Action == 2 || taskStatus.p_Action == 3 || taskStatus.p_Action == 5)
                    {
                        ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Status.ToString(), taskStatus.p_Action, taskStatus.p_CompID, taskStatus.p_UserId
                          , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, taskStatus.p_StatusName);
                        var dsActivityLog = ActivityLogBL.LogCRUD(objlog);
                    }
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

        [Route("api/ActivityLog/GetActivityLog")]
        [HttpPost]
        public IHttpActionResult GetActivityLog(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    //Deserialize JSON data into calss object
                    ActivityLog activityLog = requestParams.ToObject<ActivityLog>();
                    activityLog.p_CompID = identity.CompId;
                    activityLog.p_UserId = Convert.ToInt32(identity.UserID);

                    var ds = ActivityLogBL.LogCRUD(activityLog);

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
