using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using _365_Portal.Code.BL;
using _365_Portal.Code;
using _365_Portal.Models;

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
            //var identity = MyAuthorizationServerProvider.AuthenticateUser();
            //if (identity != null)
            //{
            try
            {
                //Deserialize JSON data into calss object
                TaskManagement task = requestParams.ToObject<TaskManagement>();

                //task.t_CompID = identity.CompId;
                //task.t_UserIds = identity.CompId;                
                var ds = TaskBL.TaskCRUD(task);
                data = Utility.ConvertDataSetToJSONString(ds);
                data = Utility.Successful(data);
            }
            catch (Exception ex)
            {
                data = Utility.Exception(ex); ;
            }
            //}
            //else
            //{
            //    data = Utility.AuthenticationError();
            //}
            return new APIResult(Request, data);
        }

    }
}
