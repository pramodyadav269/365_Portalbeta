using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using _365_Portal.Models;
using MySql.Data.MySqlClient;


namespace _365_Portal.Code.DAL
{
    public class ProjectDAL
    {

        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "ProjectDAL", methodName);
        }

        private static MySqlCommand mySqlCommandParameters(MySqlCommand cmd, Project project)
        {
            cmd.Parameters.AddWithValue("p_Action", project.p_Action);
            cmd.Parameters.AddWithValue("p_CompID", project.p_CompID);
            cmd.Parameters.AddWithValue("p_ProjectID", project.p_ProjectID);
            cmd.Parameters.AddWithValue("p_ProjectName", project.p_ProjectName);
            cmd.Parameters.AddWithValue("p_ProjectGoal", project.p_ProjectGoal);
            cmd.Parameters.AddWithValue("p_UserId", project.p_UserId);
            cmd.Parameters.AddWithValue("p_ProjectMembers_UserIds", project.p_ProjectMembers_UserIds);
            return cmd;
        }

        private static MySqlCommand mySqlCommandParameters(MySqlCommand cmd, TaskStatus taskStatus)
        {
            cmd.Parameters.AddWithValue("p_Action", taskStatus.p_Action);
            cmd.Parameters.AddWithValue("p_CompID", taskStatus.p_CompID);
            cmd.Parameters.AddWithValue("p_StatusName", taskStatus.p_StatusName);
            cmd.Parameters.AddWithValue("p_SrNo", taskStatus.p_SrNo);
            cmd.Parameters.AddWithValue("p_UserId", taskStatus.p_UserId);
            cmd.Parameters.AddWithValue("p_ProjectID", taskStatus.p_ProjectID);
            return cmd;
        }

        public static DataSet ProjectCRUD(Project project)
        {
            DataSet ds = new DataSet();
            MySqlConnection conn = new MySqlConnection(ConnectionManager.connectionString);
            try
            {
                conn.Open();
                string stm = "spTM_ProjectCRUD";
                MySqlCommand cmd = new MySqlCommand(stm, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd = mySqlCommandParameters(cmd, project); // setting values to the procedure parameters
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(ds, "Data");
                return ds;
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public static DataSet ProjectStatusCRUD(TaskStatus taskStatus)
        {
            DataSet ds = new DataSet();
            MySqlConnection conn = new MySqlConnection(ConnectionManager.connectionString);
            try
            {
                conn.Open();
                string stm = "spTM_StatusCRUD";
                MySqlCommand cmd = new MySqlCommand(stm, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd = mySqlCommandParameters(cmd, taskStatus); // setting values to the procedure parameters
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(ds, "Data");
                return ds;
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
    }
}