<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="LearningJourney.aspx.cs" Inherits="_365_Portal.t.LearningJourney" %>
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
                    <a class="btn btn-yellow" onclick="SaveAsDraft('.tab-pane.active');">Save as Draft</a>
                </div>
            </div>
            <div class="col-12 col-sm-12 mt-4">
                <div class="progress">
                    <%--<div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>--%>
                    <div class="progress-bar" id="divProgressBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <ul class="nav nav-pills mb-2" id="pills-tab" role="tablist">
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
                                                        <input type="file" id="imgCourseLogo" onchange="readURL(this, '.logo-img');encodeImagetoBase64(this,'CourseLogo')">
                                                    </div>
                                                </div>
                                                <div class="logo-img"></div>
                                                <%-- if image set then use this html --%>
                                                <%--<div class="logo-img img">
                                                    <img src="../INCLUDES/Asset/images/sun.png" class="img-fluid" />
                                                </div>--%>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-9">
                                                <div class="form-group">
                                                    <label for="ddlTags">Tags</label>
                                                    <select class="form-control select2 required" id="ddlTags" style="width: 100% !important" multiple>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-12 col-md-9">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-black" data-toggle="modal" data-target="#modalAddTag">
                                                      Add More Tags
                                                    </button>
                                                </div>
                                            </div>

                                            <%--<div class="col-sm-12 mt-4 course-tag">
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
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="pills-lesson-and-content" role="tabpanel" aria-labelledby="pills-lesson-and-content-tab">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6">a</div>
                                    <div class="col-sm-6">b</div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="pills-resources" role="tabpanel" aria-labelledby="pills-resources-tab">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse 
                        magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum 
                        mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt 
                        non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.
                            </div>
                        </div>
                    </div>


                    <div class="tab-pane fade" id="pills-quiz" role="tabpanel" aria-labelledby="pills-quiz-tab">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse 
                        magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum 
                        mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt 
                        non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div class="col-12 col-sm-12 mt-3">
                <a id="btnAddLesson" onclick="AddCourseFromLesson('.tab-pane.active');" class="btn btn-black float-right">Add Lesson</a>
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

        var accessToken = '<%=Session["access_token"]%>';
        var CourseFlag = '0';
        var LessonFlag = '0';
        var ResourceFlag = '0';
        var QuizFlag = '0';

        $(document).ready(function () {
            debugger
            if (readQueryString()["Id"] != undefined && readQueryString()["Id"] != '') {
                CourseFlag = readQueryString()["Id"];
                Edit();
            }
            else {
                GetCourseCategoryTagsAndBadge('view', 0, 0, 0);
            }

            //$("#ddlTags").select2({
            //    tags: true,
            //    placeholder: "Enter tag"
            //});
            //selectInit('#ddlCategory', 'Select Category'); 
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

        function SaveAsDraft(el) {

            var active_button = $('#pills-tabContent div#pills-course');
            var activeTabID = $(active_button).attr('id');

            if (activeTabID == 'pills-course') {
                AddCourse('redirect');
            }            
            else if (activeTabID == 'pills-lesson-and-content') {

            }
            else if (activeTabID == 'pills - resources') {

            }
            else if (activeTabID == 'pills-quiz') {

            }
            else {
                Swal.fire("Oops! Something went wrong. Please try again", {
                    icon: "error",
                });
            }
            
            //$(el).removeClass('edit').removeClass('view')
            //$(el).addClass('view')
            //$('#txtCourseTitle').val('Lorem Ipsum')
            //$('#txtCourseSummary').val('Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
            //$('#txtCourseSummary').val('Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
            //$('#ddlCategory').val('2').trigger('change')
            //$(el).find('.logo-img').addClass('img')
            //$(el).find('.logo-img').html('<img src="../INCLUDES/Asset/images/sun.png" class="img-fluid" />')           
        }

        function AddCourseFromLesson()
        {
            AddCourse('samepage');
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

        function ClearFieldsAddCourse()
        {
            $('#txtCourseTitle').val('');
            $('#txtCourseSummary').val('');
            $('#txtCourseThemeColor').val('');
            $('#ddlCourseCategory').val('').trigger('change');
            $("#rbGlobal").prop("checked", true)
            $('#txtCourseThemeColor').val('#161E98');
            $("#ddlTags option:selected").prop("selected", false);
            selectInit('#ddlTags ', 'Select Tag');
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
                                            else if (flag == 'samepage') {
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
                                                });
                                            }
                                            else {
                                                Swal.fire({
                                                    title: "Failure",
                                                    text: "Oops! Something went wrong. Please try again",
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

        function SetProgressBar()
        {
            if (CourseFlag != '0' && LessonFlag == '0' && ResourceFlag == '0' && QuizFlag == '0')
            {
                $("#divProgressBar").css("width", "25%");
            }
            else if (CourseFlag != '0' && LessonFlag != '0' && ResourceFlag == '0' && QuizFlag == '0') {
                $("#divProgressBar").css("width", "50%");
            }
            else if (CourseFlag != '0' && LessonFlag != '0' && ResourceFlag != '0' && QuizFlag == '0') {
                $("#divProgressBar").css("width", "75%");
            }
            else if (CourseFlag != '0' && LessonFlag != '0' && ResourceFlag != '0' && QuizFlag != '0') {
                $("#divProgressBar").css("width", "100%");
            }
        }

        function Edit() {
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

                            GetCourseCategoryTagsAndBadge('update', EditTopic[0].CategoryID, 0, EditTopic[0].TagID);
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
