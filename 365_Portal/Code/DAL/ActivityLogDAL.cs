using _365_Portal.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace _365_Portal.Code.DAL
{
    public class ActivityLogDAL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "ActivityLogDAL", methodName);
        }

        private static MySqlCommand mySqlCommandParameters(MySqlCommand cmd, ActivityLog log)
        {
            cmd.Parameters.AddWithValue("p_Action", log.p_Action);
            cmd.Parameters.AddWithValue("p_ActivityMasterId", log.p_ActivityMasterId);
            cmd.Parameters.AddWithValue("p_CompID", log.p_CompID);
            cmd.Parameters.AddWithValue("p_UserId", log.p_UserId);
            cmd.Parameters.AddWithValue("p_UserName", log.p_UserName);
            cmd.Parameters.AddWithValue("p_Message", log.p_Message);
            cmd.Parameters.AddWithValue("p_IPAddress", log.p_IPAddress);
            cmd.Parameters.AddWithValue("p_MethodName", log.p_MethodName);
            return cmd;
        }

        
        public static DataSet LogCRUD(ActivityLog log)
        {
            DataSet ds = new DataSet();
            MySqlConnection conn = new MySqlConnection(ConnectionManager.connectionString);

            try
            {
                conn.Open();
                string stm = "spActivityLog";
                MySqlCommand cmd = new MySqlCommand(stm, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd = mySqlCommandParameters(cmd, log); // setting values to the procedure parameters
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(ds, "Data");
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