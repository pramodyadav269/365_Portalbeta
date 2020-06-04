using _365_Portal.Code;
using _365_Portal.Code.BL;
using _365_Portal.Code.BO;
using _365_Portal.Code.DAL;
using _365_Portal.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Reflection;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Linq;
using System.IO;
using static _365_Portal.Models.Login;

namespace _365_Portal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string aa = getYouTubeThumbnail("'https://www.youtube.com/embed/ZRvhn68WVpg?enablejsapi=1'");
            if (!Page.IsPostBack)
            {
                //HttpContext.Current.Session["UserId"] = null;
                //HttpContext.Current.Session["RoleName"] = null;
                Utility.DestroyAllSession();

                //If Login From Cookie
                //HttpCookie myCookie = Request.Cookies["UserInfo"];
                //if (myCookie != null)
                //{
                //    LoginFromCookie(Convert.ToString(myCookie.Values["userid"]));
                //}
                if (Request.Cookies["userid"] != null && Request.Cookies["userid"].Value != null && Request.Cookies["userid"].Value.Trim() != "")
                {
                    LoginFromCookie(Convert.ToString(Request.Cookies["userid"].Value));
                }
            }
            //LoadBadges();
        }

        public void LoadBadges()
        {
            DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Files/Badges/"));
            FileInfo[] files = di.GetFiles("*");
            int srNo = 1;
            foreach (var file in files)
            {
                string badgeName = file.Name;
                badgeName = badgeName.Replace(".svg", "");
                var badgeNameParts = badgeName.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                if (badgeNameParts.Count() > 1)
                {
                    badgeName = badgeNameParts[1];
                }
                if (badgeNameParts.Count() > 2)
                {
                    badgeName = badgeNameParts[1] + "-" + badgeNameParts[2];
                }
                if (badgeNameParts.Count() > 3)
                {
                    badgeName = badgeNameParts[1] + "-" + badgeNameParts[1] + "-" + badgeNameParts[2];
                }
                string badgePath = @"\Files\Badges\" + file.Name;
                TrainningBL.AddBadge(badgeName, badgeName, 500, badgePath, srNo);
                srNo++;
            }
        }

        public string getYouTubeThumbnail(string YoutubeUrl)
        {
            string youTubeThumb = string.Empty;
            if (YoutubeUrl == "")
                return "";

            if (YoutubeUrl.IndexOf("=") > 0)
            {
                youTubeThumb = YoutubeUrl.Split('=')[1];
            }
            else if (YoutubeUrl.IndexOf("/v/") > 0)
            {
                string strVideoCode = YoutubeUrl.Substring(YoutubeUrl.IndexOf("/v/") + 3);
                int ind = strVideoCode.IndexOf("?");
                youTubeThumb = strVideoCode.Substring(0, ind == -1 ? strVideoCode.Length : ind);
            }
            else if (YoutubeUrl.IndexOf('/') < 6)
            {
                youTubeThumb = YoutubeUrl.Split('/')[3];
            }
            else if (YoutubeUrl.IndexOf('/') > 6)
            {
                youTubeThumb = YoutubeUrl.Split('/')[1];
            }

            return "http://img.youtube.com/vi/" + youTubeThumb + "/mqdefault.jpg";
        }

        protected void LoginFromCookie(string UserId)
        {
            UserBO objResponse = new UserBO();            
            objResponse = UserDAL.GetUserDetailsByUserID(UserId, "");

            ProceedToSuccessLoginProcess(objResponse, objResponse.EmailID, objResponse.PasswordHash);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                if (string.IsNullOrEmpty(txtUserEmail.Text.Trim()) || string.IsNullOrEmpty(txtUserPassword.Text.Trim()))
                {
                    //lblError.Text = ConstantMessages.Login.InvalidUser;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Swal.fire({text: '" + ConstantMessages.Login.InvalidUser + "',allowOutsideClick:false})", true);
                    return;
                }
                else
                {
                    LoginRequest objRequest = new LoginRequest();
                    objRequest.UserName = txtUserEmail.Text.Trim();
                    objRequest.Password = txtUserPassword.Text;

                    UserBO objResponse = new UserBO();
                    objResponse = UserDAL.LoginUser(objRequest);

                    if (objResponse.ReturnCode == "1")
                    {
                        ProceedToSuccessLoginProcess(objResponse, txtUserEmail.Text.Trim(), txtUserPassword.Text.Trim());
                    }
                    else
                    {
                        // Call Login Business Layer Function to record message
                        //lblError.Text = objResponse.ReturnMessage;
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Swal.fire({text: '" + objResponse.ReturnMessage + "',allowOutsideClick:false})", true);

                    }
                }
            }
            catch (Exception ex)
            {
                //lblError.Text = ConstantMessages.WebServiceLog.GenericErrorMsg;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Swal.fire({text: '" + ConstantMessages.WebServiceLog.GenericErrorMsg + "',allowOutsideClick:false})", true);

            }
        }

        protected void ProceedToSuccessLoginProcess(UserBO objResponse, string UserName , string Password)
        {
            //HttpCookie myOldCookie = Request.Cookies["UserInfo"];
            //if (myOldCookie == null)
            //{
            //    HttpCookie myCookie = new HttpCookie("UserInfo");
            //    myCookie.Values.Add("userid", objResponse.UserID);
            //    myCookie.Expires = DateTime.Now.AddMonths(1);
            //    Response.Cookies.Add(myCookie);
            //}

            Response.Cookies["userid"].Value = objResponse.UserID;



            //HttpCookie _userInfoCookies = new HttpCookie("UserInfo");
            //_userInfoCookies["UserId"] = objResponse.UserID;
            //_userInfoCookies.Expires = DateTime.Now.AddMonths(1);
            //Response.Cookies.Add(_userInfoCookies);
            //End

            //Login Log
            LoginLogout _loginLogout = new LoginLogout();
            _loginLogout.UserID = objResponse.UserID;
            _loginLogout.CompID = objResponse.CompId.ToString();
            _loginLogout.Type = "login";
            _loginLogout.IP_Address = Utility.GetClientIPaddress();
            UserDAL.InsertLoginLogoutHistory(_loginLogout, "");
            //End Login Log

            GetAccessToken(UserName, Password);

            if (HttpContext.Current.Session["access_token"] == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Swal.fire({text: '" + ConstantMessages.WebServiceLog.GenericErrorMsg + "',allowOutsideClick:false})", true);
                return;
            }
            else
            {
                // Call Login Business Layer Function to record message
                Utility.CreateUserSession(objResponse.UserID, objResponse.Role, objResponse.FirstName, objResponse.LastName, objResponse.CompId, objResponse.EmailID);

                List<ActiveUser> lstActiveUsers = new List<ActiveUser>();
                if (Cache["ActiveUsers"] != null)
                {
                    lstActiveUsers = (List<ActiveUser>)Cache["ActiveUsers"];
                }
                ActiveUsersCache cache = new ActiveUsersCache();
                cache.AddOrUpdate(lstActiveUsers, objResponse.UserID, objResponse.EmailID, objResponse.FirstName + " " + objResponse.LastName, Session.SessionID);
                Cache["ActiveUsers"] = lstActiveUsers;

                //For ProfilePic,CompanyProfilePic & Theme
                var UserDetails = UserDAL.GetUserDetailsByUserID(objResponse.UserID, "");
                if (UserDetails != null && !string.IsNullOrEmpty(UserDetails.ProfilePicFileID))
                {
                    HttpContext.Current.Session["ThemeColor"] = UserDetails.ThemeColor;
                    HttpContext.Current.Session["ThemeColor2"] = UserDetails.ThemeColor2;
                    HttpContext.Current.Session["ThemeColor3"] = UserDetails.ThemeColor3;
                    HttpContext.Current.Session["ThemeColor4"] = UserDetails.ThemeColor4;
                    HttpContext.Current.Session["Favicon"] = UserDetails.FaviconFileID;

                    Utility.CreateProfileAndThemeSession(UserDetails.ProfilePicFileID, UserDetails.CompanyProfilePicFileID, UserDetails.ThemeColor);
                }
                //End For ProfilePic,CompanyProfilePic & Theme

                if (objResponse.IsFirstLogin == "1" || objResponse.IsFirstPasswordNotChanged == "1")
                {
                    if (objResponse.IsFirstLogin == "1")
                    {
                        Utility.CreateFirstLoginSession(true);
                    }
                    if (objResponse.IsFirstPasswordNotChanged == "1")
                    {
                        Utility.CreateFirstPasswordNotChangedSession(true);
                    }
                    if (objResponse.IsFirstLogin == "1")
                    {
                        Response.Redirect("~/t/Settings.aspx", false);
                    }
                    else if (objResponse.IsFirstPasswordNotChanged == "1")
                    {
                        Response.Redirect("~/t/ChangePassword.aspx", false);
                    }
                }
                else
                {
                    Utility.CreateFirstLoginSession(false);

                    //Added on 04 Jun 20 to preview add course without login
                    if (HttpContext.Current.Session["requestedurlcourse"] != null)
                    {
                        string requestedurl = Convert.ToString(HttpContext.Current.Session["requestedurlcourse"]);
                        HttpContext.Current.Session["requestedurlcourse"] = null;
                        Response.Redirect(requestedurl);
                    }
                    //End

                    //This is used to redirect user on specific page where he requested .Purpose of this is to navigate already logged in user in same browser
                    HttpCookie myCookie = Request.Cookies["UserInfo"];
                    if (myCookie != null && HttpContext.Current.Session["requestedurl"] != null)
                    {
                        string requestedurl = Convert.ToString(HttpContext.Current.Session["requestedurl"]);
                        HttpContext.Current.Session["requestedurl"] = null;
                        Response.Redirect(requestedurl);
                    }
                    //End

                    if (objResponse.Role.ToLower() == "enduser")
                    {
                        Response.Redirect("~/t/default.aspx", false);
                    }
                    else if (objResponse.Role.ToLower() == "superadmin" || objResponse.Role.ToLower() == "companyadmin" || objResponse.Role.ToLower() == "subadmin")
                    {
                        Response.Redirect("~/t/dashboard.aspx", false);
                    }
                }
            }
        }
    }
}