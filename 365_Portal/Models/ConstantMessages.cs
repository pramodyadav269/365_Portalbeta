﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Models
{
    public class ConstantMessages
    {
        public class Login
        {
            public static string InvalidUserCode = "2";
            public static string InvalidUser = "Invalid EmailId or Password.";
        }
        public class WebServiceLog
        {
            public static string Success = "Success";
            public static string Exception = "Error";
            public static string Validation = "Validation";
            public static string TokenValidation = "Token Failed";

            public static string GenericErrorMsg = "There seems to be technical problem, please try again.";
            public static string GenericErrorCode = "-1";
            public static string InValidValues = "Details provided  are invalid.Please try again";

        }

        public class Roles
        {
            public static string superadmin = "superadmin";
            public static string companyadmin = "companyadmin";
            public static string subadmin = "subadmin";
            public static string enduser = "enduser";
        }

        public class ConnectionString
        {
            public static string Portal_365 = "365_Portal";
        }
        public class ChangePassowrd
        {
            public static string Success = "Password changed Successfully";
            public static string Success_Code = "200";
            public static string Error = "Error occured while Changing Password";
            public static string Error_Code = "500";
            public static string Password_Validation = "Password should contain at least 1 Alphabet, 1 Number and 1 Special Character.";
            public static string PasswordMisMatch = "Old Password entered is incorrect";
            public static string PasswordEmpty = "Password can't be empty";
            public static string PasswordMacth = "Old Password and New Password can't be same";

        }

        public class ForgotPassowrd
        {
            public static string EmailIdEmpty = "Email can't be empty";
            public static string Mobile_NumEmpty = "Mobile Number can't be empty";
            public static string InvalidEmailId = "Email entered is Invalid";
            public static string InvalidMobile = "Mobile Number entered is Invalid";
            public static string InValidUser = "User doesn't exist";
            public static string InActiveUser = "User is not Active";
            public static string LockedUser = "User is Locked";
            public static string EmailMisMatch = "EmailId is entered is not correct";
            public static string OTPSendMsg = "Otp has been send to ur Registered Mobile No";
            public static string EmailSendMsg = "An Email has been send to your Registered EmailId";
            public static string InActiveUserCode = "0";
            public static string Type_0 = "OTP";
            public static string Type_1 = "EMAIL";
            public static string Error = "Oops! An Error occured";
            public static string PasswordTokenEmpty = "Password and Token can't be Empty";
            public static string InvalidToken = "Invalid Token or Token Expired";
        }
        public class DeviceInfo
        {
            public static string InfoType = "Device Details";
            public static string DeviceTypeBrowser = "Browser";
            public static string BrowserName = "Browser Name";
            public static string BrowserVersion = "Browser Version";
        }

        public class NotificationType
        {
            public static string gift = "1";
            public static string module = "2";
            public static string topic = "3";
        }

        public class Procedures
        {
            public static string spBindDropdown = "spBindDropdown";
        }

        public enum StatusCode
        {
            Success = 1, Failure = 0
        }

        public enum Action
        {
            INSERT = 1, MODIFY = 2, DELETE = 3, VIEW = 4, EDIT = 5, EXCEPTION = 6, SEARCH = 7, SEARCH_2 = 8
        }

        public enum TaskAction
        {
            INSERT = 2, MODIFY = 3, DELETE = 4, STATUSCHANGED = 10, FILEADDED = 11, COMMENTSADDED = 12
        }
        public enum Activity
        {
            Login = 1,
            Logout = 2,

            //Course
            CourseAdded = 101,
            CourseUpdated = 102,
            CourseArchive = 103,
            CourseUnArchive = 104,
            CoursePublished = 105,
            CourseAssigned = 106,

            //Lesson
            LessonAdded = 121,
            LessonModified = 122,
            LessonDeleted = 123,

            //Content
            ContentAdded = 131,
            ContentModified = 132,
            ContentDeleted = 133,

            //Resource
            ResourceAdded = 141,
            ResourceModified = 142,
            ResourceDeleted = 143,

            //Quiz
            QuizAdded = 151,
            QuizModified = 152,
            QuizDeleted = 153,

            //Question
            QuestionAdded = 161,
            QuestionModified = 162,
            QuestionDeleted = 163,

            //Project
            ProjectAdded = 201,
            ProjectModified = 202,
            projectDeleted = 203,

            //Task
            TaskAdded = 204,
            TaskModified = 205,
            TaskDeleted = 206,
            TaskStatusChanged = 207,
            TaskFileAdded = 208,
            TaskCommentAdded = 209,

            ////Subtask
            //SubTaskAdded = 208,
            //SubTaskModified = 209,
            //SubTaskDeleted = 210,

            //Status
            StatusAdded = 211,
            StatusModified = 212,
            StatusDeleted = 213,
        }

        public enum Modules
        {
            Project
            , Task
            , Status

            , Course
            , Lesson
            , Content
            , Resource
            , Quiz
            , Question
        }

    }
}