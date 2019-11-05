﻿using _365_Portal.Code.DAL;
using _365_Portal.Code.BL;
using _365_Portal.Common;
using _365_Portal.Models;
using _365_Portal.Code;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Script.Serialization;
using static _365_Portal.Models.Login;
using Newtonsoft.Json.Linq;
using System.Web.Configuration;
using System.Text.RegularExpressions;
using System.Data;
using _365_Portal.Code.BO;
using static _365_Portal.Code.BO.UserProfile;

namespace _365_Portal.Controllers
{
    public class UserController : ApiController
    {
        [HttpPost]
        [Route("api/User/LoginUser")]
        public IHttpActionResult LoginUser(JObject requestParams)
        {
            LoginResponse objResponse = null;
            string data = string.Empty;
            try
            {
                string EmailId = Convert.ToString(requestParams["UserName"]).Trim();
                string UserPwd = Convert.ToString(requestParams["Password"]);

                if (string.IsNullOrEmpty(EmailId) || string.IsNullOrEmpty(UserPwd))
                {
                    data = Utility.API_Status("0", ConstantMessages.Login.InvalidUser);
                }
                else
                {
                    LoginRequest objRequest = new LoginRequest();
                    objRequest.UserName = EmailId;
                    objRequest.Password = UserPwd;

                    objResponse = new LoginResponse();

                    UserBO objUser = new UserBO();
                    objUser = UserDAL.LoginUser(objRequest);

                    objResponse.ReturnCode = objUser.ReturnCode;
                    objResponse.ReturnMessage = objUser.ReturnMessage;                    
                    objResponse.Role = objUser.Role;
                    objResponse.EmailID = objUser.EmailID;
                    objResponse.FirstName = objUser.FirstName;
                    objResponse.LastName = objUser.LastName;
                    objResponse.IsFirstLogin = objUser.IsFirstLogin;                    
                    
                    objResponse.IsFirstPasswordNotChanged = objUser.IsFirstPasswordNotChanged;

                    // Success
                    if (objResponse.ReturnCode == "1")
                    {
                        GetAccessToken(EmailId, UserPwd);

                        if (HttpContext.Current.Session["access_token"] != null)
                        {
                            objResponse.Token = HttpContext.Current.Session["access_token"].ToString();
                            data = JsonConvert.SerializeObject(objResponse, Formatting.Indented);
                            data = Utility.Successful(data);
                        }
                        else
                        {
                            data = Utility.API_Status("0", ConstantMessages.WebServiceLog.GenericErrorMsg);
                        }
                    }
                    else
                    {
                        // Failed
                        data = Utility.API_Status("0", objResponse.ReturnMessage);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log Error
                data = Utility.API_Status("0", "There might be some error. Please try again later.");
            }
            finally
            {

            }
            return new APIResult(Request, data);
        }

        [HttpPost]
        [Route("api/User/UserLogout")]
        public IHttpActionResult UserLogout()
        {
            WebServiceLog objServiceLog = new WebServiceLog();
            LoginResponse objResponse = null;
            string Response = string.Empty;

            objServiceLog.RequestTime = DateTime.Now;
            objServiceLog.ControllerName = this.GetType().Name;
            objServiceLog.MethodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
            try
            {
                var httpRequest = HttpContext.Current.Request;
                string EmailId = httpRequest.Form["EmailId"];

                LoginRequest objRequest = new LoginRequest();
                objRequest.UserName = EmailId;

                objResponse = new LoginResponse();
                int i = UserDAL.UserLogout(objRequest);
                if (i > 0)
                {
                    objResponse.ReturnCode = "0";
                    objResponse.ReturnMessage = "User logout succesfully.";
                }
                else
                {
                    objResponse.ReturnCode = "1";
                    objResponse.ReturnMessage = "Unable to logout.";
                }
                Response = JsonConvert.SerializeObject(objResponse, Formatting.Indented);
                objServiceLog.RequestString = JSONHelper.ConvertJsonToString(objRequest);
                objServiceLog.ResponseString = JSONHelper.ConvertJsonToString(objResponse);
                objServiceLog.RequestType = ConstantMessages.WebServiceLog.Success;
            }
            catch (Exception ex)
            {
                objServiceLog.ResponseString = "Exception " + ex.Message + " | " + ex.StackTrace;
                objServiceLog.RequestType = ConstantMessages.WebServiceLog.Exception;
            }
            finally
            {
                objServiceLog.ResponseTime = DateTime.Now;
                InsertRequestLog.SaveWebServiceLog(objServiceLog);
            }
            return Ok(Response);
        }

        //Get request api to autheticate user
        //[HttpGet]
        //[Route("api/User/GetForAuthenticate")]
        //public IHttpActionResult GetForAuthenticate()
        //{
        //    //var identity = (ClaimsIdentity)User.Identity;
        //    var identity = MyAuthorizationServerProvider.AuthenticateUser();
        //    if (identity != null)
        //    {
        //        var twest = identity.UserID;
        //    }
        //    return Ok("Hello " + identity.FirstName);
        //}

        /// <summary>
        /// Change password Api
        /// </summary>
        /// <param name="jsonResult"></param>
        /// <returns>
        /// Result as True or false 
        /// </returns>
        [HttpPost]
        [Route("API/User/ChangePassword")]
        public IHttpActionResult ChangePassword(JObject requestParams)
        {
            var data = string.Empty;
            UserBO _userdetail = new UserBO();
            Regex regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");// Password Validation regex with atleast 1 lowercase,1 Uppercase,1 numeric,1 special charcter and 8 Charcters long  
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                string NewPassword = requestParams["NewPassword"].ToString();
                string OldPassword = requestParams["OldPassword"].ToString();
                /*This fields are for the mobile Request*/
                string DeviceDetails = requestParams["DeviceDetails"].ToString();
                string DeviceType = requestParams["DeviceType"].ToString();
                /*Condition to check whether the entered old Password is correct or wrong*/
                _userdetail.OldPassword = OldPassword;
                _userdetail.NewPassword = NewPassword;//clear Text Password getting From User.                    
                _userdetail.CompId = identity.CompId;
                _userdetail.UserID = identity.UserID;

                if (!string.IsNullOrEmpty(NewPassword) && !string.IsNullOrEmpty(OldPassword))
                {
                    if (NewPassword.Trim().ToLower() != OldPassword.Trim().ToLower())
                    {
                        var UserBO = UserDAL.GetAuthenticatedUserDetails(identity.UserID, "");
                        var OldPasswordSalt = UserBO.PasswordSalt;
                        var OldPasswordHash = Utility.GetHashedPassword(OldPassword, OldPasswordSalt);

                        if (OldPasswordHash == UserBO.PasswordHash)
                        {
                            Match match = regex.Match(_userdetail.NewPassword);
                            if (match.Success)
                            {
                                try
                                {
                                    if ((HttpContext.Current.Request.Browser.IsMobileDevice == true || HttpContext.Current.Request.Browser.IsMobileDevice == false) && string.IsNullOrEmpty(DeviceDetails) && string.IsNullOrEmpty(DeviceType) && string.IsNullOrEmpty(DeviceType))
                                    {
                                        _userdetail.DeviceDetails = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.InfoType.Trim().ToLower());
                                        _userdetail.DeviceType = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.DeviceTypeBrowser.Trim().ToLower());

                                    }
                                    else
                                    {
                                        _userdetail.DeviceDetails = DeviceDetails;
                                        _userdetail.DeviceType = DeviceType;
                                    }
                                    _userdetail.IP_Address = Utility.GetClientIPaddress();
                                    _userdetail.CreatedBy = Convert.ToInt32(identity.UserID);

                                    var ds = CommonBL.ChangePassword(_userdetail);
                                    if (ds.Tables.Count > 0)
                                    {
                                        DataTable dt = ds.Tables["Data"];
                                        if (dt.Rows[0]["ReturnCode"].ToString() == "1")
                                        {
                                            HttpContext.Current.Session["IsFirstPasswordNotChanged"] = false;
                                            data = Utility.ConvertDataSetToJSONString(dt);
                                            data = Utility.Successful(data);
                                        }
                                        else
                                        {

                                            data = ConstantMessages.ChangePassowrd.Error;
                                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                        }

                                    }
                                    else
                                    {
                                        data = ConstantMessages.ChangePassowrd.Error;
                                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                    }
                                }
                                catch (Exception ex)
                                {
                                    data = ConstantMessages.ChangePassowrd.Error;
                                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                }
                            }
                            else
                            {

                                data = ConstantMessages.ChangePassowrd.Password_Validation;
                                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                            }
                        }
                        else
                        {
                            data = ConstantMessages.ChangePassowrd.PasswordMisMatch;
                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                        }
                    }
                    else
                    {
                        data = ConstantMessages.ChangePassowrd.PasswordMacth;
                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                    }
                }
                else
                {
                    data = ConstantMessages.ChangePassowrd.PasswordEmpty;
                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                }

            }
            else
            {
                data = Utility.AuthenticationError();
                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
            }
            return new APIResult(Request, data);
        }

