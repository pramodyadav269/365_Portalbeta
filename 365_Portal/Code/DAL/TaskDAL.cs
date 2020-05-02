using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using _365_Portal.Models;
using MySql.Data.MySqlClient;

namespace _365_Portal.Code.DAL
{
    public class TaskDAL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "TaskDAL", methodName);
        }

        private static MySqlCommand mySqlCommandParameters(MySqlCommand cmd, TaskManagement task)
        {
            cmd.Parameters.AddWithValue("t_Action", task.t_Action);
            cmd.Parameters.AddWithValue("t_ProjectID", task.t_ProjectID);
            cmd.Parameters.AddWithValue("t_CompID", task.t_CompID);
            cmd.Parameters.AddWithValue("t_TaskID", task.t_TaskID);
            cmd.Parameters.AddWithValue("t_TaskName", task.t_TaskName);
            cmd.Parameters.AddWithValue("t_TaskSummary", task.t_TaskSummary);
            cmd.Parameters.AddWithValue("t_DueDate", task.t_DueDate);
            cmd.Parameters.AddWithValue("t_PrivateNotes", task.t_PrivateNotes);
            cmd.Parameters.AddWithValue("t_UserId", task.t_UserId);
            cmd.Parameters.AddWithValue("t_TaskAssignees_UserIds", task.t_TaskAssignees_UserIds);
            cmd.Parameters.AddWithValue("t_TagIds", task.t_TagIds);
            cmd.Parameters.AddWithValue("t_FileIds", task.t_FileIds);
            cmd.Parameters.AddWithValue("t_SubTasks", task.t_SubTasks);
            cmd.Parameters.AddWithValue("t_StatusID", task.t_StatusID);
            cmd.Parameters.AddWithValue("t_Comments", task.t_Comments);
            return cmd;
        }

        private static MySqlCommand mySqlCommandParameters(MySqlCommand cmd, UpdateTaskManagement task)
        {
            cmd.Parameters.AddWithValue("Param_ProjectID", task.Param_ProjectID);
            cmd.Parameters.AddWithValue("Param_TaskID", task.Param_TaskID);
            cmd.Parameters.AddWithValue("Param_CompID", task.Param_CompID);
            cmd.Parameters.AddWithValue("Param_SubTaskIds", task.Param_SubTaskIds);
            cmd.Parameters.AddWithValue("Param_StatusID", task.Param_StatusID);
            cmd.Parameters.AddWithValue("Param_Comments", task.Param_Comments);
            cmd.Parameters.AddWithValue("Param_UserID", task.Param_UserID);
            
            return cmd;
        }

        public static DataSet TaskCRUD(TaskManagement task)
        {
            DataSet ds = new DataSet();
            MySqlConnection conn = new MySqlConnection(ConnectionManager.connectionString);

            try
            {
                conn.Open();
                string stm = "spTM_TaskCRUD";
                MySqlCommand cmd = new MySqlCommand(stm, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd = mySqlCommandParameters(cmd, task); // setting values to the procedure parameters
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(ds, "Data");
                //return ds;
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

        public static DataSet TaskUpdate(UpdateTaskManagement updateTask)
        {
            DataSet ds = new DataSet();
            MySqlConnection conn = new MySqlConnection(ConnectionManager.connectionString);

            try
            {
                conn.Open();
                string stm = "spTM_UpdateTask";
                MySqlCommand cmd = new MySqlCommand(stm, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd = mySqlCommandParameters(cmd, updateTask); // setting values to the procedure parameters
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