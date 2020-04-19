﻿<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="_365_Portal.t.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        .Project_items_Name {
            cursor: pointer !important;
        }
        /*current code*/
    </style>
    <div class="container-fluid">
        <div class="row pt-4 pb-4">
            <div class="col-10 offset-2">
                <div class="row">
                    <div class="col-auto mr-auto" id="contentTitle">
                        <h5 id="headingProjectName" class="content-title"></h5>
                    </div>
                    <div class="col-auto">
                        <a class="content-activity d-none"><i class="far fa-folder"></i>File</a>
                        <a class="content-activity d-none"><i class="fas fa-share-alt"></i>Share</a>
                        <a class="content-activity d-none"><i class="fas fa-filter"></i>Filter</a>
                        <%-- <a class="content-activity"><i class="fas fa-wave-square"></i>Recent Activity</a>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2 pl-0 sub-side-menu">
                <%--<ul class="list-group mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="task-summary"><span class="task-summary-count" id="spnCompletedTasksCount">0</span><span class="task-summary-title">Completed Tasks</span></div>
                        <div class="task-summary"><span class="task-summary-count" id="spnOpenTasksCount">0</span><span class="task-summary-title">Open Tasks</span></div>
                    </li>
                </ul>--%>
                <ul id="ulProjects" class="list-group task-bar mb-4 dropdown">
                    <%--<li class="list-group-item d-flex justify-content-between align-items-center task-title">Projects
                        <a onclick="onClickAddTask();"><i class="fas fa-plus c-yellow"></i></a>
                    </li>
                    <li class="list-group-item task-item">
                        <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />Dashboard UI Kit 
                        <a class="task-item-action d-none" id="taskMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                        <div class="dropdown-menu" aria-labelledby="taskMenu">
                            <button class="dropdown-item" type="button">Action</button>
                            <button class="dropdown-item" type="button">Another action</button>
                            <button class="dropdown-item" type="button">Something else here</button>
                        </div>
                    </li>


                    <li class="list-group-item task-item">
                        <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />CRM System</li>
                    <li class="list-group-item task-item">
                        <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />Website Redesign</li>
                    <li class="list-group-item task-item">
                        <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />Communication Tool</li>--%>
                </ul>



                <ul id="ulTeam" class="list-group task-bar mb-4">
                    <%-- <li class="list-group-item task-title">Teams</li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Designers
                        <span>
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                        </span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Backend
                      <span>
                          <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                          <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                      </span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Frontend
                        <span>
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                            <img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />
                        </span>
                    </li>
                    <li class="list-group-item"><a class="c-yellow"><i class="fas fa-plus"></i>Add a Team</a></li>--%>
                </ul>
            </div>
            <div class="col-10">
                <div class="row website-redesign" id="dvWebsiteRedesign">
                    <%--<div class="col-12 col-sm-12 col-md-4">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 mb-3 d-flex justify-content-between align-items-center">
                                        <h5 class="font-weight-bold">To Do</h5>
                                        <a class="btn bg-yellow rounded" onclick="onOpenTaskInfoModal();"><i class="fas fa-plus"></i>Add Task</a>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title development">Development</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title marketing">Marketing</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>
                                            <img src="../INCLUDES/Asset/images/mobile-img.jpg" class="img-fluid mt-3 content-img" />
                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title design">Design</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-4">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 mb-3 d-flex justify-content-between align-items-center">
                                        <h5 class="font-weight-bold">In Progress</h5>
                                        <a class="btn bg-yellow rounded"><i class="fas fa-plus"></i>Add Task</a>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title development">Development</span>
                                                </div>
                                            </div>
                                            <img src="../INCLUDES/Asset/images/mobile-img.jpg" class="img-fluid mt-3 content-img" />
                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title marketing">Marketing</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title design">Design</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title development">Development</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title design">Design</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-4">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 mb-3 d-flex justify-content-between align-items-center">
                                        <h5 class="font-weight-bold">Done</h5>
                                        <a class="btn bg-yellow rounded"><i class="fas fa-plus"></i>Add Task</a>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title development">Development</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="wr-content">
                                            <div class="wr-content-title mb-2">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title design">Design</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card add-status">
                            <div class="card-body">
                                <div class="icon mx-auto"><i class="fas fa-plus"></i></div>
                                <h3 class="mt-4">Add Status</h3>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div class="row input-validation input-form-2 d-none" id="dvCreateProject">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row input-validation">
                                    <div class="col-12 col-sm-12 col-md-10 mb-3">
                                        <div class="form-group">
                                            <input type="hidden" id="hdnProjectId" />
                                            <label for="txtProjectName">Project Name</label>
                                            <input type="text" class="form-control required" id="txtProjectName" placeholder="Project Name" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-10 mb-3">
                                        <div class="form-group">
                                            <label for="txtProjectGoal">Project Goal</label>
                                            <textarea id="txtProjectGoal" class="form-control required" rows="3" placeholder="Project Goal"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-10">
                                        <div class="form-group">
                                            <label for="ddlProjectMembers">Project Members</label>
                                            <select class="form-control select2 required" id="ddlProjectMembers" style="width: 100% !important" multiple>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-12 col-sm-12 col-md-10 mt-4 text-right">
                                        <a class="btn bg-yellow" onclick="SaveUpdateProject(this)">Submit</a>

                                        <%--onclick="inputValidation('.input-validation'); "--%>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

        </div>
    </div>
    <div class="modal fade p-0" id="modalTaskInfo" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg shadow modal-right">
            <div class="modal-content rounded">
                <a class="close-modal" data-dismiss="modal" aria-label="Close">
                    <img src="../Asset/images/close-button.png" class="close" /></a>
                <div class="modal-body p-5">
                    <h4 class="mb-4 font-weight-bold">Task Info</h4>
                    <div class="row input-validation-modal input-form-2">
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtTaskName">Name</label>
                                <input type="hidden" id="hdnTaskId" />
                                <input type="text" class="form-control required" id="txtTaskName" placeholder="Name" />
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="ddlStatus">Status</label>
                                <select class="form-control select2 required" id="ddlStatus" style="width: 100% !important">
                                    <%--  <option></option>
                                    <option value="1">To Do</option>
                                    <option value="2">In Progress</option>
                                    <option value="3">Done</option>--%>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtTopicSummary">Topic Summary</label>
                                <textarea class="form-control required" placeholder="Topic Summary" id="txtTopicSummary"></textarea>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="ddlAddAssignee">Add Assignee</label>
                                <select class="form-control select2 required" id="ddlAddAssignee" style="width: 100% !important" multiple>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtDueDate">Set Due Date</label>
                                <input type="text" readonly class="form-control required input-inline-picker" id="txtDueDate" placeholder="Select Date" />
                                <div id="dvDueDate" class="inline-picker d-none"></div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group input-validation-subtaskdiv" id="divSubtask">
                                <label for="txtAddSubTask">Add Sub Task</label>
                                <textarea class="form-control" placeholder="Add Sub Task" id="txtAddSubTask"></textarea>
                                <%--<input class="btn bg-primary" type="button" value="Add Subask" id="btnSave" />--%>
                                <a class="btn btn-outline" id="btnSave"><i class="fas fa-plus-circle"></i>Add</a>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group checkbox">
                                <label>Sub Task(s)</label>
                                <div id="cblist" class="sub-task-checkbox"></div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <div class="custom-file icon" id="divfileAttachment">
                                    <input type="file" class="custom-file-input" id="fileAttachment" onchange="encodeImagetoBase64(this)">
                                    <label class="custom-file-label" for="fileAttachment" id="lblfileAttachment">Add attachment</label>
                                </div>
                                <div class="custom-file icon" id="divfileAttachmentDownload">
                                    <a id="linkFileDownload" target="_blank"></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtAddPrivateNotes">Add Private Notes</label>
                                <textarea class="form-control required" placeholder="Add Private Notes" id="txtAddPrivateNotes"></textarea>
                                <div class="w-100"></div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtTaskComments">Comments</label>
                                <textarea class="form-control" placeholder="Comments" id="txtTaskComments"></textarea>
                                <div class="w-100"></div>
                                <div class="col-12 col-sm-12 mt-4 text-right">
                                    <a class="btn bg-yellow" onclick="SaveUpdateTask(this)">Submit</a>
                                </div>
                            </div>
                        </div>
                       <%-- <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group" id="taskCommentHistory">
                            </div>
                        </div>--%>
                        <div class="col-12 col-sm-12 mb-3 p-0 website-redesign comment-history">
                            <div class="card">
                                <div class="card-body" id="taskCommentHistory">
                                    <%--<div class="col-12 p-0 mb-1">
                                        <div class="wr-content">
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center mb-2">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title">Development</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>
                                            <div class="wr-content-title">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 p-0 mb-1">
                                        <div class="wr-content">
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center mb-2">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title">Development</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>
                                            <div class="wr-content-title">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 p-0 mb-1">
                                        <div class="wr-content">
                                            <div class="wr-content-anchar d-flex justify-content-between align-items-center mb-2">
                                                <div>
                                                    <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title">Development</span>
                                                </div>
                                                <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>
                                            </div>
                                            <div class="wr-content-title">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var accessToken = '<%=Session["access_token"]%>';
        var Role = '<%=Session["RoleName"]%>';
        var prevTitle = '';
        var base64UserProfileString = "";
        var ProjectID = "";
        var jsonTeam = [];
        var jsonStatusList = [];

        $(document).ajaxStart(function () {
            console.log('Ajax call started');
            //$("#loading").show();
            ShowLoader();
        });
        $(document).ajaxComplete(function () {
            console.log('Ajax call completed');
            //$("#loading").hide();
            //HideLoader();
        });


        $(document).ready(function () {
            if (Role == "enduser") {
                RoleWaiseHideControls();
            }
            BindStatusMaster();
            BindTeamMembers()
            BindProjects();

            $('#dvDueDate').datetimepicker({
                inline: true,
                sideBySide: true
            });
            $('#dvDueDate').on('dp.change', function (event) {
                // var formatted_date = event.date.format('YYYY/MM/DD hh:mm a');
                var formatted_date = moment(event.date).format("YYYY/MM/DD hh:mm a");
                $('#txtDueDate').val(formatted_date);
            });
            $('#btnSave').click(function () {
                var subtasname = $('#txtAddSubTask').val();
                if (subtasname != null && subtasname != "") {
                    addCheckbox(subtasname);
                }
                else {
                    Swal.fire({
                        title: "Error",
                        text: "Sub Task is required",
                        icon: "error",
                        button: "Ok",
                    });
                }
            });
        });

        function onOpenTaskInfoModal() {
            $('#modalTaskInfo').modal('show');
            clearFields('.input-validation-modal');
            ClearTaskForm();
        }

        function onClickBack(view, hide) {
            toggle(view, hide);
            $('#contentTitle').empty().append(prevTitle);
        }

        //Task Functions

        function BindCards() {
            var requestParams = {
                t_Action: "1"
                , t_ProjectID: ProjectID
                , t_CompID: "0"
                , t_TaskID: "0"
                , t_TaskName: ""
                , t_TaskSummary: ""
                , t_DueDate: new Date()
                , t_PrivateNotes: ""
                , t_UserId: "0"
                , t_TaskAssignees_UserIds: "" //varchar(500), #(Userids comma separated)
                , t_TagIds: "" //varchar(500), (comma separated)
                , t_FileIds: "" //varchar(500), #(comma separated)
                , t_SubTasks: "" //longtext, #(delimeter | separated)
                , t_StatusID: "0"
                , t_Comments: ""
            };

            // Ajax Call
            //var TaskCRUDAPIResponse = $.parseJSON(call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams));

            $.ajax({
                type: "POST",
                url: "../api/Task/TaskCRUD",
                contentType: "application/json",
                async: false,
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonTaskList = $.parseJSON(response).Data;
                    bindTaskStatusCounts(jsonTaskList.Data);
                    var cardHtml = '';
                    $.each(jsonStatusList, function (indxStatus, objStatus) {
                        var statusWiseTaskList = $.grep(jsonTaskList.Data, function (n) {
                            return n.Status == objStatus.StatusID;
                        });
                        // Repeat Status
                        cardHtml += '<div class="col-12 col-sm-12 col-md-4">';
                        cardHtml += '<div class="card shadow">';
                        cardHtml += '<div class="card-body">';
                        cardHtml += '<div class="row">';
                        cardHtml += '<div class="col-12 mb-3 d-flex justify-content-between align-items-center">';
                        cardHtml += '<h5 class="font-weight-bold">' + objStatus.StatusName + '</h5>';
                        cardHtml += '</div>';
                        cardHtml += '<ol class="col-12 section-sorting" status_id="' + objStatus.StatusID + '">';
                        if (statusWiseTaskList.length > 0) {
                            // Repeat Tasks
                            $.each(statusWiseTaskList, function (indxTask, objTask) {
                                var duedate = new Date(objTask.DueDate);
                                cardHtml += '<li class="col-12 mb-2 sortable-item" project_Id="' + ProjectID + '"  task_Id="' + objTask.TaskID + '" >';
                                cardHtml += '<div class="wr-content">';
                                cardHtml += '<div class="wr-content-title mb-2">' + objTask.TaskName + '<div class="float-right">';
                                cardHtml += '<i class="fas fa-pen" onclick="BindTaskDetailsBYTaskId(' + objTask.TaskID + ')"></i>';
                                if (Role != "enduser") {
                                    cardHtml += '|<i class="fas fa-trash-alt" onclick="return DeleteTaskBYTaskId(' + objTask.TaskID + ');"></i>';
                                }
                                cardHtml += '</div></div>';
                                cardHtml += '<div class="wr-content-anchar d-flex justify-content-between align-items-center">';
                                var requestParams = {
                                    t_Action: "6"
                                    , t_ProjectID: ProjectID
                                    , t_CompID: "0"
                                    , t_TaskID: objTask.TaskID
                                    , t_TaskName: ""
                                    , t_TaskSummary: ""
                                    , t_DueDate: new Date()
                                    , t_PrivateNotes: ""
                                    , t_UserId: "0"
                                    , t_TaskAssignees_UserIds: "" //varchar(500), #(Userids comma separated)
                                    , t_TagIds: "" //varchar(500), (comma separated)
                                    , t_FileIds: "" //varchar(500), #(comma separated)
                                    , t_SubTasks: "" //longtext, #(delimeter | separated)
                                    , t_StatusID: "0"
                                    , t_Comments: ""
                                };
                                //var Taskajaxdata = call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams);

                                $.ajax({
                                    type: "POST",
                                    url: "../api/Task/TaskCRUD",
                                    contentType: "application/json",
                                    headers: { "Authorization": "Bearer " + accessToken },
                                    async: false,
                                    data: requestParams != null ? JSON.stringify(requestParams) : null,
                                    success: function (response) {
                                        var jsonTaskAssigneelist = $.parseJSON(response).Data.Data;
                                        if (jsonTaskAssigneelist != null && jsonTaskAssigneelist.length > 0) {
                                            if (jsonTaskAssigneelist[0].Message == null) {
                                                $.each(jsonTaskAssigneelist, function (indxMember, objMember) {
                                                    var profilepicpath = '';
                                                    if (objMember.FilePath != null && objMember.FilePath != "") {
                                                        profilepicpath = '../Files/ProfilePic/' + objMember.FilePath;
                                                    } else {
                                                        profilepicpath = "../INCLUDES/Asset/images/profile.png";
                                                    }
                                                    cardHtml += '<div><img class="anchar-profile-icon" src="' + profilepicpath + '" title="' + objMember.FirstName + ' ' + objMember.LastName + '"  /><span class="anchar-title development">' + objMember.TeamName + '</span></div>';
                                                });
                                            }
                                        }
                                    },
                                    failure: function (response) {
                                        Swal.fire({
                                            title: "Failure",
                                            text: "Please try Again",
                                            icon: "error",
                                            button: "Ok",
                                        });
                                    }
                                });
                                cardHtml += '<div class="anchor-date"><i class="far fa-clock"></i><span>' + moment(duedate).format("MMM DD, HH:mm a") + '</span></div>';
                                cardHtml += '</div>';
                                cardHtml += '</div>';
                                cardHtml += '</li>';
                            });
                        }
                        else {
                            cardHtml += '<div class="col-12"><h6 class="font-weight-bold">No Tasks Found</h5></div>';
                        }
                        cardHtml += ' </ol>';
                        if (Role != "enduser") {
                            cardHtml += '<div class="col-12"><a class="btn bg-light-tr rounded w-100" onclick="onOpenTaskInfoModal();"><i class="fas fa-plus"></i>Add Task</a></div>';
                        }
                        cardHtml += '</div>';
                        cardHtml += '</div>';
                        cardHtml += '</div>';
                        cardHtml += '</div>';
                        cardHtml += '</div>';
                    });
                    $("#dvWebsiteRedesign").empty().html(cardHtml);

                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                }
            });



            // for card drag and drop
            var adjustment;
            $("ol.section-sorting").sortable({
                group: 'section-sorting',
                pullPlaceholder: false,
                // animation on drop
                onDrop: function ($item, container, _super) {
                    _super($item, container);
                    // added by imtiyaz (statusId)
                    var statusId = container.el.attr('status_id');
                    var ProjectId = $item.attr('project_Id');
                    var taskId = $item.attr('task_Id');
                    //alert("statusId:" + statusId + " ProjectId:" + ProjectId + " taskId:" + taskId);
                    UpdtaeTaskStatus(ProjectId, taskId, statusId);
                },
                // set $item relative to cursor position
                onDragStart: function ($item, container, _super) {
                    var offset = $item.offset(),
                        pointer = container.rootGroup.pointer;
                    adjustment = {
                        left: pointer.left - offset.left,
                        top: pointer.top - offset.top
                    };
                    _super($item, container);
                },
                onDrag: function ($item, position) {
                    $item.css({
                        left: position.left - adjustment.left,
                        top: position.top - adjustment.top
                    });
                }
            });
        }

        function bindTaskStatusCounts(jsonTaskList) {

            var Completedtasks = $.grep(jsonTaskList, function (v) {
                return v.Status == 3;
            });

            var opentask = $.grep(jsonTaskList, function (v) {
                return v.Status == 1 || v.Status == 2;
            });

            var Completedtaskscount = Completedtasks != null ? Completedtasks.length : 0;
            var Opentaskscount = opentask != null ? opentask.length : 0;

            $("#spnCompletedTasksCount").html(Completedtaskscount);
            $("#spnOpenTasksCount").html(Opentaskscount);
        }

        function BindTeam(projectId) {

            var requestParams = {
                p_Action: "1"
                , p_CompID: "0"
                , p_ProjectID: projectId
                , p_ProjectName: ""
                , p_ProjectGoal: ""
                , p_UserId: "0"
                , p_ProjectMembers_UserIds: ""
            };

            //var jsonTeamMembers = $.parseJSON(call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams)).Data.Data1;

            $.ajax({
                type: "POST",
                url: "../api/Project/ProjectCRUD",
                contentType: "application/json",
                async: false,
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonTeamMembers = $.parseJSON(response).Data.Data1;
                    jsonTeam = BindTeamMaster(jsonTeamMembers);
                    var teamHtml = '';
                    teamHtml += '<li class="list-group-item task-title">Teams</li>';
                    if (jsonTeam.length > 0) {
                        $.each(jsonTeam, function (indxTeam, objTeam) {
                            var TeamWiseMembers = $.grep(jsonTeamMembers, function (n, i) {
                                return n.Id == objTeam.Id;
                            });
                            teamHtml += '<li class="list-group-item d-flex justify-content-between align-items-center">' + objTeam.TeamName + '';
                            teamHtml += '<span>';
                            $.each(TeamWiseMembers, function (indxMember, objMember) {
                                if (objMember.FilePath != null && objMember.FilePath != "") {
                                    teamHtml += '<img class="task-user-icon" src="../Files/ProfilePic/' + objMember.FilePath + '"  title="' + objMember.FirstName + ' ' + objMember.LastName + '" />';
                                }
                                else {
                                    teamHtml += '<img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png"  title="' + objMember.FirstName + ' ' + objMember.LastName + '"/>';
                                }
                            });
                            teamHtml += '</span>';
                            teamHtml += '</li>';
                        });
                    }
                    else {
                        teamHtml += '<li class="list-group-item d-flex justify-content-between align-items-center">No Team Found';
                    }
                    $("#ulTeam").empty().html(teamHtml);
                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });
        }

        function BindAssignee(projectId) {
            var requestParams = {
                p_Action: "1"
                , p_CompID: "0"
                , p_ProjectID: projectId
                , p_ProjectName: ""
                , p_ProjectGoal: ""
                , p_UserId: "0"
                , p_ProjectMembers_UserIds: ""
            };
            //var projectajaxdata = call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams);
            $.ajax({
                type: "POST",
                url: "../api/Project/ProjectCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonTeamMembers = $.parseJSON(response).Data.Data1;

                    if (jsonTeamMembers != null && jsonTeamMembers.length > 0) {
                        var jsonTeamMembersHtml = '';
                        $.each(jsonTeamMembers, function (indxMember, objMember) {
                            jsonTeamMembersHtml += '<option value="' + objMember.UserID + '">' + objMember.FirstName + " " + objMember.LastName + '</option>';
                        });
                        $("#ddlAddAssignee").empty().html(jsonTeamMembersHtml);
                        selectInit('#ddlAddAssignee', 'Select a option');
                    }

                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });
        }

        function BindTaskDetailsBYTaskId(TaskId) {
            ClearTaskForm();
            var requestParams = {
                t_Action: "1"
                , t_ProjectID: ProjectID
                , t_CompID: "0"
                , t_TaskID: TaskId
                , t_TaskName: ""
                , t_TaskSummary: ""
                , t_DueDate: new Date()
                , t_PrivateNotes: ""
                , t_UserId: "0"
                , t_TaskAssignees_UserIds: "" //varchar(500), #(Userids comma separated)
                , t_TagIds: "" //varchar(500), (comma separated)
                , t_FileIds: "" //varchar(500), #(comma separated)
                , t_SubTasks: "" //longtext, #(delimeter | separated)
                , t_StatusID: "0"
                , t_Comments: ""
            };

            //var Taskajaxdata = call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams);
            $.ajax({
                type: "POST",
                url: "../api/Task/TaskCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {

                    var jsonTaskdetails = $.parseJSON(response).Data;
                    if (jsonTaskdetails.Data != null && jsonTaskdetails.Data.length > 0) {
                        $("#hdnTaskId").val(jsonTaskdetails.Data[0].TaskID);
                        $("#txtTaskName").val(jsonTaskdetails.Data[0].TaskName);
                        $("#txtTopicSummary").val(jsonTaskdetails.Data[0].TaskSummary);
                        var dateTime = new Date(jsonTaskdetails.Data[0].DueDate);
                        $("#txtDueDate").val(moment(dateTime).format("YYYY/MM/DD hh:mm a"));
                        $("#txtAddPrivateNotes").val(jsonTaskdetails.Data[0].PrivateNotes)
                        $('#ddlStatus').val(jsonTaskdetails.Data[0].Status);
                        $('#ddlStatus').select2().trigger('change');
                        if (jsonTaskdetails.Data1 != null && jsonTaskdetails.Data1.length > 0) {
                            if (jsonTaskdetails.Data1[0].Message == null) {
                                $('#ddlAddAssignee').val(null).trigger('change');
                                var ddlProjectMembers = $('#ddlAddAssignee');
                                $.each(jsonTaskdetails.Data1, function (indxMember, objMember) {
                                    var option = new Option(objMember.FirstName + " " + objMember.LastName, objMember.UserID, true, true);
                                    ddlProjectMembers.append(option).trigger('change');
                                });
                            }
                        }

                        if (jsonTaskdetails.Data2 != null && jsonTaskdetails.Data2.length > 0) {
                            if (jsonTaskdetails.Data2[0].Message == null) {
                                //var container = $('#cblist');
                                //container.empty();

                                var container = '';

                                $.each(jsonTaskdetails.Data2, function (indx, objsubtask) {
                                    if (objsubtask.SubTaskName != null && objsubtask.SubTaskName != "") {
                                        //var Ischecked = objsubtask.Status == 3 ? true : false;
                                        //$('<input />', { type: 'checkbox', id: objsubtask.TaskID, value: objsubtask.SubTaskName, checked: Ischecked }).appendTo(container);
                                        //$('<label />', { 'for': objsubtask.TaskID, text: objsubtask.SubTaskName }).appendTo(container);

                                        // change by imtiyaz

                                        var checked = objsubtask.Status == 3 ? 'checked' : '';
                                        container += '<div class="custom-control custom-checkbox">';
                                        container += '<input type="checkbox" name="' + objsubtask.TaskID + '" id="' + objsubtask.SubTaskName + '" value="' + objsubtask.SubTaskName + '" class="custom-control-input" ' + checked + '>';
                                        container += '<label class="custom-control-label" for="' + objsubtask.SubTaskName + '">' + objsubtask.SubTaskName + '</label>';
                                        container += '<div class="custom-action"><i class="fas fa-pen"></i>|<i class="fas fa-trash-alt"></i></div></div>';



                                    }
                                });
                                $('#cblist').empty().append(container);
                                // $("#txtAddSubTask").val(stringsubtask);
                            }
                        }

                        if (jsonTaskdetails.Data3 != null && jsonTaskdetails.Data3.length > 0) {
                            if (jsonTaskdetails.Data3[0].Message == null) {
                                $("#lblfileAttachment").val(jsonTaskdetails.Data3[0].FilePath);
                                newUrl = '../Files/Task/' + jsonTaskdetails.Data3[0].FilePath;
                                $("#linkFileDownload").attr("href", newUrl);
                                $("#linkFileDownload").text(jsonTaskdetails.Data3[0].FilePath);
                            }
                        }
                        if (jsonTaskdetails.Data4 != null && jsonTaskdetails.Data4.length > 0) {
                            if (jsonTaskdetails.Data4[0].Message == null) {
                                var container = '';
                                $.each(jsonTaskdetails.Data4, function (indx, objstatustracker) {
                                    if (objstatustracker.Comments != null && objstatustracker.Comments != "") {
                                        //$('<label />', { text: objstatustracker.CreatedDate + " = " + objstatustracker.FirstName + " : " + objstatustracker.Comments }).appendTo(container);

                                        // added by imtiyaz
                                        container += '<div class="col-12 p-0 mb-1">';
                                        container += '<div class="wr-content">';
                                        container += '<div class="wr-content-anchar d-flex justify-content-between align-items-center mb-2">';
                                        container += '<div>';
                                        container += '<img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title">' + objstatustracker.FirstName+'</span>';
                                        container += '</div>';
                                        container += '<div class="anchor-date"><span>' + objstatustracker.CreatedDate+'</span></div>';
                                        container += '</div>';
                                        container += '<div class="wr-content-title">' + objstatustracker.Comments+'</div>';
                                        container += '</div>';
                                        container += '</div>';


                                    }
                                });

                                $('#taskCommentHistory').empty().append(container);
                            }
                        }
                    }
                    $('#modalTaskInfo').modal('show');
                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });
        }

        function ClearTaskForm() {
            $("#hdnTaskId").val("");
            $("#txtTaskName").val("");
            $("#txtTopicSummary").val("");
            $("#txtAddPrivateNotes").val("");
            $("#txtTaskComments").val("");
            $('#ddlAddAssignee').val(null).trigger('change');
            $("#txtAddSubTask").val("");
            $("#ddlStatus").val("");
            $('#cblist').empty();
            $('#taskCommentHistory').empty();
            $("#linkFileDownload").attr("href", "#");
            $("#linkFileDownload").text("");
        }

        function SaveUpdateTask() {
            ShowLoader();
            if (inputValidation('.input-validation-modal')) {
                var hiddenTaskId = $("#hdnTaskId").val();
                var duedate = $("#txtDueDate").val();
                var StringSubtask = "";
                var container = $('#cblist');
                var inputs = container.find('input');
                if (inputs.length > 0) {
                    $.each(inputs, function (indx, objinputs) {
                        var chekboxtext = objinputs.value;
                        if ($(this).prop("checked") == true) {
                            chekboxtext = chekboxtext + "^" + "3";
                        }
                        else {
                            chekboxtext = chekboxtext + "^" + "1";
                        }

                        StringSubtask = StringSubtask + chekboxtext + "|";
                    });
                }

                var requestParams = {
                    t_Action: hiddenTaskId != null && hiddenTaskId != "" ? "3" : "2"
                    , t_ProjectID: ProjectID
                    , t_CompID: "0"
                    , t_TaskID: hiddenTaskId != null && hiddenTaskId != "" ? hiddenTaskId : "0"
                    , t_TaskName: $("#txtTaskName").val()
                    , t_TaskSummary: $("#txtTopicSummary").val()
                    , t_DueDate: moment(duedate).format("YYYY-MM-DDTHH:mm:ss")
                    , t_PrivateNotes: $("#txtAddPrivateNotes").val()
                    , t_UserId: "0"
                    , t_TaskAssignees_UserIds: $("#ddlAddAssignee").val().toString() //varchar(500), #(Userids comma separated)
                    , t_TagIds: "" //varchar(500), (comma separated)
                    , t_FileIds: base64UserProfileString //varchar(500), #(comma separated)
                    , t_SubTasks: StringSubtask //longtext, #(delimeter | separated)
                    , t_StatusID: $("#ddlStatus").val()
                    , t_Comments: $("#txtTaskComments").val()
                };

                // Ajax Call
                //var userlistAPIresponse = $.parseJSON(call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams));
                $.ajax({
                    type: "POST",
                    url: "../api/Task/TaskCRUD",
                    contentType: "application/json",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: requestParams != null ? JSON.stringify(requestParams) : null,
                    beforeSend: function () {
                        //ShowLoader();
                    },
                    success: function (response) {
                        debugger;
                        var userlistAPIresponse = $.parseJSON(response);
                        if (userlistAPIresponse.StatusCode > 0) {
                            $("#modalTaskInfo").modal("hide");
                            BindCards();
                            ClearTaskForm();
                        }
                        call_Notification(userlistAPIresponse);
                    },
                    failure: function (response) {
                        Swal.fire({
                            title: "Failure",
                            text: "Please try Again",
                            icon: "error",
                            button: "Ok",
                        });
                    },
                    complete: function () {
                        ////HideLoader();
                    }
                });


            }
            HideLoader();
        }

        function DeleteTaskBYTaskId(TaskId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete Task!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {

                    var requestParams = {
                        t_Action: "4"
                        , t_ProjectID: ProjectID
                        , t_CompID: "0"
                        , t_TaskID: TaskId
                        , t_TaskName: ""
                        , t_TaskSummary: ""
                        , t_DueDate: new Date()
                        , t_PrivateNotes: ""
                        , t_UserId: "0"
                        , t_TaskAssignees_UserIds: "" //varchar(500), #(Userids comma separated)
                        , t_TagIds: "" //varchar(500), (comma separated)
                        , t_FileIds: "" //varchar(500), #(comma separated)
                        , t_SubTasks: "" //longtext, #(delimeter | separated)
                        , t_StatusID: "0"
                        , t_Comments: ""
                    };
                    // Ajax Call
                    //var userlistAPIresponse = $.parseJSON(call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams));
                    $.ajax({
                        type: "POST",
                        url: "../api/Task/TaskCRUD",
                        contentType: "application/json",
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: requestParams != null ? JSON.stringify(requestParams) : null,
                        beforeSend: function () {
                            //ShowLoader();
                        },
                        success: function (response) {
                            var userlistAPIresponse = $.parseJSON(response);
                            if (userlistAPIresponse.StatusCode > 0) {
                                $("#modalTaskInfo").modal("hide");
                                BindCards();
                                call_Notification(userlistAPIresponse);
                            }
                            HideLoader();
                        },
                        failure: function (response) {
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error",
                                button: "Ok",
                            });
                        },
                        complete: function () {
                            ////HideLoader();
                        }
                    });

                }
            })
        }

        //End Task Functions

        //Project Functions

        function onClickAddProject() {
            ClearProjectForm();
            openProjectForm();
        }

        function openProjectForm() {
            toggle('dvCreateProject', 'dvWebsiteRedesign');
            prevTitle = $('#contentTitle').html();
            $('#contentTitle').empty().append('<h5 class="content-title" id="headingProjectName"><i class="fas fa-times c-pointer" onclick="onClickBack(&#34;dvWebsiteRedesign&#34;, &#34;dvCreateProject&#34;);"></i>New Project</h5>')
        }

        function BindTeamMembers() {
            //var userlistAPIdata = call_ajaxfunction("../api/User/GetUserlist", "POST");
            $.ajax({
                type: "POST",
                url: "../api/User/GetUserlist",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonTeamMembers = $.parseJSON(response).Data;
                    if (jsonTeamMembers != null && jsonTeamMembers.length > 0) {
                        var jsonTeamMembersHtml = '';
                        $.each(jsonTeamMembers, function (indxMember, objMember) {
                            jsonTeamMembersHtml += '<option value="' + objMember.UserID + '">' + objMember.FirstName + " " + objMember.LastName + '</option>';
                        });
                        $("#ddlProjectMembers").empty().html(jsonTeamMembersHtml);
                    }
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });
        }

        function BindProjects() {
            var requestParams = {
                p_Action: "1"
                , p_CompID: "0"
                , p_ProjectID: "0"
                , p_ProjectName: ""
                , p_ProjectGoal: ""
                , p_UserId: "0"
                , p_ProjectMembers_UserIds: ""
            };
            //var projectajaxdata = call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams);
            $.ajax({
                type: "POST",
                url: "../api/Project/ProjectCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    if (response != null) {
                        var jsonProjectList = $.parseJSON(response).Data;
                        var projectHtml = '';
                        projectHtml += '<li class="list-group-item task-title">Projects';
                        if (Role != "enduser") {
                            projectHtml += '<a onclick="onClickAddProject();" class="task-item-action"><i class="fas fa-plus c-yellow"></i></a>';
                        }
                        projectHtml += ' </li>';
                        if (jsonProjectList.Data.length > 0) {
                            $.each(jsonProjectList.Data, function (indxProject, objProject) {
                                var activeClass = '';
                                if ((ProjectID != "" && objProject.ProjectID == ProjectID) || indxProject == 0) {
                                    activeClass = 'active';
                                    ProjectID = objProject.ProjectID;
                                    BindCards();
                                    setcontentTitle(objProject.ProjectName);
                                    BindTeam(objProject.ProjectID);
                                    BindAssignee(ProjectID);
                                }
                                projectHtml += '<li class="list-group-item task-item ' + activeClass + ' " >';
                                projectHtml += '<img class="task-icon" src="../INCLUDES/Asset/images/sun.png" /> <span class="Project_items_Name" id="' + objProject.ProjectID + '" >' + objProject.ProjectName + '</span>';
                                if (Role != "enduser") {
                                    projectHtml += '<a class="task-item-action" id="taskMenu_' + indxProject + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>';
                                }
                                projectHtml += '<div class="dropdown-menu" aria-labelledby="taskMenu_' + indxProject + '">';
                                projectHtml += '<a class="dropdown-item" onclick="BindProjectDetailsBYProjectId(' + objProject.ProjectID + ')">Edit</a>';
                                projectHtml += '<a class="dropdown-item" onclick="DeleteProjectBYProjectId(' + objProject.ProjectID + ')">Delete</a>';
                                projectHtml += '</div></li>';
                                projectHtml += '</div></li>';
                            });
                        }
                        else {
                            projectHtml += '<li class="list-group-item task-item">No Projects Found</li>';
                        }
                        $("#ulProjects").empty().html(projectHtml);
                    }

                    $('span.Project_items_Name').on('click', function () {
                        onClickBack("dvWebsiteRedesign", "dvCreateProject");//Closing Project Form
                        $(this).parent().parent().find('li.active').removeClass('active');
                        $(this).parent().addClass('active');
                        setcontentTitle($(this).text());
                        ProjectID = $(this).attr("id");
                        BindCards();
                        BindTeam(ProjectID);
                        BindAssignee(ProjectID);
                    });

                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();

                }
            });


        }

        function setcontentTitle(tilename, isEdit = false) {
            var closeButton = isEdit ? '<i class="fas fa-times c-pointer" onclick="onClickBack(&#34;dvWebsiteRedesign&#34;, &#34;dvCreateProject&#34;);"></i>' : '';
            prevTitle = $('#contentTitle').html();
            $('#contentTitle').empty().append('<h5 class="content-title"> ' + closeButton + tilename + '</h5>')
        }

        function BindProjectDetailsBYProjectId(projectId) {

            var requestParams = {
                p_Action: "1"
                , p_CompID: "0"
                , p_ProjectID: projectId
                , p_ProjectName: ""
                , p_ProjectGoal: ""
                , p_UserId: "0"
                , p_ProjectMembers_UserIds: ""
            };

            //var projectajaxdata = call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams);

            $.ajax({
                type: "POST",
                url: "../api/Project/ProjectCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonProjecdetails = $.parseJSON(response).Data;
                    $("#hdnProjectId").val(jsonProjecdetails.Data[0].ProjectID);
                    $("#txtProjectName").val(jsonProjecdetails.Data[0].ProjectName);
                    $("#txtProjectGoal").val(jsonProjecdetails.Data[0].ProjectGoal);
                    if (jsonProjecdetails.Data1 != null && jsonProjecdetails.Data1.length > 0) {
                        $('#ddlProjectMembers').val(null).trigger('change');
                        var ddlProjectMembers = $('#ddlProjectMembers');
                        $.each(jsonProjecdetails.Data1, function (indxMember, objMember) {
                            var option = new Option(objMember.FirstName + " " + objMember.LastName, objMember.UserID, true, true);
                            ddlProjectMembers.append(option).trigger('change');
                        });
                    }
                    toggle('dvCreateProject', 'dvWebsiteRedesign');
                    setcontentTitle($("#txtProjectName").val(), true);

                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });
        }

        function SaveUpdateProject() {
            ShowLoader();
            if (inputValidation('.input-validation')) {

                var hiddenprojectId = $("#hdnProjectId").val();

                var requestParams = {
                    p_Action: hiddenprojectId != null && hiddenprojectId != "" ? "3" : "2"
                    , p_CompID: "0"
                    , p_ProjectID: hiddenprojectId != null && hiddenprojectId != "" ? hiddenprojectId : "0"
                    , p_ProjectName: $("#txtProjectName").val()
                    , p_ProjectGoal: $("#txtProjectGoal").val()
                    , p_UserId: "0"
                    , p_ProjectMembers_UserIds: $("#ddlProjectMembers").val().toString()
                };

                // Ajax Call
                //var ProjectCRUDAPIData = $.parseJSON(call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams));
                $.ajax({
                    type: "POST",
                    url: "../api/Project/ProjectCRUD",
                    contentType: "application/json",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: requestParams != null ? JSON.stringify(requestParams) : null,
                    beforeSend: function () {
                        //ShowLoader();
                    },
                    success: function (response) {
                        var ProjectCRUDAPIData = $.parseJSON(response);
                        if (ProjectCRUDAPIData.StatusCode > 0) {
                            ClearProjectForm();
                            BindProjects();
                            onClickBack("dvWebsiteRedesign", "dvCreateProject");//Closing Project Form
                        }
                        call_Notification(ProjectCRUDAPIData);
                    },
                    failure: function (response) {
                        Swal.fire({
                            title: "Failure",
                            text: "Please try Again",
                            icon: "error",
                            button: "Ok",
                        });
                    },
                    complete: function () {
                        //HideLoader();
                    }
                });
            }
            HideLoader();
        }

        function DeleteProjectBYProjectId(projectId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete Project !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    var requestParams = {
                        p_Action: "4"
                        , p_CompID: "0"
                        , p_ProjectID: projectId
                        , p_ProjectName: ""
                        , p_ProjectGoal: ""
                        , p_UserId: "0"
                        , p_ProjectMembers_UserIds: ""
                    };
                    //var ProjectCRUDAPIData = $.parseJSON(call_ajaxfunction("../api/Project/ProjectCRUD", "POST", requestParams));
                    $.ajax({
                        type: "POST",
                        url: "../api/Project/ProjectCRUD",
                        contentType: "application/json",
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: requestParams != null ? JSON.stringify(requestParams) : null,
                        beforeSend: function () {
                            //ShowLoader();
                        },
                        success: function (response) {
                            var ProjectCRUDAPIData = $.parseJSON(response);
                            if (ProjectCRUDAPIData.StatusCode > 0) {
                                BindProjects();
                                call_Notification(ProjectCRUDAPIData);
                            }
                            HideLoader();
                        },
                        failure: function (response) {
                            Swal.fire({
                                title: "Failure",
                                text: "Please try Again",
                                icon: "error",
                                button: "Ok",
                            });
                        },
                        complete: function () {
                            //HideLoader();
                        }
                    });


                }
            })
        }

        function ClearProjectForm() {
            $("#hdnProjectId").val("");
            $("#txtProjectName").val("");
            $("#txtProjectGoal").val("");
            $('#ddlProjectMembers').val(null).trigger('change');
            selectInit('#ddlProjectMembers', 'Search by user or by user name');
        }

        //End Project Functions

        function call_Notification(responsedata, callerinfo = "") {
            // alert(callerinfo);
            if (responsedata != null) {
                var swaltitle = "";
                var swalicon = "";

                if (responsedata.StatusCode > 0) {
                    swaltitle = "Success";
                    swalicon = "success";
                }
                else if (responsedata.StatusCode == 0) {
                    swaltitle = "Error";
                    swalicon = "error";
                }
                if (responsedata.StatusDescription != null && responsedata.StatusDescription != "") {
                    Swal.fire({
                        title: swaltitle,
                        text: responsedata.StatusDescription,
                        icon: swalicon,
                        button: "Ok",
                    });
                }
            }
        }

        //Encode the file to base64
        function encodeImagetoBase64(element) {

            if (element != null && element != undefined) {

                var file = element.files[0];;
                var size = file.size;
                var allowedExtensions = ['pdf', 'mp4', 'avi', 'flv', 'wmv', 'mov', '3gp', 'webm', 'wav'];

                if (file.size != undefined) {
                    if (allowedExtensions.indexOf(file.name.split('.')[1]) != -1) {
                        if (file.size < 25000000) {
                            var reader = new FileReader();
                            reader.onloadend = function () {
                                base64UserProfileString = reader.result;
                            }
                            reader.readAsDataURL(file);
                        }
                        else {
                            base64UserProfileString = "";
                            $('#filepath').val('');
                            Swal.fire({
                                text: "Error",
                                title: "File size should not be greater than 5MB",
                                icon: "error",
                            });

                            $('#lblfilepath').html("File Path");
                        }
                    }
                    else {

                        base64UserProfileString = "";
                        $('#filepath').val('');
                        Swal.fire({
                            title: "Error",
                            text: "Invalid File format! Allowed file formats are pdf,mp4,avi,flv,wmv,mov,3gp,webm,wav",
                            icon: "error",
                        });
                        $('#lblfilepath').html("File Path");
                    }
                }
                else {
                    base64UserProfileString = "";
                    $('#filepath').val('');
                    Swal.fire({
                        title: "Error",
                        text: "Invalid File",
                        icon: "error",
                    });
                    $('#lblfilepath').html("File Path");
                }

            }
            else {
                Swal.fire({
                    title: "Error",
                    text: "No Files Selected",
                    icon: "error",
                });
            }
        }

        function addCheckbox(name) {
            var container = $('#cblist');
            var inputs = container.find('input');
            var id = inputs.length + 1;

            $('<input />', { type: 'checkbox', id: 'cb' + id, value: name }).appendTo(container);
            $('<label />', { 'for': 'cb' + id, text: name }).appendTo(container);

            $('#txtAddSubTask').val("");
        }

        function UpdtaeTaskStatus(ProjectID, TaskID, StatusID) {
            //Param_CompID, Param_UserID, Param_TaskID, Param_StatusID, Param_Comments

            var requestParams = {
                Param_ProjectID: ProjectID,
                Param_TaskID: TaskID,
                Param_CompID: "0",
                Param_SubTaskIds: "", //#(completed taskIds comma separated)
                Param_StatusID: StatusID,
                Param_Comments: "",
                Param_UserID: "0"
            }

            //var UpdateTaskajaxdata = $.parseJSON(call_ajaxfunction("../api/Task/TaskUpdate", "POST", requestParams));
            $.ajax({
                type: "POST",
                url: "../api/Task/TaskUpdate",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var UpdateTaskajaxdata = $.parseJSON(response);
                    //call_Notification(UpdateTaskajaxdata);
                    if (UpdateTaskajaxdata.StatusCode > 0) {
                        BindCards();
                    }
                    HideLoader();
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    HideLoader();
                }
            });
        }

        function RoleWaiseHideControls() {
            //$('input').attr('readonly', true);
            $("#txtTaskName").attr('readonly', true);
            $("#txtTopicSummary").attr('readonly', true);
            $('#ddlAddAssignee').attr('readonly', true);
            $("#txtAddPrivateNotes").attr('readonly', true);
            $("#divSubtask").hide();
            //$("#divfileAttachment").attr('readonly', true);
            $("#divfileAttachment").hide();
            // divfileAttachmentDownload
            $("#dvDueDate").hide();
            $('#ddlAddAssignee').attr('Disabled', true);

        }

        function BindTeamMaster(data) {
            var lookup = {};
            var items = data;
            var result = [];

            for (var item, i = 0; item = items[i++];) {
                var name = item.TeamName;
                var teamobject = { Id: item.Id, TeamName: item.TeamName }

                if (!(name in lookup)) {
                    lookup[name] = 1;
                    result.push(teamobject);
                }
            }

            return result;
        }

        function BindStatusMaster() {
            var requestParams = {
                t_Action: "5"
                , t_ProjectID: "0"
                , t_CompID: "0"
                , t_TaskID: "0"
                , t_TaskName: ""
                , t_TaskSummary: ""
                , t_DueDate: new Date()
                , t_PrivateNotes: ""
                , t_UserId: "0"
                , t_TaskAssignees_UserIds: "" //varchar(500), #(Userids comma separated)
                , t_TagIds: "" //varchar(500), (comma separated)
                , t_FileIds: "" //varchar(500), #(comma separated)
                , t_SubTasks: "" //longtext, #(delimeter | separated)
                , t_StatusID: "0"
                , t_Comments: ""
            };
            //var Taskajaxdata = call_ajaxfunction("../api/Task/TaskCRUD", "POST", requestParams);

            $.ajax({
                type: "POST",
                url: "../api/Task/TaskCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    var jsonTaskdetails = $.parseJSON(response).Data.Data;
                    if (jsonTaskdetails != null && jsonTaskdetails.length > 0) {
                        var jsonstatusHtml = '';
                        $.each(jsonTaskdetails, function (indx, objstatus) {
                            jsonstatusHtml += '<option value="' + objstatus.StatusID + '">' + objstatus.StatusName + '</option>';
                        });
                        $("#ddlStatus").empty().html(jsonstatusHtml);
                    }
                    jsonStatusList = jsonTaskdetails;
                },
                failure: function (response) {
                    Swal.fire({
                        title: "Failure",
                        text: "Please try Again",
                        icon: "error",
                        button: "Ok",
                    });
                },
                complete: function () {
                    //HideLoader();
                }
            });

        }
    </script>
</asp:Content>
