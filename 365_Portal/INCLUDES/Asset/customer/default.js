﻿var app = angular.module('MasterPage', ['ngSanitize']);

var allContents = [];

// CONTROLLER FUNCTIONS
app.controller("DefaultController", function ($scope, $rootScope, DataService, $sce) {

    var currentPage = document.location.href.match(/[^\/]+$/)[0].toLowerCase();
    objDs = DataService;

    if (currentPage.indexOf('courses.aspx') > -1) {
        if (userRole == "enduser")
            objDs.DS_GetUserTopics("", userRole);
        else
            objDs.DS_GetAllTopics("");
    }
    else if (currentPage.indexOf('default.aspx') > -1) {
        objDs.DS_GetUserTopics("", "");
    }

    $("#dvTopicContainer").hide();

    $scope.ActiveContainer = "Topic";
    $scope.NotificationText = "Notifications";
    $scope.ColorIndex = 1;

    $scope.SearchTopics = function () {
        objDs.DS_GetUserTopics($scope.SearchText, "");
    }

    $scope.trustAsHtml = function (html) {

        //var encodedStr = "&lt;p&gt;&lt;span style=&quot;color: #2dc26b;&quot;&gt;Cloud Compu&lt;/span&gt;&lt;em&gt;&lt;span style=&quot;color: #2dc26b;&quot;&gt;ting - 1&lt;/span&gt; Content Description Cloud Computing Content Des&lt;/em&gt;cription &lt;strong&gt;Cloud Computing Content Description&lt;/strong&gt; Cloud Computing&lt;/p&gt;";
        var encodedStr = html;
        var parser = new DOMParser;
        var dom = parser.parseFromString(
            '<!doctype html><body>' + encodedStr,
            'text/html');
        var decodedString = dom.body.textContent;

        return $sce.trustAsHtml(decodedString);
    }

    $scope.GetColorIndex = function (title) {
        var indx = parseInt($scope.ColorIndex);
        var claass = "";
        if (indx == 1)
            claass = "card shadow br-05 bl-1-5 bc-green mb-4";
        else if (indx == 2)
            claass = "card shadow br-05 bl-1-5 bc-red mb-4";
        else if (indx == 3)
            claass = "card shadow br-05 bl-1-5 bc-purple mb-4";
        else if (indx == 4) {
            claass = "card shadow br-05 bl-1-5 bc-orange mb-4";
            indx = 1;
        }
        $scope.ColorIndex = indx + 1;
        //alert(indx + ":" + claass);
        console.log(indx + ":" + claass);
        return claass;
    }

    $scope.GetTopImageByIndex = function () {
        indx = $scope.ColorIndex;
        var image = "";
        if (indx == 1)
            image = "../includes/Asset/images/mask-group-top-green.png";
        else if (indx == 2)
            image = "../includes/Asset/images/mask-group-top-red.png";
        else if (indx == 3)
            image = "../includes/Asset/images/mask-group-top-purple.png";
        else if (indx == 4)
            image = "../includes/Asset/images/mask-group-top-orange.png";
        return image;
    }

    $scope.GetBottomImageByIndex = function () {
        indx = $scope.ColorIndex;
        var image = "";
        if (indx == 1)
            image = "../includes/Asset/images/mask-group-bottom-green.png";
        else if (indx == 2)
            image = "../includes/Asset/images/mask-group-bottom-red.png";
        else if (indx == 3)
            image = "../includes/Asset/images/mask-group-bottom-purple.png";
        else if (indx == 4)
            image = "../includes/Asset/images/mask-group-bottom-orange.png";
        return image;
    }

    $scope.GetModulesByTopic = function (topicId, checkIfTopicAssigned) {
        $scope.SelectedTopic = $rootScope.Topics.filter(function (v) {
            return topicId == v.TopicId;
        })[0];
        objDs.DS_GetModulesByTopic(topicId, checkIfTopicAssigned);
        $scope.ActiveContainer = "Module";
    }

    $scope.GetContentsByModule = function (topicId, moduleId) {

        $scope.ActiveContainer = "Content";
        $scope.SelectedModule = $rootScope.Module.UnlockedItems.filter(function (v) {
            return moduleId == v.ModuleID;
        })[0];
        $scope.SelectedContent = { Title: "Learning Objectives", Description: $scope.SelectedModule.Overview };
        objDs.DS_GetContentsByModule(topicId, moduleId, true);
    }

    $scope.DisplayLearningObjectives = function (cntrl, title, learningObjective) {
        $scope.SelectedContent = { Title: title, Description: learningObjective };
        $(".list-group-item-action").removeClass("active");
        $(cntrl).addClass("active");
    }

    $scope.DisplayQuiz = function (topicId, moduleId, contentId, moduleName, type) {

    }

    $scope.ViewContent = function (cntrl, topicId, moduleId, contentId, moduleName, type) {
        $(".list-group-item-action").removeClass("active");
        $(cntrl).addClass("active");
        $scope.ContentGoBackText = "Back to contents";
        $scope.SelectedContent = $rootScope.Content.UnlockedItems.filter(function (v) {
            return contentId == v.ContentID;
        })[0];

        objDs.DS_GetContentDetails(topicId, moduleId, contentId);
        if (type.toLowerCase() == 'survey') {
          //  $scope.ActiveContainer = "ContentSurveyView";
        }
        else if (type.toLowerCase() == 'flashcard') {
           // $scope.BeginFlashcard();
        }
        else if (type.toLowerCase() == 'finalquiz') {
           // $scope.ActiveContainer = "ContentQuizView";
            $scope.SubContainer = "ContentQuizView";
        }
        else {
            // $scope.ActiveContainer = "ContentView";
            //Unlock Next Content
            objDs.DS_UpdateContent("Content", topicId, moduleId, contentId);
        }
    }

    // Module Completed...
    $scope.UpdateContent = function (type, topicId, moduleId, contentIddd) {
        objDs.DS_UpdateContent(type, topicId, moduleId, contentIddd);
        $scope.GetModulesByTopic(topicId, false);

        $scope.ActiveContainer = "Module";
    }

    $scope.FlashcardPreviousClicked = function (contentId, index, total) {
        if (index == 0) {
            $scope.ShowFlashcardIntro();
        }
        else {
            $scope.ShowFlashcardSlides();
            $scope.CurrIndex = index - 1;
        }
    }

    $scope.SkipFlashcard = function (topicId, moduleId, contentId) {
        //Unlock Next Content
        objDs.DS_UpdateContent("Flashcard", topicId, moduleId, contentId);
        var nextContent = NextItemContent(contentId);
        $scope.ViewContent(nextContent.TopicID, nextContent.ModuleID, nextContent.ContentID, nextContent.Title, nextContent.ContentType);
    }

    $scope.FlashcardNextClicked = function (contentId, index, total) {
        // Begin Flashcard Quiz or Next Card
        if ((index + 1) == total) {
            $scope.ShowFlashcardQuiz(contentId);
        }
        else {
            $scope.ShowFlashcardSlides();
            $scope.CurrIndex = index + 1;
        }
    }

    $scope.FlashcardQuestionPrevioustClicked = function (index, total) {
        if (index == 0) {
            $scope.ShowFlashcardSlides();
        }
        else {
            $scope.ShowFlashcardQuiz();
            $scope.CurrIndex = index - 1;
        }
    }

    $scope.FlashcardQuestionNextClicked = function (topicId, moduleId, contentId, index, total) {
        // Begin Final Quiz or Next Question
        if ((index + 1) == total) {
            $scope.ShowFinalQuizIntro(contentId);
            //Unlock Next Content
            objDs.DS_UpdateContent("Flashcard", topicId, moduleId, contentId);
        }
        else {
            $scope.ShowFlashcardQuiz();
            $scope.CurrIndex = index + 1;
        }
    }

    $scope.ShowFlashcardIntro = function (contentId) {
        $scope.ActiveContainer = "ContentFlashcardView";
        $scope.ActiveSubContainer = "FlashcardIntro";
        if (contentId != null && contentId != undefined) {
            var nextContent = NextItemContent(contentId);
            $scope.ViewContent(nextContent.TopicID, nextContent.ModuleID, nextContent.ContentID, nextContent.Title, nextContent.ContentType);
        }
    }

    $scope.BeginFlashcard = function () {
        $scope.ActiveContainer = "ContentFlashcardView";
        // $scope.ActiveSubContainer = "BeginFlashcard";
        $scope.ActiveSubContainer = "FlashcardIntro";
    }

    $scope.ShowFlashcardSlides = function () {
        $scope.ActiveContainer = "ContentFlashcardView";
        $scope.ActiveSubContainer = "FlashcardSlides";
        $scope.CurrIndex = 0;
    }

    $scope.GetSelectedValues = function (items) {
        var ids = "";
        for (var i = 0; i < items.length; i++) {
            if (items[i].IsSelected) {
                ids += items[i].AnswerID + ",";
            }
        }
        ids = ids.replace(/,\s*$/, "");
        return ids;
    }

    $scope.SubmitAnswers = function () {
        var cloneObj = $rootScope.SpecialContents;
        var questionList = [];

        var index = 0;
        var validationSuccess = true;
        var validationMsg = "<ul style='text-align: left'>Following fields cannot be left blank</br>";

        $.each(cloneObj.Questions, function (key, question) {
            if (question.Value_Text == '') {
                if ($scope.GetSelectedValues(question.AnswerOptions) == '') {
                    validationMsg += "<li>" + question.Title + "</li>";
                    validationSuccess = false;
                    index++;
                }
            }
            try {
                if (question.QuestionTypeID != '1') {
                    // Single Selection
                    questionList.push({
                        "QuestionID": question.QuestionID,
                        "AnswerIDs": question.Value_Text,
                        "Base64": question.FilePath,// Base64
                        "Value_Text": question.QuestionTypeID == '8' ? question.Value_Text : question.Value_Text
                    });
                }
                else {
                    //Multiple Selection
                    questionList.push({
                        "QuestionID": question.QuestionID,
                        "AnswerIDs": $scope.GetSelectedValues(question.AnswerOptions),
                        "Base64": question.FilePath,// Base64
                        "Value_Text": question.Value_Text
                    });
                }
            }
            catch (ex) { }
        });
        validationMsg += "</ul>";

        if (validationSuccess == false) {
            Swal.fire({
                title: 'Failure',
                icon: 'error',
                html: validationMsg,
                showConfirmButton: true,
                showCloseButton: true
            });
        }
        else {
            var requestParams = {
                TopicID: cloneObj.TopicID
                , ModuleID: cloneObj.ModuleID
                , ContentID: cloneObj.ContentID
                , SurveyID: cloneObj.SurveyID
                , ContentType: cloneObj.Type
                , Questions: questionList
            };
            objDs.DS_SubmitAnswers(requestParams);
        }
    }

    $scope.RetakeTest = function (topicId, moduleId, contentId, surveyId) {
        objDs.DS_RetakeTest(topicId, moduleId, contentId, surveyId);
    }

    $scope.ChangeTopicProperty = function (objTopic, type, topicId, flag) {
        if (type == 1)
            objTopic.IsFavourite = flag;
        else if (type == 2)
            objTopic.IsArchieved = flag;
        else if (type == 3)
            objTopic.IsBookmark = flag;
        else if (type == 4)
            objTopic.IsDeleted = flag;

        objDs.DS_ChangeTopicProperty(type, topicId, flag);
    }

    $scope.GetFormattedDate = function (date) {
        //return date.split("/").reverse().join("-");
        var dateParts = date.split("-");
        date = format(dateParts[1]) + "-" + format(dateParts[0]) + "-" + format(dateParts[2]);
        var todayTime = new Date(date);
        return todayTime;
        //var month = format(todayTime.getMonth() + 1);
        //var day = format(todayTime.getDate());
        //var year = format(todayTime.getFullYear());
        //return day + "-" + month + "-" + year;
    }

    $scope.ShowFlashcardQuiz = function (contentId) {
        $scope.ActiveContainer = "ContentFlashcardView";
        $scope.ActiveSubContainer = "FlashcardQuiz";
        $scope.CurrIndex = 0;
        //if (contentId != null && contentId != undefined) {
        //    var nextContent = NextItemContent(contentId);
        //    $scope.ViewContent(nextContent.TopicID, nextContent.ModuleID, nextContent.ContentID, nextContent.Title, nextContent.ContentType);
        //}
    }

    $scope.ShowFinalQuizIntro = function (contentId) {
        $scope.ActiveContainer = "ContentQuizView";
        if (contentId != null && contentId != undefined) {
            var nextContent = NextItemContent(contentId);
            $scope.ViewContent(nextContent.TopicID, nextContent.ModuleID, nextContent.ContentID, nextContent.Title, nextContent.ContentType);
        }
    }

    $scope.GoBack = function (prevPage) {
        //if (prevPage == "Module") {
        //    lockLessonFirstTime = true;
        //    unlockLessonFirstTime = true;
        //}
        //else if (prevPage == "Topic") {

        //}


        $scope.ActiveContainer = prevPage;
        if (prevPage == 'Content')
            $("#dvVideoRating").hide();
        if (prevPage == 'Topic') {
            $("#dvTopicContainer").show();
        } if (prevPage == 'Content') {
            $('#videoControl').removeClass('d-none');
            $('#videoControl').hide();
        }
        if (prevPage == "Module") {
            $("#dvModuleContainer").show();
        }
    }

    $scope.RateVideo = function (topicId, moduleId, contentId, rating) {
        //Save Rating
        $("#dvVideoRating").hide();
        objDs.DS_RateContent(topicId, moduleId, contentId, rating);
        $scope.GoBack('Content');
    }

    $scope.NextContent = function (contentId) {
        $("#divVideo").html("");
        var nextContent = NextItemContent(contentId);
        $scope.ViewContent(nextContent.TopicID, nextContent.ModuleID, nextContent.ContentID, nextContent.Title, nextContent.ContentType);
    }

    $scope.GetTopicTime = function (timeHrsMin) {
        if (timeHrsMin == null)
            return "0 hr 0m";
        var arrHrsMins = timeHrsMin.split(':');
        if (arrHrsMins.length == 1) {
            return arrHrsMins[0] + " hr";
        }
        else if (arrHrsMins.length == 2) {
            if (parseInt(arrHrsMins[0]) > 0)
                return arrHrsMins[0] + " hr " + arrHrsMins[1] + " m";
            else
                return arrHrsMins[1] + " m";
        }
        else {
            return "";
        }
    }

    $scope.GetCompletedPercentage = function (completed, total) {
        return parseInt((completed / total) * 100) + '%'
    }

    $scope.EditTopic = function (topicId) {
        window.location.href = 'LearningJourney.aspx?topic=' + topicId;
    }
});

