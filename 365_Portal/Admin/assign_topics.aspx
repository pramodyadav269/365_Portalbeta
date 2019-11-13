﻿<%@ Page Title="Assign Topics" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="assign_topics.aspx.cs" Inherits="_365_Portal.Admin.AssignTopics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12 header mb-5">
            <a class="back" href="dashboard.aspx"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
            <h1 class="text-center font-weight-bold">Assign Topics</h1>
        </div>


        <div class="col-md-12">
            <div class="card shadow border-0 border-radius-0">
                <div class="card-body">
                    <div class="row input-validation">
                        <div class="col-md-6">
                            <div class="form-group radio">
                                <label>Assign Mode</label>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="rblBulk" name="TopicAssignment" class="custom-control-input" value="BULK" onchange="BindGroupUserCheckboxList();">
                                    <label class="custom-control-label" for="rblBulk">Assign Multiple</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="tblIndividual" name="TopicAssignment" class="custom-control-input" value="INDIVIDUAL" onchange="BindGroupUserCheckboxList();">
                                    <label class="custom-control-label" for="tblIndividual">Assign Individually</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlAssignType">Assign By</label>
                                <select class="form-control select2" id="ddlAssignType" style="width: 100% !important" onchange="BindGroupUserCheckboxList(this);">
                                    <option></option>
                                    <option value="GROUP">Group</option>
                                    <option value="USER">User</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12" id="dvGroupContainer" style="display: none;">
                            <div class="">
                                <label>Select Groups</label>
                                <div id="dvGroups"></div>
                            </div>
                        </div>

                        <div class="col-md-12" id="dvUserContainer" style="display: none;">
                            <div class="">
                                <label>Select Users</label>
                                <div id="dvUsers"></div>
                            </div>
                        </div>

                        <div class="col-md-12 mt-3" id="dvTopicContainer" style="display: none;">
                            <div class="">
                                <label>Select Topics</label>
                                <div id="dvTopics"></div>
                            </div>
                        </div>

                        <div class="w-100"></div>

                        <div class="col-md-12 mt-4">
                            <div class="float-right">
                                <a class="btn bg-yellow" id="btnSubmit" style="display: none;" onclick="SaveChanges(this);return false;">Save Changes</a>

                            </div>
                        </div>
                        <label id="lblJSON"></label>

                    </div>
                </div>
            </div>
        </div>







        <%-- <div>
            Assign Mode:
            <input type="radio" id="rblBulk" name="TopicAssignment" value="BULK" onchange="BindGroupUserCheckboxList();">
            <label for="rblBulk">Assign Multiple</label>
            <input type="radio" id="tblIndividual" name="TopicAssignment" value="INDIVIDUAL" onchange="BindGroupUserCheckboxList();">
            <label for="tblIndividual">Assign Individually</label>
            <br />
            Assign By:
            <select id="ddlAssignType" onchange="BindGroupUserCheckboxList(this);">
                <option value="-1">--Select--</option>
                <option value="GROUP">Group</option>
                <option value="USER">User</option>
            </select>

            <div id="dvGroupContainer" style="display: none;">
                <h2>Select Groups</h2>
                <div id="dvGroups"></div>
            </div>
            <div id="dvUserContainer" style="display: none;">
                <h2>Select Users</h2>
                <div id="dvUsers"></div>
            </div>

            <div id="dvTopicContainer" style="display: none;">
                <h2>Select Topics</h2>
                <div id="dvTopics"></div>
            </div>

            <br />
            <br />
            <button id="btnSubmit" style="display: none;" onclick="SaveChanges();return false;">Save Changes</button>
            <br />
            <label id="lblJSON"></label>

        </div>--%>
    </div>
    <script>

        var accessToken = '<%=Session["access_token"]%>';

        $(document).ready(function () {
            BindTopics();
        });

        function BindTopics() {
            var htmlCheckboxes = "";

            $.ajax({
                type: "POST",
                url: "../api/Trainning/GetTableData",
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify({ Type: 1 }),
                contentType: "application/json",
                success: function (response) {
                    response = $.parseJSON(response);

                    $.each(response.Data, function (index, topic) {
                        htmlCheckboxes += '<input type="checkbox" name="chk_"' + topic.Title + ' value="' + topic.TopicID + '"><label for="' + topic.TopicID + '">' + topic.Title + '</label>';
                    });

                    $("#dvTopics").html(htmlCheckboxes);
                }
            });
        }

        function BindGroupUserCheckboxList(cntrl) {
            $("#dvGroupContainer").hide();
            $("#dvUserContainer").hide();
            $("#dvTopicContainer").show();
            $("#btnSubmit").show();

            $("#dvGroups").html("");
            $("#dvUsers").html("");
            var htmlCheckboxes = "";

            if ($("#ddlAssignType").val() == "GROUP") {

                $.ajax({
                    type: "POST",
                    url: "../api/Trainning/GetTableData",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify({ Type: 3 }),
                    contentType: "application/json",
                    success: function (response) {
                        response = $.parseJSON(response);

                        if ($("input[name='TopicAssignment']:checked").val() == "BULK") {
                            $.each(response.Data, function (index, group) {
                                htmlCheckboxes += '<input type="checkbox" name="chk_"' + group.GroupName + ' value="' + group.GroupId + '"><label for="' + group.GroupId + '">' + group.GroupName + '</label>';
                            });
                        }
                        else {
                            htmlCheckboxes += '<select id="ddlGroup" class="form-control select2" style="width: 100% !important" onchange="GetSelectedTopics(this)";>';
                            htmlCheckboxes += '<option></option>';
                            $.each(response.Data, function (index, group) {
                                htmlCheckboxes += '<option value="' + group.GroupId + '">' + group.GroupName + '</option>';
                            });
                            htmlCheckboxes += '</select>';
                        }

                        $("#dvGroups").html(htmlCheckboxes);
                        $("#dvGroupContainer").show();
                    }
                });
            }
            else if ($("#ddlAssignType").val() == "USER") {

                $.ajax({
                    type: "POST",
                    url: "../api/Trainning/GetTableData",
                    headers: { "Authorization": "Bearer " + accessToken },
                     data: JSON.stringify({ Type: 2}),
                    contentType: "application/json",
                    success: function (response) {
                        response = $.parseJSON(response);

                        if ($("input[name='TopicAssignment']:checked").val() == "BULK") {
                            $.each(response.Data, function (index, user) {
                                htmlCheckboxes += '<input type="checkbox" name="chk_"' + user.UserId + ' value="' + user.UserId + '"><label for="' + user.UserId + '">' + user.EmailID + '</label>';
                            });
                        }
                        else {
                            htmlCheckboxes += '<select id="ddlUser" class="form-control select2" style="width: 100% !important" onchange="GetSelectedTopics(this)";>';
                            htmlCheckboxes += '<option></option>';
                            $.each(response.Data, function (index, user) {
                                htmlCheckboxes += '<option value="' + user.UserId + '">' + user.EmailID + '</option>';
                            });
                            htmlCheckboxes += '</select>';
                        }

                        $("#dvUsers").html(htmlCheckboxes);
                        $("#dvUserContainer").show();
                    }
                });
            }
            else {
                $("#dvTopicContainer").hide();
                $("#btnSubmit").hide();
            }

            $('select.select2').select2({
                placeholder: "Select a option",
                allowClear: true
            });
        }

        function GetSelectedTopics(cntrl) {
            var topicIds = [1, 4, 10, 12, 2, 3];

            if (cntrl.id == 'ddlGroup') {
                var selectedGroupID = $("#ddlGroup").val();
            }
            else if (cntrl.id == 'ddlUser') {
                var selectedUserId = $("#ddlUser").val();
            }

            $.each(topicIds, function (index, topicId) {
                $("#chkTopic_" + topicId).prop("checked", true);
            });
        }

        function SaveChanges() {
            var groupIds = "";
            var topicIds = "";
            var userIds = "";
            var requestParams = {};
            $("input[name='TOPIC']").each(function (index, obj) {
                if (obj.checked) {
                    topicIds += obj.value + ",";
                }
            });
            topicIds = topicIds.replace(/,\s*$/, "");

            if ($("#ddlAssignType").val() == "GROUP") {
                if ($("input[name='TopicAssignment']:checked").val() == "BULK") {
                    $("input[name='GROUP']").each(function (index, obj) {
                        if (obj.checked) {
                            groupIds += obj.value + ",";
                        }
                    });
                }
                else {
                    groupIds = $("#ddlGroup").val() != "" ? $("#ddlGroup").val() : "";
                }
                groupIds = groupIds.replace(/,\s*$/, "");
                requestParams = { "Type": $("#ddlAssignType").val(), "GroupIds": groupIds, "UserIds": "", "TopicIds": topicIds };
            }
            else if ($("#ddlAssignType").val() == "USER") {
                if ($("input[name='TopicAssignment']:checked").val() == "BULK") {
                    $("input[name='USER']").each(function (index, obj) {
                        if (obj.checked) {
                            userIds += obj.value + ",";
                        }
                    });
                }
                else {
                    userIds = $("#ddlUser").val() != "" ? $("#ddlUser").val() : "";
                }
                userIds = userIds.replace(/,\s*$/, "");
                requestParams = { "Type": $("#ddlAssignType").val(), "GroupIds": "", "UserIds": userIds, "TopicIds": topicIds };
            }

            if (requestParams.Ids.length == 0 || requestParams.TopicIds.length == 0) {
                alert("No options selected.");
            }

            $("#lblJSON").text(JSON.stringify(requestParams));

            $.ajax({
                type: "POST",
                url: "../api/Trainning/AssignTopicsByEntity",
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                success: function (response) {
                    response = $.parseJSON(response);
                    alert("Success");
                }
            });
        }
    </script>
</asp:Content>
