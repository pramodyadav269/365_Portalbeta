﻿using _365_Portal.Code.BL;
using _365_Portal.Code;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Reflection;
using Newtonsoft.Json;
using _365_Portal.Code.BO;
using _365_Portal.Models;

namespace _365_Portal.Controllers
{
    public class TrainningController : ApiController
    {
        [Route("api/Trainning/GetTopicsByUser")]
        [HttpPost]
        public IHttpActionResult GetTopicsByUser(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    string searchText = Convert.ToString(requestParams["SearchText"].ToString());
                    var ds = TrainningBL.GetTopicsByUser(compId, userId, searchText);
                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/AddFavAndBookMark")]
        [HttpPost]
        public IHttpActionResult AddFavAndBookMark(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int TopicID = 0;
                    int IsFav = 0;
                    int IsBookMark = 0;
                    bool ValFlag = true;

                    string Message = string.Empty;
                    int compId = identity.CompId;
                    string userId = identity.UserID;

                    if (requestParams.SelectToken("TopicID") != null && requestParams.SelectToken("TopicID").ToString().Trim() != "")
                    {
                        TopicID = Convert.ToInt32(requestParams.SelectToken("TopicID"));
                    }
                    else
                    {
                        Message = "Please provide TopicID."; ValFlag = false;
                    }
                    if (requestParams.SelectToken("Fav") != null && requestParams.SelectToken("Fav").ToString().Trim() != ""
                        && (requestParams.SelectToken("Fav").ToString().Trim() == "0" || requestParams.SelectToken("Fav").ToString().Trim() == "1"))
                    {
                        IsFav = Convert.ToInt32(requestParams.SelectToken("Fav"));
                    }
                    else
                    {
                        Message = "Please provide valid Favourite flag."; ValFlag = false;
                    }
                    if (requestParams.SelectToken("BookMark") != null && requestParams.SelectToken("BookMark").ToString().Trim() != ""
                        && (requestParams.SelectToken("BookMark").ToString().Trim() == "0" || requestParams.SelectToken("BookMark").ToString().Trim() == "1"))
                    {
                        IsBookMark = Convert.ToInt32(requestParams.SelectToken("BookMark"));
                    }
                    else
                    {
                        Message = "Please provide valid Bookmark flag."; ValFlag = false;
                    }

                    if (ValFlag)
                    {
                        var ds = TrainningBL.AddFavAndBookMark(userId, compId, TopicID, IsFav, IsBookMark);
                        data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                        data = Utility.Successful(data);
                    }
                    else
                    {
                        data = Utility.API_Status("2", Message);
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetModulesByTopic")]
        [HttpPost]
        public IHttpActionResult GetModulesByTopic(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    var checkIfTopicAssigned = Convert.ToBoolean(Convert.ToInt32(requestParams["CheckIfTopicAssigned"].ToString()));
                    if (checkIfTopicAssigned)
                        TrainningBL.CheckIfTopicAssigned(compId, userId, topicId);

                    var ds = TrainningBL.GetModulesByTopic(compId, userId, topicId);
                    var sourceInfo = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    sourceInfo = sourceInfo.Substring(2, sourceInfo.Length - 4);
                    data = Utility.GetModulesJSONFormat("1", "Successful", sourceInfo, Utility.ConvertDataSetToJSONString(ds.Tables[1]), Utility.ConvertDataSetToJSONString(ds.Tables[2]));
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex);
                }
            }
            else
            {
                //Added on 04 Jun 20 to preview add course without login
                if (Request.Headers.Contains("Authorization") && Request.Headers.GetValues("Authorization").First().ToUpper() == "Bearer".ToUpper())
                {
                    int compId = 0;
                    string userId = "0";
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    var checkIfTopicAssigned = Convert.ToBoolean(Convert.ToInt32(requestParams["CheckIfTopicAssigned"].ToString()));
                    if (checkIfTopicAssigned)
                        TrainningBL.CheckIfTopicAssigned(compId, userId, topicId);

                    var ds = TrainningBL.GetModulesByTopic(compId, userId, topicId);
                    var sourceInfo = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    sourceInfo = sourceInfo.Substring(2, sourceInfo.Length - 4);
                    data = Utility.GetModulesJSONFormat("1", "Successful", sourceInfo, Utility.ConvertDataSetToJSONString(ds.Tables[1]), Utility.ConvertDataSetToJSONString(ds.Tables[2]));
                }//End
                else
                {
                    data = Utility.AuthenticationError();
                }                
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetContentsByModule")]
        [HttpPost]
        public IHttpActionResult GetContentsByModule(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    int moduleId = Convert.ToInt32(requestParams["ModuleID"].ToString());
                    var isGift = false;
                    if (!string.IsNullOrEmpty(Convert.ToString(requestParams["IsGift"])))
                        isGift = Convert.ToBoolean(Convert.ToInt32(requestParams["IsGift"].ToString()));
                    var ds = TrainningBL.GetContentsByModule(compId, userId, topicId, moduleId, isGift);
                    var sourceInfo = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    sourceInfo = sourceInfo.Substring(2, sourceInfo.Length - 4);
                    data = Utility.GetModulesJSONFormat("1", "Successful", sourceInfo, Utility.ConvertDataSetToJSONString(ds.Tables[1]), Utility.ConvertDataSetToJSONString(ds.Tables[2]));
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/UpdateContent")]
        [HttpPost]
        public IHttpActionResult UpdateContent(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    int moduleId = Convert.ToInt32(requestParams["ModuleID"].ToString());
                    int contentId = Convert.ToInt32(requestParams["ContentID"].ToString());
                    var ds = TrainningBL.UpdateContent(compId, userId, topicId, moduleId, contentId);
                    if (ds.Tables.Count > 0)
                    {
                        var tableIndex = 0;
                        string isGift = "0";
                        if (ds.Tables[0].Columns.Contains("IsGift"))
                        {
                            // Successful -  Unlocked a gift
                            isGift = "1";
                            data = Utility.ContentUpdated("1", "Success", isGift, Utility.ConvertDataSetToJSONString(ds.Tables[0]));
                            tableIndex = 1;
                            TrainningBL.SendNotification(compId, userId, ConstantMessages.NotificationType.gift, "", ds.Tables[0].Rows[0]["Title"].ToString());
                        }
                        else if (ds.Tables[0].Rows[0]["StatusCode"].ToString() == "1")
                        {
                            // Successful - Without Gift
                            data = Utility.ContentUpdated("1", "Success", isGift, "");
                        }
                        else
                        {
                            // Error. Check Logs
                            data = Utility.API_Status("1", "There might be some error. Please try again later");
                        }

                        if (ds.Tables[tableIndex].Columns.Contains("StatusCode"))
                        {
                            var moduleCompleted = false;
                            if (Convert.ToBoolean(Convert.ToInt32(Convert.ToString(ds.Tables[tableIndex].Rows[0]["IsModuleCompleted"]))))
                            {
                                // Module Completed
                                // ds.Tables[tableIndex + 1];
                                moduleCompleted = true;
                                TrainningBL.SendNotification(compId, userId, ConstantMessages.NotificationType.module, "", ds.Tables[tableIndex + 1].Rows[0]["Title"].ToString());
                            }
                            if (Convert.ToBoolean(Convert.ToInt32(Convert.ToString(ds.Tables[tableIndex].Rows[0]["IsTopicCompleted"]))))
                            {
                                // Topic Completed
                                //ds.Tables[tableIndex + 1 + (moduleCompleted ? 1 : 0)];
                                TrainningBL.SendNotification(compId, userId, ConstantMessages.NotificationType.topic, "", ds.Tables[tableIndex + 1 + (moduleCompleted ? 1 : 0)].Rows[0]["Title"].ToString());
                            }
                        }
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("0", "No Records Found.");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetContentDetails")]
        [HttpPost]
        public IHttpActionResult GetContentDetails(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    int moduleId = Convert.ToInt32(requestParams["ModuleID"].ToString());
                    int contentId = Convert.ToInt32(requestParams["ContentID"].ToString());

                    List<Question> questionList = new List<Question>();
                    var ds = TrainningBL.GetContentDetails(compId, userId, topicId, moduleId, contentId, ref questionList);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        var questionJson = JsonConvert.SerializeObject(questionList);
                        var contents = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                        if (contents != "[]")
                            contents = contents.Substring(2, contents.Length - 4);
                        data = Utility.GetJSONData("1", "Successful", contents, questionJson,
                            Utility.ConvertDataSetToJSONString(ds.Tables[3]), Utility.ConvertDataSetToJSONString(ds.Tables[4]));
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("0", "No Records Found.");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex);
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/RateContent")]
        [HttpPost]
        public IHttpActionResult RateContent(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    int moduleId = Convert.ToInt32(requestParams["ModuleID"].ToString());
                    int contentId = Convert.ToInt32(requestParams["ContentID"].ToString());
                    string rating = requestParams["Rating"].ToString();
                    var ds = TrainningBL.RateContent(compId, userId, topicId, moduleId, contentId, rating, userId);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows[0]["StatusCode"].ToString() == "1")
                        {
                            // Successful
                            data = Utility.Successful("");
                        }
                        else
                        {
                            // Error. Check Logs
                            data = Utility.API_Status("1", "There might be some error. Please try again later");
                        }
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("1", "Unknown Error");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/SubmitAnswers")]
        [HttpPost]
        public IHttpActionResult SubmitAnswers(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    int surveyId = Convert.ToInt32(requestParams["SurveyID"].ToString());
                    int moduleId = Convert.ToInt32(requestParams["ModuleID"].ToString());
                    int contentId = Convert.ToInt32(requestParams["ContentID"].ToString());
                    var ds = TrainningBL.SubmitAnswers(compId, userId, surveyId, requestParams);
                    if (ds.Tables.Count > 0)
                    {
                        if (Convert.ToInt32(ds.Tables[0].Rows[0]["ResponseID"].ToString()) > 0)
                        {
                            List<Question> questionList = new List<Question>();
                            var dsContent = TrainningBL.GetContentDetails(compId, userId, topicId, moduleId, contentId, ref questionList);
                            var questionJson = JsonConvert.SerializeObject(questionList);
                            var contents = Utility.ConvertDataSetToJSONString(dsContent.Tables[0]);
                            contents = contents.Substring(2, contents.Length - 4);
                            data = Utility.GetJSONData("1", "Successful", contents, questionJson,
                                Utility.ConvertDataSetToJSONString(dsContent.Tables[3]), Utility.ConvertDataSetToJSONString(dsContent.Tables[4]));
                        }
                        else
                        {
                            // Error. Check Logs
                            data = Utility.API_Status("1", "There might be some error. Please try again later");
                        }
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("1", "Unknown Error");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetNotifications")]
        [HttpPost]
        public IHttpActionResult GetNotifications(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    var ds = TrainningBL.GetNotifications(compId, userId);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/UpdateNotification")]
        [HttpPost]
        public IHttpActionResult UpdateNotification(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    string type = Convert.ToString(requestParams["Type"]);
                    string notificationIds = Convert.ToString(requestParams["NotificationIDs"]);
                    string token = Convert.ToString(requestParams["Token"]);
                    var ds = TrainningBL.UpdateNotification(compId, userId, type, notificationIds, token);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetAchievementNGifts")]
        [HttpPost]
        public IHttpActionResult GetAchievementNGifts(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    List<Achievement> achievementList = new List<Achievement>();
                    var ds = TrainningBL.GetAchievementGifts(compId, userId, ref achievementList);
                    data = Utility.GetAchievementGiftsJSONFormat("1", "Success",
                        JsonConvert.SerializeObject(achievementList),
                        Utility.ConvertDataSetToJSONString(ds.Tables[2]));
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                //Added on 04 Jun 20 to preview add course without login
                if (Request.Headers.Contains("Authorization") && Request.Headers.GetValues("Authorization").First().ToUpper() == "Bearer".ToUpper())
                {
                    int compId = 0;
                    string userId = "0";
                    List<Achievement> achievementList = new List<Achievement>();
                    var ds = TrainningBL.GetAchievementGifts(compId, userId, ref achievementList);
                    data = Utility.GetAchievementGiftsJSONFormat("1", "Success",
                        JsonConvert.SerializeObject(achievementList),
                        Utility.ConvertDataSetToJSONString(ds.Tables[2]));
                }
                else
                {
                    data = Utility.AuthenticationError();
                }                    
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/IsUserOnline")]
        [HttpPost]
        public IHttpActionResult IsUserOnline(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    DateTime startDate = DateTime.Now;
                    DateTime endDate = DateTime.Now;
                    int totalTime = 0;
                    int type = Convert.ToInt32(requestParams["Type"].ToString());
                    if (type == 2)
                    {
                        startDate = Convert.ToDateTime(requestParams["StartDate"].ToString());
                        endDate = Convert.ToDateTime(requestParams["EndDate"].ToString());
                        totalTime = Convert.ToInt32(requestParams["TotalTime"].ToString());
                    }
                    var ds = TrainningBL.IsUserOnline(compId, userId, type, startDate, endDate, totalTime);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/RetakeTest")]
        [HttpPost]
        public IHttpActionResult RetakeTest(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    string surveyId = requestParams["SurveyID"].ToString();
                    var ds = TrainningBL.ClearAnswers(compId, userId, surveyId);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows[0]["StatusCode"].ToString() == "1")
                        {
                            // Successful
                            data = Utility.Successful("");
                        }
                        else
                        {
                            // Error. Check Logs
                            data = Utility.API_Status("1", "There might be some error. Please try again later");
                        }
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("0", "No Records Found.");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/AssignTopicsByEntity")]
        [HttpPost]
        public IHttpActionResult AssignTopicsByEntity(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    //string[] mailUserIDs = new string[] { };
                    List<string> mailUserIDs = new List<string>();
                    string userId = identity.UserID;
                    var topicIds = Convert.ToString(requestParams["TopicIds"].ToString());
                    var groupIds = Convert.ToString(requestParams["GroupIds"].ToString());
                    var userIds = Convert.ToString(requestParams["UserIds"].ToString());
                    var removeTopic = Convert.ToString(requestParams["RemoveTopics"].ToString());
                    var dueDate = DateTime.Now.AddYears(50);
                    if (!string.IsNullOrEmpty(Convert.ToString(requestParams["DueDate"])))
                        dueDate = Convert.ToDateTime(Convert.ToString(requestParams["DueDate"]));

                    if (!string.IsNullOrEmpty(userIds))
                    {
                        var dsTopics = TrainningBL.GetUserAssignedTopic(compId, userIds);

                        string[] arrTopics = topicIds.Split(',');
                        string[] arrUsers = userIds.Split(',');

                        //mailUserIDs = new string[arrUsers.Length];

                        if (dsTopics.Tables.Count > 0 && dsTopics.Tables[0].Rows.Count > 0)
                        {
                            for (int j = 0; j < arrUsers.Length; j++)
                            {
                                for (int i = 0; i < arrTopics.Length; i++)
                                {
                                    if (!dsTopics.Tables[0].Select().ToList().Exists(row => row["Topics"].ToString() == arrTopics[i] && row["UserID"].ToString() == arrUsers[j]))
                                    {
                                        mailUserIDs.Add(arrUsers[j]);
                                    }
                                }
                            }
                        }
                    }

                    var ds = TrainningBL.AssignTopicsByEntity(compId, userId, topicIds, groupIds, userIds, removeTopic, dueDate);
                    if (ds.Tables.Count > 0)
                    {
                        // Successful
                        data = Utility.Successful("");
                        if (mailUserIDs.Count() > 0)
                        {
                            mailUserIDs = mailUserIDs.Distinct().ToList();
                            foreach (string UserID in mailUserIDs)
                            {
                                EmailHelper.GetEmailContent(Convert.ToInt32(UserID), identity.CompId, EmailHelper.Functionality.ADD_TOPIC, "", "");
                            }
                        }
                    }
                    else
                    {
                        // Unknown Error
                        data = Utility.API_Status("1", "Unknown Error");
                    }
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/GetTableData")]
        [HttpPost]
        public IHttpActionResult GetTableData(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    string userId = identity.UserID;
                    var type = Convert.ToString(requestParams["Type"].ToString());
                    var valueType = Convert.ToString(requestParams["ValueType"]);
                    var valueId = Convert.ToString(requestParams["ValueID"]);
                    var ds = TrainningBL.GetTableDataByType(compId, type, valueType, valueId);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }


        [Route("API/Trainning/GetMsgNotifications")]
        [HttpPost]
        public IHttpActionResult GetMsgNotifications()
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                string Message = string.Empty;

                DataSet ds = TrainningBL.GetMsgNotifications(identity.CompId, identity.UserID.ToString(), 5);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                else
                {
                    data = Utility.API_Status("0", "No data found");
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }

        [Route("api/Trainning/ChangeTopicProperty")]
        [HttpPost]
        public IHttpActionResult ChangeTopicProperty(JObject requestParams)
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {
                try
                {
                    int compId = identity.CompId;
                    int userId = Convert.ToInt32(identity.UserID);
                    int type = Convert.ToInt32(requestParams["Type"].ToString());
                    int topicId = Convert.ToInt32(requestParams["TopicID"].ToString());
                    bool flag = Convert.ToBoolean(requestParams["Flag"].ToString());
                    var ds = TrainningBL.ChangeTopicProperty(compId, userId, topicId, type, flag);
                    data = Utility.ConvertDataSetToJSONString(ds.Tables[0]);
                    data = Utility.Successful(data);
                }
                catch (Exception ex)
                {
                    data = Utility.Exception(ex); ;
                }
            }
            else
            {
                data = Utility.AuthenticationError();
            }
            return new APIResult(Request, data);
        }


        [Route("API/Trainning/GetBadgesAndPoints")]
        [HttpPost]
        public IHttpActionResult GetBadgesAndPoints()
        {
            var data = "";
            var identity = MyAuthorizationServerProvider.AuthenticateUser();
            if (identity != null)
            {                
                DataSet dsBadges = TrainningBL.GetBadges(identity.CompId, identity.UserID.ToString(), Convert.ToInt32(ConstantMessages.Action.VIEW));
                DataSet dsPoints = TrainningBL.GetPoints(identity.CompId, identity.UserID.ToString(), Convert.ToInt32(ConstantMessages.Action.VIEW));

                DataTable dtBadges = new DataTable();
                DataTable dtPoints = new DataTable();
                DataSet ds = new DataSet();

                if (dsBadges.Tables[0].Rows.Count > 0)
                {
                    dtBadges = dsBadges.Tables[0].Copy();                                        
                }
                ds.Tables.Add(dtBadges);
                ds.Tables[0].TableName = "Badges";

                if (dsPoints.Tables[0].Rows.Count > 0)
                {
                    dtPoints = dsPoints.Tables[0].Copy();                    
                }
                ds.Tables.Add(dtPoints);
                ds.Tables[1].TableName = "Points";

                ds.Tables.Add(dsBadges.Tables[1].Copy());
                ds.Tables[2].TableName = "Rank";

                ds.Tables.Add(dsBadges.Tables[2].Copy());
                ds.Tables[3].TableName = "NextRank";

                data = Utility.ConvertDataSetToJSONString(ds);
                data = Utility.Successful(data);
            }
            else
            {
                //Added on 04 Jun 20 to preview add course without login
                if (Request.Headers.Contains("Authorization") && Request.Headers.GetValues("Authorization").First().ToUpper() == "Bearer".ToUpper())
                {
                    DataSet dsBadges = TrainningBL.GetBadges(0, "0", Convert.ToInt32(ConstantMessages.Action.VIEW));
                    DataSet dsPoints = TrainningBL.GetPoints(0, "0", Convert.ToInt32(ConstantMessages.Action.VIEW));

                    DataTable dtBadges = new DataTable();
                    DataTable dtPoints = new DataTable();
                    DataSet ds = new DataSet();

                    if (dsBadges.Tables[0].Rows.Count > 0)
                    {
                        dtBadges = dsBadges.Tables[0].Copy();
                    }
                    ds.Tables.Add(dtBadges);
                    ds.Tables[0].TableName = "Badges";

                    if (dsPoints.Tables[0].Rows.Count > 0)
                    {
                        dtPoints = dsPoints.Tables[0].Copy();
                    }
                    ds.Tables.Add(dtPoints);
                    ds.Tables[1].TableName = "Points";

                    ds.Tables.Add(dsBadges.Tables[1].Copy());
                    ds.Tables[2].TableName = "Rank";

                    ds.Tables.Add(dsBadges.Tables[2].Copy());
                    ds.Tables[3].TableName = "NextRank";

                    data = Utility.ConvertDataSetToJSONString(ds);
                    data = Utility.Successful(data);
                }//End
                else
                {
                    data = Utility.AuthenticationError();
                }                
            }
            return new APIResult(Request, data);
        }

    }
}
