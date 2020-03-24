using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Models
{
    public class Project
    {
        public int p_Action { get; set; }
        public int p_CompID { get; set; }
        public int p_ProjectID { get; set; }
        public string p_ProjectName { get; set; }
        public string p_ProjectGoal { get; set; }
        public int p_UserId { get; set; }
        public string p_ProjectMembers_UserIds { get; set; }
    }
}