<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="LearningJourney.aspx.cs" Inherits="_365_Portal.t.LearningJourney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .Tag{
            background: #fff;
            /*color: rgba(0, 0, 0, 0.3);*/
            border: 1px solid rgba(0, 0, 0, 1.2);
            padding: 2px 6px;
            border-radius: 2rem;
            margin-bottom: 10px;
            display: inline-block;
        }
        

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container module">
        <div class="row">
            <div class="col-12 col-sm-12 d-flex justify-content-between header">
                <div class="d-flex align-items-center">
                    <a class="back" href="#"><i class="fas fa-arrow-left"></i>Dashboard</a>
                    <h4 class="title">Add Course</h4>
                </div>
                <div>
                    <%--<a class="btn btn-outline mr-3">Discard Draft</a>--%>
                    <a class="btn btn-yellow" onclick="SaveAsDraft('.tab-pane.active');">Save as Draft</a>
                </div>
            </div>
            <div class="col-12 col-sm-12 mt-4">
                <div class="progress">
                    <%--<div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>--%>
                    <div class="progress-bar" id="divProgressBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <ul class="nav nav-pills mb-2" id="pills-tab-course" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="pills-course-tab" data-toggle="pill" href="#pills-course" role="tab" aria-controls="pills-course" aria-selected="true" onclick="ShowButtons('pills-course','tabclick')">Course</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-lesson-tab" data-toggle="pill" href="#pills-lesson" role="tab" aria-controls="pills-lesson" aria-selected="false" onclick="ShowButtons('pills-lesson','tabclick')">Lesson</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-content-tab" data-toggle="pill" href="#pills-content" role="tab" aria-controls="pills-content" aria-selected="false" onclick="ShowButtons('pills-content','tabclick')">Content</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-resources-tab" data-toggle="pill" href="#pills-resources" role="tab" aria-controls="pills-resources" aria-selected="false" onclick="ShowButtons('pills-resources','tabclick')">Resources</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-quiz-tab" data-toggle="pill" href="#pills-quiz" role="tab" aria-controls="pills-quiz" aria-selected="false" onclick="ShowButtons('pills-quiz','tabclick')">Quiz</a>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent" >

                    <div class="tab-pane fade show active edit" id="pills-course" role="tabpanel" aria-labelledby="pills-course-tab">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                <div class="col-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-7 col-lg-8">
                                            <div class="row">
                                                <div class="col-sm-12 mt-3">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Course Title *" maxlength="100" id="txtCourseTitle" aria-describedby="txtCourseTitleHelp" />
                                                        <small id="txtCourseTitleHelp" class="form-text">Keep your names short so they are easier to find
                                                    <span class="float-right">0 / 100</span>
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Course Summary *" maxlength="200" id="txtCourseSummary" aria-describedby="txtCourseSummaryHelp" />
                                                        <small id="txtCourseSummaryHelp" class="form-text">Keep your description brief but compelling
                                                    <span class="float-right">0 / 200</span>
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="form-group color-picker">
                                                        <label for="txtThemeColor">Theme Color</label>
                                                        <input type="color" class="form-control" id="txtCourseThemeColor" onchange="clickColor(0, -1, -1, 5)" value="#161E98" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="form-group">
                                                        <select class="form-control select2 required" id="ddlCourseCategory" style="width: 100% !important">
                                                        <%--<option></option>
                                                            <option value="1">Category 1</option>
                                                            <option value="2">Category 2</option>
                                                            <option value="3">Category 3</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 sharing">
                                                    <div class="form-group radio">
                                                        <label>Sharing</label>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbGlobal" value="1" name="rgSharing" class="custom-control-input" checked>
                                                            <label class="custom-control-label" for="rbGlobal">Global</label>
                                                            <small class="form-text">Anyone within 365 Staff can find and access this course.</small>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbOrganization" value="2" name="rgSharing" class="custom-control-input">
                                                            <label class="custom-control-label" for="rbOrganization">Organization</label>
                                                            <small class="form-text">Anyone within this organization can find and access this course.</small>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbAssigned" value="3" name="rgSharing" class="custom-control-input">
                                                            <label class="custom-control-label" for="rbAssigned">Assigned</label>
                                                            <small class="form-text">Only shared with assignees.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-5 col-lg-4 p-0 logo-tab">
                                            <div class="col-sm-12 mt-3 course-logo">
                                                <div class="form-group m-0">
                                                    <label><i class="fas fa-plus-circle black"></i>Course Logo</label>
                                                    <a class="rounded-icon" onclick="editCourseLogo('.course-logo');"><i class="fas fa-pen"></i></a>
                                                    <div class="custom-file">
                                                        <input type="file" id="imgCourseLogo" onchange="readURL(this, '.logo-img');encodeImagetoBase64(this,'CourseLogo')" >
                                                    </div>
                                                </div>
                                                <div class="logo-img" id="divCourseLogo"></div>
                                                <%-- if image set then use this html --%>
                                                <%--<div class="logo-img img">
                                                    <img src="../INCLUDES/Asset/images/sun.png" class="img-fluid" />
                                                </div>--%>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="ddlTags">Tags</label>
                                                    <select class="form-control select2 required" id="ddlTags" style="width: 100% !important" multiple>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-12 col-md-9">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-black" data-toggle="modal" data-target="#modalAddTag">
                                                      Manage Tags
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-lesson" role="tabpanel" aria-labelledby="pills-lesson-tab">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="col-12 col-sm-12 lesson-wrapper">
                                    <div class="row" id="divLessonAdd">
                                        <div class="col-12 col-sm-12 col-md-8 col-lg-9">
                                            <div class="row">
                                                <div class="col-sm-12 mt-3">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Lesson Title *" maxlength="100" id="txtLessonTitle" aria-describedby="txtLessonTitleHelp" />
                                                        <small id="txtLessonTitleHelp" class="form-text">Keep your names short so they are easier to find
                                                    <span class="float-right">0 / 100</span>
                                                        </small>
                                                    </div>
                                                </div>
                                                <%--<div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Learning Objectives *" maxlength="200" id="txtLearningObjectives" aria-describedby="txtLearningObjectivesHelp" />
                                                        <small id="txtLearningObjectivesHelp" class="form-text">Keep your description brief but compelling
                                                    <span class="float-right">0 / 200</span>
                                                        </small>
                                                    </div>
                                                </div>--%>
                                                <div class="col-sm-12" id="divLessonDescription">
                                                    <div id="txtLessonDescription"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 p-0 logo-tab">
                                            <div class="col-sm-12 mt-3">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Estimated Time</label>
                                                    <input type="text" class="form-control required" maxlength="2" id="txtHour" placeholder="hour" />
                                                    <input type="text" class="form-control required" maxlength="2" id="txtMin" placeholder="minutes" />
                                                </div>
                                            </div>
                                            <div class="col-sm-12 mt-5">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Point</label>
                                                    <input type="text" class="form-control required" id="txtPoint" placeholder="100" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="divLessonGrid" style="display:none;">                                        

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-content" role="tabpanel" aria-labelledby="pills-content-tab">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="col-12 col-sm-12 lesson-wrapper">
                                    <div class="row" id="divContentAdd">
                                        <div class="col-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-12 mt-3">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Content Header *" maxlength="200" id="txtContentHeader" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-12" id="divContentDescription">
                                                    <div id="txtContentDescription"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="divContentGrid" style="display:none;">

                                        <%--Bind Content--%>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-resources" role="tabpanel" aria-labelledby="pills-resources-tab">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                <div class="col-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-12" id="divResourcesDescription" >
                                                    <div id="txtResourcesDescription"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-quiz" role="tabpanel" aria-labelledby="pills-quiz-tab">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                
                                <div class="col-12 col-sm-12">
                                    <div class="row" id="divQuizAdd">
                                        <div class="col-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-12 mt-3">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" placeholder="Quiz Title" id="txtQuizTitle" aria-describedby="txtQuizTitleHelp" />
                                                        <small id="txtQuizTitleHelp" class="form-text">Keep your names short so they are easier to find</small>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" placeholder="Quiz Description" maxlength="200" id="txtQuizDescription" aria-describedby="txtQuizDescriptionHelp" />
                                                        <small id="txtQuizDescriptionHelp" class="form-text">Keep your description brief but compelling</small>
                                                    </div>
                                                </div>


                                                <div class="col-md-3" id="trScoreSummary">
                                                    <div class="form-group">
                                                        <label class="float-left">Total Score: <span id="lblTotalScore">0</span></label>
                                                        <span class="float-right" id="lblPassingScore"></span>
                                                        <input type="range" class="custom-range" min="0" max="100" step="5" id="txtPassingScorePercentage" onchange="ChangePercentage(this.value);">
                                                        <span id="lblPercentage">0%</span>
                                                    </div>
                                                </div>



                                            </div>
                                        </div>
                                        <%--<div class="col-12 col-sm-12 col-md-6 col-lg-3 p-0 logo-tab">
                                            <div class="col-sm-12 mt-3">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Passing Percentage</label>
                                                    <input type="text" class="form-control required" id="txtPassingPercentage" placeholder="+100" />
                                                </div>
                                            </div>
                                        </div>--%>
                                    </div>

                                    <div class="row" id="divQuizGrid" style="display:none;">
                                        <div class="container"> 
                                          <div class="card">
                                            <div class="card-body">
                                                <span>Light card</span><span> Light card</span><span> Light card</span>
                                            </div>
                                          </div>
                                          <br>  
                                          <div class="card">
                                            <div class="card-body">
                                                <span>Light card</span><span> Light card</span><span> Light card</span>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="divQuestion">

                                </div>

                                <div class="col-sm-12 quiz-wrapper" >
                                    <div class="d-flex justify-content-between">
                                        <h5 class="font-weight-bold">Quiz</h5>
                                        <div class="percentage-text">Passing Percentage <span>74</span></div>
                                    </div>
                                    <div class="card shadow-sm">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-12 mb-3 d-flex justify-content-between align-items-center ques">
                                                    <span class="sr">Q1<i class="far fa-circle"></i><i class="fas fa-caret-down"></i></span>
                                                    <div class="col-sm-8 col-md-10">
                                                        <div class="form-group">
                                                            <input readonly type="text" class="form-control" value="What is a Module" />
                                                        </div>
                                                    </div>
                                                    <span class="correct">Correct</span>
                                                </div>

                                                <div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">
                                                    <span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="far fa-circle"></i></span>
                                                    <div class="col-sm-8 col-md-10">
                                                        <div class="row">
                                                            <div class="col-sm-12 col-md-10">
                                                                <div class="form-group">
                                                                    <input readonly type="text" class="form-control" value="A real life business senario" />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3 col-md-2">
                                                                <div class="form-group">
                                                                    <input readonly type="text" class="form-control" value="0" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span class="checked-icon"><i class="far fa-check-circle correct"></i></span>
                                                </div>

                                                <div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">
                                                    <span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="far fa-circle"></i></span>
                                                    <div class="col-sm-8 col-md-10">
                                                        <div class="row">
                                                            <div class="col-sm-12 col-md-10">
                                                                <div class="form-group">
                                                                    <input readonly type="text" class="form-control" value="A single learning topic" />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3 col-md-2">
                                                                <div class="form-group">
                                                                    <input readonly type="text" class="form-control" value="0" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span class="checked-icon"><i class="far fa-check-circle wrong"></i></span>
                                                </div>

                                                <div class="offset-1 offset-sm-1 col-sm-11 mb-2">
                                                    <div class="form-group mt-2">
                                                        <a class="label"><i class="fas fa-plus-circle black"></i>Add Answer</a>
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

            <div class="col-12 col-sm-12 mt-3">                

                <%--Course--%>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddCourse" onclick="AddCourseFromLesson();">Add Lesson</a>

                <%--Lesson--%>
                <a style="display:none;" class="btn btn-outline float-left black" id="btnAddMoreLesson" onclick="AddMore('btnAddMoreLesson');"><i class="fas fa-plus-circle"></i>Add More Lesson</a>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddLession" onclick="AddLessionFromContent();" >Add Content</a>
                
                <%--Content--%>
                <a style="display:none;" class="btn btn-outline float-left black" id="btnAddMoreContent" onclick="AddMore('btnAddMoreContent');"><i class="fas fa-plus-circle"></i>Add More Content</a>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddContent" onclick="AddContentFromResource();" >Add Resource</a>
                
                <%--Resource--%>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddResource" onclick="AddResourceFromQuiz();" >Add Quiz</a>

                <%--Quiz--%>
                <%--<a style="display:none;" class="btn btn-outline float-left black" id="btnAddMoreQuiz" onclick="AddMore('btnAddMoreQuiz');"><i class="fas fa-plus-circle"></i>Add More Quiz</a>--%>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddQuiz" onclick="AddQuizFinal();" >Add Quiz</a>

            </div>
        </div>


        <%--Modal popup region--%>
        
        <div class="modal fade" id="modalAddTag" tabindex="-1" role="dialog" aria-labelledby="modalAddTagTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Add Tag</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-12 mt-3">
                                <div class="form-group">
                                    <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Tag Name *" maxlength="100" id="txtTagName" aria-describedby="txtTagNameHelp" />
                                    <small id="txtTagNameHelp" class="form-text">Add tag name
                                        <span class="float-right">0 / 100</span>
                                    </small>
                                </div>
                            </div>

                            <%--<div class="col-sm-12 mt-4">                            
                                <div class="form-group">
                                    <label>Tags</label>
                                    <div>
                                        <span class="Tag">Admin<a class="close" onclick="DeleteTag(1);" alt="Delete tag">  X</a></span>
                                        <span class="Tag">Developer</span>
                                        <span class="Tag">Beginner</span>
                                        <span class="Tag">Database</span>
                                        <span class="Tag">Salesforce Platform</span>
                                    </div>
                                </div>
                            </div>--%>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="AddTag();" class="btn btn-primary">Add</button>
                        <%--<a id="btnAddTag" onclick="AddTag();" class="btn btn-primary">Add</a>--%>                        
                    </div>
                </div>
            </div>
        </div>

        <%--End Modal popup region--%>

    </div>

    <script>

        var editorContentDesc = new Jodit('#txtContentDescription');
        var editorResourcesDesc = new Jodit('#txtResourcesDescription');
        var editorLessonDesc = new Jodit('#txtLessonDescription');
        var allowedExtensions = ['pdf', 'mp4', 'avi', 'flv', 'wmv', 'mov', '3gp', 'webm', 'wav'];
        var accessToken = '<%=Session["access_token"]%>';

        var CourseFlag = '0';
        var LessonFlag = '0';
        var ContentFlag = '0';
        var ResourceFlag = '0';
        var QuizFlag = '0';

        var AddMoreLessonFlag = 'add';
        var AddMoreContentFlag = 'add';
        var AddMoreQuizFlag = 'add';

        var divLessonFlag = 'add';
        var divContentFlag = 'add';
        var divQuizFlag = 'add';

        var ContentContentTypeID = '1';
        var QuizContentTypeID = '5';
        var passingScore = 0;
        var pasingPercentage = 0;

        $(document).ready(function () {
            debugger
            if (readQueryString()["topic"] != undefined && readQueryString()["topic"] != '')
            {
                CourseFlag = readQueryString()["topic"];
                EditCourse();

                if (readQueryString()["module"] != undefined && readQueryString()["module"] != '')
                {
                    LessonFlag = readQueryString()["module"];

                    if (readQueryString()["content"] != undefined && readQueryString()["content"] != '') {
                        ContentFlag = readQueryString()["content"];
                        //BindContent();
                    }
                    if (readQueryString()["resource"] != undefined && readQueryString()["resource"] != '') {
                        ResourceFlag = readQueryString()["resource"];
                    }
                    if (readQueryString()["quiz"] != undefined && readQueryString()["quiz"] != '') {
                        QuizFlag = readQueryString()["quiz"];
                    }
                }
                if (CourseFlag != '0' && LessonFlag == '0' && ContentFlag == '0' && ResourceFlag == '0' && QuizFlag == '0') {
                    BindLesson('fromtopic');
                }
                else if (CourseFlag != '0' && LessonFlag != '0' && ContentFlag == '0' && ResourceFlag == '0' && QuizFlag == '0') {
                    BindLesson('frommodule');
                }
                else if (CourseFlag != '0' && LessonFlag != '0' && ContentFlag != '0' && ResourceFlag == '0' && QuizFlag == '0') {
                    BindContent('fromcontent');
                }                
            }            
            else {
                ShowButtons('pills-course', 'tabclick');
                GetCourseCategoryTagsAndBadge('view', 0, 0, 0);
            }
        });


        function readQueryString() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }

        function ShowButtons(id,action)
        {
            debugger
            if (id == 'pills-course') {
                $('#btnAddCourse').show();
                $('#btnAddMoreLesson').hide();
                $('#btnAddLession').hide();
                $('#btnAddMoreContent').hide();
                $('#btnAddContent').hide();
                $('#btnAddResource').hide();
                //$('#btnAddMoreQuiz').hide();
                $('#btnAddQuiz').hide();
            }
            else if (id == 'pills-lesson') {
                if (CourseFlag != '0') {
                    $('#btnAddCourse').hide();
                    $('#btnAddMoreLesson').show();
                    $('#btnAddLession').show();
                    $('#btnAddMoreContent').hide();
                    $('#btnAddContent').hide();
                    $('#btnAddResource').hide();
                    //$('#btnAddMoreQuiz').hide();
                    $('#btnAddQuiz').hide();

                    if (divLessonFlag == 'new') {
                        $('#btnAddLession').hide();
                        $('#divLessonAdd').hide();
                        $('#divLessonGrid').show();
                    }
                    else if (divLessonFlag == 'add') {
                        $('#btnAddMoreLesson').show();
                        $('#btnAddLession').show();

                        $('#divLessonAdd').show();
                        $('#divLessonGrid').hide();
                    }
                    else if (divLessonFlag == 'bindtile') {
                        $('#btnAddMoreLesson').show();
                        $('#btnAddLession').hide();

                        $('#divLessonAdd').hide();
                        $('#divLessonGrid').show();
                    }
                }
                else {
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not Added Course, Requesting to add Course.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-course-tab');
                        }
                    });
                }
            }
            else if (id == 'pills-content') {

                if (CourseFlag != '0' && LessonFlag != '0') {
                    $('#btnAddCourse').hide();
                    $('#btnAddMoreLesson').hide();
                    $('#btnAddLession').hide();
                    $('#btnAddMoreContent').show();
                    $('#btnAddContent').show();
                    $('#btnAddResource').hide();
                    //$('#btnAddMoreQuiz').hide();
                    $('#btnAddQuiz').hide();

                    if (divContentFlag == 'new') {
                        $('#btnAddContent').hide();
                        $('#divContentAdd').hide();
                        $('#divContentGrid').show();
                    }
                    else if (divContentFlag == 'add') {
                        $('#btnAddMoreContent').show();
                        $('#btnAddContent').show();

                        $('#divContentAdd').show();
                        $('#divContentGrid').hide();
                    }
                    else if (divContentFlag == 'bindtile') {
                        $('#btnAddMoreContent').show();
                        $('#btnAddContent').hide();

                        $('#divContentAdd').hide();
                        $('#divContentGrid').show();
                    }
                    else if (divContentFlag == 'bindtileafterlessonadd') {
                        //$('#btnAddMoreContent').show();
                        //$('#btnAddContent').hide();

                        //$('#divContentAdd').hide();
                        //$('#divContentGrid').show();

                        BindContent('addmore');
                    }
                }
                else if (CourseFlag != '0' && LessonFlag == '0') {                    
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not selected Lesson, Requesting to select Lesson.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-lesson-tab');
                        }
                    });
                }
                else {
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not Added Course, Requesting to add Course.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-course-tab');
                        }
                    });
                }                
            }
            else if (id == 'pills-resources') {
                if (CourseFlag != '0' && LessonFlag != '0') {
                    $('#btnAddCourse').hide();
                    $('#btnAddMoreLesson').hide();
                    $('#btnAddLession').hide();
                    $('#btnAddMoreContent').hide();
                    $('#btnAddContent').hide();
                    $('#btnAddResource').show();
                    //$('#btnAddMoreQuiz').hide();
                    $('#btnAddQuiz').hide();
                }
                else if (CourseFlag != '0' && LessonFlag == '0') {
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not selected Lesson, Requesting to select Lesson.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-lesson-tab');
                        }
                    });
                }
                else {                    
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not Added Course, Requesting to add Course.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-course-tab');
                        }
                    });
                }
            }
            else if (id == 'pills-quiz') {
                if (CourseFlag != '0' && LessonFlag != '0') {
                    $('#btnAddCourse').hide();
                    $('#btnAddMoreLesson').hide();
                    $('#btnAddLession').hide();
                    $('#btnAddMoreContent').hide();
                    $('#btnAddContent').hide();
                    $('#btnAddResource').hide();
                    //$('#btnAddMoreQuiz').show();
                    $('#btnAddQuiz').show();

                    if (divQuizFlag == 'new') {
                        $('#btnAddLession').hide();
                    }
                }
                else if (CourseFlag != '0' && LessonFlag == '0') {
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not selected Lesson, Requesting to select Lesson.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-lesson-tab');
                        }
                    });
                }
                else {
                    Swal.fire({
                        title: "Failure",
                        text: "It seems you have not Added Course, Requesting to add Course.",
                        icon: "error"
                    }).then((value) => {
                        if (value) {
                            nextTab('pills-course-tab');
                        }
                    });
                }
            }
            else {
                location.reload();
            }
        }

        function SaveAsDraft(el) {
            debugger
            //var active_button = $('#pills-tabContent div#pills-course');
            //var activeTabID = $(active_button).attr('id');
            var activeTabID = $('#pills-tabContent div.active').attr('id');

            if (activeTabID == 'pills-course') {
                AddCourse('redirect');
            }
            else if (activeTabID == 'pills-lesson') {

                var result = validateAddLesson();
                if (result.error) {
                    Swal.fire({
                        title: "Alert",
                        text: result.msg,
                        icon: "error",
                        button: "Ok",
                    });
                }
                else {
                    AddLession('redirect');
                }
            }
            else if (activeTabID == 'pills-content') {
                var result = validateAddContent();
                if (result.error) {
                    Swal.fire({
                        title: "Alert",
                        text: result.msg,
                        icon: "error",
                        button: "Ok",
                    });
                }
                else {
                    AddContent('redirect');
                }
            }
            else if (activeTabID == 'pills-resources') {
                var result = validateAddResource();
                if (result.error) {
                    Swal.fire({
                        title: "Alert",
                        text: result.msg,
                        icon: "error",
                        button: "Ok",
                    });
                }
                else {
                    AddResource('redirect');
                }
            }
            else if (activeTabID == 'pills-quiz') {

            }
            else {
                Swal.fire("Oops! Something went wrong. Please try again", {
                    icon: "error",
                });
            }
        }

        function AddMore(id)
        {
            debugger
            if (id == 'btnAddMoreLesson')
            {
                if (AddMoreLessonFlag == 'add')
                {
                    var result = validateAddLesson();
                    if (result.error) {
                        Swal.fire({
                            title: "Alert",
                            text: result.msg,
                            icon: "error",
                            button: "Ok",
                        });
                    }
                    else {
                        $('#btnAddMoreLesson').show();
                        $('#btnAddLession').hide();

                        $('#divLessonAdd').hide();
                        $('#divLessonGrid').show();
                        AddMoreLessonFlag = 'more';

                        AddLession('addmore');
                    }
                }
                else if (AddMoreLessonFlag == 'bindtile') {
                    ClearFieldsAddLesson();
                    $('#btnAddMoreLesson').show();
                    $('#btnAddLession').hide();

                    $('#divLessonAdd').hide();
                    $('#divLessonGrid').show();
                    AddMoreLessonFlag = 'more';                    
                }
                else {
                    ClearFieldsAddLesson();                    
                    $('#btnAddMoreLesson').show();
                    $('#btnAddLession').show();

                    $('#divLessonAdd').show();
                    $('#divLessonGrid').hide();
                    AddMoreLessonFlag = 'add';
                    divLessonFlag = 'add';
                    LessonFlag = '0';
                }
            }
            else if (id == 'btnAddMoreContent') {
                //$('#btnAddMoreContent').show();
                //$('#btnAddContent').hide();

                if (AddMoreContentFlag == 'add') {

                    var result = validateAddContent();
                    if (result.error) {
                        Swal.fire({
                            title: "Alert",
                            text: result.msg,
                            icon: "error",
                            button: "Ok",
                        });
                    }
                    else {
                        $('#btnAddMoreContent').show();
                        $('#btnAddContent').hide();

                        $('#divContentAdd').hide();
                        $('#divContentGrid').show();
                        AddMoreContentFlag = 'more';

                        AddContent('addmore');
                    }
                }
                else if (AddMoreContentFlag == 'bindtile') {
                    ClearFieldsAddContent();
                    $('#btnAddMoreContent').show();
                    $('#btnAddContent').hide();

                    $('#divContentAdd').hide();
                    $('#divContentGrid').show();
                    AddMoreContentFlag = 'more';
                }
                else {
                    ClearFieldsAddContent();                    
                    $('#btnAddMoreContent').show();
                    $('#btnAddContent').show();

                    $('#divContentAdd').show();
                    $('#divContentGrid').hide();
                    AddMoreContentFlag = 'add';


                    ClearFieldsAddLesson();
                    $('#btnAddMoreContent').show();
                    $('#btnAddContent').show();

                    $('#divContentAdd').show();
                    $('#divContentGrid').hide();
                    AddMoreContentFlag = 'add';
                    divContentFlag = 'add';
                    ContentFlag = '0';
                }
            }
            /*
            else if (id == 'btnAddMoreQuiz') {
                $('#btnAddMoreQuiz').show();
                $('#btnAddQuiz').hide();

                if (AddMoreQuizFlag == 'add') {
                    //AddQuiz();

                    //OnSuccess
                    $('#divQuizAdd').hide();
                    $('#divQuizGrid').show();
                    AddMoreQuizFlag = 'more';
                }
                else {
                    ClearFieldsAddQuiz();                    
                    $('#btnAddMoreQuiz').show();
                    $('#btnAddQuiz').show();

                    $('#divQuizAdd').show();
                    $('#divQuizGrid').hide();
                    AddMoreQuizFlag = 'add';
                }
            }
            */
        }

        function nextTab(tabID)
        {
            $("#"+tabID).click();
        }


        function GetCourseCategoryTagsAndBadge(flag, CourseCategoryID, AchievementBadgeID, TagID) {
            var getUrl = "/API/Content/GetCourseCategoryTagsAndBadge";
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                contentType: "application/json",
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);
                        HideLoader();
                        if (DataSet.StatusCode == "1") {
                            var Tags = DataSet.Data.Tag;
                            var AchievementBadge = DataSet.Data.AchievementBadge;
                            var CourseCategory = DataSet.Data.CourseCategory;

                            if (Tags != undefined && Tags.length > 0) {
                                $('#ddlTags').empty().append('<option></option>');
                                for (var i = 0; i < Tags.length; i++) {
                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                }
                                selectInit('#ddlTags', 'Select Tag');
                            }
                            //if (AchievementBadge != undefined && AchievementBadge.length > 0) {
                            //    $('#ddlAchievementBadge').empty().append('<option></option>');
                            //    for (var i = 0; i < AchievementBadge.length; i++) {
                            //        $('#ddlAchievementBadge').append('<option value="' + AchievementBadge[i].BadgeID + '">' + AchievementBadge[i].BadgeName + '</option>');
                            //    }
                            //    selectInit('#ddlAchievementBadge', 'Select Achievement Badge');
                            //}
                            if (CourseCategory != undefined && CourseCategory.length > 0) {
                                $('#ddlCourseCategory').empty().append('<option></option>');
                                for (var i = 0; i < CourseCategory.length; i++) {
                                    $('#ddlCourseCategory').append('<option value="' + CourseCategory[i].CategoryID + '">' + CourseCategory[i].Title + '</option>');
                                }
                                selectInit('#ddlCourseCategory', 'Select Course Category');
                            }
                            if (flag == 'update') {
                                debugger
                                $('#ddlCourseCategory').val(CourseCategoryID).trigger('change');
                                //$('#ddlAchievementBadge').val(AchievementBadgeID).trigger('change');

                                if (TagID != undefined) {
                                    for (i = 0; i < 1; i++) {
                                        if (TagID.includes(',,')) {
                                            TagID = TagID.replace(",,", ",");
                                            if (TagID.includes(',,')) {
                                                i--;
                                            }
                                        }
                                    }
                                    TagID = TagID.replace(/,\s*$/, "");
                                    var selectedTagsArray = TagID.split(',');
                                    $("#ddlTags").val(selectedTagsArray).trigger('change');
                                }
                            }
                        }
                        else {
                            if (DataSet.Data != undefined && DataSet.Data.length > 0) {
                                Swal.fire(DataSet.Data[0].ReturnMessage, {
                                    icon: "error",
                                });
                            }
                            else {
                                Swal.fire(DataSet.StatusDescription, {
                                    icon: "error",
                                });
                            }
                        }
                    }
                    catch (e) {
                        HideLoader();
                    }
                },
                failure: function (response) {
                    HideLoader();
                }
            });
        }

        function ClearFieldsAddCourse() {
            $('#txtCourseTitle').val('');
            $('#txtCourseSummary').val('');
            $('#txtCourseThemeColor').val('');
            $('#ddlCourseCategory').val('').trigger('change');
            $("#rbGlobal").prop("checked", true)
            $('#txtCourseThemeColor').val('#161E98');
            $("#ddlTags option:selected").prop("selected", false);
            selectInit('#ddlTags ', 'Select Tag');
        }

        function validateAddCourse()
        {
            if ($("#txtCourseTitle").val() == undefined || $("#txtCourseTitle").val() == '') {
                return { error: true, msg: "Please enter Course Title" };
            }
            else if ($("#txtCourseSummary").val() == undefined || $("#txtCourseSummary").val() == '') {
                return { error: true, msg: "Please enter Course Summary" };
            }
            else if ($("#txtCourseThemeColor").val() == undefined || $("#txtCourseThemeColor").val() == '') {
                return { error: true, msg: "Please enter Course Theme color" };
            }
            else if ($("#ddlCourseCategory option:selected").val() == undefined || $("#ddlCourseCategory option:selected").val() == '') {
                return { error: true, msg: "Please select Course Category" };
            }
            else if ($("#rbGlobal").prop("checked") == false && $("#rbOrganization").prop("checked") == false && $("#rbAssigned").prop("checked") == false) {
                return { error: true, msg: "Please select sharing option" };
            }
            return true;
        }
        
        function AddCourseFromLesson()
        {
            debugger            
            AddCourse('nexttab');
        }
        
        function AddCourse(flag) {
            debugger
            var getUrl;
            var requestParams;
            var result = validateAddCourse();
            if (result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {
                ShowLoader();
                var _Topic_Id;
                var _SrNo = "1";
                var _Title = $('#txtCourseTitle').val();
                var _Description = $('#txtCourseSummary').val();
                //var _IsPublished = $('#cbIsPublished').prop('checked');

                var _CategoryColor = $('#txtCourseThemeColor').val();
                var _CourseCategory = $("#ddlCourseCategory option:selected").val();

                //var _Points = $('#txtPoints').val();
                //var _CourseTime = $('#txtCourseTime').val();
                //var _IsGlobal = $('#cbIsGlobal').prop('checked');
                //var _AchievementBadge = $("#ddlAchievementBadge option:selected").val();
                //var _Accessibility = $("#ddlAccessibility option:selected").val();

                var _Accessibility = '';
                if ($("#rbGlobal").prop("checked") == true) {
                    _Accessibility = $("#rbGlobal").val();
                }
                else if ($("#rbOrganization").prop("checked") == true) {
                    _Accessibility = $("#rbOrganization").val();
                }
                else if ($("#rbAssigned").prop("checked") == true) {
                    _Accessibility = $("#rbAssigned").val();
                }

                var selectedTagsArray = $('#ddlTags').val();
                var _selectedTags = '';
                if (selectedTagsArray.length > 0) {
                    for (i = 0; i < selectedTagsArray.length; i++) {
                        _selectedTags = _selectedTags + selectedTagsArray[i] + ',';
                    }
                    _selectedTags = _selectedTags.replace(/,\s*$/, "");
                }

                if (CourseFlag == '0') {
                    getUrl = "/API/Content/CreateTopic";

                } else {
                    _Topic_Id = CourseFlag;
                    getUrl = "/API/Content/ModifyTopic";
                }

                //requestParams = { TopicID: _Topic_Id, TopicTitle: _Title, TopicDescription: _Description, IsPublished: _IsPublished, SrNo: _SrNo, MinUnlockedModules: "", UserID: "", IsActive: true, CourseCategory: _CourseCategory, CategoryColor: _CategoryColor, Points: _Points, CourseTime: _CourseTime, AchievementBadge: _AchievementBadge, Accessibility: _Accessibility, CourseLogoBase64: base64CourseLogo, selectedTags: _selectedTags };
                requestParams = {
                    TopicID: _Topic_Id, TopicTitle: _Title, TopicDescription: _Description, SrNo: _SrNo, MinUnlockedModules: "", UserID: "", IsActive: true, CourseCategory: _CourseCategory
                    , CategoryColor: _CategoryColor, Accessibility: _Accessibility, CourseLogoBase64: base64CourseLogo, selectedTags: _selectedTags
                };

                try {
                    $.ajax({
                        type: "POST",
                        url: getUrl,
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: JSON.stringify(requestParams),
                        contentType: "application/json",
                        success: function (response) {
                            try {
                                if (response != null) {
                                    debugger
                                    var DataSet = $.parseJSON(response);
                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {
                                            if (flag == 'redirect') {
                                                Swal.fire({
                                                    title: "Success",
                                                    text: DataSet.Data[0].ReturnMessage,
                                                    icon: "success"
                                                }).then((value) => {
                                                    if (value) {
                                                        document.location = 'Dashboard.aspx';
                                                    }
                                                });
                                            }
                                            else if (flag == 'nexttab') {
                                                HideLoader();
                                                if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                                    CourseFlag = DataSet.Data[0].InsertedID;
                                                }

                                                SetProgressBar();
                                                //ClearFieldsAddCourse();

                                                Swal.fire({
                                                    title: "Success",
                                                    text: DataSet.Data[0].ReturnMessage,
                                                    icon: "success"
                                                }).then((value) => {
                                                    if (value) {
                                                        debugger
                                                        nextTab('pills-lesson-tab');
                                                    }
                                                });
                                            }
                                            else {
                                                Swal.fire({
                                                    title: "Failure",
                                                    text: DataSet.StatusDescription,
                                                    icon: "error"
                                                });
                                            }
                                        }
                                        else {
                                            HideLoader();
                                            Swal.fire({
                                                title: "Failure",
                                                text: DataSet.StatusDescription,
                                                icon: "error"
                                            });
                                            clearFields('.input-validation');
                                        }
                                    }
                                    else {
                                        HideLoader();
                                        Swal.fire({
                                            title: "Failure",
                                            text: "Please try Again",
                                            icon: "error"
                                        });
                                    }
                                }
                                else {
                                    HideLoader();
                                    Swal.fire({
                                        title: "Failure",
                                        text: "Please try Again",
                                        icon: "error"
                                    });

                                }
                            }
                            catch (e) {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error"
                                });
                            }
                        },
                        complete: function () {
                            HideLoader();
                        },
                        failure: function (response) {
                            HideLoader();
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error"

                            });
                        }
                    });
                }
                catch (e) {
                    HideLoader();
                    Swal.fire({
                        title: "Alert",
                        text: "Please try again",
                        icon: "error"

                    });
                }
            }
        }

        function EditCourse() {
            debugger
            ClearFieldsAddCourse();

            ShowLoader();
            var getUrl = "/API/Content/EditTopic";
            var requestParams = { TopicID: CourseFlag };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                async: false,
                contentType: "application/json",
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);
                        HideLoader();
                        if (DataSet.StatusCode == "1") {
                            debugger
                            var EditTopic = DataSet.Data.Data;

                            $('#txtCourseTitle').val(EditTopic[0].Title);
                            $('#txtCourseSummary').val(EditTopic[0].Description);
                            $('#txtCourseThemeColor').val(EditTopic[0].CategoryColor);

                            if (EditTopic[0].Accessibility == '2') {
                                $("#rbOrganization").prop("checked", true)
                            }
                            else if (EditTopic[0].Accessibility == '3') {
                                $("#rbAssigned").prop("checked", true)
                            }
                            else {
                                $("#rbGlobal").prop("checked", true)
                            }

                            if (EditTopic[0].FilePath != undefined && EditTopic[0].FilePath != null && EditTopic[0].FilePath != '')
                            {
                                $("#imgCourseLogo").attr("src", "../Files/CourseLogo/" + EditTopic[0].FilePath);
                                $("#divCourseLogo").addClass('img');
                                $("#divCourseLogo").append('<img src="../Files/CourseLogo/' + EditTopic[0].FilePath + '" alt="Course Logo" class="img-fluid">');
                            }
                            
                            GetCourseCategoryTagsAndBadge('update', EditTopic[0].CategoryID, 0, EditTopic[0].TagID);

                            nextTab('pills-course-tab');
                        }
                        else {
                            if (DataSet.Data != undefined && DataSet.Data.length > 0) {
                                Swal.fire(DataSet.Data[0].ReturnMessage, {
                                    icon: "error",
                                });
                            }
                            else {
                                Swal.fire(DataSet.StatusDescription, {
                                    icon: "error",
                                });
                            }
                        }
                    }
                    catch (e) {
                        HideLoader();
                    }
                },
                failure: function (response) {
                    HideLoader();
                }
            });
        }        


        function ClearFieldsAddLesson() {
            $('#txtLessonTitle').val('');
            //$('#txtLearningObjectives').val('');
            $('#divLessonDescription').empty().append('<div id="txtLessonDescription"></div>');
            var editorContentDesc = new Jodit('#txtLessonDescription');
            //$('#txtEstimatedTime').val('');
            $('#txtHour').val('');
            $('#txtMin').val('');
            $('#txtPoint').val('');
        }

        function validateAddLesson()
        {
            if ($("#txtLessonTitle").val() == undefined || $("#txtLessonTitle").val() == '') {
                return { error: true, msg: "Please enter Lesson Title" };
            }
            //else if ($("#txtLearningObjectives").val() == undefined || $("#txtLearningObjectives").val() == '') {
            //    return { error: true, msg: "Please enter Learning Objectives" };
            //}
            else if ($('#divLessonDescription').find('.jodit_wysiwyg').text() == undefined || $('#divLessonDescription').find('.jodit_wysiwyg').text() == '') {
                return { error: true, msg: "Please enter Lesson Details" };
            }
            //else if ($("#txtEstimatedTime").val() == undefined || $("#txtEstimatedTime").val() == '') {
            //    return { error: true, msg: "Please enter Estimate Time" };
            //}
            else if ($("#txtHour").val() == undefined || $("#txtHour").val() == '') {
                return { error: true, msg: "Please enter Hour" };
            }
            else if ($("#txtMin").val() == undefined || $("#txtMin").val() == '') {
                return { error: true, msg: "Please enter Minute" };
            }
            else if ($("#txtPoint").val() == undefined || $("#txtPoint").val() == '') {
                return { error: true, msg: "Please enter Point" };
            }
            else if (CourseFlag == '0') {
                return { error: true, msg: "Oops ! Something went wrong. PLease try again." };
            }
            return true;
        }

        function AddLessionFromContent()
        {
            var result = validateAddLesson();
            if (result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {
                AddLession('nexttab');
            }
        }

        function AddLession(flag)
        {            
            var getUrl;
            ShowLoader();
            var _Topic_Id = CourseFlag;
            var _Title = $('#txtLessonTitle').val();
            //var _Overview = $('#txtLearningObjectives').val();
            var _Overview = $('#divLessonDescription').find('.jodit_wysiwyg').text();
            //var _Description = $('#txtDescription').val();
            //var _IsPublished = $('#cbIsPublished').prop('checked');
                
            var _Points = $('#txtPoint').val();
            //var _CourseTime = $('#txtEstimatedTime').val();
            var _CourseTime = $('#txtHour').val() + ':' + $('#txtMin').val();

            var ID;
            if (LessonFlag == '0') {
                getUrl = "/API/Content/CreateModule";

            } else {
                ID = LessonFlag;
                getUrl = "/API/Content/ModifyModule";
            }

            var _SrNo = "";
            try {
                var requestParams = { TopicID: _Topic_Id, ModuleTitle: _Title, ModuleOverview: _Overview, SrNo: _SrNo, UserID: "", IsActive: true, ModuleID: ID, Points: _Points, CourseTime: _CourseTime };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    async: false,
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            debugger
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1")
                                {                                        
                                    if (flag == 'redirect')
                                    {
                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                document.location = 'Dashboard.aspx';
                                            }
                                        });
                                    }
                                    else if (flag == 'nexttab')
                                    {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        SetProgressBar();
                                        ClearFieldsAddLesson();
                                        BindLesson('nexttab');

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                if (AddMoreLessonFlag == 'add')
                                                {
                                                    nextTab('pills-content-tab');                                                    
                                                }
                                            }
                                        });
                                    }
                                    else if (flag == 'addmore') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        SetProgressBar();
                                        ClearFieldsAddLesson();
                                        BindLesson('addmore');

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        });
                                    }
                                }
                                else {
                                    Swal.fire({
                                        title: "Failure",
                                        text: DataSet.StatusDescription,
                                        icon: "error"
                                    });
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error"
                                });
                            }
                        }
                        catch (e) {
                            HideLoader();
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error"
                            });
                        }
                    },
                    complete: function () {
                        HideLoader();
                    },
                    failure: function (response) {
                        HideLoader();
                        alert(response.data);
                        Swal.fire({
                            title: "Failure",
                            text: "Please try Again",
                            icon: "error"
                        });
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({
                    title: "Alert",
                    text: "Oops! An Occured. Please try again",
                    icon: "error"

                });
            }
        }

        function EditLesson() {
            debugger
            ClearFieldsAddLesson();

            ShowLoader();
            var getUrl = "/API/Content/EditModule";
            var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                async: false,
                contentType: "application/json",
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);
                        HideLoader();
                        if (DataSet.StatusCode == "1") {
                            debugger
                            var EditModule = DataSet.Data.Data;

                            $('#txtLessonTitle').val(EditModule[0].Title);
                            //$('#txtLearningObjectives').val(EditModule[0].Overview);
                            $('#divLessonDescription').find('.jodit_wysiwyg').text(EditModule[0].Overview);


                            //$('#txtEstimatedTime').val(EditModule[0].CourseTime);
                            if (EditModule[0].CourseTime != '' && EditModule[0].CourseTime.split(":").length > 0) {
                                $('#txtHour').val(EditModule[0].CourseTime.split(":")[0]);
                                if (EditModule[0].CourseTime.split(":").length > 1) {
                                    $('#txtMin').val(EditModule[0].CourseTime.split(":")[1]);
                                }
                                else {
                                    $('#txtMin').val('00');
                                }
                            }
                            else {
                                $('#txtHour').val('');
                                $('#txtMin').val('');
                            }

                            $('#txtPoint').val(EditModule[0].Points);

                            nextTab('pills-lesson-tab');
                        }
                        else {
                            if (DataSet.Data != undefined && DataSet.Data.length > 0) {
                                Swal.fire(DataSet.Data[0].ReturnMessage, {
                                    icon: "error",
                                });
                            }
                            else {
                                Swal.fire(DataSet.StatusDescription, {
                                    icon: "error",
                                });
                            }
                        }
                    }
                    catch (e) {
                        HideLoader();
                    }
                },
                failure: function (response) {
                    HideLoader();
                }
            });
        }

        function EditLessionFromTile(obj,id)
        {
            debugger                        
            $('#txtLessonTitle').val($(obj).parent().parent().parent().parent().find('#spTitle').text());
            //$('#txtLearningObjectives').val($(obj).parent().parent().parent().parent().find('#spOverview').text());
            $('#divLessonDescription').find('.jodit_wysiwyg').text($(obj).parent().parent().parent().parent().find('#spOverview').text());
            //$('#txtEstimatedTime').val($(obj).parent().parent().parent().parent().find('#spCourseTime').text());

            if ($(obj).parent().parent().parent().parent().find('#spCourseTime').text() != undefined
                && $(obj).parent().parent().parent().parent().find('#spCourseTime').text() != ''
                && $(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":").length > 0
                )
            {
                $('#txtHour').val($(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":")[0]);
                if ($(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":").length > 1)
                {
                    $('#txtMin').val($(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":")[1]);
                }
            }
            else {
                $('#txtHour').val('');
                $('#txtMin').val('');
            }

            
            $('#txtPoint').val($(obj).parent().parent().parent().parent().find('#spPoints').text());

            LessonFlag = id;
            AddMoreLessonFlag = 'add';
            divLessonFlag = 'add';
            nextTab('pills-lesson-tab');

            BindResource();
        }

        function DeleteLessionFromTile(obj, id)
        {
            debugger
            LessonFlag = id;
            ShowLoader();
            var getUrl = "/API/Content/DeleteModule";

            try {
                var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, IsActive:0 };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    async: false,
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            debugger
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {
                                            LessonFlag = '0';
                                            BindLesson('addmore');
                                        }
                                    });
                                }
                                else {
                                    Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error"});
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({ title: "Failure", text: "Please try Again", icon: "error"});
                            }
                        }
                        catch (e) {
                            HideLoader();
                            Swal.fire({ title: "Failure",text: "Please try Again",icon: "error"});
                        }
                    },
                    complete: function () {
                        HideLoader();
                    },
                    failure: function (response) {
                        HideLoader();
                        alert(response.data);
                        Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again",icon: "error"});
            }
        }

        function BindLesson(flag)
        {
            var getUrl = "/API/Content/GetModules";
            var requestParams = { TopicID: CourseFlag, Flag: 'learningjourney' };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                async: false,
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);
                        debugger
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                
                                var Modules = DataSet.Data;
                                var tblModules = '';

                                $('#divLessonGrid').empty();
                                if (Modules != undefined && Modules.length > 0) {

                                    for (var i = 0; i < Modules.length; i++) {

                                        tblModules = tblModules + '<div class="card shadow-sm" id="divLessonTile"><div class="card-body">';
                                        tblModules = tblModules + '<div class="tag"><span id="spTitle" >' + Modules[i].Title + '</span></div>';
                                        tblModules = tblModules + '<i class="fas fa-grip-vertical grid-icon"></i>';
                                        tblModules = tblModules + '<div class="row">';
                                        tblModules = tblModules + '<div class="col-sm-12 col-md-9 col-lg-10">';
                                        tblModules = tblModules + '<h5 class="card-title" id="spOverview">' + Modules[i].Overview + '</h5>';                                        
                                        tblModules = tblModules + '<p class="card-text">~<span id="spCourseTime">' + Modules[i].CourseTime + '</span> mins</p>';
                                        tblModules = tblModules + '<span id="spPoints" style="display:none;">' + Modules[i].Points + '</span>';
                                        tblModules = tblModules + '</div>';
                                        tblModules = tblModules + '<div class="col-sm-12 col-md-3 col-lg-2"><div class="action">';
                                        //tblContents = tblContents + '<i class="far fa-eye"></i>';
                                        tblModules = tblModules + '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteLessionFromTile(this,' + Modules[i].ModuleID + ')";></i><span></span>';
                                        tblModules = tblModules + '<i class="fas fa-edit" title="Edit" onclick="EditLessionFromTile(this,' + Modules[i].ModuleID + ')";></i>';
                                        tblModules = tblModules + '</div></div></div></div></div>';
                                    }
                                }
                                else {
                                    tblModules = tblModules + '<div class="container"><h3>Lesson Not Found</h3></div>';
                                }
                                $('#divLessonGrid').append(tblModules);

                                if (flag == 'frommodule') {
                                    $("#sp" + LessonFlag).click();
                                }
                                else if (flag == 'fromtopic') {
                                    AddMoreLessonFlag = 'bindtile';
                                    divLessonFlag = 'bindtile';
                                    AddMore('btnAddMoreLesson');
                                    nextTab('pills-course-tab');
                                }
                                else if (flag == 'nexttab') {
                                    AddMoreLessonFlag = 'bindtile';
                                    divLessonFlag = 'bindtile';
                                    AddMore('btnAddMoreLesson');

                                    divContentFlag = 'bindtileafterlessonadd';
                                    nextTab('pills-content-tab');
                                }
                                else if (flag == 'addmore') {
                                    AddMoreLessonFlag = 'bindtile';
                                    divLessonFlag = 'bindtile';
                                    AddMore('btnAddMoreLesson');
                                }
                            }
                            else {
                                Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error" });
                            }
                        }
                        else {
                            HideLoader();
                            Swal.fire({ title: "Failure", text: "Please try Again",icon: "error" });
                        }
                    }
                    catch (e) {
                        HideLoader();
                        Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                    }
                },
                complete: function () {
                    HideLoader();
                },
                failure: function (response) {
                    HideLoader();
                    Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                }
            });
        }


        function ClearFieldsAddContent() {
            $('#txtContentHeader').val('');
            $('#divContentDescription').empty().append('<div id="txtContentDescription"></div>');
            var editorContentDesc = new Jodit('#txtContentDescription');
        }

        function validateAddContent()
        {
            if ($("#txtContentHeader").val() == undefined || $("#txtContentHeader").val() == '') {
                return { error: true, msg: "Please enter Content Header" };
            }
            else if ($('#divContentDescription').find('.jodit_wysiwyg').text() == undefined || $('#divContentDescription').find('.jodit_wysiwyg').text() == '') {
                return { error: true, msg: "Please enter Content Details" };
            }
            else if (CourseFlag == '0' || LessonFlag == '0') {
                return { error: true, msg: "Oops ! Something went wrong. PLease try again." };
            }
            return true;
        }

        function AddContentFromResource()
        {
            debugger
            var result = validateAddContent();
            if (result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {
                AddContent('nexttab');
            }
        }

        function AddContent(flag)
        {
            debugger
            var getURL = '';
            var regex = '';
            var formdata = new FormData();
            var selectedDocType = 'TEXT';
            var isUrl = '';
            var index = 1;
            var ContentID = '';

            if (ContentFlag == '0') {
                getURL = "/API/Content/CreateContent";
            }
            else {
                ContentID = ContentFlag;
                getURL = "/API/Content/ModifyContent";
            }

            formdata.append("ContentID", ContentID);
            formdata.append("SrNo", index);
            formdata.append("DocType", selectedDocType);
            formdata.append("Title", $("#txtContentHeader").val());
            formdata.append("Description", $('#divContentDescription').find('.jodit_wysiwyg').text());
            formdata.append("Overview", "");
            formdata.append("IsGift", "");
            formdata.append("IsPublished", "");
            formdata.append("CourseTime", "");
            formdata.append("TopicID", CourseFlag);
            formdata.append("ModuleID", LessonFlag);
            formdata.append("TypeID", "1");
            formdata.append("FlashcardTitle", "");
            formdata.append("IsActive", "");
            formdata.append("TotalScore", "");
            formdata.append("PassingPercent", "");
            formdata.append("PassingScore", "");
            formdata.append("FlashcardHighlights", "");
            formdata.append("SkipFlashcards", "");
            formdata.append("IsURL", isUrl);
            ShowLoader();

            $.ajax({
                type: "POST",
                url: getURL,
                headers: { "Authorization": "Bearer " + accessToken },
                data: formdata,
                contentType: false,
                processData: false,
                success: function (response) {
                    try {
                        debugger
                        var DataSet = $.parseJSON(response);
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                ClearFieldsAddContent();
                                HideLoader();                                

                                if (flag == 'redirect') {
                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {
                                            document.location = 'Dashboard.aspx';
                                        }
                                    });
                                }
                                else if (flag == 'nexttab') {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    SetProgressBar();
                                    ContentFlag = '0';
                                    BindContent('nexttab');

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {
                                            if (AddMoreContentFlag == 'add') {
                                                nextTab('pills-resources-tab');
                                            }
                                        }
                                    });
                                }
                                else if (flag == 'addmore') {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    SetProgressBar();
                                    ContentFlag = '0';
                                    BindContent('addmore');

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    });
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: DataSet.StatusDescription,
                                    icon: "error"
                                });
                            }
                        }
                        else {
                            HideLoader();
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error"
                            });
                        }
                    }
                    catch (e) {
                        HideLoader();
                        Swal.fire({
                            title: "Failure",
                            text: "Please try Again",
                            icon: "error"
                        });
                    }
                },
                complete: function () {
                    HideLoader();
                },
                failure: function (response) {
                    HideLoader();
                    alert(response.data);
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error"
                    });
                }
            });
        }

        function EditContentFromTile(obj, id) {
            debugger
            $('#txtContentHeader').val($(obj).parent().parent().parent().parent().find('#spTitle').text());
            $('#divContentDescription').find('.jodit_wysiwyg').text($(obj).parent().parent().parent().parent().find('#spOverview').text());

            ContentFlag = id;
            AddMoreContentFlag = 'add';
            divContentFlag = 'add';
            nextTab('pills-content-tab');
        }

        function DeleteContentFromTile(obj, id)
        {
            debugger
            debugger
            ContentFlag = id;
            ShowLoader();
            var getUrl = "/API/Content/DeleteContent";

            try {
                var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag,p_ContentID: ContentFlag, IsActive: 0 };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    async: false,
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            debugger
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {
                                            ContentFlag = '0';
                                            BindContent('addmore');
                                        }
                                    });
                                }
                                else {
                                    Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error" });
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                            }
                        }
                        catch (e) {
                            HideLoader();
                            Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                        }
                    },
                    complete: function () {
                        HideLoader();
                    },
                    failure: function (response) {
                        HideLoader();
                        alert(response.data);
                        Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error" });
            }
        }

        function is_valid_url(url) {
            return /^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/.test(url);
        }

        function BindURL(Description)
        {
            var FilePath = "";
            var returnString = ''

            if (Description != "" && Description != undefined) {
                if (Description.split('.')[1] != undefined) {
                    if (allowedExtensions.indexOf(Description.split('.')[1]) != -1) {
                        FilePath = Description;
                    }
                    else {
                        FilePath = Description;
                    }
                }
                else {
                    FilePath = Description;
                }
            }
            if (FilePath != '' && FilePath != undefined)
            {
                if (is_valid_url(FilePath)) {
                    returnString += "<a href=" + FilePath + " target=_blank data-action='navigate'>" + FilePath + "</a>";
                }
                else {                    
                    returnString += "<a href=" + FilePath + " target=_blank>File</a>";
                }
            }
            return returnString;
        }

        function BindContent(flag) {
            var getUrl = "/API/Content/GetContentList";
            var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: ContentFlag,ContentTypeID: "", IsGift: "true", Flag: 'learningjourney' };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                async: false,
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);
                        debugger
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {

                                var Contents = DataSet.Data;
                                var tblContents = '';
                                $('#divContentGrid').empty();
                                if (Contents != undefined && Contents.length > 0) {

                                    for (var i = 0; i < Contents.length; i++) {

                                        tblContents = tblContents + '<div class="card shadow-sm" id="divContentTile"><div class="card-body">';
                                        tblContents = tblContents + '<div class="tag"><span id="spTitle" >' + Contents[i].Title + '</span></div>';
                                        tblContents = tblContents + '<i class="fas fa-grip-vertical grid-icon"></i>';
                                        tblContents = tblContents + '<div class="row">';
                                        tblContents = tblContents + '<div class="col-sm-12 col-md-9 col-lg-10">';
                                        //tblContents = tblContents + '<h5 class="card-title" id="spOverview">' + BindURL(Contents[i].Description) + '</h5>';//BindURL(Contents[i].Description)
                                        tblContents = tblContents + '<a target="_blank" href="' + Contents[i].Description + '"><h5 class="card-title" id="spOverview">' + Contents[i].Description + '</h5></a>';
                                        
                                        //tblContents = tblContents + '<p class="card-text">~' + Contents[i].CourseTime + ' mins</p>';
                                        tblContents = tblContents + '</div>';
                                        tblContents = tblContents + '<div class="col-sm-12 col-md-3 col-lg-2"><div class="action">';
                                        //tblContents = tblContents + '<i class="far fa-eye"></i>';
                                        tblContents = tblContents + '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteContentFromTile(this,' + Contents[i].ContentID + ')";></i><span></span>';
                                        tblContents = tblContents + '<i class="fas fa-edit" title="Edit" onclick="EditContentFromTile(this,' + Contents[i].ContentID + ')";></i>';
                                        tblContents = tblContents + '</div></div></div></div></div>';
                                    }
                                }
                                else {
                                    tblContents = tblContents + '<div class="container"><h3>Content Not Found</h3></div>';
                                }
                                $('#divContentGrid').append(tblContents);

                                if (flag == 'fromcontent') {
                                    $("#sp" + ContentFlag).click();
                                }
                                else if (flag == 'nexttab') {
                                    AddMoreContentFlag = 'bindtile';
                                    divContentFlag = 'bindtile';
                                    AddMore('btnAddMoreContent');
                                    nextTab('pills-resources-tab');
                                }
                                else if (flag == 'addmore') {
                                    AddMoreContentFlag = 'bindtile';
                                    divContentFlag = 'bindtile';
                                    AddMore('btnAddMoreContent');
                                }
                            }
                            else {
                                Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error" });
                            }
                        }
                        else {
                            HideLoader();
                            Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                        }
                    }
                    catch (e) {
                        HideLoader();
                        Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                    }
                },
                complete: function () {
                    HideLoader();
                },
                failure: function (response) {
                    HideLoader();
                    Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                }
            });
        }


        function ClearFieldsAddResource() {
            $('#divResourcesDescription').empty().append('<div id="txtResourcesDescription"></div>');
            var editorResourcesDesc = new Jodit('#txtResourcesDescription');
            
        }

        function validateAddResource()
        {
            if ($('#divResourcesDescription').find('.jodit_wysiwyg').text() == undefined || $('#divResourcesDescription').find('.jodit_wysiwyg').text() == '') {
                return { error: true, msg: "Please enter Resource Details" };
            }
            return true;
        }

        function AddResourceFromQuiz() {
            AddResource('samepage');
        }

        function AddResource(flag)
        {
            debugger
            var result = validateAddResource();
            if (result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {                
                ShowLoader();
                var Description = $('#divResourcesDescription').find('.jodit_wysiwyg').text();
                var getUrl = "/API/Content/UpdateResource";

                try {
                    var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, Description: Description };

                    $.ajax({
                        type: "POST",
                        url: getUrl,
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: JSON.stringify(requestParams),
                        contentType: "application/json",
                        async: false,
                        success: function (response) {
                            try {
                                var DataSet = $.parseJSON(response);
                                debugger
                                if (DataSet != null && DataSet != "") {
                                    if (DataSet.StatusCode == "1") {
                                        if (flag == 'redirect') {
                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.Data[0].ReturnMessage,
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    document.location = 'Dashboard.aspx';
                                                }
                                            });
                                        }
                                        else if (flag == 'samepage') {
                                            HideLoader();
                                            ResourceFlag = LessonFlag;

                                            SetProgressBar();
                                            //ClearFieldsAddResource();

                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.Data[0].ReturnMessage,
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    nextTab('pills-quiz-tab');
                                                }
                                            });
                                        }
                                    }
                                    else {
                                        Swal.fire({
                                            title: "Failure",
                                            text: DataSet.StatusDescription,
                                            icon: "error"
                                        });
                                    }
                                }
                                else {
                                    HideLoader();
                                    Swal.fire({
                                        title: "Failure",
                                        text: "Please try Again",
                                        icon: "error"
                                    });
                                }
                            }
                            catch (e) {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error"
                                });
                            }
                        },
                        complete: function () {
                            HideLoader();
                        },
                        failure: function (response) {
                            HideLoader();
                            alert(response.data);
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error"
                            });
                        }
                    });
                }
                catch (e) {
                    HideLoader();
                    Swal.fire({
                        title: "Alert",
                        text: "Oops! An Occured. Please try again",
                        icon: "error"

                    });
                }
            }
        }

        function BindResource() {
            debugger
            ClearFieldsAddResource();
            ShowLoader();
            var getUrl = "/API/Content/GetResource";

            try {
                var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            debugger
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    $('#divResourcesDescription').find('.jodit_wysiwyg').text(DataSet.Data[0].Resource);
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                            }
                        }
                        catch (e) {
                            HideLoader();
                            Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                        }
                    },
                    complete: function () {
                        HideLoader();
                    },
                    failure: function (response) {
                        HideLoader();
                        alert(response.data);
                        Swal.fire({ title: "Failure", text: "Please try Again", icon: "error" });
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error" });
            }
        }


        function ClearFieldsAddQuiz() {
            $('#txtQuizTitle').val('');
            $('#txtQuizDescription').val('');
            $('#txtPassingScorePercentage').val('');
            $('#lblTotalScore').text('');
            $('#lblPassingScore').text('Passing Score: 0');
            $('#lblPercentage').text('');
            //$('#txtPassingPercentage').val('');
        }

        function ChangePercentage(val) {
            pasingPercentage = val;
            $("#lblPercentage").text(val + "%");
            passingScore = Math.round((parseFloat($("#lblTotalScore").text()) * parseInt(val)) / 100);
            $("#lblPassingScore").text("Passing Score: " + passingScore);
        }

        function validateAddQuiz()
        {
            if ($("#txtQuizTitle").val() == undefined || $("#txtQuizTitle").val() == '') {
                return { error: true, msg: "Please enter Quiz Title" };
            }
            else if ($("#txtQuizDescription").val() == undefined || $("#txtQuizDescription").val() == '') {
                return { error: true, msg: "Please enter Quiz Description" };
            }
            else if ($("#txtPassingScorePercentage").val() == undefined || $("#txtPassingScorePercentage").val() == '') {
                return { error: true, msg: "Please select Passing Percentage" };
            }
            return true;
        }

        function AddQuizFinal() {
            debugger
            var result = validateAddQuiz();
            if (result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {
                AddQuiz('nexttab');
            }
        }

        function AddQuiz(flag)
        {
            debugger
            ShowLoader();
            var Title = $("#txtQuizTitle").val();
            var Description = $("#txtQuizDescription").val();
            var TotalScore = $("#lblTotalScore").text();
            var PassingScore = $("#lblPassingScore").text().replace("Passing Score: ", "");
            var PassingPercentage = $("#lblPercentage").text().replace("%", "");

            var requestParams = {
                TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: '', ContentTypeID: QuizContentTypeID, Title: Title, Description: Description, Points: '0', IsPublished: true
                , SkipFlashcard: false, IsGift: false, TotalScore: TotalScore, PassingScore: PassingScore, PassingPercentage: PassingPercentage
            };
            
            try {
                $.ajax({
                    method: "POST",
                    url: "../api/Quiz/SaveContent",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                }).then(function success(response) {
                    debugger
                    HideLoader();
                    var DataSet = $.parseJSON(response);                    
                    if (DataSet != null && DataSet != "") {
                        if (DataSet.StatusCode == "1") {
                            Swal.fire({
                                title: "Success",
                                text: DataSet.Data[0].ReturnMessage,
                                icon: "success"
                            });
                        }
                        else {
                            Swal.fire({
                                title: "Failure",
                                text: DataSet.Data[0].ReturnMessage,
                                icon: "error"
                            });
                        }
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error"});
            }
        }

        


        function editCourseLogo(el) {
            $(el).find('label .svg-inline--fa').show();
            $(el).find('.custom-file').show();
            $(el).find('.rounded-icon').hide();
        }

        function editTag(el) {
            $(el).find('.chip-input').show();
            $(el).find('.form-group.chip a').hide();
        }

        function SetProgressBar()
        {
            var width = 0;
            if (CourseFlag != '0') {
                width = width + 20;
            }
            if (LessonFlag != '0') {
                width = width + 20;
            }
            if (ContentFlag != '0') {
                width = width + 20;
            }
            if (ResourceFlag != '0') {
                width = width + 20;
            }
            if (QuizFlag != '0') {
                width = width + 20;
            }
            $("#divProgressBar").css("width", width.toString() + "%");
        }


        var base64CourseLogo = '';
        function encodeImagetoBase64(element, flag) {
            //debugger
            var file = element.files[0];
            var size = file.size;
            if (file.size != undefined) {
                if (file.size < 5000000) {
                    var reader = new FileReader();
                    reader.onloadend = function () {

                        if (flag == 'CourseLogo') {
                            base64CourseLogo = reader.result;
                            $("#imgCourseLogo").attr("src", base64CourseLogo);
                        }
                    }
                    reader.readAsDataURL(file);
                }
                else {
                    Swal.fire("File size should not be greater than 5MB", {
                        icon: "error",
                    });
                }
            }
            else {
                Swal.fire("Invalid File", {
                    icon: "error",
                });
            }

        }

        function AddTag()
        {
            var getUrl;
            var requestParams;
            ShowLoader();
            if ($('#txtTagName').val() != '' && $('#txtTagName').val() != undefined)
            {
                var _Title = $('#txtTagName').val();
                var _Description = '';

                var getUrl = "/API/Content/MasterAdd";
                var requestParams = { Title: _Title, Description: _Description, type:'tag' };

                try {
                    $.ajax({
                        type: "POST",
                        url: getUrl,
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: JSON.stringify(requestParams),
                        contentType: "application/json",
                        success: function (response) {
                            try {
                                if (response != null) {
                                    var DataSet = $.parseJSON(response);
                                    debugger
                                    HideLoader();
                                    if (DataSet.StatusCode == "1")
                                    {
                                        if (DataSet.Data.Data1 != undefined)
                                        {
                                            var Tags = DataSet.Data.Data1;
                                            if (Tags != undefined && Tags.length > 0) {
                                                $('#ddlTags').empty().append('<option></option>');
                                                for (var i = 0; i < Tags.length; i++) {
                                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                                }
                                                selectInit('#ddlTags', 'Select Tag');
                                            }
                                        }

                                        $('#txtTagName').val();
                                        
                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                $('#modalAddTag').modal('toggle');
                                            }
                                        });
                                    }
                                    else {
                                        HideLoader();
                                        Swal.fire({
                                            title: "Failure",
                                            text: DataSet.Data.Data[0].ReturnMessage,
                                            icon: "error",
                                            button: "Ok",
                                        });
                                    }
                                }
                                else {
                                    HideLoader();
                                    Swal.fire({
                                        title: "Failure",
                                        text: "Please try Again",
                                        icon: "error",
                                        button: "Ok",
                                    });

                                }
                            }
                            catch (e) {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error",
                                    button: "Ok",
                                });
                            }
                        },
                        complete: function () {
                            HideLoader();
                        },
                        failure: function (response) {
                            HideLoader();
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error",
                                button: "Ok",
                            });
                        }
                    });
                }
                catch (e) {
                    HideLoader();
                    Swal.fire({
                        title: "Alert",
                        text: "Oops! An Occured. Please try again",
                        icon: "error",
                        button: "Ok",
                    });
                }
            }
            else {
                HideLoader();
                Swal.fire({
                    title: "Alert",
                    text: "Fill tag name",
                    icon: "error",
                    button: "Ok",
                });
            }
        }

    </script>
</asp:Content>
