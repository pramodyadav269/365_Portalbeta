﻿using _365_Portal.Code.DAL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using _365_Portal.Code.BO;

namespace _365_Portal.Code.BL
{
    public class TrainningBL
    {
        public static void Log(Exception ex, string methodName)
        {
            Logger.Log(ex, "TrainningBL", methodName);
        }

        public static DataSet GetTopics(int CompID, string UserID)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.GetTopics(CompID, UserID);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet GetTopicsByUser(int CompID, string UserID)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.GetTopicsByUser(CompID, UserID);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet GetModulesByTopic(int CompID, string UserID, int TopicID)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.GetModulesByTopic(CompID, UserID, TopicID);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet GetContentsByModule(int CompID, string UserID, int TopicID, int ModuleID)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.GetContentsByModule(CompID, UserID, TopicID, ModuleID);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet GetContentDetails(int CompID, string UserID, int TopicID, int ModuleID, int ContentID, ref List<Question> questionList)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.GetContentDetails(CompID, UserID, TopicID, ModuleID, ContentID);

                // Table 0: Content Information
                // Table 1: Questions
                // Table 2: Answer Options
                // Table 3: Flashcards Intro 
                // Table 3: Flashcards     

                questionList = new List<Question>();
                questionList = (from DataRow dr in ds.Tables[1].Rows
                                select new Question()
                                {
                                    QuestionID = Convert.ToInt32(dr["QuestionID"]),
                                    IsMultiSelectQuestion = !string.IsNullOrEmpty(dr["IsMultiSelectQuestion"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsMultiSelectQuestion"].ToString())) : true,
                                    QType = dr["QType"].ToString(),
                                    Type = dr["Type"].ToString(),
                                    QuestionTypeID = Convert.ToInt32(dr["QuestionTypeID"].ToString()),
                                    IsMandatory = !string.IsNullOrEmpty(dr["IsMandatory"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsMandatory"].ToString())) : true,
                                    IsMultiLine = !string.IsNullOrEmpty(dr["IsMultiLine"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsMultiLine"].ToString())) : false,
                                    MaxLength = !string.IsNullOrEmpty(dr["MaxLength"].ToString()) ? Convert.ToInt32(dr["MaxLength"].ToString()) : 0,
                                    Title = dr["Title"].ToString(),
                                    SortOrder = Convert.ToInt32(dr["SortOrder"].ToString()),
                                    IsAnswered = !string.IsNullOrEmpty(dr["IsAnswered"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsAnswered"].ToString())) : false,
                                    ResponseID = dr["ResponseID"].ToString(),
                                    TotalScore = !string.IsNullOrEmpty(dr["TotalScore"].ToString()) ? Convert.ToDouble(dr["TotalScore"].ToString()) : 0,
                                    ScoreEarned = !string.IsNullOrEmpty(dr["ScoreEarned"].ToString()) ? Convert.ToDouble(dr["ScoreEarned"].ToString()) : 0,
                                    PercentageEarned = !string.IsNullOrEmpty(dr["PercentageEarned"].ToString()) ? Convert.ToDouble(dr["PercentageEarned"].ToString()) : 0,
                                    IPAddress = dr["IPAddress"].ToString()
                                }).ToList();

                List<AnswerOption> ansOptionList = new List<AnswerOption>();
                ansOptionList = (from DataRow dr in ds.Tables[2].Rows
                                 select new AnswerOption()
                                 {
                                     QuestionID = !string.IsNullOrEmpty(dr["QuestionID"].ToString()) ? Convert.ToInt32(dr["QuestionID"].ToString()) : 0,
                                     IsAnswered = !string.IsNullOrEmpty(dr["IsAnswered"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsAnswered"].ToString())) : false,
                                     AnswerID = !string.IsNullOrEmpty(dr["AnswerID"].ToString()) ? Convert.ToInt32(dr["AnswerID"].ToString()) : 0,
                                     AnswerText = dr["AnswerText"].ToString(),
                                     SortOrder = !string.IsNullOrEmpty(dr["SortOrder"].ToString()) ? Convert.ToInt32(dr["SortOrder"].ToString()) : 0,
                                     IsCorrect = !string.IsNullOrEmpty(dr["IsCorrect"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["IsCorrect"].ToString())) : false,
                                     CorrectScore = !string.IsNullOrEmpty(dr["CorrectScore"].ToString()) ? Convert.ToDouble(dr["CorrectScore"].ToString()) : 0,
                                     InCorrectScore = !string.IsNullOrEmpty(dr["InCorrectScore"].ToString()) ? Convert.ToDouble(dr["InCorrectScore"].ToString()) : 0,
                                     Value_ID = !string.IsNullOrEmpty(dr["Value_ID"].ToString()) ? Convert.ToInt32(dr["Value_ID"].ToString()) : 0,
                                     Value_Text = dr["Value_Text"].ToString(),
                                     Value_IsCorrect = !string.IsNullOrEmpty(dr["Value_IsCorrect"].ToString()) ? Convert.ToBoolean(Convert.ToInt32(dr["Value_IsCorrect"].ToString())) : false,
                                     Value_CorrectScore = !string.IsNullOrEmpty(dr["Value_CorrectScore"].ToString()) ? Convert.ToDouble(dr["Value_CorrectScore"].ToString()) : 0,
                                     Value_InCorrectScore = !string.IsNullOrEmpty(dr["Value_InCorrectScore"].ToString()) ? Convert.ToDouble(dr["Value_InCorrectScore"].ToString()) : 0,
                                     FilePath = dr["FilePath"].ToString()
                                 }).ToList();
                foreach (var question in questionList)
                {
                    List<AnswerOption> ansOptions = new List<AnswerOption>();
                    question.AnswerOptions = ansOptionList.Where(p => p.QuestionID == question.QuestionID).ToList();
                }
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet UpdateContent(int CompID, string UserID, int TopicID, int ModuleID, int ContentID)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.UpdateContent(CompID, UserID, TopicID, ModuleID, ContentID);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet RateContent(int CompID, string UserID, int TopicID, int ModuleID, int ContentID, string Rating, string CreatedBy)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = TrainningDAL.RateContent(CompID, UserID, TopicID, ModuleID, ContentID, Rating, CreatedBy);
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }

        public static DataSet SubmitAnswers(int compId, string userId, int surveyId, JObject responseDetail)
        {
            DataSet ds = new DataSet();
            try
            {
                List<Question> questionAnswerList = new List<Question>();
                var dataSet = GetContentDetails(compId, userId, Convert.ToInt32(responseDetail["TopicID"]),
                     Convert.ToInt32(responseDetail["ModuleID"]), Convert.ToInt32(responseDetail["ContentID"]), ref questionAnswerList);

                double totalScore = 0;
                if (Convert.ToString(responseDetail["ContentType"]) != "SURVEY")
                {
                    totalScore = Convert.ToDouble(dataSet.Tables[0].Rows[0]["TotalScore"].ToString());
                }
                double scoreEarned = 0, percentageEarned = 0;
                List<AnswerOption> lstAnswers = new List<AnswerOption>();


                // Flashcard & Final Quiz
                for (int i = 0; i < responseDetail["Questions"].Count(); i++)
                {
                    bool isCorrect = false;
                    double correctScore = 0;
                    double inCorrectScore = 0;
                    var questionid = Convert.ToInt32(responseDetail["Questions"][i]["QuestionID"]);
                    var answerIds = Convert.ToString(responseDetail["Questions"][i]["AnswerIDs"]);
                    var value_text = Convert.ToString(responseDetail["Questions"][i]["Value_Text"]);

                    var answer = questionAnswerList.SingleOrDefault(p => p.QuestionID == questionid);
                    if (answer != null)
                    {
                        // Single Select
                        if (answer.QuestionTypeID == 2 || answer.QuestionTypeID == 3)
                        {
                            var correctAnswer = answer.AnswerOptions.SingleOrDefault(p => p.AnswerID == Convert.ToInt32(answerIds));
                            if (correctAnswer != null)
                            {
                                if (correctAnswer.IsCorrect)
                                {
                                    // Correct Answer
                                    correctScore = correctAnswer.CorrectScore;
                                    isCorrect = true;
                                }
                                else
                                {
                                    // Incorrect Answer
                                    inCorrectScore = correctAnswer.InCorrectScore;
                                    isCorrect = false;
                                }
                                AnswerOption ansOption = new AnswerOption();
                                ansOption.QuestionID = questionid;
                                ansOption.Value_Text = value_text;
                                ansOption.AnswerID = correctAnswer.AnswerID;
                                ansOption.IsCorrect = isCorrect;
                                ansOption.CorrectScore = correctAnswer.CorrectScore;
                                ansOption.InCorrectScore = correctAnswer.InCorrectScore;
                                lstAnswers.Add(ansOption);
                            }
                        }
                        // Multiple Select
                        else if (answer.QuestionTypeID == 1)
                        {
                            var selectedAnswerIds = answerIds.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                            var allAnswers = answer.AnswerOptions;
                            foreach (var answerOption in allAnswers)
                            {
                                if (selectedAnswerIds.Contains(answerOption.AnswerID.ToString()))
                                {
                                    if (answerOption.IsCorrect)
                                    {
                                        // Correct Answer
                                        correctScore += answerOption.CorrectScore;
                                        isCorrect = true;
                                    }
                                    else
                                    {
                                        // Incorrect Answer
                                        inCorrectScore += answerOption.InCorrectScore;
                                        isCorrect = false;
                                    }
                                    AnswerOption ansOption = new AnswerOption();
                                    ansOption.QuestionID = questionid;
                                    ansOption.Value_Text = value_text;
                                    ansOption.AnswerID = answerOption.AnswerID;
                                    ansOption.IsCorrect = isCorrect;
                                    ansOption.CorrectScore = answerOption.CorrectScore;
                                    ansOption.InCorrectScore = answerOption.InCorrectScore;
                                    lstAnswers.Add(ansOption);
                                }
                            }
                        }
                        else
                        {
                            AnswerOption ansOption = new AnswerOption();
                            ansOption.QuestionID = questionid;
                            ansOption.Value_Text = value_text;
                            lstAnswers.Add(ansOption);
                        }
                    }
                    scoreEarned += correctScore - inCorrectScore;
                }

                percentageEarned = (scoreEarned / (totalScore == 0 ? 1 : totalScore)) * 100;

                //Submit response in DB
                ds = TrainningDAL.SubmitResponse(compId, userId, surveyId, totalScore, scoreEarned, percentageEarned, Utility.GetClientIPaddress());

                if (ds.Tables.Count > 0)
                {
                    // Call SubmitAnswers
                    var fileId = 0;
                    var responseId = Convert.ToInt32(ds.Tables[0].Rows[0]["ResponseID"]);
                    foreach (var answer in lstAnswers)
                    {
                        TrainningDAL.SubmitAnswers(compId, userId, surveyId, responseId, answer.QuestionID, answer.AnswerID, fileId,
                            answer.Value_Text, answer.IsCorrect, answer.CorrectScore, answer.InCorrectScore, "");
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex, System.Reflection.MethodBase.GetCurrentMethod().Name);
            }
            return ds;
        }
    }
}