﻿<%@ Page Title="Module" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="_365_Portal.t.Module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <a class="btn btn-yellow" onclick="Save('.tab-pane.active');" id="btnSave">Save</a>
                </div>
            </div>
            <div class="col-12 col-sm-12 mt-4">
                <div class="progress">
                    <%--<div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>--%>
                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <ul class="nav nav-pills mb-2" id="pills-tab-course" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="pills-course-tab" data-toggle="pill" href="#pills-course" role="tab" aria-controls="pills-course" aria-selected="true">Course</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-lesson-and-content-tab" data-toggle="pill" href="#pills-lesson-and-content" role="tab" aria-controls="pills-lesson-and-content" aria-selected="false">Lesson & Content</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-resources-tab" data-toggle="pill" href="#pills-resources" role="tab" aria-controls="pills-resources" aria-selected="false">Resources</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-quiz-tab" data-toggle="pill" href="#pills-quiz" role="tab" aria-controls="pills-quiz" aria-selected="false">Quiz</a>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
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
                                                        <input type="color" class="form-control" id="txtThemeColor" onchange="clickColor(0, -1, -1, 5)" value="#161E98" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="form-group">
                                                        <select class="form-control select2 required" id="ddlCategory" style="width: 100% !important">
                                                            <option></option>
                                                            <option value="1">Category 1</option>
                                                            <option value="2">Category 2</option>
                                                            <option value="3">Category 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 sharing">
                                                    <div class="form-group radio">
                                                        <label>Sharing</label>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbGlobal" name="rgSharing" class="custom-control-input" checked>
                                                            <label class="custom-control-label" for="rbGlobal">Global</label>
                                                            <small class="form-text">Anyone within 365 Staff can find and access this course.</small>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbOrganization" name="rgSharing" class="custom-control-input">
                                                            <label class="custom-control-label" for="rbOrganization">Organization</label>
                                                            <small class="form-text">Anyone within this organization can find and access this course.</small>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" id="rbAssigned" name="rgSharing" class="custom-control-input">
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
                                                        <input type="file" id="fileLogo" onchange="readURL(this, '.logo-img');">
                                                    </div>
                                                </div>
                                                <div class="logo-img"></div>
                                                <%-- if image set then use this html --%>
                                                <%--<div class="logo-img img">
                                                    <img src="../INCLUDES/Asset/images/sun.png" class="img-fluid" />
                                                </div>--%>
                                            </div>
                                            <div class="col-sm-12 mt-4 course-tag">
                                                <div class="form-group chip-input">
                                                    <label><i class="fas fa-plus-circle black"></i>Tags</label>
                                                    <select class="form-control select2" id="ddlTags" style="width: 100% !important" multiple>
                                                    </select>
                                                </div>
                                                <div class="form-group chip">
                                                    <label>Tags</label>
                                                    <div class="chip-item">
                                                        <span>Admin</span>
                                                        <span>Developer</span>
                                                        <span>Beginner</span>
                                                        <span>Database</span>
                                                        <span>Salesforce Platform</span>

                                                        <a onclick="editTag('.course-tag');">Manage Tags</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-lesson-and-content" role="tabpanel" aria-labelledby="pills-lesson-and-content-tab">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                <div class="col-12 col-sm-12">
                                    <div class="row">
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
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control required" onkeyup="setTextCount(this)" placeholder="Content Header *" maxlength="200" id="txtContentHeader" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div id="txtContentDescription"></div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group mt-2">
                                                        <a class="label"><i class="fas fa-plus-circle"></i>Add Content</a>
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
                                                <div class="col-sm-12 mt-3 mb-3">
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
                                    <div class="row">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-12 mt-3">
                <a class="btn btn-outline float-left d-none black" id="btnAddQuestion"><i class="fas fa-plus-circle"></i>Add Question</a>
                <a class="btn btn-outline float-left d-none black" id="btnAddMoreLesson"><i class="fas fa-plus-circle"></i>Add More Lesson</a>
                <a class="btn btn-black float-right" id="btnNextTab" onclick="nextTab(this)">Add Lesson</a>
            </div>
        </div>
    </div>

    <script>

        var editorContentDesc = new Jodit('#txtContentDescription');
        var editorResourcesDesc = new Jodit('#txtResourcesDescription');

        $(document).ready(function () {
            $("#ddlTags").select2({
                tags: true,
                placeholder: "Enter tag"
            });
            selectInit('#ddlCategory', 'Select Category');

            $('#txtEstimatedTime').datetimepicker({
                format: 'LT'
            });

            $('a[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                //e.target // newly activated tab
                //e.relatedTarget // previous active tab
                $('#btnAddQuestion').addClass('d-none');
                $('#btnAddMoreLesson').addClass('d-none');
                $('#btnNextTab').removeClass('d-none');

                if ((e.target.id).indexOf("course") !== -1) {
                    $('#btnNextTab').text('Add Lesson');
                } else if ((e.target.id).indexOf("lesson") !== -1) {
                    $('#btnAddMoreLesson').removeClass('d-none');
                    $('#btnNextTab').text('Add Resources');
                } else if ((e.target.id).indexOf("resources") !== -1) {
                    $('#btnNextTab').text('Add Quiz');
                } else if ((e.target.id).indexOf("quiz") !== -1) {
                    $('#btnAddQuestion').removeClass('d-none');
                    $('#btnNextTab').addClass('d-none')
                    $('#btnNextTab').text('Add Lesson');
                }
            })
        });

        function nextTab(ctrl) {

            var tabCurrentId = $('#pills-tab-course').find('a.active').attr('id')
            var tabNextId = $('#pills-tab-course').find('a.active').parent().next().find('a').attr('id')

            $('#' + tabNextId).tab('show')


        }

        function Save(el) {
            $(el).removeClass('edit').removeClass('view')
            $(el).addClass('view')

            $('#txtCourseTitle').val('Lorem Ipsum')
            $('#txtCourseSummary').val('Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
            $('#txtCourseSummary').val('Lorem Ipsum is simply dummy text of the printing and typesetting industry.')

            $('#ddlCategory').val('2').trigger('change')

            $(el).find('.logo-img').addClass('img')
            $(el).find('.logo-img').html('<img src="../INCLUDES/Asset/images/sun.png" class="img-fluid" />')


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



    </script>
</asp:Content>