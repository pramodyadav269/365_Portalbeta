using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Code
{
    public class ActivityLog
    {

        public void Log(Activity activityNum, int compId, int userId, string userName, string message, string ipAddress)
        {

        }

        // tblActivityLogs
        //- LogID
        //- CompID
        //- UserId
        //- UserName
        //- Message
        //- IPAddress
        //- MethodName
        //- CreatedDate
        //- ActivityMasterId
    }

    public enum Activity
    {
        Login = 1,
        Logout = 2,
        CourseAdded = 101,
        CourseArchive = 102,
        CourseUnArchive = 103,
        CourseUpdated = 104,
        CoursePublished = 105,
        CourseAssigned = 106
    }
}