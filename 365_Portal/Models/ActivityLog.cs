using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Models
{
    public class ActivityLog
    {
        public int p_Action { get; set; }
        public int p_ActivityMasterId { get; set; }
        public int p_CompID { get; set; }
        public int p_UserId { get; set; }
        public string p_UserName { get; set; }
        public string p_Message { get; set; }
        public string p_IPAddress { get; set; }
        public string p_MethodName { get; set; }
    }
}