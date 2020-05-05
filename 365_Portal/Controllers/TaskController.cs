using _365_Portal.Code;
using _365_Portal.Code.BL;
using _365_Portal.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Web.Http;
using static _365_Portal.Models.ConstantMessages;

namespace _365_Portal.Controllers
{
    public class TaskController : ApiController
    {
        private System.Web.Script.Serialization.JavaScriptSerializer jsSerializer;

        private TaskController()
        {
            jsSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        }

        [Route("api/Task/TaskCRUD")]
        [HttpPost]
        public IHttpActionResult TaskCRUD(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    //Deserialize JSON data into calss object
                    TaskManagement task = requestParams.ToObject<TaskManagement>();

                    task.t_CompID = identity.CompId;
                    task.t_UserId = Convert.ToInt32(identity.UserID);

                    var ds = TaskBL.TaskCRUD(task);
                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);

                    if (task.t_Action == 2 || task.t_Action == 3 || task.t_Action == 4)
                    {
                        ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Project.ToString(), task.t_Action, task.t_CompID, task.t_UserId
                          , identity.UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.t_TaskName);
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

        [Route("api/Task/TaskUpdate")]
        [HttpPost]
        public IHttpActionResult TaskUpdate(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    UpdateTaskManagement task = requestParams.ToObject<UpdateTaskManagement>();
                    task.Param_CompID = identity.CompId;
                    task.Param_UserID = Convert.ToInt32(identity.UserID);

                    var ds = TaskBL.TaskUpdate(task);
                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);

                    ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Task.ToString(), 10 , task.Param_CompID, task.Param_UserID
                      , identity.UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.Param_TaskName);
                    var dsActivityLog = ActivityLogBL.LogCRUD(objlog);
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
