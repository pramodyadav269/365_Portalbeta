using _365_Portal.Code.DAL;
using _365_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace _365_Portal.Code.BL
{
    public class UserBL
    {

        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "UserBL", methodName);
        }

        public static DataSet CreateUser(UserBO userdetails)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateUser(userdetails);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet ModifyUser(UserBO userdetails)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateUser(userdetails);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet DeleteUser(int CompId, string UserId, string UserKey, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.DeleteUser(CompId, UserId, UserKey, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet GetUsers(string UserId, string RoleId, string EmailId, string GroupId, string MobileNo, string Position, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.GetUsers(UserId, RoleId, EmailId, GroupId, MobileNo, Position, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet CreateGroup(int CompId, string GroupName, string Description, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateGroup((int)ConstantMessages.Action.INSERT, CompId, 0, GroupName, Description, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet ModifyGroup(int CompId, string GroupName, int GroupId, string Description, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateGroup((int)ConstantMessages.Action.MODIFY, CompId, GroupId, GroupName, Description, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        public static DataSet ViewGroup(int CompId)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.ViewGroup(CompId);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet DeleteGroup(int CompId, int GroupId, bool IsActive, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.DeleteGroup(CompId, GroupId, IsActive, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }


        #region CRUD FOR DEPARTMENTS
        public static DataSet CreateDepartment(int CompId, string DeptName, string Description, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateDepartment((int)ConstantMessages.Action.INSERT, CompId, 0, DeptName, Description, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        public static DataSet ModifyDepartment(int CompId, string DeptName, int DeptId, string Description, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateDepartment((int)ConstantMessages.Action.MODIFY, CompId, DeptId, DeptName, Description, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        public static DataSet ViewDepartment(int CompId)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.ViewDepartment(CompId);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        public static DataSet DeleteDepartment(int CompId, int GroupId, bool IsActive, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.DeleteDepartment(CompId, GroupId, IsActive, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        #endregion DEPARTMENTS

        #region CRUD FOR CATEGORY        
        public static DataSet CategoryCRUD(int action,int CompId,int CatID, string CatName, string Description, string CreatedBy, bool IsActive)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CategoryCRUD(action, CompId, CatID, CatName, Description, CreatedBy, IsActive);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        #endregion CATEGORY

        #region CRUD FOR TEAM        
        public static DataSet TeamCRUD(int action, int CompId, int TeamID, string TeamName, string Description, string CreatedBy, bool IsActive)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.TeamCRUD(action, CompId, TeamID, TeamName, Description, CreatedBy, IsActive);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
        #endregion TEAM


        public static DataSet MasterCRUD(int action, int CompId, int TeamID, string TeamName, string Description, string CreatedBy, bool IsActive, string type)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.MasterCRUD(action, CompId, TeamID, TeamName, Description, CreatedBy, IsActive, type);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }



        public static DataSet SetUserPassword(int CompId, string UserId, string Password, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.SetUserPassword(CompId, UserId, Password, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }


        /// <summary>
        /// Send OTP on provided mobile number/s
        /// </summary>
        /// <param name="mobileNumbers"></param>
        /// <param name="OTP"></param>
        /// <returns></returns>
        public static DataSet ResetPassword(int Action, int CompId, string UserId, string MobileNum, string EmailId, string Type, string DeviceDetails, string DeviceType, string IpAddress)
        {
            DataSet data = new DataSet();
            int OTP = 0;
            var token_url = "";
            var token = "";
            if (Type == ConstantMessages.ForgotPassowrd.Type_0)
            {
                OTP = Utility.GenerateOTP(4);
            }
            else
            {
                string Link = System.Web.Configuration.WebConfigurationManager.AppSettings["ResetPasswordLink"].ToString();
                var g = Guid.NewGuid();
                token_url = Utility.urlNewShorter(Link + g);
                token = g.ToString();
            }
            //If otp type is for success message than skip otp code..            
            try
            {
                data = CommonDAL.UserResetPassword(Action, CompId, UserId, MobileNum, EmailId, Type, DeviceDetails, DeviceType, IpAddress, OTP, token_url, token);


            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }


            return data;
        }

        public static DataSet CreateFile(string FilePath, string FileDirectory,bool IsURL, string Ref1)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = UserDAL.CreateFile(FilePath, FileDirectory,IsURL, Ref1);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

    }
}