        /// <summary>
        /// Gives the Login Details for User
        /// </summary>
        /// <param name="jsonResult">Username In Json result</param>
        /// <returns>
        /// Login Details
        /// </returns>
        [HttpPost]
        [Route("api/User/GetLoginDetails")]
        public IHttpActionResult GetLoginDetails(JObject jsonResult)
        {
            var data = "";
            string UserName = (string)jsonResult.SelectToken("username");
            if (!string.IsNullOrEmpty(UserName) && !string.IsNullOrWhiteSpace(UserName))
            {
                try
                {
                    //var ds =  CommonBL.GetLoginDetails(1);
                    var ds = CommonBL.GetLoginDetails(UserName);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                }
                catch (Exception ex)
                {
                    APIResult.ThrowException(ex);
                }
            }
            else
            {
                data = "UserName is not entered. Please enter a UserName";
            }
            return new APIResult(Request, data);
        }

        [Route("API/User/CreateUser")]
        [HttpPost]
        public IHttpActionResult CreateUser(JObject jsonResult)
        {
            var data = "";
            string UserName = (string)jsonResult.SelectToken("username");
            if (!string.IsNullOrEmpty(UserName) && !string.IsNullOrWhiteSpace(UserName))
            {
                try
                {
                    //var ds =  CommonBL.GetLoginDetails(1);
                    var ds = CommonBL.GetLoginDetails(UserName);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                }
                catch (Exception ex)
                {
                    APIResult.ThrowException(ex);
                }
            }
            else
            {
                data = "UserName is not entered. Please enter a UserName";
            }
            return new APIResult(Request, data);
        }