//COMMON SERVICE OPERATIONS
app.service("DataService", function ($http, $rootScope, $compile) {
    var ds = this;

    ds.DS_GetAllTopics = function (searchText) {
        ShowLoader();
        var requestParams = { TopicID: "", TopicTitle: "", TopicDescription: "", IsPublished: "", SrNo: "", MinUnlockedModules: "", UserID: "", IsActive: "" };
        $http({
            method: "POST",
            url: "../API/Content/GetTopics",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: JSON.stringify(requestParams),

        }).then(function success(response) {
            HideLoader();
            var responseData = response.data;
            $rootScope.AllTopics = responseData.Data;

            $rootScope.GlobalTopics = $rootScope.AllTopics.filter(function (v) {
                return v.Accessibility == "1";
            });

            $rootScope.PublishedTopics = $rootScope.AllTopics.filter(function (v) {
                return v.IsPublished == "1";
            });

            $rootScope.AssignedTopics = $rootScope.AllTopics.filter(function (v) {
                return v.Accessibility == "3";
            });

            $rootScope.DraftTopics = $rootScope.AllTopics.filter(function (v) {
                return v.IsPublished == "0";
            });


        });
    }

    ds.DS_GetUserTopics = function (searchText, userRole) {
        ShowLoader();
        var requestParams = { SearchText: searchText };
        $http({
            method: "POST",
            url: "../api/Trainning/GetTopicsByUser",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: JSON.stringify(requestParams),

        }).then(function success(response) {
            HideLoader();
            $("#dvTopicContainer").show();
            var responseData = response.data;
            $rootScope.InProgressTopics = responseData.Data.Data; // In Progress Courses
            if ($rootScope.InProgressTopics.length == 0) {
                $("#dvInProgressTitle").hide();
                $("#dvInProgressTopics").hide();
            }
            else {
                $("#dvInProgressTitle").show();
                $("#dvInProgressTopics").show();
            }

            $rootScope.MyCourses = responseData.Data.Data1; // My Courses except in-complete courses..
            if ($rootScope.MyCourses.length == 0) {
                $("#dvMyTopicsTitle").hide();
                $("#dvMyTopics").hide();
            }
            else {
                $("#dvMyTopicsTitle").show();
                $("#dvMyTopics").show();
            }

            $rootScope.RecommendedCourses = responseData.Data.Data2; // Recommended Courses
            if ($rootScope.RecommendedCourses.length == 0) {
                $("#dvRecommendedTopicsTitle").hide();
                $("#dvRecommendedTopics").hide();
            }
            else {
                $("#dvRecommendedTopicsTitle").show();
                $("#dvRecommendedTopics").show();
            }


            $rootScope.LatestCourses = responseData.Data.Data3; // Latest Courses
            if ($rootScope.LatestCourses.length == 0) {
                $("#dvLatestTopicsTitle").hide();
                $("#dvLatestTopics").hide();
            }
            else {
                $("#dvLatestTopicsTitle").show();
                $("#dvLatestTopics").show();
            }

            $rootScope.PopularCourses = responseData.Data.Data4; // Popular Courses
            if ($rootScope.PopularCourses.length == 0) {
                $("#dvPopularTopicsTitle").hide();
                $("#dvPopularTopics").hide();
            }
            else {
                $("#dvPopularTopicsTitle").show();
                $("#dvPopularTopics").show();
            }

            var allTopics = [];
            $.merge(allTopics, $rootScope.InProgressTopics);
            $.merge(allTopics, $rootScope.MyCourses);
            $.merge(allTopics, $rootScope.RecommendedCourses);
            $.merge(allTopics, $rootScope.LatestCourses);
            $.merge(allTopics, $rootScope.PopularCourses);

            if (userRole == "enduser") {
                $rootScope.AllTopics = allTopics;
                angular.forEach(jsonObject, function (value, key) {
                    value.CanEdit = 0;
                });
            }
            else
                $rootScope.Topics = allTopics;

            $rootScope.$apply();

            //$rootScope.Topics = ds.DS_SetClasses(responseData.Data);
        });
    }

    ds.DS_SetClasses = function (jsonObject) {
        var indx = 1;
        angular.forEach(jsonObject, function (value, key) {
            var classs = ""; var topClass = ""; var bottomClass = "";
            if (indx == 1) {
                classs = "card shadow br-05 bl-1-5 bc-green mb-4";
                topClass = "../includes/Asset/images/mask-group-top-green.png";
                bottomClass = "../includes/Asset/images/mask-group-bottom-green.png";
            }
            else if (indx == 2) {
                classs = "card shadow br-05 bl-1-5 bc-red mb-4";
                topClass = "../includes/Asset/images/mask-group-top-red.png";
                bottomClass = "../includes/Asset/images/mask-group-bottom-red.png";
            }
            else if (indx == 3) {
                classs = "card shadow br-05 bl-1-5 bc-purple mb-4";
                topClass = "../includes/Asset/images/mask-group-top-purple.png";
                bottomClass = "../includes/Asset/images/mask-group-bottom-purple.png";
            }
            else if (indx == 4) {
                classs = "card shadow br-05 bl-1-5 bc-orange mb-4";
                topClass = "../includes/Asset/images/mask-group-top-orange.png";
                bottomClass = "../includes/Asset/images/mask-group-bottom-orange.png";
                indx = 0;
            }
            indx++;
            value.Class = classs;
            value.TopClass = topClass;
            value.BottomClass = bottomClass;
        });
        return jsonObject;
    }

    ds.DS_GetModulesByTopic = function (topicId, checkIfTopicAssigned) {
        ShowLoader();
        var requestParams = { TopicID: topicId, CheckIfTopicAssigned: checkIfTopicAssigned };
        $http({
            method: "POST",
            url: "../api/Trainning/GetModulesByTopic",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            HideLoader();
            var responseData = response.data;
            responseData.TopicTags = ds.DS_SetClasses(responseData.LockedItems);
            responseData.UnlockedItems = ds.DS_SetClasses(responseData.UnlockedItems);
            $rootScope.Module = responseData;
        });
    }

    ds.DS_GetContentsByModule = function (topicId, moduleId, displayLoader) {
        if (displayLoader == true)
            ShowLoader();
        var requestParams = { TopicID: topicId, ModuleID: moduleId, IsGift: 0 };
        $http({
            method: "POST",
            url: "../api/Trainning/GetContentsByModule",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            HideLoader();
            var responseData = response.data;
            $rootScope.Content = responseData;
            allContents = [];
            //allContents = responseData.UnlockedItems;
            //allContents = $.merge(allContents, responseData.LockedItems);
            $.merge(allContents, responseData.UnlockedItems);
            $.merge(allContents, responseData.LockedItems);
            //var newAllContents = $.extend(true, {}, responseData.UnlockedItems, responseData.LockedItems);
            //allContents = newAllContents;
        });
    }

    ds.DS_GetContentDetails = function (topicId, moduleId, contentId) {
        ShowLoader();
        var requestParams = { TopicID: topicId, ModuleID: moduleId, ContentID: contentId };
        $http({
            method: "POST",
            url: "../api/Trainning/GetContentDetails",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            HideLoader();
            var responseData = response.data;
            $rootScope.SpecialContents = responseData;
            if ($rootScope.SpecialContents.Type == 'CONTENT') {
                if ($rootScope.SpecialContents.DocType == 'VIDEO') {
                    if ($rootScope.SpecialContents.FilePath.toLowerCase().includes("youtube.com")) {
                        //$("#divVideo").html('<iframe id="ik_player" class="section-video-main" height="100%" width="100%" src="https://www.youtube.com/embed/GYnwqxKOm0Y?enablejsapi=1"></iframe>');
                        $("#divVideo").html('<iframe id="ik_player" class="section-video-main" height="100%" width="100%" src="' + $rootScope.SpecialContents.FilePath + '"></iframe>');
                        onYouTubeIframeAPIReady();
                    }
                    else {
                        $("#divVideo").html('<video id="vdVideoPlayer" onclick="VideoClicked(this)" onpause="VideoPaused(this)" class="section-video-main" autobuffer="" controls="" height="100%" width="100%">' +
                            '<source id="dvVideoPlayer" src="' + $rootScope.SpecialContents.FilePath + '" type="video/mp4">' +
                            '</video>');
                        document.getElementById('vdVideoPlayer').addEventListener('ended', VideoFinished, false);
                    }
                    $('#videoControl').show();
                }
                else if ($rootScope.SpecialContents.DocType == 'PDF') {
                    $("#divPDF").html('<embed id="dvPDFViewer" src="' + $rootScope.SpecialContents.FilePath + '" width="760" height="800"/>');
                }
            }
        });

        // Call this to retrieve locked/unlocked contents.
        //DS_GetContentsByModule();
    }

    ds.DS_UpdateContent = function (type, topicId, moduleId, contentId) {
        var requestParams = { TopicID: topicId, ModuleID: moduleId, ContentID: contentId };
        $http({
            method: "POST",
            url: "../api/Trainning/UpdateContent",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            var responseData = response.data;
            //ds.DS_GetContentsByModule(topicId, moduleId, false);

            if (responseData.IsGift == true) {
                $rootScope.UnlockGiftData = responseData.Data[0];
                $('#modalPersonalGift').modal('show');
            }
        });
    }

    ds.DS_RateContent = function (topicId, moduleId, contentId, rating) {
        var requestParams = { TopicID: topicId, ModuleID: moduleId, ContentID: contentId, Rating: rating };
        $http({
            method: "POST",
            url: "../api/Trainning/RateContent",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            var responseData = response.data;
        });
    }

    ds.DS_SubmitAnswers = function (requestParams) {
        ShowLoader();
        $http({
            method: "POST",
            url: "../api/Trainning/SubmitAnswers",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            var responseData = response.data;
            if (requestParams.ContentType == "SURVEY") {
                // Unlock Flashcard
                Swal.fire({
                    title: 'Success',
                    icon: 'success',
                    html: "Survey submitted successfully.",
                    showConfirmButton: true,
                    showCloseButton: true
                });
                $rootScope.SpecialContents.IsAnswered = 1;
                ds.DS_UpdateContent("Survey", requestParams.TopicID, requestParams.ModuleID, requestParams.ContentID);
                //ds.DS_GetContentDetails(requestParams.TopicID, requestParams.ModuleID, NextItemContentID(requestParams.ContentID));
                HideLoader();
            }
            else if (requestParams.ContentType == "FLASHCARD") {
                // Nothing to do
                HideLoader();
            }
            else if (requestParams.ContentType == "FINALQUIZ") {
                //To see answers
                ds.DS_GetContentDetails(requestParams.TopicID, requestParams.ModuleID, requestParams.ContentID);

                var strMsg = "You have earned " + responseData.ScoreEarned + " marks out of " + responseData.TotalScore;
                if (responseData.IsPassed == "0") {
                    strMsg += "<br/> You have not passed this test, need  more marks in order to complete this module. Take the test again. ";

                    Swal.fire({
                        title: 'Failure',
                        icon: 'error',
                        html: strMsg,
                        showConfirmButton: true,
                        showCloseButton: true
                    });
                }
                else {

                    Swal.fire({
                        title: 'Success',
                        icon: 'success',
                        html: strMsg,
                        showConfirmButton: true,
                        showCloseButton: true
                    });
                }
                HideLoader();
            }
        });
    }

    ds.DS_RetakeTest = function (topicId, moduleId, contentId, surveyId) {
        ShowLoader();
        var requestParams = { SurveyID: surveyId };
        $http({
            method: "POST",
            url: "../api/Trainning/RetakeTest",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            var responseData = response.data;
            ds.DS_GetContentDetails(topicId, moduleId, contentId);
            HideLoader();
        });
    }

    ds.DS_ChangeTopicProperty = function (type, topicId, flag) {
        //ShowLoader();
        var requestParams = { Type: type, TopicID: topicId, Flag: flag };
        $http({
            method: "POST",
            url: "../api/Trainning/ChangeTopicProperty",
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "Authorization": "Bearer " + accessToken
            },
            data: requestParams,
        }).then(function success(response) {
            var responseData = response.data;
            //alert("Success");
            //  HideLoader();
        });
    }
});

