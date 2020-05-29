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
            , string p_MethodName, string activitynameobject, string ExtraParam1 = "", string ProjectName = "", string StatusName = "")
        {
            int p_ActivityMasterId = 0;
            string p_Message = "";
            string p_IPAddress = Utility.GetClientIPaddress();

            if (ModuleName == Modules.Task.ToString())
            {
                switch (ActionId)
                {
                    case (int)TaskAction.INSERT:
                        p_ActivityMasterId = (int)Activity.TaskAdded;
                        p_Message = p_UserName + " added <b>" + activitynameobject + "</b>";
                        break;
                    case (int)TaskAction.MODIFY:
                        p_ActivityMasterId = (int)Activity.TaskModified;
                        p_Message = p_UserName + " edited <b>" + activitynameobject + "</b>";
                        break;
                    case (int)TaskAction.DELETE:
                        p_ActivityMasterId = (int)Activity.TaskDeleted;
                        p_Message = p_UserName + " deleted <b>" + activitynameobject + "</b>";
                        break;
                    case 10:
                        p_ActivityMasterId = (int)Activity.TaskStatusChanged;
                        p_Message = p_UserName + " marked <b>" + activitynameobject + "</b> from project <b>" + ProjectName + "</b> as <b>" + StatusName + "</b>";
                        break;
                    case (int)TaskAction.FILEADDED:
                        p_ActivityMasterId = (int)Activity.TaskFileAdded;
                        p_Message = p_UserName + " uploaded attachement to <b>" + activitynameobject + "</b>";
                        break;
                    case (int)TaskAction.COMMENTSADDED:
                        p_ActivityMasterId = (int)Activity.TaskCommentAdded;
                        p_Message = p_UserName + " Commented on <b>" + activitynameobject + "</b>";
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
                        p_Message = p_UserName + " added <b>" + activitynameobject + "</b>";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.ProjectModified;
                        p_Message = p_UserName + " edited <b>" + activitynameobject + "</b>";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.projectDeleted;
                        p_Message = p_UserName + " deleted <b>" + activitynameobject + "</b>";
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


            //For Add Course Journey
            else if (ModuleName == Modules.Course.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.CourseAdded;
                        p_Message = "Course <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.CourseUpdated;
                        p_Message = "Course <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.CourseArchive;
                        p_Message = "Course <b>" + activitynameobject + "</b> archieved Successfully";
                        break;
                    case 5:
                        p_ActivityMasterId = (int)Activity.CourseUnArchive;
                        p_Message = "Course <b>" + activitynameobject + "</b> Un-archieved Successfully";
                        break;
                    case 6:
                        p_ActivityMasterId = (int)Activity.CoursePublished;
                        p_Message = "Course <b>" + activitynameobject + "</b> published Successfully";
                        break;
                    case 7:
                        p_ActivityMasterId = (int)Activity.CoursePublished;
                        p_Message = "Course <b>" + activitynameobject + "</b> assigned Successfully";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Lesson.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.LessonAdded;
                        p_Message = "Lesson <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.LessonModified;
                        p_Message = "Lesson <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.LessonDeleted;
                        p_Message = "Lesson <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Content.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.ContentAdded;
                        p_Message = "Content <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.ContentModified;
                        p_Message = "Content <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.ContentDeleted;
                        p_Message = "Content <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Resource.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.ResourceAdded;
                        p_Message = "Resource <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.ResourceModified;
                        p_Message = "Resource <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.ResourceDeleted;
                        p_Message = "Resource <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Quiz.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.QuizAdded;
                        p_Message = "Quiz <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.QuizModified;
                        p_Message = "Quiz <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.QuizDeleted;
                        p_Message = "Quiz <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            else if (ModuleName == Modules.Question.ToString())
            {
                switch (ActionId)
                {
                    case 2:
                        p_ActivityMasterId = (int)Activity.QuestionAdded;
                        p_Message = "Question <b>" + activitynameobject + "</b> added Successfully";
                        break;
                    case 3:
                        p_ActivityMasterId = (int)Activity.QuestionModified;
                        p_Message = "Question <b>" + activitynameobject + "</b> updated Successfully";
                        break;
                    case 4:
                        p_ActivityMasterId = (int)Activity.QuestionDeleted;
                        p_Message = "Question <b>" + activitynameobject + "</b> deleted";
                        break;
                    default:
                        p_ActivityMasterId = 0;
                        break;
                }
            }
            //End For Add Course Journey

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