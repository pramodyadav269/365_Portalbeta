<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="UserCourseStatus.aspx.cs" Inherits="_365_Portal.t.UserCourseStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row">
        <div class="col-md-12 header mb-5">
            <a class="back" href="dashboard.aspx"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
            <h2 class="text-center font-weight-bold">User Courses In Progress</h2>
        </div>

        <div class="col-md-12" id="divGird">
            <div class="card shadow border-0 border-radius-0">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-2">
                            <div class="form-group">                                
                                <select id="ddlCourseStatus" class="form-control select2 required" style="width: 100% !important" >                                    
                                    <option value="1">Course Completed</option>
                                    <option value="2">Course In Progress</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-2">
                            <div class="form-group">                                
                                <select id="ddlOperator" class="form-control select2 required" style="width: 100% !important" >                                    
                                    <option value=">">Is greater than</option>
                                    <option value="<">Is less than</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <input type="text" class="form-control required" id="txtCount" placeholder="Enter Count" />
                            </div>
                        </div>
                        
                        <div class="col-sm-12 col-md-2">
                            <a class="btn bg-yellow" id="btnSearch" onclick="GetGetUserCourseStatus();" >Search</a>
                        </div>
                    </div>

                    <h3 style="display:none;" id="hdngCount"></h3>

                    <div id="divTable" class="mt-3 table-responsive">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var accessToken = '<%=Session["access_token"]%>';

        function inputValidation()
        {
            var valFlag = false;
            if ($("#ddlCourseStatus").val() != '' && $("#ddlOperator").val() != '' && $("#txtCount").val()) {
                valFlag = true;
            }
            return valFlag;
        }

        function GetGetUserCourseStatus() {
            debugger
            if (inputValidation()) {
                ShowLoader();
                var getUrl = "/API/User/GetGetUserCourseStatus";
                var requestParams = { CourseFilterID: $("#ddlCourseStatus").val(), Operator: $("#ddlOperator").val(), Count: $("#txtCount").val() };
                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    success: function (response) {
                        HideLoader();
                        try {
                            var DataSet = $.parseJSON(response);
                            HideLoader();
                            if (DataSet.StatusCode == "1") {
                                BindTable(DataSet.Data);
                            }
                            else {
                                Swal.fire(DataSet.StatusDescription, {
                                    icon: "error",
                                });
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
            else {
                Swal.fire("! Please enter all fields.", {
                    icon: "error",
                });
            }
        }
        function BindTable(DataSet) {

            var Table = DataSet.Data;
            var UsersCount = DataSet.Data1;

            $('#divTable').empty().append();
            var tbl = '<table id="tblGird" class="table table-bordered" style="width:100%">' +
                '<thead><tr><th>#</th><th style="display:none;">ID</th><th>UserName</th><th>Display Name</th><th>User Group</th><th>Courses In Progress</th><th>Quiz Passes</th><th>Last Activity</th></thead>'
            tbl += '<tbody>';

            if (Table != undefined && Table.length > 0) {
                for (var i = 0; i < Table.length; i++) {
                    tbl += '<tr>';
                    tbl += '<td>' + (i + 1) + '</td>';
                    tbl += '<td style="display:none;" id="id">' + Table[i].UserID + '</td>';
                    tbl += '<td title="' + Table[i].EmailID + '" >' + Table[i].EmailID + '</td>';
                    tbl += '<td title="' + Table[i].UserName + '" >' + Table[i].UserName + '</td>';
                    tbl += '<td title="' + BlankIfNullOrUndefined(Table[i].GroupNames) + '" >' + BlankIfNullOrUndefined(Table[i].GroupNames).replace(/,\s*$/, "") + '</td>';
                    tbl += '<td title="' + Table[i].InProgressCourses + '" >' + Table[i].InProgressCourses + '</td>';
                    tbl += '<td title="' + Table[i].CompletedModules + '" >' + Table[i].CompletedModules + '</td>';
                    tbl += '<td title="' + BlankIfNullOrUndefined(Table[i].LastActivityDate) + '" >' + BlankIfNullOrUndefined(Table[i].LastActivityDate) + '</td>';
                    tbl += '</tr>';
                }

                $('#hdngCount').text(Table.length + ' / ' + UsersCount[0].TotalUsers + ' Users');
                $('#hdngCount').show();
            }
            else {
                $('#hdngCount').hide();
            }

            tbl += '</tbody>';
            tbl += '</table>';
            $('#divTable').empty().append(tbl);
            $('#tblGird').DataTable();
        }
    </script>

</asp:Content>
