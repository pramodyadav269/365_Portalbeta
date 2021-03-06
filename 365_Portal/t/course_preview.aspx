﻿<%@ Page Title="365" Language="C#" MasterPageFile="~/t/enduser.Master" AutoEventWireup="true" CodeBehind="course_preview.aspx.cs" Inherits="Life.course_preview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular-sanitize.js"></script>

    <script src="https://www.youtube.com/iframe_api"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="theme-section" ng-if="ActiveContainer =='Topic'">
        <img src="../INCLUDES/Asset/images/theme_nature_header.svg" style="display: none;" />
        <h4 class="nature" id="dvUserName" style="display: none;" runat="server">Welcome User! Let's learn something new today :)</h4>
    </div>

    <%-- beta view lesson start --%>
    <div class="dashboard">

        <section id="dvModuleContainer" class="course-wrapper" ng-if="ActiveContainer =='Module'">
            <div class="card text-white bg-dark-blue course-header">
                <img src="../INCLUDES/Asset/images/course-preview.png" class="img-preview" />
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-7 col-lg-8 mb-2">
                            <a class="back c-yellow" ng-show="IsLoggedIn != 'false'" ng-click="GoBack('Topic')"><i class="fas fa-arrow-left"></i>Back to Courses</a>
                        </div>
                        <div class="col-sm-12 col-md-7 col-lg-8">
                            <h2 class="card-title" ng-bind-html="trustAsHtml(SelectedTopic.Title)"></h2>
                            <p class="card-text" ng-bind-html="trustAsHtml(SelectedTopic.Description)"></p>
                            <div class="action" ng-show="IsLoggedIn != 'false'">
                                <span ng-show="SelectedTopic.IsFavourite ==1" ng-click="ChangeTopicProperty(SelectedTopic,1,SelectedTopic.TopicId,!SelectedTopic.IsFavourite)"><i class="fas fa-heart c-red"></i></span>
                                <span ng-show="SelectedTopic.IsFavourite !=1" ng-click="ChangeTopicProperty(SelectedTopic,1,SelectedTopic.TopicId,!SelectedTopic.IsFavourite)"><i class="fas fa-heart"></i></span>
                                <span ng-show="SelectedTopic.IsBookmark ==1" ng-click="ChangeTopicProperty(SelectedTopic,3,SelectedTopic.TopicId,!SelectedTopic.IsBookmark)"><i class="fas fa-plus c-red"></i></span>
                                <span ng-show="SelectedTopic.IsBookmark !=1" ng-click="ChangeTopicProperty(SelectedTopic,3,toSelectedTopicpic.TopicId,!SelectedTopic.IsBookmark)"><i class="fas fa-plus"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="course-preview">
                    <div class="course-content enroll">
                        <%-- <div class="course-content enroll no-header"> for no header IsLoggedIn--%>
                        <div class="card">
                            <img ng-show="SelectedTopic.CourseLogo !=null" class="card-img-top" ng-src="{{'/Files/CourseLogo/' + SelectedTopic.CourseLogo}}">
                            <img ng-show="SelectedTopic.CourseLogo ==null" class="card-img-top" src="../INCLUDES/Asset/images/sun.png">

                            <div class="card-body">
                                <div class="creator">
                                    <%--<img src="../INCLUDES/Asset/images/profile.png" />--%>
                                    <img ng-show="SelectedTopic.InstructorPic !=null" class="card-img-top" ng-src="{{'/Files/InspectorImage/' + SelectedTopic.InstructorPic}}">
                                    <img ng-show="SelectedTopic.InstructorPic ==null" class="card-img-top" src="../INCLUDES/Asset/images/sun.png">

                                    <div class="creator-details">
                                        <span>{{SelectedTopic.InstructorName}}</span>
                                        <span>{{ GetLastUpdatedDate(SelectedTopic.ModifiedDate)}}</span>
                                    </div>
                                </div>
                                <div class="enroll-content">
                                    <span>Course Category</span>
                                    <span ng-bind-html="trustAsHtml(SelectedTopic.CategoryName)"></span>

                                </div>
                                <div class="point-progress" ng-show="SelectedTopic.IsEnrolled == 1">

                                    <span>{{ GetCompletedPercentage(SelectedTopic.CompletedModules,SelectedTopic.TotalModules)}}</span>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" ng-style="{ 'width': (SelectedTopic.CompletedModules / SelectedTopic.TotalModules) * 100 + '%' }"
                                            aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    </div>

                                </div>
                                <a class="btn bg-yellow w-100" ng-click="EnrollCourse(SelectedTopic.TopicId)" ng-show="SelectedTopic.IsEnrolled == null || SelectedTopic.IsEnrolled == 0">Enroll</a>

                            </div>
                        </div>
                        <%--  <div class="card shadow-sm course-connection">
                                    <div class="card-body">
                                        <h5 class="card-title">Community Connections</h5>
                                        <p class="card-text mb-1">Learning is better togather</p>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="path">Go to Community fee                </div>
