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
                            <div class="card-body p-0">
                                <div class="col-12 col-sm-12">
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
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Learning Objectives *" maxlength="200" id="txtLearningObjectives" aria-describedby="txtLearningObjectivesHelp" />
                                                        <small id="txtLearningObjectivesHelp" class="form-text">Keep your description brief but compelling
                                                    <span class="float-right">0 / 200</span>
                                                        </small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 p-0 logo-tab">
                                            <div class="col-sm-12 mt-3">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Estimated Time</label>
                                                    <input type="text" class="form-control required" id="txtEstimatedTime" placeholder="12:00 AM" />
                                                </div>
                                            </div>
                                            <div class="col-sm-12 mt-5">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Point</label>
                                                    <input type="text" class="form-control required" id="txtPoint" placeholder="+100" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" id="divLessonGrid" style="display:none;">                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-content" role="tabpanel" aria-labelledby="pills-content-tab">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                <div class="col-12 col-sm-12">
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

                                    <div class="row" id="divContentGrid" style="display:none;">
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
                                        <div class="col-12 col-sm-12 col-md-8 col-lg-9">
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
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 p-0 logo-tab">
                                            <div class="col-sm-12 mt-3">
                                                <div class="form-group">
                                                    <label><i class="fas fa-plus-circle black"></i>Passing Percentage</label>
                                                    <input type="text" class="form-control required" id="txtPassingPercentage" placeholder="+100" />
                                                </div>
                                            </div>
                                        </div>
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
                <a style="display:none;" class="btn btn-outline float-left black" id="btnAddMoreQuiz" onclick="AddMore('btnAddMoreQuiz');"><i class="fas fa-plus-circle"></i>Add More Quiz</a>
                <a style="display:none;" class="btn btn-black float-right" id="btnAddQuiz" onclick="AddQuiz();" >Add Quiz</a>

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
                    }
                    if (readQueryString()["resource"] != undefined && readQueryString()["resource"] != '') {
                        ResourceFlag = readQueryString()["resource"];
                    }
                    if (readQueryString()["quiz"] != undefined && readQueryString()["quiz"] != '') {
                        QuizFlag = readQueryString()["quiz"];
                    }
                }
                if (LessonFlag == '0') {
                    BindLesson('fromtopic');
                }
                else {
                    BindLesson('frommodule');
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
                $('#btnAddMoreQuiz').hide();
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
                    $('#btnAddMoreQuiz').hide();
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
                    $('#btnAddMoreQuiz').hide();
                    $('#btnAddQuiz').hide();

                    if (divContentFlag == 'new') {
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
            else if (id == 'pills-resources') {
                if (CourseFlag != '0' && LessonFlag != '0') {
                    $('#btnAddCourse').hide();
                    $('#btnAddMoreLesson').hide();
                    $('#btnAddLession').hide();
                    $('#btnAddMoreContent').hide();
                    $('#btnAddContent').hide();
                    $('#btnAddResource').show();
                    $('#btnAddMoreQuiz').hide();
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
                    $('#btnAddMoreQuiz').show();
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

            }
            else if (activeTabID == 'pills-resources') {

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
                $('#btnAddMoreContent').show();
                $('#btnAddContent').hide();

                if (AddMoreContentFlag == 'add') {
                    //AddContent();

                    //OnSuccess
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
                }
            }
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
                                                ClearFieldsAddCourse();

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
                            $("#imgCourseLogo").attr("src", "../Files/CourseLogo/" + EditTopic[0].FilePath);

                            //$("#divCourseLogo").addClass('img');
                            //$("#divCourseLogo").append('<img src="" class="img-fluid">');

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
            $('#txtLearningObjectives').val('');
            $('#txtEstimatedTime').val('');
            $('#txtPoint').val('');
        }

        function validateAddLesson()
        {
            if ($("#txtLessonTitle").val() == undefined || $("#txtLessonTitle").val() == '') {
                return { error: true, msg: "Please enter Lesson Title" };
            }
            else if ($("#txtLearningObjectives").val() == undefined || $("#txtLearningObjectives").val() == '') {
                return { error: true, msg: "Please enter Learning Objectives" };
            }
            else if ($("#txtEstimatedTime").val() == undefined || $("#txtEstimatedTime").val() == '') {
                return { error: true, msg: "Please enter Estimate Time" };
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
            var _Overview = $('#txtLearningObjectives').val();
            //var _Description = $('#txtDescription').val();
            //var _IsPublished = $('#cbIsPublished').prop('checked');
                
            var _Points = $('#txtPoint').val();
            var _CourseTime = $('#txtEstimatedTime').val();

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
                            $('#txtLearningObjectives').val(EditModule[0].Overview);
                            $('#txtEstimatedTime').val(EditModule[0].CourseTime);
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
            $('#txtLessonTitle').val($(obj).closest('div').find("#spTitle").text());
            $('#txtLearningObjectives').val($(obj).closest('div').find("#spOverview").text());
            $('#txtEstimatedTime').val($(obj).closest('div').find("#spCourseTime").text());
            $('#txtPoint').val($(obj).closest('div').find("#spPoints").text());

            LessonFlag = id;
            AddMoreLessonFlag = 'add';
            divLessonFlag = 'add';
            nextTab('pills-lesson-tab');
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

                                    tblModules = tblModules + '<div class="container">';

                                    for (var i = 0; i < Modules.length; i++)
                                    {
                                        tblModules = tblModules + '<div class="card"><div class="card-body">';
                                        tblModules = tblModules + '<span id="sp' + Modules[i].ModuleID + '" onclick="EditLessionFromTile(this,' + Modules[i].ModuleID + ')"; style="display:none";>' + Modules[i].ModuleID + '</span>';
                                        tblModules = tblModules + '<span id="spTitle" onclick="EditLessionFromTile(this,' + Modules[i].ModuleID + ')";>' + Modules[i].Title + '</span>';
                                        tblModules = tblModules + '<span id="spOverview">' + Modules[i].Overview + '</span>';
                                        tblModules = tblModules + '<span id="spCourseTime">' + Modules[i].CourseTime + '</span>';
                                        tblModules = tblModules + '<span id="spPoints">' + Modules[i].Points + '</span>';
                                        tblModules = tblModules + '</div></div><br>';
                                    }
                                    $('#divLessonGrid').append('</div>');
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
        }

        function AddContentFromResource()
        {
            //nextTab('pills-resources-tab');
            AddContent('samepage');
        }

        function AddContent()
        {            
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
                
            }
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
                                            ClearFieldsAddResource();

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


        function ClearFieldsAddQuiz() {
            $('#txtQuizTitle').val('');
            $('#txtQuizDescription').val('');
            $('#txtPassingPercentage').val('');
        }

        function validateAddQuiz()
        {
            if ($("#txtQuizTitle").val() == undefined || $("#txtQuizTitle").val() == '') {
                return { error: true, msg: "Please enter Quiz Title" };
            }
            else if ($("#txtQuizDescription").val() == undefined || $("#txtQuizDescription").val() == '') {
                return { error: true, msg: "Please enter Quiz Description" };
            }
            else if ($("#txtPassingPercentage").val() == undefined || $("#txtPassingPercentage").val() == '') {
                return { error: true, msg: "Please enter Passing Percentage" };
            }
        }

        function AddQuiz()
        {
            //nextTab();
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
