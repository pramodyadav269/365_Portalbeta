<%@ Page Title="Task" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="_365_Portal.t.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web-animations/2.3.1/web-animations.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <%--<script src="https://unpkg.com/muuri@0.6.3/dist/muuri.min.js"></script>--%>
    <script src="../INCLUDES/Asset/js/muuri.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        .Project_items_Name {
            cursor: pointer !important;
        }

        .divDisable {
            pointer-events: none;
            cursor: not-allowed;
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
                    <div class="col-auto pr-5">
                        <a class="content-activity d-none"><i class="far fa-folder"></i>File</a>
                        <a class="content-activity d-none"><i class="fas fa-share-alt"></i>Share</a>
                        <a class="content-activity d-none"><i class="fas fa-filter"></i>Filter</a>
                        <%--<a class="content-activity" target="_blank" href="https://xd.adobe.com/view/74659cca-f14e-44cb-7e67-6046ffc5bd97-0254/screen/92d06a3d-b8a0-48ff-8203-7d327e755004/17-Screen1-Recent-Activity-"><i class="fas fa-wave-square"></i>Recent Activity</a>--%>
                        <a class="content-activity" onclick="onClickRecentActivity();"><i class="fas fa-wave-square"></i>Recent Activity</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2 pl-0 sub-side-menu">
                <ul class="list-group mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="task-summary"><span class="task-summary-count" id="spnTotalTasksCount">0</span><span class="task-summary-title">Total Tasks</span></div>
                        <%-- <div class="task-summary"><span class="task-summary-count" id="spnCompletedTasksCount">0</span><span class="task-summary-title">Completed Tasks</span></div>
                        <div class="task-summary"><span class="task-summary-count" id="spnOpenTasksCount">0</span><span class="task-summary-title">Open Tasks</span></div>--%>

                    </li>
                </ul>
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
            <div class="col-10 pr-5 drag-drop-card">
                <div class="row website-redesign board" id="dvWebsiteRedesign">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row recent-activity d-none" id="dvRecentActivity">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body" id="dvActivitybody">
                                <div class="activity-wrapper">
                                    <div class="day">Today</div>
                                    <div class="activity">
                                        <div class="pre-icon"><span class="check"><i class="fas fa-check"></i></span></div>
                                        <div class="col-12 col-md-8 col-lg-10 content">
                                            <b>Darika Samak</b> mark as done <b>Listing on Product Hunt so that we can reach as many potential users</b>
                                        </div>
                                        <div class="time">8:40 PM</div>
                                    </div>
                                    <div class="activity">
                                        <div class="pre-icon"><span class="comment"><i class="fas fa-comment-alt"></i></span></div>
                                        <div class="col-12 col-md-8 col-lg-10 content">
                                            <b>Emilee Simchenko</b> commented on <b>Account for teams and personal in bottom style</b>

                                            <div class="comment-wrapper">
                                                <img src="../INCLUDES/Asset/images/profile.png" />
                                                During a project build, it is necessary to evaluate the product design and development against project requirements and outcomes
                                            </div>
                                        </div>
                                        <div class="time">7:32 PM</div>
                                    </div>
                                    <div class="activity">
                                        <div class="pre-icon"><span class="upload"><i class="fas fa-upload"></i></span></div>
                                        <div class="col-12 col-md-8 col-lg-10 content">
                                            <b>Darika Samak</b> uploaded 4 files on <b>An option to search in current projects or in all projects</b>
                                            <div class="file-wrapper">
                                                <img src="../INCLUDES/Asset/images/mobile-img.jpg" />
                                                <img src="../INCLUDES/Asset/images/mobile-img.jpg" />
                                                <img src="../INCLUDES/Asset/images/mobile-img.jpg" />
                                                <img src="../INCLUDES/Asset/images/mobile-img.jpg" />
                                            </div>
                                        </div>
                                        <div class="time">6:02 PM</div>
                                    </div>

                                </div>
                                <div class="activity-wrapper">
                                    <div class="day">Yesterday</div>
                                    <div class="activity">
                                        <div class="pre-icon"><span class="check"><i class="fas fa-check"></i></span></div>
                                        <div class="col-12 col-md-8 col-lg-10 content">
                                            <b>Darika Samak</b> mark as done <b>Listing on Product Hunt so that we can reach as many potential users</b>
                                        </div>
                                        <div class="time">5:49 PM</div>
                                    </div>
                                    <div class="activity">
                                        <div class="pre-icon"><span class="pencil"><i class="fas fa-pencil-alt"></i></span></div>
                                        <div class="col-12 col-md-8 col-lg-10 content">
                                            <b>Darika Samak</b> edited <b>Listing on Product Hunt so that we can reach as many potential users</b>
                                        </div>
                                        <div class="time">5:40 PM</div>
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
                                    <input type="hidden" id="hdntaskddlStatusId" />
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
                                <a class="btn btn-outline" id="btnSave"><i class="fas fa-plus-circle"></i>Add</a>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group checkbox">
                                <label>Sub Task(s)</label>
                                <input type="hidden" id="hiddenSuntaskId" />
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
                        <div class="col-12 col-sm-12 mb-3 p-0 website-redesign comment-history">
                            <div class="card">
                                <div class="card-body" id="taskCommentHistory">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade p-0" id="modalStatusInfo" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog shadow">
            <div class="modal-content rounded">
                <a class="close-modal" data-dismiss="modal" aria-label="Close">
                    <img src="../Asset/images/close-button.png" class="close" /></a>
                <div class="modal-body p-5">
                    <h4 class="mb-4 font-weight-bold">Add Status</h4>
                    <div class="row input-form-2">
                        <div class="col-12 col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="txtTaskName">Status Name</label>
                                <%--<input type="hidden" id="hdnTaskId" />--%>
                                <input type="text" class="form-control required" id="txtStatusName" placeholder="Status Name" />
                                <div class="w-100"></div>
                                <div class="col-12 col-sm-12 mt-4 text-right">
                                    <a class="btn bg-yellow" onclick="SaveUpdateStatus(0)">Submit</a>
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
        var FileName = "";
        var ProjectID = "";
        var jsonTeam = [];
        var jsonStatusList = [];

        $(document).ajaxStart(function () {
            //console.log('Ajax call started');
            ShowLoader();
        });

        $(document).ready(function () {
            //ShowLoader();
            if (Role == "enduser") {
                RoleWaiseHideControls();
            }
            //BindStatusMaster();
            BindProjects();
            BindTeamMembers()

            $('#dvDueDate').datetimepicker({
                inline: true,
                sideBySide: true
            });
            $('#dvDueDate').on('dp.change', function (event) {
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

                if ($(this).text() == "Update") {
                    $(this).html('<i class="fas fa-plus-circle"></i>Add');
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
            $('#contentTitle + .col-auto').removeClass('d-none');
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
            var ajaxtaskResponse;
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
                    ajaxtaskResponse = response;
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
                    BindtaskData(ajaxtaskResponse);
                    //initDragDrop();
                }
            });
        }

        function initDragDrop() {
            // for card drag and drop
            var adjustment;
            $('.section-sorting').sortable('refresh')
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
                    var taskName = $item.attr("task_Name");
                    //alert("statusId:" + statusId + " ProjectId:" + ProjectId + " taskId:" + taskId);
                    UpdateTaskStatus(ProjectId, taskId, statusId, taskName);
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
            var TotalTasksCount = jsonTaskList.length;
            $("#spnTotalTasksCount").html(TotalTasksCount);
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
                    //HideLoader();
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
            $.ajax({
                // async: false,
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
                    //HideLoader();
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
                        $("#txtAddPrivateNotes").val(jsonTaskdetails.Data[0].PrivateNotes);
                        $("#hdntaskddlStatusId").val(jsonTaskdetails.Data[0].Status)
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
                                var container = '';
                                $.each(jsonTaskdetails.Data2, function (indx, objsubtask) {
                                    if (objsubtask.SubTaskName != null && objsubtask.SubTaskName != "") {
                                        // change by imtiyaz
                                        var checked = objsubtask.Status == 1 ? 'checked' : '';
                                        container += '<div class="custom-control custom-checkbox">';
                                        container += '<input type="checkbox" subtaskId="' + objsubtask.SubTaskID + '" name="subtask_' + objsubtask.SubTaskID + '" id="subtask_' + objsubtask.SubTaskID + '" value="' + objsubtask.SubTaskName + '" class="custom-control-input" ' + checked + '>';
                                        container += '<label class="custom-control-label" subtaskId="' + objsubtask.SubTaskID + '" for="subtask_' + objsubtask.SubTaskID + '">' + objsubtask.SubTaskName + '</label>';
                                        container += '<div class="custom-action"><i class="fas fa-pen" subtaskId="' + objsubtask.SubTaskID + '" onclick="EditSubTask(this);" ></i>|<i class="fas fa-trash-alt" id="subtask_' + objsubtask.SubTaskID + '" onclick="return DeleteSubTask(this);" ></i></div></div>';

                                    }
                                });
                                $('#cblist').empty().append(container);
                            }
                        }
                        if (jsonTaskdetails.Data3 != null && jsonTaskdetails.Data3.length > 0) {
                            if (jsonTaskdetails.Data3[0].Message == null) {
                                //$("#lblfileAttachment").val(jsonTaskdetails.Data3[0].FilePath);
                                newUrl = '../Files/Task/' + jsonTaskdetails.Data3[0].FilePath;
                                $("#linkFileDownload").attr("href", newUrl);
                                $("#linkFileDownload").text(jsonTaskdetails.Data3[0].ActualFileName);
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
                                        container += '<img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title">' + objstatustracker.FirstName + '</span>';
                                        container += '</div>';
                                        container += '<div class="anchor-date"><span>' + moment(objstatustracker.CreatedDate).format("MMM DD YYYY, HH:mm a") + '</span></div>';
                                        container += '</div>';
                                        container += '<div class="wr-content-title">' + objstatustracker.Comments + '</div>';
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
            $("#lblfileAttachment").text("");
            $("#linkFileDownload").attr("href", "#");
            $("#linkFileDownload").text("");
        }

        function SaveUpdateTask() {
            //ShowLoader();
            if (inputValidation('.input-validation-modal')) {
                var hiddenTaskId = $("#hdnTaskId").val();
                var duedate = $("#txtDueDate").val();
                var StringSubtask = "";

                var taskStatusId = $("#ddlStatus").val();
                var container = $('#cblist');
                var inputs = container.find('input');
                if (inputs.length > 0) {
                    $.each(inputs, function (indx, objinputs) {
                        var parentstyle = $(objinputs).parent().css('display');
                        if (parentstyle != 'none') {
                            var chekboxtext = objinputs.value;
                            if ($(this).prop("checked") == true) {
                                chekboxtext = chekboxtext + "^" + "1";
                            }
                            else {
                                chekboxtext = chekboxtext + "^" + "0";
                            }
                            StringSubtask = StringSubtask + chekboxtext + "|";
                        }
                    });
                }
                var task_ActionId = hiddenTaskId != null && hiddenTaskId != "" ? "3" : "2";
                var requestParams = {
                    t_Action: task_ActionId
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
                    , t_StatusID: taskStatusId
                    , t_Comments: $("#txtTaskComments").val()
                    , t_FileName: FileName
                };

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
                            ClearTaskForm();

                            var hdntaskddlStatusId = $("#hdntaskddlStatusId").val();
                            if (hdntaskddlStatusId != null && hdntaskddlStatusId != '' && hdntaskddlStatusId != taskStatusId) {
                                UpdateTaskStatus(requestParams.t_ProjectID, requestParams.t_TaskID, requestParams.t_StatusID, requestParams.t_TaskName);
                            }

                            if (task_ActionId == "2") {
                                userlistAPIresponse.StatusDescription = "Task details added successfully";
                            }
                            else if (task_ActionId == "3") {
                                userlistAPIresponse.StatusDescription = "Task details updated successfully";
                            }
                        }
                        HideLoader();
                        call_Notification(userlistAPIresponse);
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


            }
        }

        function DeleteTaskBYTaskId(TaskId, TaskName) {
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
                        , t_TaskName: TaskName
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
                                userlistAPIresponse.StatusDescription = "Task has been deleted";
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

        function onClickRecentActivity() {
            toggle('dvRecentActivity', 'dvWebsiteRedesign');
            prevTitle = $('#contentTitle').html();
            $('#contentTitle').empty().append('<h5 class="content-title"><i class="fas fa-times c-pointer" onclick="onClickBack(&#34;dvWebsiteRedesign&#34;, &#34;dvRecentActivity&#34;);"></i>Recent Activity</h5>');
            ajacallActivityLogs();
        }

        function onClickAddProject() {
            ClearProjectForm();
            openProjectForm();
        }

        function openProjectForm() {
            toggle('dvCreateProject', 'dvWebsiteRedesign');
            prevTitle = $('#contentTitle').html();
            $('#contentTitle').empty().append('<h5 class="content-title" id="headingProjectName"><i class="fas fa-times c-pointer" onclick="onClickBack(&#34;dvWebsiteRedesign&#34;, &#34;dvCreateProject&#34;);"></i>New Project</h5>')

            $('#contentTitle + .col-auto').addClass('d-none');
        }

        function BindTeamMembers() {
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

            var ajaxprojectadata;
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
                    ajaxprojectadata = response;
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
                    BindProjectData(ajaxprojectadata);

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
                    $('#contentTitle + .col-auto').addClass('d-none');
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
            //ShowLoader();
            if (inputValidation('.input-validation')) {
                var hiddenprojectId = $("#hdnProjectId").val();
                var Project_actionId = hiddenprojectId != null && hiddenprojectId != "" ? "3" : "2";
                var requestParams = {
                    p_Action: Project_actionId
                    , p_CompID: "0"
                    , p_ProjectID: hiddenprojectId != null && hiddenprojectId != "" ? hiddenprojectId : "0"
                    , p_ProjectName: $("#txtProjectName").val()
                    , p_ProjectGoal: $("#txtProjectGoal").val()
                    , p_UserId: "0"
                    , p_ProjectMembers_UserIds: $("#ddlProjectMembers").val().toString()
                };

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
                            if (Project_actionId == "2") {
                                ProjectCRUDAPIData.StatusDescription = "Project details added successfully";
                            }
                            else if (Project_actionId == "3") {
                                ProjectCRUDAPIData.StatusDescription = "Project details updated successfully";
                            }
                        }
                        HideLoader();
                        call_Notification(ProjectCRUDAPIData);
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
            }
        }

        function DeleteProjectBYProjectId(projectId, projectname) {
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
                        , p_ProjectName: projectname
                        , p_ProjectGoal: ""
                        , p_UserId: "0"
                        , p_ProjectMembers_UserIds: ""
                    };
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
                                ProjectID = "";
                                //onClickBack("dvWebsiteRedesign", "dvCreateProject");//Closing Project Form
                                BindProjects();
                                ProjectCRUDAPIData.StatusDescription = "Project has been deleted.";
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
            HideLoader();
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
                var file = element.files[0];
                var size = file.size;
                var allowedExtensions = ['pdf', 'mp4', 'avi', 'flv', 'wmv', 'mov', '3gp', 'webm', 'wav', 'jpg'];

                if (file.size != undefined) {
                    if (allowedExtensions.indexOf(file.name.split('.')[1]) != -1) {
                        if (file.size < 25000000) {
                            var reader = new FileReader();
                            reader.onloadend = function () {
                                base64UserProfileString = reader.result;
                                FileName = file.name;
                            }
                            reader.readAsDataURL(file);
                        }
                        else {
                            base64UserProfileString = "";
                            FileName = "";
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
                        FileName = "";
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
                    FileName = "";
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
            var hiddenSuntaskId = $("#hiddenSuntaskId").val();

            if (hiddenSuntaskId != "" && hiddenSuntaskId > 0) {

                var Selectedcheckbox = container.find('input[subtaskId="' + hiddenSuntaskId + '"]');
                var SelectedLable = container.find('label[subtaskId="' + hiddenSuntaskId + '"]');
                $(Selectedcheckbox).val(name);
                $(SelectedLable).text(name);
                $("#hiddenSuntaskId").val("");
            }
            else {
                var inputs = container.find('input');
                var id = inputs.length + 1;
                var SubtaskControls = '';
                SubtaskControls += '<div class="custom-control custom-checkbox">';
                SubtaskControls += '<input type="checkbox" subtaskId="0"  name="subtask_' + id + '" id="subtask_' + id + '" value="' + name + '" class="custom-control-input" >';
                SubtaskControls += '<label class="custom-control-label"  subtaskId="0"   for="subtask_' + id + '">' + name + '</label>';
                SubtaskControls += '<div class="custom-action"><i class="fas fa-pen" subtaskId="0" id="subtask_' + id + '" onclick="EditSubTask(this);" ></i>|<i class="fas fa-trash-alt" id="subtask_' + id + '" onclick="return DeleteSubTask(this);" ></i></div></div>';
                $('#cblist').append(SubtaskControls);
            }

            $('#txtAddSubTask').val("");
        }

        function UpdateTaskStatus(ProjectID, TaskID, StatusID, taskName) {

            var requestParams = {
                Param_ProjectID: ProjectID,
                Param_TaskID: TaskID,
                Param_CompID: "0",
                Param_SubTaskIds: "", //#(completed taskIds comma separated)
                Param_StatusID: StatusID,
                Param_Comments: "",
                Param_UserID: "0",
                Param_TaskName: taskName
            }

            $.ajax({
                type: "POST",
                url: "../api/Task/TaskUpdate",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    HideLoader();
                },
                success: function (response) {
                    HideLoader();
                    //var UpdateTaskajaxdata = $.parseJSON(response);
                    //if (UpdateTaskajaxdata.StatusCode > 0) {
                    //    BindCards();
                    //}
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
            $("#txtTaskName").attr('readonly', true);
            $("#txtTopicSummary").attr('readonly', true);
            $('#ddlAddAssignee').attr('readonly', true);
            $("#txtAddPrivateNotes").attr('readonly', true);
            $("#divSubtask").hide();
            $("#divfileAttachment").hide();
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
                p_Action: "4"
                , p_CompID: "0"
                , p_StatusName: "0"
                , p_SrNo: "0"
                , p_UserId: "0"
                , p_ProjectID: ProjectID
            };
            $.ajax({
                type: "POST",
                async: false,
                url: "../api/Project/ProjectStatusCRUD",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                success: function (response) {
                    var jsonTaskdetails = $.parseJSON(response).Data.Data;
                    if (jsonTaskdetails != null && jsonTaskdetails.length > 0) {
                        var jsonstatusHtml = '';
                        $.each(jsonTaskdetails, function (indx, objstatus) {
                            jsonstatusHtml += '<option value="' + objstatus.StatusID + '">' + objstatus.Status + '</option>';
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
                    // BindProjects();
                }
            });
        }

        function SelectProject(objthis) {
            //ShowLoader();
            setTimeout(function () { ShowLoader }, 10000);
            onClickBack("dvWebsiteRedesign", "dvCreateProject");//Closing Project Form
            $(objthis).parent().parent().find('li.active').removeClass('active');
            $(objthis).parent().addClass('active');
            setcontentTitle($(objthis).text());
            ProjectID = $(objthis).attr("id");
            BindStatusMaster();
            BindCards();
            BindTeam(ProjectID);
            BindAssignee(ProjectID);
            //HideLoader();
        }

        function EditSubTask(objthis) {
            var subtaskId = $(objthis).attr("subtaskid");
            $("#hiddenSuntaskId").val(subtaskId)
            $("#txtAddSubTask").val($(objthis).parent().parent().find('label.custom-control-label').text());
            $("#btnSave").text("Update");
        }

        function DeleteSubTask(objthis) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete Subtask ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    $(objthis).parent().parent().hide();
                }
            })
        }

        function BindTaskwaiseAssignees() {
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
        }

        function BindtaskData(response) {

            var jsonTaskList = $.parseJSON(response).Data;
            bindTaskStatusCounts(jsonTaskList.Data);

            var newCardHtml = '';
            var cardHtml = '';

            $.each(jsonStatusList, function (indxStatus, objStatus) {
                var statusWiseTaskList = $.grep(jsonTaskList.Data, function (n) {
                    return n.Status == objStatus.StatusID;
                });

                newCardHtml += '<div class="board-column">';
                newCardHtml += '<div id="divheaderStatus">';
                newCardHtml += '<div class="board-column-header">' + objStatus.Status;
                newCardHtml += '<div class="float-right statusediticons">';
                if (Role != "enduser") {
                    newCardHtml += '<i class="fas fa-pen" statusid="' + objStatus.StatusID + '" statusname="' + objStatus.Status + '" onclick="TaskStatusEditable(this,1)"></i>';
                    newCardHtml += '|<i class="fas fa-trash-alt" onclick="return DeleteTaskStatus(' + objStatus.StatusID + ',\'' + objStatus.Status +'\');"></i>';
                }
                newCardHtml += '</div></div>';
                newCardHtml += '</div>';

                newCardHtml += '<div class="board-column-content-wrapper">';
                newCardHtml += '<div class="board-column-content" MasterStatusID="' + objStatus.StatusID + '">';
                // Repeat Status
                cardHtml += '<div class="col-12 col-sm-12 col-md-4">';
                cardHtml += '<div class="card shadow">';
                cardHtml += '<div class="card-body">';
                cardHtml += '<div class="row">';
                cardHtml += '<div class="col-12 mb-3 d-flex justify-content-between align-items-center">';
                cardHtml += '<h5 class="font-weight-bold">' + objStatus.Status + '</h5>';
                cardHtml += '</div>';
                cardHtml += '<ol class="col-12 section-sorting" status_id="' + objStatus.StatusID + '">';
                if (statusWiseTaskList.length > 0) {
                    // Repeat Tasks
                    $.each(statusWiseTaskList, function (indxTask, objTask) {
                        var duedate = new Date(objTask.DueDate);
                        newCardHtml += '<div class="board-item">';
                        newCardHtml += '<div class="board-item-content"  status_id="' + objStatus.StatusID + '" task_Id="' + objTask.TaskID + '" project_Id="' + ProjectID + '" task_Name="' + objTask.TaskName + '">';
                        cardHtml += '<li class="col-12 mb-2 sortable-item" project_Id="' + ProjectID + '"  task_Id="' + objTask.TaskID + '" >';
                        newCardHtml += '<div class="wr-content">';
                        newCardHtml += '<div class="wr-content-title mb-2">' + objTask.TaskName + '<div class="float-right">';
                        newCardHtml += '<i class="fas fa-pen" onclick="BindTaskDetailsBYTaskId(' + objTask.TaskID + ')"></i>';
                        if (Role != "enduser") {
                            newCardHtml += '|<i class="fas fa-trash-alt" onclick="return DeleteTaskBYTaskId(' + objTask.TaskID + ',\'' + objTask.TaskName + '\');"></i>';
                        }
                        newCardHtml += '</div></div>';
                        newCardHtml += '<div class="wr-content-anchar d-flex justify-content-between align-items-center">';

                        //Bind Task Assignee
                        var jsonTaskAssigneelist = gettaskassignees(objTask.TaskAsginee);
                        if (jsonTaskAssigneelist != null && jsonTaskAssigneelist.length > 0) {
                            if (jsonTaskAssigneelist[0].Message == null) {
                                $.each(jsonTaskAssigneelist, function (indxMember, objMember) {
                                    var profilepicpath = '';
                                    if (objMember.FilePath != null && objMember.FilePath != "") {
                                        profilepicpath = '../Files/ProfilePic/' + objMember.FilePath;
                                    } else {
                                        profilepicpath = "../INCLUDES/Asset/images/profile.png";
                                    }
                                    newCardHtml += '<div><img class="anchar-profile-icon" src="' + profilepicpath + '" title="' + objMember.FirstName + ' ' + objMember.LastName + '"  /><span class="anchar-title development">' + objMember.TeamName + '</span></div>';
                                });
                            }
                        }
                        newCardHtml += '<div class="anchor-date"><i class="far fa-clock"></i><span>' + moment(duedate).format("MMM DD, HH:mm a") + '</span></div>';
                        newCardHtml += '</div>';
                        newCardHtml += '</div>';
                        cardHtml += '</li>';
                        newCardHtml += '</div>';
                        newCardHtml += '</div>';
                    });

                }
                else {
                    cardHtml += '<div class="col-12"><h6 class="font-weight-bold">No Tasks Found</h5></div>';
                }
                newCardHtml += '</div>';
                newCardHtml += '</div>';

                cardHtml += ' </ol>';
                if (Role != "enduser") {
                    cardHtml += '<div class="col-12"><a class="btn bg-light-tr rounded w-100" onclick="onOpenTaskInfoModal();"><i class="fas fa-plus"></i>Add Task</a></div>';
                    newCardHtml += '<div class="col-12 mt-2 mb-3"><a class="btn bg-light-tr rounded w-100" onclick="onOpenTaskInfoModal();"><i class="fas fa-plus"></i>Add Task</a></div>';
                }
                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
                newCardHtml += '</div>';
            });

            if (jsonStatusList.length < 6) {
                newCardHtml += '<div class="board-column">';
                newCardHtml += '<div class="card add-status"><div class="card-body" onclick="onOpenAddStatusModal();"><div class="icon mx-auto"><i class="fas fa-plus"></i></div><h3 class="mt-4">Add Status</h3></div></div>';
                newCardHtml += '</div>';
            }

            $("#dvWebsiteRedesign").html("")
            $("#dvWebsiteRedesign").empty().html(cardHtml);
            $("#dvWebsiteRedesign").empty().html(newCardHtml);
            InitializeCardsDraggableView();
            HideLoader();
        }

        function InitializeCardsDraggableView() {
            var itemContainers = [].slice.call(document.querySelectorAll('.board-column-content'));
            var columnGrids = [];
            var boardGrid;
            var activeItem;
            // Define the column grids so we can drag those
            // items around.
            itemContainers.forEach(function (container) {
                // Instantiate column grid.
                var grid = new Muuri(container, {
                    items: '.board-item',
                    layoutDuration: 400,
                    layoutEasing: 'ease',
                    dragEnabled: true,
                    dragSort: function () {
                        return columnGrids;
                    },
                    dragStartPredicate: function (item, event) {
                        if (item === activeItem) {
                            return Muuri.ItemDrag.defaultStartPredicate(item, event);
                        } else {
                            return false;
                        }
                    },
                    dragSortInterval: 0,
                    dragContainer: document.body,
                    dragReleaseDuration: 400,
                    dragReleaseEasing: 'ease',
                    MasterStatusID: $(container).attr("MasterStatusID")
                })
                    .on('dragStart', function (item) {
                        // Let's set fixed widht/height to the dragged item
                        // so that it does not stretch unwillingly when
                        // it's appended to the document body for the
                        // duration of the drag.
                        item.getElement().style.width = item.getWidth() + 'px';
                        item.getElement().style.height = item.getHeight() + 'px';
                    })
                    .on('dragReleaseEnd', function (item) {
                        activeItem = null;
                        // Let's remove the fixed width/height from the
                        // dragged item now that it is back in a grid
                        // column and can freely adjust to it's
                        // surroundings.

                        var taskId = $(item._element).children().attr("task_id");
                        var ProjectId = $(item._element).children().attr("project_Id");
                        var statusId = $(item._element).children().attr("status_id");
                        var taskName = $(item._element).children().attr("task_Name");

                        // columnGrids

                        //draggableContainer.MasterStatusID
                        var draggableContainer = $(columnGrids).filter(function (i, n) {
                            return n._id === item._gridId;
                        })[0];

                        if (draggableContainer._settings.MasterStatusID != statusId) {
                            UpdateTaskStatus(ProjectId, taskId, draggableContainer._settings.MasterStatusID, taskName);
                        }

                        item.getElement().style.width = '';
                        item.getElement().style.height = '';
                        // Just in case, let's refresh the dimensions of all items
                        // in case dragging the item caused some other items to
                        // be different size.
                        columnGrids.forEach(function (grid) {
                            grid.refreshItems();
                        });
                    })
                    .on('layoutStart', function () {
                        // Let's keep the board grid up to date with the
                        // dimensions changes of column grids.
                        boardGrid.refreshItems().layout();
                    });

                // Add the column grid reference to the column grids
                // array, so we can access it later on.
                columnGrids.push(grid);

                grid.getItems().forEach(function (item) {
                    item.getElement().addEventListener('click', function () {
                        activeItem = activeItem === null ? undefined : item;
                    });
                });

            });

            // Instantiate the board grid so we can drag those
            // columns around.
            boardGrid = new Muuri('.board', {
                layoutDuration: 400,
                layoutEasing: 'ease',
                dragEnabled: true,
                dragSortInterval: 0,
                dragStartPredicate: {
                    handle: '.board-column-header'
                },
                dragReleaseDuration: 400,
                dragReleaseEasing: 'ease'
            });
        }

        function BindProjectData(response) {

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
                        if ((ProjectID != "" && objProject.ProjectID == ProjectID) || (ProjectID == "" && indxProject == 0)) {
                            activeClass = 'active';
                            ProjectID = objProject.ProjectID;
                            BindStatusMaster();
                            BindCards();
                            setcontentTitle(objProject.ProjectName);
                            BindTeam(objProject.ProjectID);
                            BindAssignee(ProjectID);
                        }
                        projectHtml += '<li class="list-group-item task-item ' + activeClass + ' " >';
                        projectHtml += '<img class="task-icon" src="../INCLUDES/Asset/images/sun.png" /> <span class="Project_items_Name" id="' + objProject.ProjectID + '" onclick="SelectProject(this)" >' + objProject.ProjectName + '</span>';
                        if (Role != "enduser") {
                            projectHtml += '<a class="task-item-action" id="taskMenu_' + indxProject + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>';
                        }
                        projectHtml += '<div class="dropdown-menu" aria-labelledby="taskMenu_' + indxProject + '">';
                        projectHtml += '<a class="dropdown-item" onclick="BindProjectDetailsBYProjectId(' + objProject.ProjectID + ')">Edit</a>';
                        projectHtml += '<a class="dropdown-item" onclick="DeleteProjectBYProjectId(' + objProject.ProjectID + ',\'' + objProject.ProjectName + '\')">Delete</a>';
                        projectHtml += '</div></li>';
                        projectHtml += '</div></li>';
                    });
                }
                else {
                    projectHtml += '<li class="list-group-item task-item">No Projects Found</li>';
                }
                $("#ulProjects").empty().html(projectHtml);
            }
        }

        function onOpenAddStatusModal() {
            $('#txtStatusName').val("");
            $('#modalStatusInfo').modal('show');
        };

        function SaveUpdateStatus(StatusId = 0) {
            ShowLoader();
            var txtStatusName = $('#txtStatusName').val();
            var txtStatusNameEdit = $('#txtStatusNameEdit').val();

            if (txtStatusName != null && txtStatusName != '' || txtStatusNameEdit != null && txtStatusNameEdit != '') {
                var actionID = StatusId != null && StatusId != '' && StatusId != 0 ? 3 : 2;
                var requestParams = {
                    p_Action: actionID
                    , p_CompID: "0"
                    , p_StatusName: actionID == 2 ? txtStatusName : txtStatusNameEdit
                    , p_SrNo: jsonStatusList.length + 1
                    , p_UserId: "0"
                    , p_ProjectID: ProjectID
                    , p_StatusId: StatusId
                };
                $.ajax({
                    type: "POST",
                    url: "../api/Project/ProjectStatusCRUD",
                    contentType: "application/json",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: requestParams != null ? JSON.stringify(requestParams) : null,
                    success: function (response) {
                        var responseData = $.parseJSON(response);
                        if (responseData.StatusCode > 0) {
                            BindStatusMaster();
                            BindCards();
                            BindTeam(ProjectID);
                            BindAssignee(ProjectID);
                            $('#modalStatusInfo').modal('hide');

                            if (actionID == "2") {
                                responseData.StatusDescription = "Status added successfully";
                            }
                            else if (actionID == "3") {
                                responseData.StatusDescription = "Status updated successfully";
                            }
                        }

                        call_Notification(responseData);
                    },
                    failure: function (response) {
                        debugger;
                        Swal.fire({
                            title: "Failure",
                            text: "Please try Again",
                            icon: "error",
                            button: "Ok",
                        });
                    },
                    complete: function () {
                        // HideLoader();
                    }
                });
            }
            else {
                Swal.fire({
                    title: "Warning",
                    text: "Status name cannot be blank",
                    icon: "warning",
                    button: "Ok",
                });
            }

        }

        var ActualStatusHTML = "";
        function TaskStatusEditable(objthis, type) {
            if (type == 1) { //edit 
                $(".statusediticons").addClass('divDisable');
                ActualStatusHTML = $(objthis).parent().parent().parent().html();
                var StatusId = $(objthis).attr("statusid");
                var StatusName = $(objthis).attr("statusname");
                var editstatusHTML = '';
                editstatusHTML += '<div class="d-flex justify-content-between align-items-center p-3">';
                editstatusHTML += '<input type="text" class="form-control required col-9" id="txtStatusNameEdit" placeholder="Status Name">';
                //editstatusHTML += '<textbox  id="txtStatusNameEdit" > ' + StatusName + ' </textbox>';
                editstatusHTML += '<div class="float-right"><i class="fas fa-check" onclick="SaveUpdateStatus(' + StatusId + ')"></i>|<i class="fas fa-times" onclick="TaskStatusEditable(this,0)"></i></div>'
                editstatusHTML += '</div>'
                $(objthis).parent().parent().replaceWith(editstatusHTML);
                $("#txtStatusNameEdit").val(StatusName);
            }
            else if (type == 0) { //cancel

                if (ActualStatusHTML != "") {
                    $(objthis).parent().parent().replaceWith(ActualStatusHTML);
                }
                ActualStatusHTML = "";
                $(".statusediticons").removeClass('divDisable');
            }
        }

        function DeleteTaskStatus(StatusId,Statusname) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete Status, all Tasks under this Status will be deleted too !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    var requestParams = {
                        p_Action: "5"
                        , p_CompID: "0"
                        , p_StatusName: Statusname
                        , p_SrNo: "0"
                        , p_UserId: "0"
                        , p_ProjectID: ProjectID
                        , p_StatusId: StatusId
                    };
                    $.ajax({
                        type: "POST",
                        url: "../api/Project/ProjectStatusCRUD",
                        contentType: "application/json",
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: requestParams != null ? JSON.stringify(requestParams) : null,
                        success: function (response) {
                            BindStatusMaster();
                            BindCards();
                            BindTeam(ProjectID);
                            BindAssignee(ProjectID);
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
                            // HideLoader();
                        }
                    });
                }
            })
        }

        function gettaskassignees(assigneesData) {
            var TaskAssinees = [];
            var TaskAssigneeRows = assigneesData.split('|');
            $.each(TaskAssigneeRows, function (index, objrow) {
                var TaskAssigneeCols = objrow.split(',');
                var Taskassigneesparam = {
                    FirstName: TaskAssigneeCols[0]
                    , LastName: TaskAssigneeCols[1]
                    , TeamName: TaskAssigneeCols[2]
                    , FilePath: TaskAssigneeCols[3]
                };
                TaskAssinees.push(Taskassigneesparam);
            });
            return TaskAssinees;
        }


        function ajacallActivityLogs() {
            ShowLoader();
            var requestParams = {
                p_Action: "1"
                , p_ActivityMasterId: "0"
                , p_CompID: "0"
                , p_UserId: "0"
                , p_UserName: ""
                , p_Message: ""
                , p_IPAddress: ""
                , p_MethodName: ""
            };

            var ajaxActivityadata;
            $.ajax({
                type: "POST",
                url: "../api/ActivityLog/GetActivityLog",
                contentType: "application/json",
                headers: { "Authorization": "Bearer " + accessToken },
                data: requestParams != null ? JSON.stringify(requestParams) : null,
                beforeSend: function () {
                    //ShowLoader();
                },
                success: function (response) {
                    ajaxActivityadata = response;
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
                    BindActivityLogs(ajaxActivityadata);
                }
            });
        }

        function BindActivityLogs(response) {

            if (response != null) {
                var jsonActivityList = $.parseJSON(response).Data.Data;
                var DistinctDates = GetDistinctDates(jsonActivityList);
                var Html = '';
                Html += '<div class="activity-wrapper">';
                $.each(DistinctDates, function (index, objdates) {
                    Html += '<div class="day">' + objdates.formateddate + '</div>';

                    var DateWiseActivities = $.grep(jsonActivityList, function (n) {
                        var listdate = moment(n.CreatedDate).format("MMM DD YYYY");
                        return listdate == objdates.formateddate;
                    });

                    $.each(DateWiseActivities, function (index, objactivity) {
                        Html += '<div class="activity">';
                        if (objactivity.ActivityMasterId == 201 || objactivity.ActivityMasterId == 204 || objactivity.ActivityMasterId == 211) {
                            Html += '<div class="pre-icon"><span class="check"><i class="fas fa-check"></i></span></div>';
                        }
                        else if (objactivity.ActivityMasterId == 202 || objactivity.ActivityMasterId == 205 || objactivity.ActivityMasterId == 212 || objactivity.ActivityMasterId == 207) {
                            Html += '<div class="pre-icon"><span class="pencil"><i class="fas fa-pencil-alt"></i></span></div>';
                        }
                        else if (objactivity.ActivityMasterId == 203 || objactivity.ActivityMasterId == 206 || objactivity.ActivityMasterId == 213) {
                            Html += '<div class="pre-icon"><span class="pencil"><i class="fas fa-trash-alt"></i></span></div>';
                        }
                        else {
                            Html += '<div class="pre-icon"><span class="pencil"><i class="fas fa-list-alt"></i></span></div>';
                        }
                        Html += '<div class="col-12 col-md-8 col-lg-10 content">';
                        Html += objactivity.Message;
                        Html += '</div>';
                        Html += '<div class="time">' + moment(objactivity.CreatedDate).format("HH:mm a") + '</div>';
                        Html += '</div>';
                    });
                    Html += '</div>';
                });
                $("#dvActivitybody").empty().html(Html);
                HideLoader();

            }
        }

        function GetDistinctDates(data) {
            var lookup = {};
            var items = data;
            var result = [];

            for (var item, i = 0; item = items[i++];) {
                var date = moment(item.CreatedDate).format("MMM DD YYYY");
                var dateobject = { formateddate: moment(item.CreatedDate).format("MMM DD YYYY"), actualdate: item.CreatedDate }

                if (!(date in lookup)) {
                    lookup[date] = 1;
                    result.push(dateobject);
                }
            }
            return result;
        }


        //function BindTeamMaster(data) {
        //    var lookup = {};
        //    var items = data;
        //    var result = [];

        //    for (var item, i = 0; item = items[i++];) {
        //        var name = item.TeamName;
        //        var teamobject = { Id: item.Id, TeamName: item.TeamName }

        //        if (!(name in lookup)) {
        //            lookup[name] = 1;
        //            result.push(teamobject);
        //        }
        //    }
        //    return result;
        //}
    </script>
</asp:Content>