d</a>
                                    </div>
                                </div>--%>
                    </div>
                    <div class="col p-0">
                        <div class="course-summary">
                            <div class="summary-title">
                                Course Summary
                            </div>
                            <p class="summary-content" ng-bind-html="trustAsHtml(SelectedTopic.Summary)">
                            </p>
                        </div>

                        <div class="course-lesson">
                            <div class="lesson"></div>
                            <div class="lesson" ng-repeat="module in Module.UnlockedItems">
                                <div class="card" ng-click="GetContentsByModule(module.TopicID,module.ModuleID,SelectedTopic.IsEnrolled)">
                                    <div class="card-body">
                                        <h5 class="card-title" ng-bind-html="trustAsHtml(module.Title)"></h5>
                                        <%--  <p ng-bind-html="trustAsHtml(SelectedContent.Description)"></p>--%>
                                        <p class="card-text">~{{ GetTopicTime(module.LessonTime) }}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="lesson"></div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section id="dvContentsContainer" ng-show="ActiveContainer =='Content'">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#" ng-click="GoBack('Module')">{{SelectedTopic.Title}}</a></li>
                    <li class="breadcrumb-item active">{{SelectedModule.Title}}</li>
                </ol>
            </nav>
            <div class="col-12">
                <div class="row lesson-wrapper">
                    <div class="lesson-list shadow-sm">
                        <div class="duration"><span>Time Estimate</span><span>About {{ GetTopicTime(SelectedModule.LessonTime) }}</span></div>
                        <div class="header">Content</div>
                        <div id="list-lesson" class="list-group">
                            <a class="list-group-item list-group-item-action active" href="#list-item-learningObjectives" ng-click="DisplayLearningObjectives($event.currentTarget,'Learning Objectives',SelectedModule.Overview)">Learning Objectives</a>
                            <%-- <a class="list-group-item list-group-item-action" href="#list-item-2">Overview of Objects</a>
                                    <a class="list-group-item list-group-item-action" href="#list-item-3">Get to Know Objects</a>
                                    <a class="list-group-item list-group-item-action" href="#list-item-4">Create a Custom Object</a>--%>

                            <a ng-if="content.ContentType != 'FINALQUIZ'" ng-repeat="content in Content.UnlockedItems"
                                ng-click="ViewContent($event.currentTarget,content.TopicID,content.ModuleID,content.ContentID,content.Title,content.ContentType)"
                                class="list-group-item list-group-item-action" href="{{'#list-item-' + content.ContentID }}" ng-bind-html="trustAsHtml(content.Title)"></a>

                            <a class="list-group-item list-group-item-action" href="#list-item-resources" ng-click="DisplayLearningObjectives($event.currentTarget,'Resources',SelectedModule.Resources)">Resources</a>

                            <a class="next shadow-sm  list-group-item list-group-item-action" href="#list-item-finalquiz" ng-if="content.ContentType == 'FINALQUIZ'" ng-repeat="content in Content.UnlockedItems"
                                ng-init="ViewContent($event.currentTarget,content.TopicID,content.ModuleID,content.ContentID,content.Title,content.ContentType)">Quiz
                            </a>
                        </div>
                    </div>
                    <div class="col p-0">
                        <div id="dvContentViewer" data-spy="scroll" data-target="#list-lesson" data-offset="0" class="lesson-scrollspy">
                            <div class="lesson-content" id="list-item-1">
                                <h2 class="lesson-title">{{SelectedModule.Title}}</h2>
                                <%--                       <h4 class="lesson-content-title">{{SelectedContent.Title}}</h4>--%>
                                <p ng-bind-html="trustAsHtml(SelectedContent.Description)"></p>
                            </div>

                            <div class="lesson-content" id="list-item-learningObjectives">
                                <h4 class="lesson-content-title">Learning Objectives</h4>
                                <%--Display Content here..--%>
                                <p ng-bind-html="trustAsHtml(SelectedModule.Overview)"></p>
                            </div>

                            <div class="lesson-content" id="{{'list-item-' + content.ContentID }}" ng-if="content.ContentType != 'FINALQUIZ'" ng-repeat="content in Content.UnlockedItems">
                                <%--  <h2 class="lesson-title" ng-bind-html="trustAsHtml(SelectedModule.Title)"></h2>--%>
                                <h4 class="lesson-content-title" ng-bind-html="trustAsHtml(content.Title)"></h4>
                                <%--Display Content here..--%>
                                <p ng-bind-html="trustAsHtml(content.Description)"></p>
                            </div>

                            <div class="lesson-content" id="list-item-resources">
                                <%-- <h4 class="lesson-content-title">Resources</h4>--%>
                                <%--Display Content here..--%>
                                <p ng-bind-html="trustAsHtml(SelectedModule.Resources)"></p>
                            </div>
                            <%-- </div>
                        <div class="lesson-scrollspy">--%>
                            <div class="lesson-content" id="list-item-finalquiz">
                                <%-- <h2 class="lesson-title" ng-bind-html="trustAsHtml(SelectedModule.Title)"></h2>--%>
                                <%--<h4 class="lesson-content-title" ng-bind-html="trustAsHtml(SelectedContent.Title)"></h4>
                                <p ng-bind-html="trustAsHtml(SelectedContent.Description)"></p>--%>

                                <div class="lesson-content" ng-if="content.ContentType == 'FINALQUIZ'" ng-repeat="content in Content.UnlockedItems">
                                    <h4 class="lesson-content-title" ng-bind-html="trustAsHtml(content.Title)"></h4>
                                    <p ng-bind-html="trustAsHtml(content.Description)"></p>
                                </div>

                                <%-- <div class="col-sm-12 header">
                                            <a class="back" href="#" ng-click="GoBack('Content')"><i class="fas fa-arrow-left"></i>{{ContentGoBackText}}</a>
                                            <h2 class="text-center font-weight-bold">{{SelectedContent.Title}}</h2>
                                        </div>--%>

                                <div class="col-sm-12">
                                    <div class="row" id="finalQuiz">
                                        <div class="col-sm-12 pl-0 mb-3" ng-repeat="question in SpecialContents.Questions" my-post-repeat-directive>
                                            <div class="ng-class: 'card border-0 shadow mb-3 ' + (question.IsAnswered == true ? (question.IsCorrect ==true ? 'b-green-2' : 'b-red-2'):'' );">
                                                <div class="card-body question">
                                                    <div class="media mb-4">
                                                        <h1 class="card-title display-4 font-weight-bold mr-4">{{$index + 1}}.</h1>
                                                        <div class="media-body pr-4">
                                                            <h5 class="mt-0 mb-4">{{question.Title}}</h5>

                                                            <%--Checkbox List--%>
                                                            <div ng-if="question.QuestionTypeID == 1 ">
                                                                <div class="custom-control custom-checkbox" ng-repeat="ansOption in question.AnswerOptions">
                                                                    <input ng-disabled="SpecialContents.IsAnswered ==1 && SpecialContents.IsPassed ==1" type="checkbox" ng-model="ansOption.IsSelected" id="{{'chkAnsOption_' + question.QuestionID + $index}}" class="custom-control-input" name="{{'ansOption.AnswerText_1_' +  question.QuestionID}}" value="{{ansOption.AnswerID}}">
                                                                    <label class="custom-control-label" for="{{'chkAnsOption_' + question.QuestionID + $index}}">{{ansOption.AnswerText}}</label>
                                                                    <%-- IsCorrect {{ansOption.IsCorrect}} , CorrectScore{{ansOption.CorrectScore}} ,InCorrectScore{{ansOption.InCorrectScore}}--%>
                                                                </div>
                                                            </div>

                                                            <%--Dropdown List--%>
                                                            <div class="form-group" ng-if="question.QuestionTypeID == 2 ">
                                                                <select class="form-control select2" ng-model="question.Value_Text">
                                                                    <option ng-disabled="SpecialContents.IsAnswered ==1 && SpecialContents.IsPassed ==1" value="{{ansOption.AnswerID}}" ng-repeat="ansOption in question.AnswerOptions">{{ansOption.AnswerText}} 
                                                    <%--IsCorrect {{ansOption.IsCorrect}} , CorrectScore{{ansOption.CorrectScore}} ,InCorrectScore{{ansOption.InCorrectScore}}--%>
                                                                    </option>
                                                                </select>
                                                            </div>

                                                            <%--Radio Button List--%>
                                                            <div ng-if="question.QuestionTypeID == 3 ">
                                                                <div class="custom-control custom-radio" ng-repeat="ansOption in question.AnswerOptions">
                                                                    <input ng-disabled="SpecialContents.IsAnswered ==1 && SpecialContents.IsPassed ==1" type="radio" id="{{'rbSVAnsOption_' + question.QuestionID + $index}}" class="custom-control-input" ng-model="question.Value_Text" name="{{'ansOption.AnswerText_3_' +  question.QuestionID}}" value="{{ansOption.AnswerID}}">
                                                                    <label class="custom-control-label" for="{{'rbSVAnsOption_' + question.QuestionID + $index}}">{{ansOption.AnswerText}}</label>
                                                                    <%-- IsCorrect {{ansOption.IsCorrect}} , CorrectScore{{ansOption.CorrectScore}} ,InCorrectScore{{ansOption.InCorrectScore}}--%>
                                                                </div>
                                                            </div>

                                                            <%--Radio Button List with box--%>
                                                            <div ng-if="question.QuestionTypeID == 9 " class="box">
                                                                <div ng-repeat="ansOption in question.AnswerOptions">
                                                                    <input ng-disabled="SpecialContents.IsAnswered ==1 && SpecialContents.IsPassed ==1" type="checkbox" id="{{'rbAnsOption_' + question.QuestionID + $index}}" ng-model="question.Value_Text" name="{{'ansOption.AnswerText_9_' +  question.QuestionID}}" value="{{ansOption.AnswerID}}">
                                                                    <label for="{{'rbAnsOption_' + question.QuestionID + $index}}">{{ansOption.AnswerText}}</label>
                                                                    <%--    IsCorrect {{ansOption.IsCorrect}} , CorrectScore{{ansOption.CorrectScore}} ,InCorrectScore{{ansOption.InCorrectScore}}--%>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <p class="anchor"></p>
                                                        <i ng-if="SpecialContents.IsAnswered ==true && question.IsCorrect ==false" class="fas fa-times c-red"></i>
                                                        <i ng-if="SpecialContents.IsAnswered ==true && question.IsCorrect ==true" class="fas fa-check c-green"></i>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-100 mt-4 text-center">
                                            <a class="btn btn-custom bg-blue font-weight-bold text-white" ng-if="SpecialContents.IsAnswered==true && SpecialContents.IsPassed==false"
                                                ng-click="RetakeTest(SpecialContents.TopicID,SpecialContents.ModuleID,SpecialContents.ContentID,SpecialContents.SurveyID)">TAKE THE TEST AGAIN</a>
                                            <a class="btn btn-custom bg-blue font-weight-bold text-white" ng-if="SpecialContents.IsAnswered==false && SpecialContents.IsPassed==false"
                                                ng-click="SubmitAnswers()">Check Answers</a>
                                            <a class="btn btn-custom bg-blue font-weight-bold text-white" ng-if="SpecialContents.IsPassed==true"
                                                ng-click="UpdateContent(SpecialContents.Type,SpecialContents.TopicID,SpecialContents.ModuleID,SpecialContents.ContentID)">Continue</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <%-- beta view lesson end --%>

        <div class="container-fluid dashboard">
            <section id="dvTopicContainer" ng-if="ActiveContainer =='Topic'">
                <h4 class="section-title" id="dvInProgressTitle" style="display: none;">In Progress Courses</h4>

                <%-- Start new card style --%>
                <div class="row" id="dvInProgressTopics">
                    <div class="courses-card" ng-repeat="topic in InProgressTopics" inprogress-topic-repeat-directive>
                        <div class="card card-with-img">
                            <div class="action-icon dropdown">
                                <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                <div class="dropdown-menu br-0">
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,0);"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,0);"><i class="far fa-eye"></i>View more details</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsFavourite !=1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsFavourite ==1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="far fa-bookmark"></i>Remove from Favorites</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsBookmark !=1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i>Add to Learning Path</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsBookmark ==1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i>Remove from Learning Path</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicId)"><i class="fas fa-pen"></i>Manage</a>
                                </div>
                            </div>

                            <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                            <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                            <div class="card-body item" style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicId,0);">
                                <p class="card-text type">{{ GetTopicTime(topic.CategoryName) }}</p>
                                <h6 class="card-title">{{topic.Title}}</h6>
                                <p class="card-text ellipsis">{{topic.Description}}</p>
                            </div>
                            <div class="card-body profile">
                                <img ng-show="topic.InstructorPic !=null" ng-src="{{'/Files/ProfilePic/' + topic.InstructorPic}}" />
                                <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                <h6 class="card-title">{{topic.InstructorName}}</h6>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- End new card style --%>

                <%--  <div id="dvInProgressTopics" class="content d-none">
                    <div class="content-item card-fix" ng-repeat="topic in InProgressTopics" inprogress-topic-repeat-directive>
                        <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                            <div class="card-icon">
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                <span class="point">+{{topic.Points}} Points</span>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">{{topic.Title}}</h5>
                                <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                <div class="action">
                                    <span ng-show="topic.IsFavourite ==1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="fas fa-heart c-red"></i></span>
                                    <span ng-show="topic.IsFavourite !=1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="fas fa-heart"></i></span>
                                    <span ng-show="topic.IsBookmark ==1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus c-red"></i></span>
                                    <span ng-show="topic.IsBookmark !=1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i></span>

                                    <span class="play" ng-style="{'background-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }" ng-click="GetModulesByTopic(topic.TopicId,0);" style="cursor: pointer;">
                                        <img src="../INCLUDES/Asset/images/icon-play.svg" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <h4 class="section-title" id="dvMyTopicsTitle" style="display: none;">My Courses</h4>

                <%-- Start new card style --%>
                <div class="row" id="dvMyTopics">
                    <div class="courses-card" ng-repeat="topic in MyCourses" my-topic-repeat-directive>
                        <div class="card card-with-img">
                            <div class="action-icon dropdown">
                                <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                <div class="dropdown-menu br-0">
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,0);"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,0);"><i class="far fa-eye"></i>View more details</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsFavourite !=1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsFavourite ==1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="far fa-bookmark"></i>Remove from Favorites</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsBookmark !=1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i>Add to Learning Path</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.IsBookmark ==1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i>Remove from Learning Path</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicId)"><i class="fas fa-pen"></i>Manage</a>
                                </div>
                            </div>

                            <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                            <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">

                            <div class="card-body item" style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicId,0);">
                                <p class="card-text type">{{ GetTopicTime(topic.CategoryName) }}</p>
                                <h6 class="card-title">{{topic.Title}}</h6>
                                <p class="card-text ellipsis">{{topic.Description}}</p>
                            </div>
                            <div class="card-body profile">
                                <img ng-show="topic.InstructorPic !=null" ng-src="{{'/Files/ProfilePic/' + topic.InstructorPic}}" />
                                <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                <h6 class="card-title">{{topic.InstructorName}}</h6>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- End new card style --%>

                <%--<div id="dvMyTopics" class="content">
                    <div class="content-item card-fix" ng-repeat="topic in MyCourses" my-topic-repeat-directive>
                        <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                            <div class="card-icon">
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                <span class="point">+{{topic.Points}} Points</span>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">{{topic.Title}}</h5>
                                <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                <div class="action">
                                    <span ng-show="topic.IsFavourite ==1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="fas fa-heart c-red"></i></span>
                                    <span ng-show="topic.IsFavourite !=1" ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="fas fa-heart"></i></span>
                                    <span ng-show="topic.IsBookmark ==1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus c-red"></i></span>
                                    <span ng-show="topic.IsBookmark !=1" ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i></span>

                                    <span class="play" ng-style="{'background-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }" ng-click="GetModulesByTopic(topic.TopicId,0);" style="cursor: pointer;">
                                        <img src="../INCLUDES/Asset/images/icon-play.svg" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <h4 class="section-title" id="dvRecommendedTopicsTitle" style="display: none;">Recommended Courses</h4>

                <%-- Start new card style --%>
                <div class="row" id="dvRecommendedTopics">
                    <div class="courses-card" ng-repeat="topic in RecommendedCourses" recommended-topic-repeat-directive>
                        <div class="card card-with-img">
                            <div class="action-icon dropdown">
                                <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                <div class="dropdown-menu br-0">
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,1);"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,1);"><i class="far fa-eye"></i>View more details</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicId)"><i class="fas fa-pen"></i>Manage</a>
                                </div>
                            </div>
                            <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                            <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                            <div class="card-body item" style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicId,1);">
                                <p class="card-text type">{{ GetTopicTime(topic.CategoryName) }}</p>
                                <h6 class="card-title">{{topic.Title}}</h6>
                                <p class="card-text ellipsis">{{topic.Description}}</p>
                            </div>
                            <div class="card-body profile">
                                <img ng-show="topic.InstructorPic !=null" ng-src="{{'/Files/ProfilePic/' + topic.InstructorPic}}" />
                                <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                <h6 class="card-title">{{topic.InstructorName}}</h6>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- End new card style --%>

                <%--<div id="dvRecommendedTopics" class="content">
                    <div class="content-item card-fix" ng-repeat="topic in RecommendedCourses" recommended-topic-repeat-directive>
                        <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                            <div class="card-icon">
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                <span class="point">+{{topic.Points}} Points</span>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">{{topic.Title}}</h5>
                                <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                <div class="action">
                                    <span class="play" ng-style="{'background-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }" ng-click="GetModulesByTopic(topic.TopicId,0);" style="cursor: pointer;">
                                        <img src="../INCLUDES/Asset/images/icon-play.svg" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <h4 class="section-title" id="dvLatestTopicsTitle" style="display: none;">Latest Courses</h4>

                <%-- Start new card style --%>
                <div class="row" id="dvLatestTopics">
                    <div class="courses-card" ng-repeat="topic in LatestCourses" latest-topic-repeat-directive>
                        <div class="card card-with-img">
                            <div class="action-icon dropdown">
                                <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                <div class="dropdown-menu br-0">
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,1);"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                    <a class="dropdown-item" href="#" ng-click="GetModulesByTopic(topic.TopicId,1);"><i class="far fa-eye"></i>View more details</a>
                                    <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicId)"><i class="fas fa-pen"></i>Manage</a>
                                </div>
                            </div>
                            <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                            <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                            <div class="card-body item" style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicId,1);">
                                <p class="card-text type">{{ GetTopicTime(topic.CategoryName) }}</p>
                                <h6 class="card-title">{{topic.Title}}</h6>
                                <p class="card-text ellipsis">{{topic.Description}}</p>
                            </div>
                            <div class="card-body profile">
                                <img ng-show="topic.InstructorPic !=null" ng-src="{{'/Files/ProfilePic/' + topic.InstructorPic}}" />
                                <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                <h6 class="card-title">{{topic.InstructorName}}</h6>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- End new card style --%>



                <h4 class="section-title" id="dvPopularTopicsTitle" style="display: none;">Popular Courses</h4>


            </section>



            <div>



                <div class="row survey" ng-if="ActiveContainer =='ContentSurveyView'">
                    <div class="col-sm-12 header">
                        <a class="back" href="#" ng-click="GoBack('Content')"><i class="fas fa-arrow-left"></i>{{ContentGoBackText}}</a>
                        <h2 class="text-center font-weight-bold">{{SelectedContent.Title}}</h2>
                    </div>
                    <div class="col-sm-12 mt-5">
                        <div class="row" id="surveyQuestion">
                            <div class="col-sm-12 mb-3" ng-repeat="question in SpecialContents.Questions" my-post-repeat-directive>
                                <div class="card border-0 shadow mb-3">
                                    <div class="card-body question">
                                        <div class="media mb-4">
                                            <h1 class="card-title display-4 font-weight-bold mr-4">{{$index + 1}}.</h1>
                                            <div class="media-body pr-4">
                                                <h5 class="mt-0 mb-4">{{question.Title}}</h5>

                                                <%--Checkbox List--%>
                                                <div ng-if="question.QuestionTypeID == 1 && question.IsBox==false ">
                                                    <div class="custom-control custom-checkbox" ng-repeat="ansOption in question.AnswerOptions">
                                                        <input type="checkbox" ng-disabled="SpecialContents.IsAnswered ==1" ng-model="ansOption.IsSelected" id="{{'chkAnsOption_' + question.QuestionID + $index}}" class="custom-control-input" name="ansOption.AnswerText_1" value="{{ansOption.AnswerID}}">
                                                        <label class="custom-control-label" for="{{'chkAnsOption_' + question.QuestionID + $index}}">{{ansOption.AnswerText}}</label>
                                                    </div>
                                                </div>

                                                <%--Checkbox List with Box--%>
                                                <div ng-if="question.QuestionTypeID == 1 && question.IsBox==true " class="form-group checkbox box">
                                                    <div ng-repeat="ansOption in question.AnswerOptions">
                                                        <input type="checkbox" ng-disabled="SpecialContents.IsAnswered ==1" ng-model="ansOption.IsSelected" id="{{'chkAnsOption_' + question.QuestionID + $index}}" class="custom-control-input" name="ansOption.AnswerText_1" value="{{ansOption.AnswerID}}">
                                                        <label for="{{'chkAnsOption_' + question.QuestionID + $index}}">{{ansOption.AnswerText}}</label>
                                                    </div>
                                                </div>

                                                <%--Dropdown List--%>
                                                <div class="form-group" ng-if="question.QuestionTypeID == 2 ">
                                                    <select ng-disabled="SpecialContents.IsAnswered ==1" class="form-control select2" ng-model="question.Value_Text">
                                                        <option value="{{ansOption.AnswerID}}" ng-repeat="ansOption in question.AnswerOptions">{{ansOption.AnswerText}}</option>
                                                    </select>
                                                </div>

                                                <%--Radio Button List--%>
                                                <div ng-if="question.QuestionTypeID == 3 && question.IsBox==false  ">
                                                    <div class="custom-control custom-radio" ng-repeat="ansOption in question.AnswerOptions">
                                                        <input ng-disabled="SpecialContents.IsAnswered ==1" type="radio" id="{{'rbSVAnsOption_' + question.QuestionID + '_' + ansOption.AnswerID}}" class="custom-control-input" ng-model="question.Value_Text" name="{{'RadioName_' + question.QuestionID}}" value="{{ansOption.AnswerID}}">
                                                        <label class="custom-control-label" for="{{'rbSVAnsOption_' + question.QuestionID + '_' + ansOption.AnswerID}}">{{ansOption.AnswerText}}</label>
                                                    </div>
                                                </div>

                                                <%--Radio Button List with box--%>
                                                <div ng-if="question.QuestionTypeID == 3  && question.IsBox==true" class="form-group radio box">
                                                    <div ng-repeat="ansOption in question.AnswerOptions">
                                                        <input ng-disabled="SpecialContents.IsAnswered ==1" type="radio" id="{{'rbSVAnsOption_' + question.QuestionID + '_' + ansOption.AnswerID}}" class="custom-control-input" ng-model="question.Value_Text" name="{{'RadioName_' + question.QuestionID}}" value="{{ansOption.AnswerID}}">
                                                        <label for="{{'rbSVAnsOption_' + question.QuestionID + '_' + ansOption.AnswerID}}">{{ansOption.AnswerText}}</label>
                                                    </div>
                                                </div>

                                                <%--File Upload Control--%>
                                                <div ng-if="question.QuestionTypeID == 4">
                                                    <input ng-disabled="SpecialContents.IsAnswered ==1" type="file" questionid="{{question.QuestionID}}" onchange="encodeImagetoBase64(this,angular.element(this).scope())" ng-model="question.Value_Text" class="required" id="file">
                                                    <div>{{question.Value_Text}}</div>
                                                </div>

                                                <%--Scale Range Selector--%>
                                                <div ng-if="question.QuestionTypeID == 5" class="rating">
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="10" id="{{'rbSurveyRate_' + $index + '_10'}}" /><label for="{{'rbSurveyRate_' + $index + '_10'}}">10</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="9" id="{{'rbSurveyRate_' + $index + '_9'}}" /><label for="{{'rbSurveyRate_' + $index + '_9'}}">9</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="8" id="{{'rbSurveyRate_' + $index + '_8'}}" /><label for="{{'rbSurveyRate_' + $index + '_8'}}">8</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="7" id="{{'rbSurveyRate_' + $index + '_7'}}" /><label for="{{'rbSurveyRate_' + $index + '_7'}}">7</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="6" id="{{'rbSurveyRate_' + $index + '_6'}}" /><label for="{{'rbSurveyRate_' + $index + '_6'}}">6</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="5" id="{{'rbSurveyRate_' + $index + '_5'}}" /><label for="{{'rbSurveyRate_' + $index + '_5'}}">5</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="4" id="{{'rbSurveyRate_' + $index + '_4'}}" /><label for="{{'rbSurveyRate_' + $index + '_4'}}">4</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="3" id="{{'rbSurveyRate_' + $index + '_3'}}" /><label for="{{'rbSurveyRate_' + $index + '_3'}}">3</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="2" id="{{'rbSurveyRate_' + $index + '_2'}}" /><label for="{{'rbSurveyRate_' + $index + '_2'}}">2</label>
                                                    <input type="radio" ng-disabled="SpecialContents.IsAnswered ==1" name="{{'CustomRating_' + $index}}" ng-model="question.Value_Text" value="1" id="{{'rbSurveyRate_' + $index + '_1'}}" /><label for="{{'rbSurveyRate_' + $index + '_1'}}">1</label>
                                                </div>

                                                <%--Textbox--%>
                                                <div ng-if="question.QuestionTypeID == 6">
                                                    <div class="form-group">
                                                        <input ng-disabled="SpecialContents.IsAnswered ==1" type="text" class="form-control" id="{{'txt_' + $index}}" placeholder="Type your answer here" ng-model="question.Value_Text">
                                                    </div>
                                                </div>

                                                <%--Text Area--%>
                                                <div ng-if="question.QuestionTypeID == 7">
                                                    <div class="form-group">
                                                        <textarea ng-disabled="SpecialContents.IsAnswered ==1" class="form-control" placeholder="Type your answer here" id="{{'txtArea_' + $index}}" ng-model="question.Value_Text"></textarea>
                                                    </div>
                                                </div>

                                                <%--Date Picker--%>
                                                <div ng-if="question.QuestionTypeID == 8 ">
                                                    <div class="form-group">
                                                        <input ng-disabled="SpecialContents.IsAnswered ==1" ng-init="question.Value_Text = GetFormattedDate(question.Value_Text)" value="question.Value_Text" type="date" class="form-control" id="{{'date_' + $index}}" placeholder="Select Date" style="width: 25%;" ng-model="question.Value_Text" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <a class="btn btn-custom bg-blue font-weight-bold text-white" ng-if="SpecialContents.IsAnswered==0" ng-click="SubmitAnswers()">Submit Survey</a>
                            <a class="btn btn-custom bg-blue font-weight-bold text-white" ng-if="SpecialContents.IsAnswered==1" ng-click="ShowFlashcardIntro(SpecialContents.ContentID)">Next</a>
                        </div>
                    </div>
                </div>

                <div class="row flashcards" ng-if="ActiveContainer =='ContentFlashcardView'">
                    <div class="col-sm-12 header">
                        <a class="back" href="#" ng-click="GoBack('Content')"><i class="fas fa-arrow-left"></i>{{ContentGoBackText}}</a>
                        <h2 class="text-center font-weight-bold">{{SpecialContents.Title}}</h2>
                        <h6 class="text-center section-title mt-3 color-0-25">Flashcards</h6>
                    </div>
                    <div class="col-sm-10 offset-1 mt-4">
                        <div class="row justify-content-center">
                            <%--<div class="col-12 col-sm-12 col-md-6 mb-3 overview" ng-if="ActiveSubContainer =='BeginFlashcard'">
                        You have completed all the videos/pdfs in this module.
            <h1>UP NEXT:</h1>
                        <div>FLASHCARD ICON</div>
                        <div>FLASHCARD TITLE</div>
                        <a ng-if="SpecialContents.SkipFlashcards == '1'" href="#" class="link font-weight-bold float-left">Skip Flashcards</a>
                        <a class="btn btn-custom bg-blue font-weight-bold text-white float-right" ng-click="ShowFlashcardIntro()">BEGIN FLASHCARD</a>
                    </div>--%>
                            <div class="col-12 col-sm-12 col-md-6 mb-3 overview" ng-if="ActiveSubContainer =='FlashcardIntro'">
                                <h2>Flashcard intro</h2>
                                <h5 class="font-weight-bold">{{SpecialContents.FlashcardTitle}}</h5>
                                <ul>
                                    <li ng-repeat="highlight in SpecialContents.FlashcardsIntro">{{highlight.Comments}}</li>
                                </ul>
                                <div class="w-100 mt-5">
                                    <a ng-if="SpecialContents.SkipFlashcards == '0'" href="#" class="link font-weight-bold float-left"
                                        ng-click="SkipFlashcard(SpecialContents.TopicID,SpecialContents.ModuleID,SpecialContents.ContentID)">Skip Flashcards</a>
                                    <a href="#" class="btn btn-custom bg-blue font-weight-bold text-white float-right" ng-click="ShowFlashcardSlides()">Let's Go</a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-6 mb-3 overview" id="divFlashcard" ng-if="ActiveSubContainer =='FlashcardSlides'">
                                <div ng-repeat="flashcardSlide in SpecialContents.Flashcards" ng-if="$index == CurrIndex">
                                    <div class="flashcard">
                                        <div class="card border-0">
                                            <img class="card-img-top circle mx-auto" src="../includes/Asset/images/profile.png" />
                                            <div class="card-body">
                                                <p class="card-text">
                                                    {{flashcardSlide.Description}}
                                                </p>
                                                <p class="text-right anchor">{{($index + 1) +'/'+ (SpecialContents.Flashcards).length}}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w-100 mt-5 text-center">
                                        <a href="#" class="btn btn-custom btn-transparent font-weight-bold mr-2" id="btnPrevCard" ng-click="FlashcardPreviousClicked(SpecialContents.ContentID,$index,SpecialContents.TotalFlashcardSlides)">{{$index ==0 ? 'Previous' :'Previous Card'}}</a>
                                        <a href="#" class="btn btn-custom bg-yellow font-weight-bold" id="btnNextCard" ng-click="FlashcardNextClicked(SpecialContents.ContentID,$index,SpecialContents.TotalFlashcardSlides)">{{($index + 1) == SpecialContents.TotalFlashcardSlides ? 'Begin Flashcard Quiz' :'Next Card'}}</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3 overview" id="divFlashcardQuiz" ng-if="ActiveSubContainer =='FlashcardQuiz'">
                                <div ng-repeat="question in SpecialContents.Questions">
                                    <div ng-if="$index == CurrIndex">
                                        <div class="row justify-content-center flashcard-question">
                                            <div class="col-12 col-sm-12 col-md-6 mb-3 text-center">
                                                <p>{{question.Title}}</p>
                                            </div>
                                            <div class="w-100"></div>
                                            <div class="col-12 col-sm-12 col-md-4 mb-3" ng-click="question.ShowAnwer=true" ng-repeat="ansOption in question.AnswerOptions">
                                                <div class="ng-class: 'card border-0 shadow text-center ' + (question.ShowAnwer ==true? (ansOption.IsCorrect ==true ? 'b-green-2' : 'b-red-2'):'' );">
                                                    <div class="card-body">
                                                        <h5 class="card-title">{{ansOption.AnswerText}}</h5>
                                                        <p class="anchor"></p>
                                                        <i ng-if="question.ShowAnwer ==true && ansOption.IsCorrect ==false" class="fas fa-times c-red"></i>
                                                        <i ng-if="question.ShowAnwer ==true && ansOption.IsCorrect ==true" class="fas fa-check c-green"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-100 mt-5 text-center">
                                            <a href="#" class="btn btn-custom btn-transparent font-weight-bold mr-2"
                                                id="btnPrevQuestion" ng-click="FlashcardQuestionPrevioustClicked($index,SpecialContents.TotalQuestions)">{{ $index == 0 ? 'Previous' :'Previous Question'}}</a>
                                            <a href="#" class="btn btn-custom bg-yellow font-weight-bold"
                                                id="btnNextQuestion"
                                                ng-click="FlashcardQuestionNextClicked(SpecialContents.TopicID,SpecialContents.ModuleID,SpecialContents.ContentID,$index,SpecialContents.TotalQuestions)">{{($index + 1) == SpecialContents.TotalQuestions ? 'Begin Final Quiz' :'Next Question'}}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <div id="dvFinalQuiz" ng-if="ActiveContainer =='ContentCompleted'">
                    You have completed all the videos/pdfs in this module.
            <h1>UP NEXT:</h1>
                    <div>QUIZ ICON</div>
                    <div>QUIZ TITLE</div>
                    <button onclick="return false;">DO THE QUIZ</button>
                </div>

                <div id="dvModuleCompleted" ng-if="ActiveContainer =='ModuleCompleted'">
                    Hurra!, You've just completed module:
            <h1>MODULE NAME</h1>
                    <div>You gained the following things</div>
                    <div>Highlights 1</div>
                    <div>Highlights 2</div>
                    <button onclick="return false;">Great</button>
                </div>

                <div class="modal fade" id="modalPersonalGift" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <a class="close-modal" data-dismiss="modal" aria-label="Close">
                                <img src="../includes/Asset/images/close-button.png" class="close" /></a>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-12 text-center mt-4">
                                        <img src="../includes/Asset/images/suprrise-icon.svg" class="img-achievements" />
                                        <p class="modal-text mt-4">Surprise!</p>
                                        <h3 class="font-weight-bold modal-title">You just unlocked a personal gift!</h3>
                                    </div>
                                    <div class="col-sm-12 text-center mt-3">
                                        <img ng-if="UnlockGiftData.DocType == 'VIDEO'" src="../includes/Asset/images/next-video-icon.svg" class="img-achievements" />
                                        <img ng-if="UnlockGiftData.DocType == 'PDF'" src="../includes/Asset/images/next-pdf-icon.svg" class="img-achievements" />
                                        <img ng-if="UnlockGiftData.DocType == 'FLASHCARD'" src="../includes/Asset/images/next-flashcard-icon.svg" class="img-achievements" />
                                        <h5 class="modal-title mt-2"><b>{{UnlockGiftData.Title}}:</b> {{UnlockGiftData.Description}}</h5>
                                    </div>
                                    <div class="col-sm-12 text-center mt-5 mb-3">
                                        <a class="btn btn-custom bg-blue font-weight-bold text-white" class="close-modal" data-dismiss="modal" aria-label="Close" href="#">OK</a>
                                        <div class="w-100"></div>
                                        <span class="note"><b>Note:</b> You can access this gift in your Profile page</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="dvAchievementReceived" ng-if="ActiveContainer =='AchievementReceived'">
                    <div>Hurray!. You just became guru</div>
                    <div>ICON</div>
                    <div>Description</div>
                    <button onclick="return false;">GREAT</button>
                </div>

                <div class="modal fade" id="modalAchievements" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <a class="close-modal" data-dismiss="modal" aria-label="Close">
                                <img src="../includes/Asset/images/close-button.png" class="close" /></a>
                            <div class="modal-body">
                                <div class="row reward">
                                    <div class="col-sm-12 col-md-10 offset-md-1">
                                        <div class="row mt-3">
                                            <div class="col-md-3 mt-3 text-right">
                                                <img id="imgAchievementIcon" src="../includes/Asset/images/engager-icon.svg" class="img-achievements disabled" />
                                            </div>
                                            <div class="col-sm-9">
                                                <h3 class="font-weight-bold modal-title" id="dvAchievementTitle">The Engager</h3>
                                                <p class="modal-text" id="dvAchievmentDescription">The Engager is dedicated to the platform. She loves interacting with others and sharing her thoughts about the topics.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-10 offset-md-1">
                                        <div class="row mt-3 requirements">
                                            <div class="col-sm-12">
                                                <h5 class="section-title">Requirements</h5>
                                            </div>
                                            <div class="col-sm-12">
                                                <ul class="list-group" id="dvRequirements">
                                                    <%--<li class="list-group-item border-0">Be an active part of the community</li>
                                            <li class="list-group-item border-0">Express your opinion</li>
                                            <li class="list-group-item border-0">React to the videos</li>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-10 offset-md-1">
                                        <div class="row mt-4">
                                            <div class="col-sm-12">
                                                <h5 class="section-title">Your Reward on completion</h5>
                                            </div>
                                            <div class="col-sm-12 text-center mt-3">
                                                <img src="../includes/Asset/images/reward-icon.svg" class="img-achievements" />
                                            </div>
                                            <div class="col-sm-12 text-center mt-5 mb-4">
                                                <a class="btn btn-custom bg-blue font-weight-bold text-white" data-dismiss="modal" aria-label="Close">Got It!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {            

            $("#dvMenu_Dashboard").addClass("active");
            $('select.select2').select2({
                placeholder: "Select a option",
                allowClear: true
            });
            //$('.date').datepicker({ uiLibrary: 'bootstrap4', format: 'yyyy-dd-mm' });
            bsCustomFileInput.init();

            GetAchievements();
        });

        function InitSlickSlider(el) {
            //$(el).removeClass("slick-initialized");
            //$(el).removeClass("slick-slider");
            //$(el).slick({
            //    dots: false,
            //    infinite: false,
            //    speed: 300,
            //    slidesToShow: 4,
            //    slidesToScroll: 1,
            //    centerMode: false,
            //    responsive: [
            //        {
            //            breakpoint: 1420,
            //            settings: {
            //                slidesToShow: 3,
            //                slidesToScroll: 1
            //            }
            //        },
            //        {
            //            breakpoint: 900,
            //            settings: {
            //                slidesToShow: 2,
            //                slidesToScroll: 1
            //            }
            //        },
            //        {
            //            breakpoint: 480,
            //            settings: {
            //                slidesToShow: 1,
            //                slidesToScroll: 1
            //            }
            //        }
            //    ]
            //});
        }

        //This code loads the IFrame Player API code asynchronously.
        //var tag = document.createElement('script');
        //tag.src = "https://www.youtube.com/iframe_api";
        //var firstScriptTag = document.getElementsByTagName('script')[0];
        //firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // This function creates an iframe and YouTube player
        // after the API code downloads.
        var ik_player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('ik_player', {
                height: '390',
                width: '640',
                videoId: '',
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange,
                    'onPlaybackQualityChange': onPlayerPlaybackQualityChange,
                    'onPlaybackRateChange': onPlayerPlaybackRateChange,
                    'onError': onPlayerError,
                    'onApiChange': onPlayerApiChange
                }
            });
        }

        // The API will call this function when the video player is ready.
        function onPlayerReady(event) {
            console.log('player is ready');
        }

        // The API calls this function when the player's state changes.
        function onPlayerStateChange(event) {

            switch (event.data) {
                case YT.PlayerState.UNSTARTED:
                    console.log('unstarted');
                    break;
                case YT.PlayerState.ENDED:
                    $("#dvVideoRating").show();
                    $('#dvVideoRating').removeClass('d-none');
                    $('#videoControl').addClass('d-none');
                    $('#videoControl').hide();
                    break;
                case YT.PlayerState.PLAYING:
                    console.log('playing');
                    break;
                case YT.PlayerState.PAUSED:
                    console.log('paused');
                    break;
                case YT.PlayerState.BUFFERING:
                    console.log('buffering');
                    break;
                case YT.PlayerState.CUED:
                    console.log('video cued');
                    break;
            }
        }

        function onPlayerPlaybackQualityChange(playbackQuality) {
            //alert("onPlayerPlaybackQualityChange");
            console.log('playback quality changed to ' + playbackQuality.data);
        }

        function onPlayerPlaybackRateChange(playbackRate) {
            //alert("onPlayerPlaybackRateChange");
            console.log('playback rate changed to ' + playbackRate.data);
        }

        function onPlayerError(e) {
            //alert("onPlayerError");
            console.log('An error occurred: ' + e.data);
        }

        function onPlayerApiChange() {
            //alert("onPlayerApiChange");
            console.log('The player API changed');
        }



        var achievements = [];

        function GetAchievements() {
            ShowLoader();
            var requestParams = { contact_name: "Scott", company_name: "HP" };
            $.ajax({
                type: "POST",
                url: "../api/Trainning/GetAchievementNGifts",
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                success: function (response) {
                    achievements = $.parseJSON(response).Achievements;
                    gifts = $.parseJSON(response).Gifts;
                    HideLoader();
                }
            });
        }

        function openModal(achievementId) {
            $.each(achievements, function (i, data) {
                if (data.AchievementID == achievementId) {
                    $("#dvAchievementTitle").html(data.Title);
                    $("#dvAchievmentDescription").html(data.Description);

                    if (data.Title.includes("quiz master"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/quiz-master-c-icon.svg');
                    if (data.Title.includes("world"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/perfectionist-c-icon.svg');
                    if (data.Title.includes("wordsmith"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/wordsmith-c-icon.svg');
                    if (data.Title.includes("engager"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/engager-icon.svg');
                    if (data.Title.includes("Guru"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/diploma.png');

                    var reqHtml = "";
                    $.each(data.Requirements, function (indx, req) {
                        reqHtml += '<li class="list-group-item border-0">' + req.Description + '</li>';
                    });
                    $("#dvRequirements").html(reqHtml);

                    return false;
                }
            });

            $('#modalAchievements').modal('show');
        }

        function VideoFinished(e) {
            $("#dvVideoRating").show();
            $('#dvVideoRating').removeClass('d-none');
            $('#videoControl').addClass('d-none');
            $('#videoControl').hide();
        }

        function VideoPlayPause(action) {
            if (action == 1) {
                // video.play();
                $('#vdVideoPlayer')[0].play();
                $('#videoControl').addClass('d-none');
                $('#videoControl').hide();
            }
        }

        function VideoPaused(e) {
            //alert("Video Paused");
            $('#videoControl').removeClass('d-none');
            $('#videoControl').hide();
            $('#vdVideoPlayer')[0].pause();
        }

        var accessToken = '<%=Session["access_token"]%>';
        var userRole ='<%=Session["RoleName"]%>';


        function ChangeFileName(cntrl) {
            var scope = angular.element(cntrl).scope();
            var selectedQuestion = jQuery.grep(scope.SpecialContents.Questions, function (obj) {
                return obj.QuestionID === parseInt($(cntrl).attr("questionid"));
            });

            selectedQuestion[0].Value_Text = cntrl.files[0].name;
            //selectedQuestion.Value_Text = cntrl.files[0].name;
        }

        //function GetFormattedDate(date) {
        //    var dateParts = date.split("-");
        //    date = format(dateParts[1]) + "-" + format(dateParts[0]) + "-" + format(dateParts[2]);
        //    var todayTime = new Date(date);
        //    var month = format(todayTime.getMonth() + 1);
        //    var day = format(todayTime.getDate());
        //    var year = format(todayTime.getFullYear());
        //    return day + "/" + month + "/" + year;
        //}

        function format(str) {
            return str < 10 ? "0" + str : str;
        }

        function encodeImagetoBase64(element, scope) {
            var uploadFile = true;
            if (!(/\.(gif|jpg|jpeg|tiff|png)$/i).test(element.files[0].name)) {
                uploadFile = false;
            }

            if (uploadFile) {
                var sizeInMB = parseInt(element.files[0].size / 1024 / 1024);
                if (sizeInMB <= 2) {
                    var file = element.files[0];
                    var reader = new FileReader();
                    reader.onloadend = function () {
                        scope.question.FilePath = reader.result;
                        scope.question.Value_Text = element.files[0].name;
                    }
                    reader.readAsDataURL(file);
                }
                else {
                    Swal.fire({
                        title: 'Failure',
                        icon: 'error',
                        html: "Maximum file upload size is 2 MB",
                        showConfirmButton: false,
                        showCloseButton: true
                    });
                }
            }
            else {
                Swal.fire({
                    title: 'Failure',
                    icon: 'error',
                    html: "Only images with (gif|jpg|jpeg|tiff|png) extensions can be uploaded.",
                    showConfirmButton: false,
                    showCloseButton: true
                });
            }
        }

    </script>
</asp:Content>

