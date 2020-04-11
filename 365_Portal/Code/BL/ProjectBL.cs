using _365_Portal.Code.DAL;
using _365_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace _365_Portal.Code.BL
{
    public class ProjectBL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "ProjectBL", methodName);
        }

        public static DataSet ProjectCRUD(Project project)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = ProjectDAL.ProjectCRUD(project);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            return ds;
        }
    }
}