app.directive('myPostRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            // iteration is complete, do whatever post-processing
            // is necessary
            $('select.select2').select2({
                placeholder: "Select a option",
                allowClear: true
            });

            bsCustomFileInput.init()

            $('.date').datepicker({ uiLibrary: 'bootstrap4', format: 'yyyy-dd-mm' });

            $('.custom-range').on('change', function () {
                $('label[for=' + this.id + ']').text('Value : ' + $(this).val());
            });
        }
    };
});

app.directive('inprogressTopicRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            //alert("called");
            InitSlickSlider('#dvInProgressTopics');
        }
    };
});

app.directive('myTopicRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            // alert("my topic");
            //InitSlickSlider('.content');
            InitSlickSlider('#dvMyTopics');
        }
    };
});

app.directive('recommendedTopicRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            InitSlickSlider('#dvRecommendedTopics');
        }
    };
});

app.directive('latestTopicRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            InitSlickSlider('#dvLatestTopics');
        }
    };
});

app.directive('popularTopicRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            InitSlickSlider('#dvPopularTopics');
        }
    };
});

var unlockLessonFirstTime = true;
var unlockLessonCount = 1;
app.directive('myUnlocklessonRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            if (unlockLessonFirstTime || unlockLessonCount == 2) {
                InitSlickSlider('#dvUnlockedLessons');
                unlockLessonFirstTime = false;
                unlockLessonCount = 1;
                $("#dvModuleContainer").show();
            }
            else {
                unlockLessonCount = 2;
            }
        }
    };
});

