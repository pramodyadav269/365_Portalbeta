﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal
{
    public class ContentBO
    {
        public  int CompID { get; set; }
        public  int ContentID { get; set; }
        public int ParentSrNo { get; set; }
        public  int ContentTypeID { get; set; }
        public string ContentType { get; set; }
        public  string ContentTitle { get; set; }
        public  string ContentDescription { get; set; }
        public  string FilePath { get; set; }
        public  string UserIDs { get; set; }
        public  int TopicID { get; set; }
        public string TopicIDs { get; set; }
        public  string TopicTitle { get; set; }
        public  string TopicName { get; set; }
        public  string TopicDescription { get; set; }
        public  string TopicOverview { get; set; }
        public int ModuleID { get; set; }
        public  string ModuleTitle { get; set; }
        public  string ModuleDescription { get; set; }
        public  string ModuleOverview { get; set; }
        public  string DocType { get; set; }
        public  bool IsPublished { get; set; }
        public  bool IsGift { get; set; }
        public  bool SkipFlashcard { get; set; }
        public  bool IsActive { get; set; }
        public  int SrNo { get; set; }
        public  string MinUnlockedModules { get; set; }
        public  string CreatedBy { get; set; }


    }
}