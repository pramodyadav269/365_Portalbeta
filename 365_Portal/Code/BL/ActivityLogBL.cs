using _365_Portal.Code.DAL;
using _365_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static _365_Portal.Models.ConstantMessages;

namespace _365_Portal.Code.BL
{
    public class ActivityLogBL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "ActivityLogBL", methodName);
        }

        public static DataSet LogCRUD(ActivityLog log)
        {
            DataSet dsresult = new DataSet();
            try
            {
                dsresult = ActivityLogDAL.LogCRUD(log);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);

            }
            return dsresult;
        }

        public static ActivityLog ActivityLogMapper(string ModuleName, int ActionId, int p_CompID, int p_UserId, string p_UserName
            , string p_MethodName, string activitynameobject)
        {
            int p_ActivityMasterId = 0;
            string p_Message = "";
            string p_IPAddress = Utility.GetClientIPaddress();

            if (ModuleName == Modules.Task.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.TaskAdded;
                        p_Message = "Task <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.TaskModified;
                        p_Message = "Task <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.TaskDeleted;
                        p_Message = "Task <b>" + activitynameobject + "</b> Deleted";
                        break;
                    case 10:
                        p_ActivityMasterId = (int)Activity.TaskStatusChanged;
                        p_Message = "Task <b>" + activitynameobject + "</b> status Changed";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Project.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.ProjectAdded;
                        p_Message = "Project <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.ProjectModified;
                        p_Message = "Project <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.projectDeleted;
                        p_Message = "Project <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Status.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.StatusAdded;
                        p_Message = "Status <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.StatusModified;
                        p_Message = "Status <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 5:
                        p_ActivityMasterId = (int)Activity.StatusDeleted;
                        p_Message = "Status <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }

            ActivityLog objlog = new ActivityLog()
            {
                p_Action = 2,
                p_ActivityMasterId = p_ActivityMasterId,
                p_CompID = p_CompID,
                p_UserId = p_UserId,
                p_UserName = p_UserName,
                p_Message = p_Message,
                p_IPAddress = p_IPAddress,
                p_MethodName = p_MethodName,

            };

            return objlog;
        }

    }
}