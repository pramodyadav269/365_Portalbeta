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
        private string UserName = string.Empty;

        private TaskController()
        {
            jsSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            UserName = Convert.ToString(System.Web.HttpContext.Current.Session["UserFullName"]);
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

                    #region Activity Log
                    if (task.t_Action == 2 || task.t_Action == 3 || task.t_Action == 4)
                    {
                        ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Task.ToString(), task.t_Action, task.t_CompID, task.t_UserId
                          , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.t_TaskName);
                        var dsActivityLog = ActivityLogBL.LogCRUD(objlog);

                        if (!string.IsNullOrEmpty(task.t_FileName) && task.t_IsFileUploaded)
                        {
                            ActivityLog objlogfie = ActivityLogBL.ActivityLogMapper(Modules.Task.ToString(), (int)TaskAction.FILEADDED, task.t_CompID, task.t_UserId
                       , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.t_TaskName, task.t_FileName);
                            var dsActivityLogfile = ActivityLogBL.LogCRUD(objlogfie);

                        }

                        if (!string.IsNullOrEmpty(task.t_Comments))
                        {
                            ActivityLog objlogcomments = ActivityLogBL.ActivityLogMapper(Modules.Task.ToString(), (int)TaskAction.COMMENTSADDED, task.t_CompID, task.t_UserId
                       , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.t_TaskName, task.t_Comments);
                            var dsActivityLogfile = ActivityLogBL.LogCRUD(objlogcomments);

                        }
                    }
                    #endregion Activity Log
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

                    #region Activity Log
                    ActivityLog objlog = ActivityLogBL.ActivityLogMapper(Modules.Task.ToString(), 10, task.Param_CompID, task.Param_UserID
                      , UserName, System.Reflection.MethodBase.GetCurrentMethod().Name, task.Param_TaskName, "", task.Param_ProjectName, task.Param_StatusName);
                    var dsActivityLog = ActivityLogBL.LogCRUD(objlog);
                    #endregion Activity Log
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
