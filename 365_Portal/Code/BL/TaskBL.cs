using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _365_Portal.Models;
using _365_Portal.Code.DAL;
using System.Data;
using System.IO;

namespace _365_Portal.Code.BL
{
    public class TaskBL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "TaskBL", methodName);
        }

        public static DataSet TaskCRUD(TaskManagement task)
        {
            DataSet dsresult = new DataSet();
            try
            {
                if (!string.IsNullOrEmpty(task.t_FileIds))
                {
                    string userProfilePicBase64 = string.Empty;


                    var files = task.t_FileIds.Split(new string[] { "," }, StringSplitOptions.None);

                    if (files.Count() == 1)
                        userProfilePicBase64 = files[0];
                    else
                        userProfilePicBase64 = files[1];
                    byte[] imageBytes = Convert.FromBase64String(userProfilePicBase64);

                    string fileName = task.t_UserId + "_" + Guid.NewGuid() + "." + Utility.GetFileExtension(userProfilePicBase64);
                    string filePath = HttpContext.Current.Server.MapPath("~/Files/Task/" + fileName);
                    File.WriteAllBytes(filePath, imageBytes);

                    DataSet dsFile = UserBL.CreateFile(fileName, HttpContext.Current.Server.MapPath("~/Files/Task/"), false, "Task");
                    if (dsFile.Tables.Count > 0 && dsFile.Tables[0].Rows.Count > 0)
                    {
                        task.t_FileIds = dsFile.Tables[0].Rows[0]["UniqueID"].ToString().Trim();
                    }
                }
                dsresult = TaskDAL.TaskCRUD(task);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return dsresult;
        }

    }
}