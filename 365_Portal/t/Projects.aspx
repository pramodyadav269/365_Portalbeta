<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="_365_Portal.t.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid">
        <div class="row pt-4 pb-4">
            <div class="col-10 offset-2">
                <div class="row">
                    <div class="col-auto mr-auto" id="contentTitle">
                        <h5 class="content-title"><i class="fas fa-tasks"></i>Website Redesign</h5>
                    </div>
                    <div class="col-auto">
                        <a class="content-activity"><i class="far fa-folder"></i>File</a>
                        <a class="content-activity"><i class="fas fa-share-alt"></i>Share</a>
                        <a class="content-activity"><i class="fas fa-filter"></i>Filter</a>
                        <a class="content-activity"><i class="fas fa-wave-square"></i>Recent Activity</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-2 pl-0 sub-side-menu">
                <ul class="list-group mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="task-summary"><span class="task-summary-count" id="spnCompletedTasksCount">0</span><span class="task-summary-title">Completed Tasks</span></div>
                        <div class="task-summary"><span class="task-summary-count" id="spnOpenTasksCount">0</span><span class="task-summary-title">Open Tasks</span></div>
                    </li>
                </ul>
                <ul id="ulProjects" class="list-group task-bar mb-4">
                    <%--<li class="list-group-item d-flex justify-content-between align-items-center task-title">Projects
                        <a onclick="onClickAddTask();"><i class="fas fa-plus c-yellow"></i></a>
                    </li>
                    <li class="list-group-item task-item">
                        <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />Dashboard UI Kit</li>
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
                    <%--   <div class="col-12 col-sm-12 col-md-4">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 mb-3 d-flex justify-content-between align-items-center">
                                        <h5 class="font-weight-bold">To Do</h5>
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
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-10 mb-3">
                                        <div class="form-group">
                                            <label for="txtProjectName">Project Name</label>
                                            <input type="text" class="form-control required" id="txtProjectName" placeholder="Project Name" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-10">
                                        <div class="form-group">
                                            <label for="ddlProjectMembers">Project Members</label>
                                            <select class="form-control select2 required" id="ddlProjectMembers" style="width: 100% !important" multiple>
                                                <%--<option></option>
                                                <option value="1">Project Member 1</option>
                                                <option value="2">Project Member 2</option>
                                                <option value="3">Project Member 3</option>
                                                <option value="4">Project Member 4</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-12 col-sm-12 col-md-10 mt-4 text-right">
                                        <a class="btn bg-yellow" onclick="inputValidation('.input-validation');" onclick="SaveProject(this)">Submit</a>
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

        var prevTitle = '';

        $(document).ready(function () {
            BindTeamMembers();
            BindProjects();
            BindTeam();
            BindCards();
        });

        function onClickAddTask() {
            toggle('dvCreateProject', 'dvWebsiteRedesign');
            prevTitle = $('#contentTitle').html();
            $('#contentTitle').empty().append('<h5 class="content-title"><i class="fas fa-times c-pointer" onclick="onClickBack(&#34;dvWebsiteRedesign&#34;, &#34;dvCreateProject&#34;);"></i>New Project</h5>')

            selectInit('#ddlProjectMembers', 'Search by user or by user name');
        }

        function onClickBack(view, hide) {
            toggle(view, hide);
            $('#contentTitle').empty().append(prevTitle);
        }

        function BindCards() {

            // Ajax Call
            var jsonStatusList = [];
            jsonStatusList.push({ StatusID: 1, Status: "To Do" });
            jsonStatusList.push({ StatusID: 2, Status: "In Progress" });
            jsonStatusList.push({ StatusID: 3, Status: "Done" });

            var jsonTaskList = [];
            jsonTaskList.push({ TaskId: 1, StatusID: 1, TaskName: "This is some text within a card body." });
            jsonTaskList.push({ TaskId: 2, StatusID: 2, TaskName: "This is some text within a card body." });
            jsonTaskList.push({ TaskId: 3, StatusID: 3, TaskName: "This is some text within a card body." });

            var jsonTaskSummary = [];
            jsonTaskSummary.push({ CompletedTasksCount: 20, OpenTasksCount: 7 });

            $("#spnCompletedTasksCount").html(jsonTaskSummary.CompletedTasksCount);
            $("#spnOpenTasksCount").html(jsonTaskSummary.OpenTasksCount);

            var cardHtml = '';

            $.each(jsonStatusList, function (indxStatus, objStatus) {
                // Repeat Status
                cardHtml += '<div class="col-12 col-sm-12 col-md-4">';
                cardHtml += '<div class="card shadow">';
                cardHtml += '<div class="card-body">';
                cardHtml += '<div class="row">';
                cardHtml += '<div class="col-12 mb-3 d-flex justify-content-between align-items-center">';
                cardHtml += '<h5 class="font-weight-bold">' + objStatus.Status + '</h5>';
                cardHtml += '<a class="btn bg-yellow rounded"><i class="fas fa-plus"></i>Add Task</a>';
                cardHtml += ' </div>';

                var statusWiseTaskList = $.grep(jsonTaskList, function (n, i) {
                    return n.StatusID === objStatus.StatusID;
                });

                //statusWiseTaskList = [];
                if (statusWiseTaskList.length > 0) {
                    // Repeat Tasks
                    $.each(statusWiseTaskList, function (indxTask, objTask) {
                        cardHtml += '<div class="col-12 mb-2">';
                        cardHtml += '<div class="wr-content">';
                        cardHtml += '<div class="wr-content-title mb-2">';
                        cardHtml += objTask.TaskName;
                        cardHtml += '</div>';
                        cardHtml += '<div class="wr-content-anchar d-flex justify-content-between align-items-center">';
                        cardHtml += '<div>';
                        cardHtml += ' <img class="anchar-profile-icon" src="../INCLUDES/Asset/images/profile.png" /><span class="anchar-title development">Development</span>';
                        cardHtml += '</div>';
                        cardHtml += ' <div class="anchor-date"><i class="far fa-clock"></i><span>Mar 10, 12:00 PM</span></div>';
                        cardHtml += ' </div>';
                        cardHtml += ' </div>';
                        cardHtml += ' </div>';
                    });
                }
                else {
                    cardHtml += '<div>No Tasks Found</div>';
                }

                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
                cardHtml += '</div>';
            });

            $("#dvWebsiteRedesign").html(cardHtml);

        }

        function BindProjects() {

            // Ajax Call
            var jsonProjectList = [];
            jsonProjectList.push({ ProjectID: 1, ProjectName: "Project 1" });
            jsonProjectList.push({ ProjectID: 2, ProjectName: "Project 2" });
            jsonProjectList.push({ ProjectID: 3, ProjectName: "Project 3" });
            jsonProjectList.push({ ProjectID: 4, ProjectName: "Project 4" });
            jsonProjectList.push({ ProjectID: 5, ProjectName: "Project 5" });
            jsonProjectList.push({ ProjectID: 6, ProjectName: "Project 6" });
            jsonProjectList.push({ ProjectID: 7, ProjectName: "Project 7" });

            var projectHtml = '';
            projectHtml += '<li class="list-group-item d-flex justify-content-between align-items-center task-title">Projects';
            projectHtml += '<a onclick="onClickAddTask();"><i class="fas fa-plus c-yellow"></i></a>';
            projectHtml += ' </li>';
            //jsonProjectList = [];
            if (jsonProjectList.length > 0) {
                $.each(jsonProjectList, function (indxProject, objProject) {
                    projectHtml += '<li class="list-group-item task-item">';
                    projectHtml += ' <img class="task-icon" src="../INCLUDES/Asset/images/sun.png" />' + objProject.ProjectName + '</li>';
                });
            }
            else {
                projectHtml += '<li class="list-group-item task-item">No Projects Found</li>';
            }
            $("#ulProjects").html(projectHtml);
        }

        function BindTeam() {

            // Ajax Call
            var jsonTeam = [];
            jsonTeam.push({ GroupID: 1, GroupName: "Team 1" });
            jsonTeam.push({ GroupID: 2, GroupName: "Team 2" });
            jsonTeam.push({ GroupID: 3, GroupName: "Team 3" });

            var jsonTeamMembers = [];
            jsonTeamMembers.push({ GroupID: 1, Name: "userName 1" });
            jsonTeamMembers.push({ GroupID: 1, Name: "userName 1" });
            jsonTeamMembers.push({ GroupID: 1, Name: "userName 1" });
            jsonTeamMembers.push({ GroupID: 2, Name: "userName 2" });
            jsonTeamMembers.push({ GroupID: 2, Name: "userName 2" });
            jsonTeamMembers.push({ GroupID: 2, Name: "userName 2" });
            jsonTeamMembers.push({ GroupID: 2, Name: "userName 2" });
            jsonTeamMembers.push({ GroupID: 3, Name: "userName 3" });
            jsonTeamMembers.push({ GroupID: 3, Name: "userName 3" });

            var teamHtml = '';
            teamHtml += '<li class="list-group-item task-title">Teams</li>';
            // jsonTeam = [];
            if (jsonTeam.length > 0) {
                $.each(jsonTeam, function (indxTeam, objTeam) {
                    teamHtml += '<li class="list-group-item d-flex justify-content-between align-items-center">' + objTeam.GroupName + '';
                    teamHtml += '<span>';

                    var groupWiseMembers = $.grep(jsonTeamMembers, function (n, i) {
                        return n.GroupID === objTeam.GroupID;
                    });

                    $.each(groupWiseMembers, function (indxMember, objMember) {
                        teamHtml += '<img class="task-user-icon" src="../INCLUDES/Asset/images/profile.png" />';
                    });
                    teamHtml += '</span>';
                    teamHtml += '</li>';
                });
            }
            else {
                teamHtml += '<li class="list-group-item d-flex justify-content-between align-items-center">No Team Found';
            }
            teamHtml += '<li class="list-group-item"><a class="c-yellow"><i class="fas fa-plus"></i>Add a Team</a></li>';
            $("#ulTeam").html(teamHtml);
        }

        function BindTeamMembers() {

            // Ajax Call
            var jsonTeamMembers = [];
            jsonTeamMembers.push({ UserId: 1, Name: "userName 1" });
            jsonTeamMembers.push({ UserId: 2, Name: "userName 2" });
            jsonTeamMembers.push({ UserId: 3, Name: "userName 3" });
            jsonTeamMembers.push({ UserId: 4, Name: "userName 4" });
            jsonTeamMembers.push({ UserId: 5, Name: "userName 5" });

            var jsonTeamMembersHtml = "";
            $.each(jsonTeamMembers, function (indxMember, objMember) {
                jsonTeamMembersHtml += '<option value="' + objMember.UserId + '">' + objMember.Name + '</option>';
            });
            $("#ddlProjectMembers").html(jsonTeamMembersHtml);
        }

        function SaveProject() {
            $("#txtProjectName").val();
            $("#ddlProjectMembers").val();


            // Ajax Call
        }

    </script>
</asp:Content>
