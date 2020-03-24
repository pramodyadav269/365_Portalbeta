using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _365_Portal.Models;
using _365_Portal.Code.DAL;
using System.Data;

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
            DataSet ds = new DataSet();
            try
            {
                ds = TaskDAL.TaskCRUD(task);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

    }
}