        [HttpPost]
        [Route("API/User/GetMyProfile")]
        public IHttpActionResult GetMyProfile()//JObject requestParams
        {
            var data = string.Empty;
            UserProfileResponse objUserProfile = new UserProfileResponse();

            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                var UserDetails = UserDAL.GetUserDetailsByUserID(identity.UserID, "");
                if (UserDetails != null)
                {                    
                    objUserProfile.Role = UserDetails.Role;
                    objUserProfile.FirstName = UserDetails.FirstName;
                    objUserProfile.LastName = UserDetails.LastName;
                    objUserProfile.EmailID = UserDetails.EmailID;
                    objUserProfile.MobileNum = UserDetails.MobileNum;
                    objUserProfile.Position = UserDetails.Position;
                    objUserProfile.EmailNotification = UserDetails.EmailNotification;
                    objUserProfile.PushNotification = UserDetails.PushNotification;                    
                    objUserProfile.ThemeColor = UserDetails.ThemeColor;
                    objUserProfile.GroupName = UserDetails.GroupName;
                    if (!string.IsNullOrEmpty(UserDetails.ProfilePicFileID))
                    {
                        //objUserProfile.ProfilePicFile = HttpContext.Current.Server.MapPath("~/Files/ProfilePic/") + UserDetails.ProfilePicFileID;
                        objUserProfile.ProfilePicFile = UserDetails.ProfilePicFileID;
                    }
                    if (!string.IsNullOrEmpty(UserDetails.CompanyProfilePicFileID))
                    {
                        //objUserProfile.CompanyProfilePicFile = HttpContext.Current.Server.MapPath("~/Files/CompLogo/") + UserDetails.CompanyProfilePicFileID;
                        objUserProfile.CompanyProfilePicFile = UserDetails.CompanyProfilePicFileID;
                    }

                    data = Utility.ConvertJsonToString(objUserProfile);
                    data = Utility.Successful(data);
                }
                else
                {
                    data = Utility.Failed(data);
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [HttpPost]
        [Route("API/User/UpdateMyProfile")]
        public IHttpActionResult UpdateMyProfile(JObject requestParams)
        {
            var data = string.Empty;
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                UserBO _userdetail = new UserBO();
                _userdetail.UserID = identity.UserID;
                _userdetail.EmailID = (string)requestParams.SelectToken("EmailID");
                _userdetail.Position = (string)requestParams.SelectToken("Position");

                try
                {
                    if (requestParams.SelectToken("UserProfileImageBase64") != null && Convert.ToString(requestParams.SelectToken("UserProfileImageBase64")).Split(',').Length > 1)
                    {
                        _userdetail.ProfilePicFile = Convert.ToString(requestParams.SelectToken("UserProfileImageBase64")).Split(',')[1];

                        byte[] bytes = Convert.FromBase64String(_userdetail.ProfilePicFile);
                        System.Drawing.Image image;
                        using (System.IO.MemoryStream ms = new System.IO.MemoryStream(bytes))
                        {
                            image = System.Drawing.Image.FromStream(ms);
                        }

                        string GUID = Guid.NewGuid().ToString();
                        string extension = "." + Convert.ToString(requestParams.SelectToken("UserProfileImageBase64")).Split(';')[0].Split('/')[1];
                        string FileName = _userdetail.UserID + "_" + GUID + extension;
                        string FullPath = HttpContext.Current.Server.MapPath("~/Files/ProfilePic/" + FileName);
                        image.Save(FullPath, System.Drawing.Imaging.ImageFormat.Png);

                        DataSet ds = UserBL.CreateFile(FileName, HttpContext.Current.Server.MapPath("~/Files/ProfilePic/"), "");
                        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            _userdetail.ProfilePicFileID = ds.Tables[0].Rows[0]["UniqueID"].ToString();
                        }
                    }
                    if (identity.Role == ConstantMessages.Roles.companyadmin || identity.Role == ConstantMessages.Roles.superadmin)
                    {
                        if (requestParams.SelectToken("CompanyProfileImageBase64") != null && Convert.ToString(requestParams.SelectToken("CompanyProfileImageBase64")).Split(',').Length > 1)
                        {
                            _userdetail.CompanyProfilePicFile = Convert.ToString(requestParams.SelectToken("CompanyProfileImageBase64")).Split(',')[1];

                            byte[] bytes = Convert.FromBase64String(_userdetail.CompanyProfilePicFile);
                            System.Drawing.Image image;
                            using (System.IO.MemoryStream ms = new System.IO.MemoryStream(bytes))
                            {
                                image = System.Drawing.Image.FromStream(ms);
                            }

                            string GUID = Guid.NewGuid().ToString();
                            string extension = "." + Convert.ToString(requestParams.SelectToken("CompanyProfileImageBase64")).Split(';')[0].Split('/')[1];
                            string FileName = _userdetail.UserID + "_" + GUID + extension;
                            string FullPath = HttpContext.Current.Server.MapPath("~/Files/CompLogo/" + FileName);
                            image.Save(FullPath, System.Drawing.Imaging.ImageFormat.Png);

                            DataSet ds = UserBL.CreateFile(FileName, HttpContext.Current.Server.MapPath("~/Files/CompLogo/"), "");
                            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                            {
                                _userdetail.CompanyProfilePicFileID = ds.Tables[0].Rows[0]["UniqueID"].ToString();
                            }
                        }
                        _userdetail.ThemeColor = (string)requestParams.SelectToken("CompanyThemeColor");
                    }
                }
                catch (Exception ex)
                {
                    ResponseBase objResponse = new ResponseBase();
                    objResponse.ReturnCode = ConstantMessages.WebServiceLog.GenericErrorCode;
                    objResponse.ReturnMessage = ConstantMessages.WebServiceLog.GenericErrorMsg;
                    data = Utility.ConvertJsonToString(objResponse);
                    data = Utility.Failed(data);
                    return new APIResult(Request, data);
                }

                var ResponseBase = UserDAL.UpdateUserDetailsByUserID(_userdetail, "");
                ResponseBase.Ref1 = _userdetail.ProfilePicFile;
                data = Utility.ConvertJsonToString(ResponseBase);

                if (ResponseBase.ReturnCode == "1")
                {
                    HttpContext.Current.Session["IsFirstLogin"] = false;
                    data = Utility.Successful(data);
                }
                else
                {
                    data = Utility.Failed(data);
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [HttpPost]
        [Route("API/User/UpdateNotification")]
        public IHttpActionResult UpdateNotification(JObject requestParams)
        {
            var data = string.Empty;
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                UserBO _userdetail = new UserBO();
                _userdetail.UserID = identity.UserID;
                _userdetail.EmailNotification = (bool)requestParams.SelectToken("EmailNotification");
                _userdetail.PushNotification = (bool)requestParams.SelectToken("PushNotification");

                var ResponseBase = UserDAL.UpdateNotificationByUserID(_userdetail, "");
                if (ResponseBase.ReturnCode == "1")
                {
                    data = Utility.ConvertJsonToString(ResponseBase);
                    data = Utility.Successful(data);
                }
                else
                {
                    data = Utility.Failed(data);
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        /// <summary>
        /// Forgot/Reset password Api
        /// </summary>
        /// <param name="jsonResult"></param>
        /// <returns>
        /// Result as True or false 
        /// </returns>
        [HttpPost]
        [Route("API/User/ForgotPassword")]
        public IHttpActionResult ForgotPassword(JObject requestParams)
        {
            var data = string.Empty;
            int CompId = 0;
            int Action;
            string UserId = string.Empty;
            string Type = string.Empty;
            string IP_Address = string.Empty;
            /*Both values are taken as input whatever the logic needs to impemented*/
            string EmailId = requestParams["EmailId"].ToString();
            string MobileNum = requestParams["MobileNum"].ToString();
            Action = Convert.ToInt32(requestParams["Action"]);
            /*This fields are for the mobile Request*/
            string DeviceDetails = requestParams["DeviceDetails"].ToString();
            string DeviceType = requestParams["DeviceType"].ToString();
            Regex regex_Email = new Regex(@"^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
            Regex regex_Mobile_Num = new Regex(@"^[0-9]{10}$");
            Match mtch_Email = regex_Email.Match(EmailId);
            Match mtch_Mobile = regex_Mobile_Num.Match(MobileNum);
            try
            {
                if (!string.IsNullOrEmpty(EmailId) || !string.IsNullOrEmpty(MobileNum))
                {
                    if (mtch_Email.Success || mtch_Mobile.Success)
                    {
                        var identity = UserDAL.GetUserDetailsByEmailID(EmailId, string.Empty);
                        if (identity != null)//User Entered EamilId(User) is present in system or not
                        {
                            if (identity.IsDeleted.ToString() == ConstantMessages.ForgotPassowrd.InActiveUserCode)//User is active or Inactive
                            {
                                data = ConstantMessages.ForgotPassowrd.InActiveUser;
                                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                            }
                            else
                            {
                                if (EmailId.Trim().ToUpper() == identity.EmailID.Trim().ToUpper())
                                {
                                    try
                                    {
                                        CompId = identity.CompId;
                                        UserId = identity.UserID;
                                        IP_Address = Utility.GetClientIPaddress();
                                        if ((HttpContext.Current.Request.Browser.IsMobileDevice == true || HttpContext.Current.Request.Browser.IsMobileDevice == false) && string.IsNullOrEmpty(DeviceDetails) && string.IsNullOrEmpty(DeviceType) && string.IsNullOrEmpty(DeviceType))
                                        {
                                            DeviceDetails = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.InfoType.Trim().ToLower());
                                            DeviceType = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.DeviceTypeBrowser.Trim().ToLower());
                                        }
                                        if (Action == Convert.ToInt32(ConstantMessages.StatusCode.Failure))
                                        {
                                            Type = ConstantMessages.ForgotPassowrd.Type_0;
                                        }
                                        else
                                        {
                                            Type = ConstantMessages.ForgotPassowrd.Type_1;
                                        }
                                        var ds = UserBL.ResetPassword(Action, CompId, UserId, MobileNum, EmailId, Type, DeviceDetails, DeviceType, IP_Address);
                                        if (ds.Tables.Count > 0)
                                        {
                                            DataTable dt = ds.Tables["Data"];
                                            if (dt.Rows[0]["ReturnCode"].ToString() == "1")
                                            {
                                                data = Utility.ConvertDataSetToJSONString(dt);
                                                data = Utility.Successful(data);
                                            }
                                            else
                                            {

                                                data = ConstantMessages.ChangePassowrd.Error;
                                                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                            }

                                        }
                                        else
                                        {
                                            data = ConstantMessages.ChangePassowrd.Error;
                                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        data = ConstantMessages.ForgotPassowrd.Error;
                                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                    }
                                }
                                else
                                {
                                    data = ConstantMessages.ForgotPassowrd.InvalidEmailId;
                                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                }
                            }
                        }
                        else
                        {
                            data = ConstantMessages.ForgotPassowrd.InValidUser;
                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(EmailId))
                        {
                            data = ConstantMessages.ForgotPassowrd.EmailMisMatch;
                        }
                        else
                        {
                            data = ConstantMessages.ForgotPassowrd.InvalidMobile;
                        }
                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(EmailId))
                    {
                        data = ConstantMessages.ForgotPassowrd.EmailIdEmpty;
                    }
                    else
                    {
                        data = ConstantMessages.ForgotPassowrd.Mobile_NumEmpty;
                    }
                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                }
            }
            catch (Exception ex)
            {
                data = ex.Message;
                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
            }
            return new APIResult(Request, data);
        }
        /// <summary>
        /// Password Changed API which will Change the PAssword
        /// </summary>
        /// <param name="requestParams"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("API/User/ResetPassword")]
        public IHttpActionResult ResetPassword(JObject requestParams)
        {
            var data = string.Empty;
            try
            {

                string Password = requestParams["Password"].ToString();
                string Token = requestParams["Token"].ToString();
                /*This fields are for the mobile Request*/
                string DeviceDetails = requestParams["DeviceDetails"].ToString();
                string DeviceType = requestParams["DeviceType"].ToString();
                if (!string.IsNullOrEmpty(Password) && !string.IsNullOrEmpty(Token))
                {
                    var User_details = UserDAL.GetUserDetailsByToken(Token, string.Empty);

                    if (Token.ToUpper().ToString() == User_details.Token.ToUpper().ToString())
                    {
                        var _ds = CommonDAL.UserResetPassword((int)4, User_details.CompId, User_details.UserID, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, 0, string.Empty, User_details.Token);
                        if (_ds.Tables.Count > 0)
                        {
                            DataTable _dt = _ds.Tables["Data"];
                            if (_dt.Rows[0]["ReturnCode"].ToString() == "1")
                            {
                                Regex regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");// Password Validation regex with atleast 1 lowercase,1 Uppercase,1 numeric,1 special charcter and 8 Charcters long  
                                Match m = regex.Match(Password);
                                if (m.Success)
                                {
                                    UserBO _details = new UserBO();
                                    _details.CompId = User_details.CompId;
                                    _details.UserID = User_details.UserID;
                                    _details.Token = Token;
                                    _details.NewPassword = Password;
                                    _details.IP_Address = Utility.GetClientIPaddress();
                                    if ((HttpContext.Current.Request.Browser.IsMobileDevice == true || HttpContext.Current.Request.Browser.IsMobileDevice == false) && string.IsNullOrEmpty(DeviceDetails) && string.IsNullOrEmpty(DeviceType) && string.IsNullOrEmpty(DeviceType))
                                    {
                                        _details.DeviceDetails = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.InfoType.Trim().ToLower());
                                        _details.DeviceType = Utility.GetDeviceDetails(ConstantMessages.DeviceInfo.DeviceTypeBrowser.Trim().ToLower());
                                    }
                                    var ds = CommonBL.ChangePassword(_details);
                                    if (ds.Tables.Count > 0)
                                    {
                                        DataTable dt = ds.Tables["Data"];
                                        if (dt.Rows[0]["ReturnCode"].ToString() == "1")
                                        {
                                            data = Utility.ConvertDataSetToJSONString(dt);
                                            data = Utility.Successful(data);
                                            //var ds_ = CommonDAL.UserResetPassword((int)5, User_details.CompId, User_details.UserID, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, 0, string.Empty, User_details.Token);
                                            //if (ds_.Tables.Count > 0)
                                            //{
                                            //    DataTable dt_ = ds_.Tables["Data"];
                                            //    if (dt_.Rows[0]["ReturnCode"].ToString() != "1")
                                            //    {
                                            //        data = ConstantMessages.ChangePassowrd.Error;
                                            //        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                            //    }
                                            //}
                                            //else
                                            //{
                                            //    data = ConstantMessages.ChangePassowrd.Error;
                                            //    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                            //}
                                        }
                                        else
                                        {

                                            data = ConstantMessages.ChangePassowrd.Error;
                                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                        }

                                    }
                                    else
                                    {
                                        data = ConstantMessages.ChangePassowrd.Error;
                                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                    }
                                }
                                else
                                {
                                    data = ConstantMessages.ChangePassowrd.Password_Validation;
                                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                                }
                            }
                            else
                            {

                                data = Utility.ConvertDataSetToJSONString(_dt);
                                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                            }
                        }
                        else
                        {
                            data = ConstantMessages.ChangePassowrd.Error;
                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                        }
                    }
                    else
                    {
                        data = ConstantMessages.ForgotPassowrd.InvalidToken;
                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                    }

                }
                else
                {
                    data = ConstantMessages.ForgotPassowrd.PasswordTokenEmpty;
                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                }
            }
            catch (Exception ex)
            {
                data = ex.Message;
                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
            }

            return new APIResult(Request, data);
        }
        /// <summary>
        /// Token Verification 
        /// </summary>
        /// <param name="requestParams"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("API/User/TokenVerification")]
        public IHttpActionResult TokenVerification(JObject requestParams)
        {
            var data = string.Empty;
            try
            {
                string Token = requestParams["Token"].ToString();
                if (!string.IsNullOrEmpty(Token))
                {

                    var User_details = UserDAL.GetUserDetailsByToken(Token, string.Empty);
                    var ds = CommonDAL.UserResetPassword((int)4, User_details.CompId, User_details.UserID, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, 0, string.Empty, User_details.Token);
                    if (ds.Tables.Count > 0)
                    {
                        DataTable dt = ds.Tables["Data"];
                        if (dt.Rows[0]["ReturnCode"].ToString() == "1")
                        {
                            data = Utility.ConvertDataSetToJSONString(dt);
                            data = Utility.Successful(data);
                        }
                        else
                        {

                            data = Utility.ConvertDataSetToJSONString(dt);
                            data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                        }

                    }
                    else
                    {
                        data = ConstantMessages.ChangePassowrd.Error;
                        data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                    }

                }
                else
                {
                    data = ConstantMessages.ForgotPassowrd.InvalidToken;
                    data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
                }
            }
            catch (Exception ex)
            {
                data = ex.Message;
                data = Utility.API_Status(Convert.ToInt32(ConstantMessages.StatusCode.Failure).ToString(), data);
            }

            return new APIResult(Request, data);
        }

    }
}
