﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _365_Portal.Code.BO
{
    public class TrainningBO
    {
    }
    public class AnswerOption
    {
        public int QuestionID { get; set; }
        public bool IsAnswered { get; set; }
        public int AnswerID { get; set; }
        public string AnswerText { get; set; }
        public int SortOrder { get; set; }
        public bool IsCorrect { get; set; }
        public double CorrectScore { get; set; }
        public double InCorrectScore { get; set; }
        public int Value_ID { get; set; }
        public bool IsSelected { get; set; }
        public string Value_Text { get; set; }
        public bool Value_IsCorrect { get; set; }
        public double Value_CorrectScore { get; set; }
        public double Value_InCorrectScore { get; set; }
        public string FilePath { get; set; }
    }

    public class Question
    {
        public int QuestionID { get; set; }
        public bool IsMultiSelectQuestion { get; set; }
        public string QType { get; set; }
        public string Type { get; set; }
        public int QuestionTypeID { get; set; }
        public bool IsMandatory { get; set; }
        public bool IsMultiLine { get; set; }
        public int MaxLength { get; set; }
        public string Title { get; set; }
        public int SortOrder { get; set; }
        public bool IsAnswered { get; set; }
        public bool IsCorrect { get; set; }
        public string ResponseID { get; set; }
        public double TotalScore { get; set; }
        public double ScoreEarned { get; set; }
        public double PercentageEarned { get; set; }
        public string IPAddress { get; set; }
        public string Value_Text { get; set; }
        public List<AnswerOption> AnswerOptions { get; set; }
    }
}