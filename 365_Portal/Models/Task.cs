using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Models
{
    public class TaskManagement
    {
        public int t_Action { get; set; }
        public int t_ProjectID { get; set; }
        public int t_CompID { get; set; }
        public int t_TaskID { get; set; }
        public string t_TaskName { get; set; }
        public string t_TaskSummary { get; set; }
        public DateTime? t_DueDate { get; set; }
        public string t_PrivateNotes { get; set; }
        public int t_UserId { get; set; }
        public string t_TaskAssignees_UserIds { get; set; } //(Userids comma separated)
        public string t_TagIds { get; set; } //(comma separated)
        public string t_FileIds { get; set; }
        public string t_SubTasks { get; set; } //(delimeter | separated)
        public int t_StatusID { get; set; }
        public string t_Comments { get; set; }
        public string t_FileName { get; set; } //(comma separated)
        public bool t_IsFileUploaded { get; set; }
    }

    public class UpdateTaskManagement
    {
        public int Param_ProjectID { get; set; }
        public int Param_TaskID { get; set; }
        public int Param_CompID { get; set; }
        public string Param_SubTaskIds { get; set; } //#(completed taskIds comma separated)
        public int Param_StatusID { get; set; }
        public string Param_Comments { get; set; }
        public int Param_UserID { get; set; }

        public string Param_ProjectName { get; set; }
        public string Param_TaskName { get; set; }
        public string Param_StatusName { get; set; }


    }
}