var lockLessonFirstTime = true;
var lockLessonCount = 1;
app.directive('myLockedlessonRepeatDirective', function () {
    return function (scope, element, attrs) {
        if (scope.$last) {
            if (lockLessonFirstTime || lockLessonCount == 2) {
                InitSlickSlider('#dvLockedLessons');
                lockLessonFirstTime = false;
                lockLessonCount = 1;
                $("#dvModuleContainer").show();
            }
            else {
                lockLessonCount = 2;
            }
        }
    };
});

//app.directive('contentRepeatDirective', function () {
//    return function (scope, element, attrs) {
//        if (scope.$last) {
//            //alert("abc");
//            // InitSlickSlider('#dvTopics');
//            InitSlickSlider('.content');
//        }
//    };
//});

function NextItemContent(contentid) {
    var contId = {};
    $.each(allContents, function (key, content) {
        if (content.ContentID == parseInt(contentid)) {
            contId = allContents[parseInt(key) + 1];
            return false;
        }
    });
    return contId;
}

function NextItemContentID(contentid) {
    var contId = 0;
    $.each(allContents, function (key, content) {
        if (content.ContentID == contentid) {
            contId = allContents[parseInt(key) + 1].ContentID;
            return false;
        }
    });
    return contId;
}

function LoadData() {
    var formdata = new FormData();
    formdata.append('PageSize', "10000");
    formdata.append('PageNumber', "1");

    $.ajax({
        "dataType": 'json',
        //headers: { "Authorization": "Bearer " + gbl_accessToken },
        "type": "POST",
        "contentType": false,
        "processData": false,
        "url": "../api/Topic/GetUserTopicsasd",
        "data": formdata,
        beforeSend: function () {
            //$(ctrl).parent().append('<div class="loading-small" style="position: fixed;top: 36%;right: 50%;"></div>')
        },
        complete: function () {
            //$('.loading-small').remove();
            // alert("Completed..");
        },
        "success": function (json) {
            try {
                var dataset = JSON.parse(json);
                $("#tblData").append("<tr><th>ID</th><th>Name</th><th>Address</th><th>MobileNo</th></tr>");
                $.each(dataset, function (key, value) {
                    $("#tblData").append("<tr><td>" + value.ID + "</td><td>" + value.Name + "</td><td>" + value.Address + "</td><td>" + value.MobileNo + "</td></tr>");
                });
            }
            catch (err) {
                alert(err);
                $('.loading-small').remove();
            }
        },
        error: function (xhr, textStatus, error) {
            $('.loading-small').remove();
            alert("error thrown..");
            if (typeof console == "object") {
                console.log(xhr.status + "," + xhr.responseText + "," + textStatus + "," + error);
            }
        }
    });
}
