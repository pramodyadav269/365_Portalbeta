using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Code
{
    public class ActiveUsersCache
    {
        private readonly object padlock = new object();
        //  private readonly Dictionary<string, DateTime> cache = new Dictionary<string, DateTime>();

        // List<ActiveUser> lstActiveUsers = new List<ActiveUser>();
        private DateTime lastCleanedAt;

        public int ActivePeriodInMinutes { get; } = 30;
        private const int MinutesBetweenCacheClean = 30;

        public List<ActiveUser> GetActiveUsers(List<ActiveUser> lstActiveUsers)
        {
            lstActiveUsers = CleanCache(lstActiveUsers);

            //var result = new List<ActiveUser>();
            //lock (padlock)
            //{
            //    //  result.AddRange(lstActiveUsers.Select(activeUser => new ActiveUser { Name = activeUser.Key, LastActive = activeUser.Value }));
            //    //result = lstActiveUsers;
            //}
            return lstActiveUsers;
        }

        private List<ActiveUser> CleanCache(List<ActiveUser> lstActiveUsers)
        {
            lastCleanedAt = DateTime.Now;
            var cutoffTime = DateTime.Now - TimeSpan.FromMinutes(ActivePeriodInMinutes);
            lock (padlock)
            {
                var expiredSessions = lstActiveUsers.Where(au => au.LastActive < cutoffTime).ToList();
                foreach (var name in expiredSessions)
                {
                    lstActiveUsers.Remove(name);
                }
            }
            return lstActiveUsers;
        }

        public List<ActiveUser> AddOrUpdate(List<ActiveUser> lstActiveUsers, string userId, string emailId, string userName, string sessionid)
        {
            lock (padlock)
            {
                var currentUser = lstActiveUsers.SingleOrDefault(p => p.SessionID == sessionid);
                if (currentUser != null)
                {
                    // Update Details
                    currentUser.UserId = userId;
                    currentUser.EmailID = emailId;
                    currentUser.SessionID = sessionid;
                    currentUser.LastActive = DateTime.Now;
                    currentUser.Name = userName;
                }
                else
                {
                    // Insert
                    lstActiveUsers.Add(new ActiveUser() { UserId = userId, EmailID = emailId, LastActive = DateTime.Now, CreatedDate = DateTime.Now, Name = userName, SessionID = sessionid });
                }
            }

            if (IsTimeForCacheCleaup())
            {
                CleanCache(lstActiveUsers);
            }
            return lstActiveUsers;
        }

        public List<ActiveUser> KillSession(List<ActiveUser> lstActiveUsers, string sessionId, string userId)
        {
            if (!string.IsNullOrEmpty(sessionId))
            {
                var expiredSessions = lstActiveUsers.Where(p => p.SessionID == sessionId).ToList();
                foreach (var name in expiredSessions)
                {
                    lstActiveUsers.Remove(name);
                }
            }
            if (!string.IsNullOrEmpty(userId))
            {
                var expiredSessions = lstActiveUsers.Where(p => p.UserId == userId).ToList();
                foreach (var name in expiredSessions)
                {
                    lstActiveUsers.Remove(name);
                }
            }
            return lstActiveUsers;
        }

        private bool IsTimeForCacheCleaup()
        {
            return lastCleanedAt < DateTime.Now - TimeSpan.FromMinutes(MinutesBetweenCacheClean);
        }
    }

    [Serializable]
    public class ActiveUser
    {
        public string UserId { get; set; }

        public string Name { get; set; }

        public string EmailID { get; set; }

        public string SessionID { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime LastActive { get; set; }

        public string TotalSpentTime
        {
            get
            {
                var timeSpan = DateTime.Now - CreatedDate;
                if (timeSpan.Minutes == 0 && timeSpan.Seconds == 0)
                    return "Just now";
                if (timeSpan.Minutes == 0)
                    return timeSpan.Seconds + "s ago";
                return $"{timeSpan.Minutes}m  {timeSpan.Seconds}s ago";
            }
        }

        public string LastActiveDescription
        {
            get
            {
                var timeSpan = DateTime.Now - LastActive;
                if (timeSpan.Minutes == 0 && timeSpan.Seconds == 0)
                    return "Just now";
                if (timeSpan.Minutes == 0)
                    return timeSpan.Seconds + "s ago";
                return $"{timeSpan.Minutes}m  {timeSpan.Seconds}s ago";
            }
        }
    }
}