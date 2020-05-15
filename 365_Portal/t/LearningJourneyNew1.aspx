<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="LearningJourneyNew1.aspx.cs" Inherits="_365_Portal.t.LearningJourneyNew1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="course-flow">
        <div class="row">
            <div class="col-12 col-sm-12 d-flex justify-content-between header">
                <div class="d-flex align-items-center">
                    <h4 class="title">Add Course</h4>
                </div>
                <div>
                    <%--<a class="btn btn-outline mr-3">Discard Draft</a>--%>
                    <a class="btn btn-yellow d-none" id="dvSaveAsDraft" onclick="SaveAsDraft('.tab-pane.active');">Save as Draft</a>
                    <a class="btn btn-yellow" id="dvPublishCourse" style="display: none;" onclick="PublishCourse('');">Publish</a>

                    <div class="col dropdown p-0">
                        <a class="btn btn-yellow dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Publish</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item">Save</a>
                            <a class="dropdown-item">Save draft</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-12 mt-4 accordion course-collapse">
                <div class="card">
                    <div class="card-header" id="headingCourse">
                        <%--<h5>hdfhadfhsdhffldsdhfkf</h5>--%><%--keep some text in this heading if want to collapse.The code is written in site.js file in ready function at line no 96--%>
                        <h5></h5>
                        <a data-toggle="collapse" data-target="#collapseCourse" aria-expanded="true" aria-controls="collapseCourse">
                            <i class="fas fa-chevron-down"></i>
                        </a>
                    </div>
                    <div id="collapseCourse" class="collapse in" aria-labelledby="headingCourse">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-8 pr-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group asterisk">
                                                <label for="txtCourseTitle" class="inline">Course Title</label>
                                                <input type="text" class="form-control required" id="txtCourseTitle" placeholder="Add New Course Title" />
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group asterisk">
                                                <label for="txtCourseDescription" class="inline">Course Description</label>
                                                <textarea class="form-control required" id="txtCourseDescription" placeholder="Add Course Description"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group asterisk">
                                                <label for="ddlCourseCategory" class="inline">Course Category</label>
                                                <select class="form-control select2 required" id="ddlCourseCategory" style="width: 100% !important">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group asterisk">
                                                <label for="ddlTags" class="inline">Tags</label>
                                                <select class="form-control select2 required" id="ddlTags" style="width: 100% !important" multiple>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group color-picker">
                                                <label for="txtCourseThemeColor">Theme Color</label>
                                                <input type="color" class="form-control" id="txtCourseThemeColor" onchange="clickColor(0, -1, -1, 5)" value="#161E98" />
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <a id="btnManageTags" data-toggle="modal" data-target="#modalAddTag" onclick="clearModalText();" href="#"><u>Manage Tags</u></a>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group editor">
                                                <label>Course Summary </label>
                                                <%--<span>Highlight why the course should be taken and who is the appropriate audience for the course.</span>--%>
                                                <div id="txtCourseSummary"></div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 col-md-6 mb-3">
                                            <a class="btn btn-black" onclick="AddCourse('add');"><i class="fas fa-plus-circle"></i>Add Course</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-4 pl-0">
                                <div class="card-body right-side-content">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label><i class="fas fa-plus-circle"></i>Course Logo </label>
                                                <%--<span>Set the image for the course.</span>--%>
                                                <div class="logo-img course-logo" id="divCourseLogo"></div>
                                                <div class="custom-file logo">
                                                    <input type="file" class="custom-file-input" id="imgCourseLogo" onchange="readURL(this, '.course-logo');encodeImagetoBase64(this,'CourseLogo')">
                                                    <%--<img src=""/>--%>
                                                    <label class="custom-file-label" for="imgCourseLogo">Drop your image here</label>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div class="instructor checkbox">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" id="cbxInstructorName" name="cbxInstructorName" onclick="ManageInstructor();" class="custom-control-input" checked>
                                                        <label class="custom-control-label" for="cbxInstructorName">Same as Admin</label>
                                                    </div>
                                                </div>
                                                <label for="txtInstructorName"><i class="fas fa-plus-circle"></i>Instructor Details</label>
                                                <div class="instructor" style="display: none;" id="divInstructorName">
                                                    <input type="text" class="form-control" id="txtInstructorName" placeholder="Instructor Name" />

                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="imgInstructorPhoto" onchange="readURL(this, '.instructor-photo');encodeImagetoBase64(this,'InstructorPhoto')">
                                                        <label class="custom-file-label" for="imgInstructorPhoto" id="lblInstructorPhoto">Add Image</label>
                                                    </div>
                                                    <div class="logo-img instructor-photo position-relative" id="divInstructorPhoto"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group radio">
                                                <label><i class="fas fa-share-alt-square"></i>Sharing</label>
                                                <div class="sharing">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





            <%-- in progresss --%>
            <div class="col-12 col-sm-12 mt-4 accordion course-content-collapse" style="display: none;" id="divLessonMain">
                <div class="builder" id="divCourseBuilder">
                    <div class="builder-title">
                        <img src="../INCLUDES/Asset/images/builder.png" /><span>Course Builder</span>
                    </div>
                    <div class="builder-action d-none"><span onclick="collapseToggle('.course-content-collapse .collapse',1);">Expand All</span><span onclick="collapseToggle('.course-content-collapse .collapse',0);">Collapse All</span></div>
                </div>
                <div class="lesson-container">
                </div>

                <%--<div id="dvLessonViewParentView"></div>
                <div id="dvLessonViewParentEdit"></div>--%>
            </div>

            <div class="col-12 mb-5" id="divAddMoreLesson">
                <a class="btn btn-black" id="btnAddMoreLesson" onclick="bindViewLessonContainer('.lesson-container', 0, 'edit');"><i class="fas fa-plus-circle"></i>Add New Lesson</a>
            </div>
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
                </div>
            </div>
        </div>
    </div>

    <%--End Modal popup region--%>

    <script>

        //new code
        var editorCourseSummary = new Jodit('#txtCourseSummary');
        var editorContentDescription = '';
        var editorResourcesDescription = '';


        var accessToken = '<%=Session["access_token"]%>';

        var IsQueryString = '0';//To identify whether page load from query string or not

        var CourseFlag = '0';
        var LessonFlag = '0';
        var ContentFlag = '0';
        var ResourceFlag = '0';
        var QuizFlag = '0';

        var ContentContentTypeID = '1';
        var QuizContentTypeID = '5';
        var passingScore = 0;
        var pasingPercentage = 0;

        var QuestionAction = '1';

        var dvLessonEdit = '<div class="form-group asterisk">' +
            '<label for="txtLessonTitle" class="inline">Lesson Title</label>' +
            '<input type="text" class="form-control required" id="txtLessonTitle" placeholder="Lesson Title" />' +
            '</div>' +
            '<div class="form-group asterisk">' +
            '<label for="txtLessonDescription" class="inline">Lesson Description</label>' +
            '<textarea class="form-control required" id="txtLessonDescription" placeholder="Add Lesson Description"></textarea>' +
            '</div>';

        var dvLessonContentEdit = '<div class="form-group asterisk">' +
            '<div class="tag content">Content</div>' +
            '<label for="txtContentHeader" class="inline">Content Title</label>' +
            '<input type="text" class="form-control required" id="txtContentHeader" placeholder="Content Title" />' +
            '</div>' +
            '<div class="form-group editor asterisk">' +
            '<div id="txtContentDescription"></div>' +
            '</div>';

        var dvLessonResourceEdit = '<div class="form-group editor">' +
            '<label>Resources</label>' +
            '<div id="txtResourcesDescription"></div>' +
            '</div>';

        var dvLessonQuizEdit = '<label>Quiz</label>' +
            '<div class="form-group asterisk">' +
            '<label for="txtQuizTitle" class="inline">Quiz Title</label>' +
            '<input type="text" class="form-control required" id="txtQuizTitle" placeholder="Quiz Title" />' +
            '</div>' +
            '<div class="form-group asterisk">' +
            '<label for="txtQuizDescription" class="inline">Quiz Description</label>' +
            '<textarea class="form-control required" id="txtQuizDescription" placeholder="Quiz Description"></textarea>' +
            '</div>';

        var QuestionType = "done";
        var divQuestionType = '<a class="btn btn-outline blod black rounded-pill" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
            '<i class="fas fa-plus-circle"></i>New Question' +
            '</a>' +
            '<div class="dropdown-menu quiz-element">' +
            '<a class="dropdown-item" name="multiple" onclick="ShowQuestion(\'multiple\',\'new\');"><i class="far fa-check-square"></i>Multiple Choice</a>' +
            '<a class="dropdown-item" name="radio" onclick="ShowQuestion(\'radio\',\'new\');"><i class="fas fa-dot-circle"></i>Radio Button</a>' +
            '<a class="dropdown-item" name="dropdown" onclick="ShowQuestion(\'dropdown\',\'new\');"><i class="far fa-caret-square-down"></i>Dropdown</a>' +
            '</div>' +

            '<a class="btn btn-black float-right Auto" id="btnQuestionDone" onclick="AddQuestion(this,\'' + QuestionAction + '\',\'' + QuestionType + '\');" style="display:none;">Done</a>';

        $(document).ready(function () {
            if (readQueryString()["topic"] != undefined && readQueryString()["topic"] != '') {
                CourseFlag = readQueryString()["topic"];
                IsQueryString = '1';
                EditCourse();

                if (CourseFlag != '0') {
                    BindLessonGrid();
                }
            }
            else {
                GetCourseCategoryTagsAndBadge('view', 0, 0, 0);
            }
        });

        var isLessonDetailsChanged = false;

        // Event raised when Lesson Title, Description, Points, Hours & Minutues changed..
        $(document).on('keyup', '#txtLessonTitle,#txtLessonDescription,#txtPoint,#txtHour,#txtMin', function () {
            alert("changed");
            isLessonDetailsChanged = true;
        });

        // Call this function when user click on Lesson (Accordion)
        function CheckIfNewChanges() {
            if (isLessonDetailsChanged) {
                alert("Do you want to save the changes?");
            }
            else {
                alert("No new changes found.");
            }
        }

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



        function GetCourseCategoryTagsAndBadge(flag, CourseCategoryID, TagID) {
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
                            var CourseCategory = DataSet.Data.CourseCategory;

                            if (Tags != undefined && Tags.length > 0) {
                                $('#ddlTags').empty();
                                for (var i = 0; i < Tags.length; i++) {
                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                }
                                selectInit('#ddlTags', 'Tags');
                            }
                            if (CourseCategory != undefined && CourseCategory.length > 0) {
                                $('#ddlCourseCategory').empty().append('<option></option>');
                                for (var i = 0; i < CourseCategory.length; i++) {
                                    $('#ddlCourseCategory').append('<option value="' + CourseCategory[i].CategoryID + '">' + CourseCategory[i].Title + '</option>');
                                }
                                selectInit('#ddlCourseCategory', 'Course Category');
                            }
                            if (flag == 'edit') {
                                ""
                                $('#ddlCourseCategory').val(CourseCategoryID).trigger('change');

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

        function ManageInstructor() {
            if ($("#cbxInstructorName").prop('checked') == true) {
                $("#divInstructorName").hide();
            }
            else {
                $("#divInstructorName").show();
                $("#txtInstructorName").val('');
                $("#imgInstructorPhoto").removeAttr("src");
                $("#lblInstructorPhoto").text("Add Image");
                $("#divInstructorPhoto").removeClass('img');
                $("#divInstructorPhoto").empty();
            }
        }

        function ClearFieldsAddCourse() {
            $('#txtCourseTitle').val('');
            $('#txtCourseDescription').val('');

            $("#ddlCourseCategory option:selected").prop("selected", false);
            selectInit('#ddlCourseCategory ', 'CourseCategory');

            $("#ddlTags option:selected").prop("selected", false);
            selectInit('#ddlTags ', 'Tags');

            $('#txtCourseThemeColor').val('#161E98');
            editorCourseSummary.value = '';

            $("#rbGlobal").prop("checked", true)
            $("#cbxInstructorName").click();
        }

        function validateAddCourse() {

            if ($("#txtCourseTitle").val() == undefined || $("#txtCourseTitle").val() == '') {
                return { error: true, msg: "Please enter Course Title" };
            }
            else if ($("#txtCourseDescription").val() == undefined || $("#txtCourseDescription").val() == '') {
                return { error: true, msg: "Please enter Course Description" };
            }
            else if ($("#ddlCourseCategory option:selected").val() == undefined || $("#ddlCourseCategory option:selected").val() == '') {
                return { error: true, msg: "Please select Course Category" };
            }
            else if ($("#txtCourseThemeColor").val() == undefined || $("#txtCourseThemeColor").val() == '') {
                return { error: true, msg: "Please enter Course Theme color" };
            }
            else if (editorCourseSummary.value == undefined || editorCourseSummary.value.trim() == '') {
                return { error: true, msg: "Please enter Course Summary" };
            }
            else if ($("#cbxInstructorName").prop('checked') == false) {
                if ($("#txtInstructorName").val() == undefined || $("#txtInstructorName").val() == '') {
                    return { error: true, msg: "Please enter instructor name" };
                }
            }
            else if ($("#rbGlobal").prop("checked") == false && $("#rbOrganization").prop("checked") == false && $("#rbAssigned").prop("checked") == false) {
                return { error: true, msg: "Please select sharing option" };
            }

            return true;
        }

        function AddCourse(flag) {

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
                var _Description = $('#txtCourseDescription').val();
                var _CourseCategory = $("#ddlCourseCategory option:selected").val();

                var selectedTagsArray = $('#ddlTags').val();
                var _selectedTags = '';
                if (selectedTagsArray.length > 0) {
                    for (i = 0; i < selectedTagsArray.length; i++) {
                        _selectedTags = _selectedTags + selectedTagsArray[i] + ',';
                    }
                    _selectedTags = _selectedTags.replace(/,\s*$/, "");
                }

                var _CategoryColor = $('#txtCourseThemeColor').val();
                var _Summary = editorCourseSummary.value;

                var _IsCourseCreator = '1';
                var _InstructorName = '';
                if ($("#cbxInstructorName").prop('checked') == false) {
                    _IsCourseCreator = '0';
                    _InstructorName = $("#txtInstructorName").val();
                }

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

                if (CourseFlag == '0') {
                    getUrl = "/API/Content/CreateTopic";

                } else {

                    flag = 'update';
                    _Topic_Id = CourseFlag;
                    getUrl = "/API/Content/ModifyTopic";
                }

                requestParams = {
                    TopicID: _Topic_Id, TopicTitle: _Title, TopicDescription: _Description, CourseCategory: _CourseCategory, selectedTags: _selectedTags, CategoryColor: _CategoryColor, Summary: _Summary
                    , CourseLogoBase64: base64CourseLogo, IsCourseCreator: _IsCourseCreator, InstructorName: _InstructorName, InstructorPhotoBase64: base64InstructorPhoto
                    , Accessibility: _Accessibility, SrNo: _SrNo, MinUnlockedModules: "", UserID: "", IsActive: true
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
                                    ""
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
                                                        document.location = 'courses.aspx';
                                                    }
                                                });
                                            }
                                            else if (flag == 'add') {

                                                $("#divLessonMain").show();
                                                //AddMoreLesson();
                                                bindViewLessonContainer('.lesson-container', 0, 'edit');

                                                HideLoader();
                                                if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                                    CourseFlag = DataSet.Data[0].InsertedID;
                                                }

                                                SetProgressBar();

                                                Swal.fire({
                                                    title: "Success",
                                                    text: DataSet.Data[0].ReturnMessage,
                                                    icon: "success"
                                                }).then((value) => {
                                                    if (value) {

                                                    }
                                                });
                                            }
                                            else if (flag == 'update') {

                                                $("#divLessonMain").show();
                                                BindLessonGrid('update');

                                                HideLoader();
                                                if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                                    CourseFlag = DataSet.Data[0].InsertedID;
                                                }

                                                SetProgressBar();

                                                Swal.fire({
                                                    title: "Success",
                                                    text: DataSet.Data[0].ReturnMessage,
                                                    icon: "success"
                                                }).then((value) => {
                                                    if (value) {

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
            ClearFieldsAddCourse();

            ShowLoader();
            var getUrl = "/API/Content/EditTopic";
            var requestParams = { TopicID: CourseFlag };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                //async: false,//Added on 18 APR
                contentType: "application/json",
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);

                        HideLoader();
                        if (DataSet.StatusCode == "1") {
                            var EditTopic = DataSet.Data.Data;

                            // Check if course is publishable or not..
                            CheckCoursePublishable(DataSet.Data.Data1[0].IsPublishable, DataSet.Data.Data1[0].IsPublished)

                            $('#txtCourseTitle').val(EditTopic[0].Title);
                            $('#txtCourseDescription').val(EditTopic[0].Description);
                            $('#txtCourseThemeColor').val(EditTopic[0].CategoryColor);
                            editorCourseSummary.value = EditTopic[0].Summary;

                            if (EditTopic[0].Accessibility == '2') {
                                $("#rbOrganization").prop("checked", true)
                            }
                            else if (EditTopic[0].Accessibility == '3') {
                                $("#rbAssigned").prop("checked", true)
                            }
                            else {
                                $("#rbGlobal").prop("checked", true)
                            }

                            if (EditTopic[0].FilePath != undefined && EditTopic[0].FilePath != null && EditTopic[0].FilePath != '') {
                                $("#imgCourseLogo").attr("src", "../Files/CourseLogo/" + EditTopic[0].FilePath);
                                $("#divCourseLogo").addClass('img');
                                $("#divCourseLogo").append('<img src="../Files/CourseLogo/' + EditTopic[0].FilePath + '" alt="Course Logo" class="img-fluid">');
                            }


                            if (EditTopic[0].InstructorName != undefined && EditTopic[0].InstructorName != null) {
                                $("#cbxInstructorName").prop("checked", false)
                                $("#divInstructorName").show();
                                $("#txtInstructorName").val(EditTopic[0].InstructorName);


                                if (EditTopic[0].InstructorImageFile != undefined && EditTopic[0].InstructorImageFile != null && EditTopic[0].InstructorImageFile != '') {
                                    $("#imgInstructorPhoto").attr("src", "../Files/InspectorImage/" + EditTopic[0].InstructorImageFile);
                                    $("#divInstructorPhoto").addClass('img');
                                    $("#divInstructorPhoto").append('<img src="../Files/InspectorImage/' + EditTopic[0].InstructorImageFile + '" alt="Inspector Image" class="img-fluid">');
                                }
                            }
                            else {
                                $("#cbxInstructorName").prop("checked", true)
                                $("#divInstructorName").hide();
                                $("#txtInstructorName").val('');
                            }

                            GetCourseCategoryTagsAndBadge('edit', EditTopic[0].CategoryID, EditTopic[0].TagID);
                        }
                        else {
                            CourseFlag = '0';

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

        function clearModalText() {
            $('#txtTagName').val('');
        }

        function AddTag() {
            var getUrl;
            var requestParams;
            ShowLoader();
            if ($('#txtTagName').val() != '' && $('#txtTagName').val() != undefined) {
                var _Title = $('#txtTagName').val();
                var _Description = '';

                var selectedTagsArray = $('#ddlTags').val();
                var _selectedTags = '';
                if (selectedTagsArray.length > 0) {
                    for (i = 0; i < selectedTagsArray.length; i++) {
                        _selectedTags = _selectedTags + selectedTagsArray[i] + ',';
                    }
                    _selectedTags = _selectedTags.replace(/,\s*$/, "");
                }

                var getUrl = "/API/Content/MasterAdd";
                var requestParams = { Title: _Title, Description: _Description, type: 'tag' };

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
                                    HideLoader();
                                    if (DataSet.StatusCode == "1") {
                                        if (DataSet.Data.Data1 != undefined) {
                                            var Tags = DataSet.Data.Data1;
                                            if (Tags != undefined && Tags.length > 0) {
                                                $('#ddlTags').empty()
                                                for (var i = 0; i < Tags.length; i++) {
                                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                                }
                                                selectInit('#ddlTags', 'Tags');
                                            }
                                        }

                                        if (_selectedTags != undefined) {
                                            for (i = 0; i < 1; i++) {
                                                if (_selectedTags.includes(',,')) {
                                                    _selectedTags = _selectedTags.replace(",,", ",");
                                                    if (_selectedTags.includes(',,')) {
                                                        i--;
                                                    }
                                                }
                                            }
                                            _selectedTags = _selectedTags.replace(/,\s*$/, "");
                                            var selectedTagsArray = _selectedTags.split(',');
                                            $("#ddlTags").val(selectedTagsArray).trigger('change');
                                        }
                                        //$('#txtTagName').val();

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
                                    else if (DataSet.StatusCode == '0') {
                                        HideLoader();
                                        Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error", button: "Ok" });
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


        //Lesson
        function ManageLesson(flag) {
            if (flag == 'editbind') {
                $('#dvLessonEdit').empty().append(dvLessonEdit);
            }
            else if (flag == 'editclear') {
                $('#dvLessonEdit').empty();
            }
        }

        function AddMoreLesson() {
            LessonFlag = '0';
            var dvLessonViewParentEdit = '<div class="row">' +

                //Right Pane
                '<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-8 pr-0">' +
                '<div class="card-body arrows">' +
                '<div class="tag lesson main-card">Lesson</div>' +
                '<div class="arrows-icon"><i class="fas fa-arrows-alt"></i></div>' +
                '<div class="row" id="divLessonJourney">' +
                //'<div class="col-sm-12" id="dvLessonView"></div>' +
                '<div class="col-sm-12" id="dvLessonEdit"></div>' +

                //'<div class="col-sm-12" id="dvLessonContentView"></div>' +
                '<div class="col-sm-12" id="dvLessonContentEdit"></div>' +

                //'<div class="col-sm-12" id="dvLessonResourceView"></div>' +
                '<div class="col-sm-12" id="dvLessonResourceEdit"></div>' +

                //'<div class="col-sm-12" id="dvLessonQuizView"></div>' +
                '<div class="col-sm-12" id="dvLessonQuizEdit"></div>' +

                '</div>' +
                '</div>' +
                '</div>' +
                //End Right Pane

                //Left pane
                '<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-4 pl-0">' +
                '<div class="card-body right-side-content">' +
                '<div class="lesson-action">' +
                '<a><i class="fas fa-pen"></i></a>' +
                '<a><i class="fas fa-trash-alt"></i></a>' +
                '<a><i class="fas fa-chevron-down"></i></a>' +
                '</div>' +
                '<div class="row mt-5">' +
                '<div class="col-sm-12 mt-4 mb-4">' +
                '<div class="form-group">' +
                '<label class="d-inline"><i class="fas fa-plus-circle"></i>Estimated Time</label>' +
                '<input type="text" class="form-control required d-inline col-2 mr-2" maxlength="2" id="txtHour" placeholder="HH" onkeyup="return isNumberKey(this,event);" />' +
                '<input type="text" class="form-control required d-inline col-2" maxlength="2" id="txtMin" placeholder="MM" onkeyup="return isNumberKey(txtMin,event);" />' +
                '</div>' +
                '</div>' +
                '<div class="col-sm-12">' +
                '<div class="form-group">' +
                '<label class="d-inline"><i class="fas fa-plus-circle"></i>Points</label>' +
                '<input type="text" class="form-control required d-inline col-3" maxlength="5" id="txtPoint" placeholder="+100" onkeyup="return isNumberKey(txtPoint,event);" />' +
                '</div>' +
                '</div>' +

                '<div class="col-sm-12 mt-5" id="divPassingPercentage" style="display:none;">' +
                '<div class="form-group">' +
                '<label class="d-inline"><i class="fas fa-plus-circle"></i>Passing Percentage</label>' +
                '<input type="text" class="form-control required d-inline col-3" maxlength="5" id="txtPassingScorePercentage" placeholder="+100" onkeyup="return isNumberKey(txtPassingScorePercentage,event);" />' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                //End Left pane

                '<div class="w-100"></div>' +

                '<div class="col-sm-12 quiz-wrapper" id="dvQuestionView">' +
                '</div>' +

                '<div class="col-sm-12 quiz-wrapper" id="dvLessonQues">' +
                '</div>' +

                '<div class="col-sm-12 mb-4 quiz-wrapper" id="divQuestionType">' +
                '</div>' +

                '<div class="w-100"></div>' +

                '<div class="action-btn">' +
                '<a class="btn btn-outline blod black" id="btnAddContent"  name="btnAddContent" onclick="AddLessonWithOthers(this);"><i class="fas fa-plus-circle"></i>Add New Content</a>' +
                '<a class="btn btn-outline blod black" id="btnAddResource" name="btnAddResource" onclick="AddLessonWithOthers(this);"><i class="fas fa-plus-circle"></i>Add Resources</a>' +
                '<a class="btn btn-outline blod black" id="btnAddQuiz"     name="btnAddQuiz" onclick="AddLessonWithOthers(this);"><i class="fas fa-plus-circle"></i>Add Topic Quiz</a>' +
                '</div>' +
                '</div>';

            $('#dvLessonViewParentEdit').show();
            $('#dvLessonViewParentEdit').empty().append(dvLessonViewParentEdit);
            ManageLesson('editbind');
            ManageContent('editbind');
            inputInline();
        }

        function validateAddLesson() {
            if ($("#txtLessonTitle").val() == undefined || $("#txtLessonTitle").val() == '') {
                return { error: true, msg: "Please enter Lesson Title" };
            }
            else if ($("#txtLessonDescription").val() == undefined || $("#txtLessonDescription").val() == '') {
                return { error: true, msg: "Please enter Lesson Description" };
            }
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

        function BindLessonGrid(flag) {

            ShowLoader();
            var getUrl = "/API/Content/GetModules";
            var requestParams = { TopicID: CourseFlag, Flag: 'learningjourney' };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);

                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                var LessonTable = DataSet.Data;

                                $('#divLessonMain').show();

                                $('.lesson-container').empty();
                                if (LessonTable != undefined && LessonTable.length > 0) {
                                    for (var i = 0; i < LessonTable.length; i++) {

                                        //Lesson = Lesson + '<div class="card-header">' +
                                        //    '<h5>' + LessonTable[i].Title + '</h5>' +
                                        //    '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteLessionFromTile(this,' + LessonTable[i].ModuleID + ')";></i>' +
                                        //    '<i class="fas fa-edit" title="Edit" onclick="EditLessionFromTile(this,' + LessonTable[i].ModuleID + ')";></i>' +
                                        //    '<span style="display:none;" id="spTitle">' + LessonTable[i].Title + '</span>' +
                                        //    '<span style="display:none;" id="spOverview">' + LessonTable[i].Overview + '</span>' +
                                        //    '<span style="display:none;" id="spCourseTime">' + LessonTable[i].CourseTime + '</span>' +
                                        //    '<span style="display:none;" id="spPoints">' + LessonTable[i].Points + '</span>' +
                                        //    '</div>';

                                        $('.lesson-container').append('<div class="card mb-4">' +
                                            '<div class="tag lesson">Lesson ' + (i + 1) + '</div>' +
                                            '<div class="card-header">' +
                                            '<h5>' + LessonTable[i].Title + '</h5>' +
                                            '<div class="card-header-action">' +
                                            //'<a title="Edit" onclick="EditLessionFromTile(this,' + LessonTable[i].ModuleID + ')";><i class="fas fa-pen"></i></a>' +
                                            //'<a title="Delete" onclick="DeleteLessionFromTile(this,' + LessonTable[i].ModuleID + ')";><i class="fas fa-trash-alt"></i></a>' +
                                            '<a data-toggle="collapse" data-target="#collapseLession' + LessonTable[i].ModuleID + '" aria-expanded="true" aria-controls="collapseLession' + LessonTable[i].ModuleID + '"><i class="fas fa-chevron-down"></i></a>' +
                                            '</div>' +
                                            '</div>' +
                                            '<div id="collapseLession' + LessonTable[i].ModuleID + '" class="collapse"></div></div>');

                                        bindViewLessonContainer('#collapseLession' + LessonTable[i].ModuleID, LessonTable[i].ModuleID, 'view');
                                    }

                                }
                                else {
                                    //ManageLesson('editbind');
                                    //ManageContent('editbind');                                    
                                    //AddMoreLesson();
                                    bindViewLessonContainer('.lesson-container', 0, 'edit');
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

        function bindViewLessonContainer(el, lessonId, action) {

            html = '';

            if (lessonId === 0) {
                html += '<div class="card mb-4">';
            }



            html += '<div class="row">';
            html += '<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-8 pr-0">';
            html += '<div class="card-body arrows">';

            if (action === 'edit') {
                html += '<div class="tag lesson main-card">Lesson 1</div>';
            }

            html += '<div class="arrows-icon"><i class="fas fa-arrows-alt"></i></div>';
            html += '<div class="row w-100">';

            html += '<div class="col-sm-12 edit" style="display: none;">';
            html += '<div class="form-group asterisk">';
            html += '<label for="txtLessonTitle" class="inline">Lesson Title</label>';
            html += '<input type="text" class="form-control required" id="txtLessonTitle" placeholder="Lesson Title" />';
            html += '</div>';
            html += '<div class="form-group asterisk">';
            html += '<label for="txtLessonDescription" class="inline">Lesson Description</label>';
            html += '<textarea class="form-control required" id="txtLessonDescription" placeholder="Add Lesson Description"></textarea>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 accordion view">';
            html += '<div class="card">';
            html += '<div class="card-header">';
            html += '<h5>Understand Custom & Standard Objects</h5>';
            html += '<a data-toggle="collapse" data-target="#collapseLesson' + lessonId + '" aria-expanded="true" aria-controls="collapseLesson' + lessonId + '"><i class="fas fa-chevron-down"></i></a>';
            html += '</div>';
            html += '<div id="collapseLesson' + lessonId + '" class="collapse">';
            html += '<div class="card-body">aaa</div>';
            html += '</div>';
            html += '</div></div>';

            html += '<div class="col-sm-12 edit" style="display: none;">';
            html += '<div class="form-group asterisk">';
            html += '<div class="tag content">Content 1</div>';
            html += '<label for="txtContentTitle" class="inline">Content Title</label>';
            html += '<input type="text" class="form-control required" id="txtContentTitle" placeholder="Content Title" />';
            html += '</div>';
            html += '<div class="form-group editor asterisk">';
            html += '<div id="txtContentDescriptionLesson' + lessonId + '"></div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 accordion view">';
            html += '<div class="card">';
            html += '<div class="tag content">Content 1</div>';
            html += '<div class="card-header">';
            html += '<h5>Overview of Objects</h5>';
            html += '<a data-toggle="collapse" data-target="#collapseLesson' + lessonId + 'Content1" aria-expanded="true" aria-controls="collapseLesson' + lessonId + 'Content1">';
            html += '<i class="fas fa-chevron-down"></i>';
            html += '</a>';
            html += '</div>';
            html += '<div id="collapseLesson' + lessonId + 'Content1" class="collapse">';
            html += '<div class="card-body">';
            html += 'DreamHouse is a realty company that provides a way for customers to shop for homes and contact real estate agents online.';
            html += '<br />';
            html += 'DreamHouse brokers use some of Salesforce’s standard functionality, like contacts and leads, to track home buyers.';
            html += '<br />';
            html += '<br />';
            html += 'But when it comes to selling houses, there are a lot more things they want to track.';
            html += 'For example, Salesforce doesn’t include a standard way to track properties.';
            html += 'How is DreamHouse supposed to know which homes they have for sale or how much each home costs?';
            html += 'Luckily, their Salesforce admin, D’Angelo, knows that the Salesforce platform offers a solution.';
            html += 'We’ll work with D’Angelo to see what he’s building.';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-4 pl-0">';
            html += '<div class="card-body right-side-content">';
            html += '<div class="lesson-action">';
            html += '<a onclick="EditLessionFrom(this, ' + lessonId + ')";><i class="fas fa-pen"></i></a>';
            html += '<a onclick="DeleteLessionFrom(this, ' + lessonId + ')";><i class="fas fa-trash-alt"></i></a>';
            html += '<a><i class="fas fa-chevron-down"></i></a>';
            html += '</div>';

            html += '<div class="row mt-4">';

            html += '<div class="col-sm-12 mt-2">';
            html += '<div class="form-group">';
            html += '<label class="d-inline"><i class="fas fa-plus-circle"></i>Estimated Time</label>';
            html += '<input type="text" class="form-control required d-inline col-2 mr-2" maxlength="2" id="txtHour" placeholder="HH" onkeyup="return isNumberKey("txtHour",event);" />';
            html += '<input type="text" class="form-control required d-inline col-2" maxlength="2" id="txtMin" placeholder="MM" onkeyup="return isNumberKey("txtMin",event);" />';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12">';
            html += '<div class="form-group">';
            html += '<label class="d-inline"><i class="fas fa-plus-circle"></i>Points</label>';
            html += '<input type="text" class="form-control required d-inline col-3" maxlength="5" id="txtPoint" placeholder="+100" onkeyup="return isNumberKey("txtPoint",event);" />';
            html += '</div>';
            html += '</div>';

            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="w-100"></div>';

            html += '<div class="col-12 col-sm-12">';
            html += '<div class="card-body pl-5">';

            html += '<div class="col-sm-12">';
            html += '<div class="form-group editor">';
            html += '<label>Resources</label>';
            html += '<div id="txtResourcesDescriptionLesson' + lessonId + '"></div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 d-flex justify-content-between align-items-center">';
            html += '<label>Quiz</label>';
            html += '<div class="form-group mb-2 d-flex justify-content-end">';
            html += '<label class="d-inline"><i class="fas fa-plus-circle"></i>Passing Percentage</label>';
            html += '<input type="text" class="form-control required d-inline col-3" maxlength="5" id="txtPassingScorePercentage" placeholder="+100" onkeyup="return isNumberKey("txtPassingScorePercentage",event);" />';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 edit" style="display: none;">';

            html += '<div class="form-group asterisk">';
            html += '<label for="txtQuizTitle" class="inline">Quiz Title</label>';
            html += '<input type="text" class="form-control required" id="txtQuizTitle" placeholder="Quiz Title" />';
            html += '</div>';
            html += '<div class="form-group asterisk">';
            html += '<label for="txtQuizDescription" class="inline">Quiz Description</label>';
            html += '<textarea class="form-control required" id="txtQuizDescription" placeholder="Quiz Description"></textarea>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 accordion view">';
            html += '<div class="card">';
            html += '<div class="card-header">';
            html += '<h5>Data Modeling Quiz</h5>';
            html += '<a data-toggle="collapse" data-target="#collapseLesson' + lessonId + 'Quiz" aria-expanded="true" aria-controls="collapseLesson' + lessonId + 'Quiz">';
            html += '<i class="fas fa-chevron-down"></i>';
            html += '</a>';
            html += '</div>';
            html += '<div id="collapseLesson' + lessonId + 'Quiz" class="collapse">';
            html += '<div class="card-body">';
            html += 'Give your data structure with objects, fields, and relationships.';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-sm-12 quiz-wrapper">';

            //html = '<div class="accordion">';
            //html += '<div class="card">';
            //html += '<div class="card-header p-0">';
            //html += '<div class="d-flex align-items-center ques">';
            //html += '<a class="sr" data-toggle="collapse" data-target="#collapseLesson' + lessonId + 'Question" aria-expanded="true" aria-controls="collapseLesson' + lessonId + 'Question">Q <i class="fas fa-dot-circle m-0 ml-2"></i><i class="fas fa-caret-down m-0 ml-1"></i></a>';
            //html += '<h5 class="ml-3">Question Title</h5>';
            //html += '</div>';
            //html += '</div>';
            //html += '<div id="collapseLesson' + lessonId + 'Question" class="collapse">';
            //html += '<div class="card-body">';
            //html += '<div class="quiz">';
            //html += '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">';
            //html += '<span class="sr">Q <i class="fas fa-dot-circle"></i><i class="fas fa-caret-down"></i></span>';
            //html += '<div class="col-sm-8 col-md-10">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Add Question Text" />';
            //html += '</div>';
            //html += '</div>';
            //html += '<span class="correct">Correct</span>';
            //html += '</div>';
            //html += '<div class="row answer-content">';
            //html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            //html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="fas fa-dot-circle"></i></span>';
            //html += '<div class="col-sm-8 col-md-10">';
            //html += '<div class="row">';
            //html += '<div class="col-sm-12 col-md-10">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            //html += '</div>';
            //html += '</div>';
            //html += '<div class="col-sm-3 col-md-2">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            //html += '</div>';
            //html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            //html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="fas fa-dot-circle"></i></span>';
            //html += '<div class="col-sm-8 col-md-10">';
            //html += '<div class="row">';
            //html += '<div class="col-sm-12 col-md-10">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            //html += '</div>';
            //html += '</div>';
            //html += '<div class="col-sm-3 col-md-2">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            //html += '</div>';
            //html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            //html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="fas fa-dot-circle"></i></span>';
            //html += '<div class="col-sm-8 col-md-10">';
            //html += '<div class="row">';
            //html += '<div class="col-sm-12 col-md-10">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            //html += '</div>';
            //html += '</div>';
            //html += '<div class="col-sm-3 col-md-2">';
            //html += '<div class="form-group">';
            //html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '</div>';
            //html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            //html += '</div>';
            //html += '</div>';
            //html += '<div class="offset-1 offset-sm-1 col-sm-11 mt-2 mb-4">';
            //html += '<a onclick="AddAnswerOption(this, &#34;fas fa-dot-circle&#34;)" class="btn btn-link"><i class="fas fa-plus-circle"></i>Add Answer Option</a>';
            //html += '</div>';
            //html += '</div>';


            //html += '</div>';
            //html += '</div>';
            //html += '</div>';

            html += '</div>';

            html += '<div class="col-sm-12 mb-4 dropright" id="divQuestionType">';
            html += '<a class="btn btn-outline blod black rounded-pill" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
            html += '<i class="fas fa-plus-circle"></i>New Question';
            html += '</a>';
            html += '<div class="dropdown-menu quiz-element">';
            html += '<a class="dropdown-item" onclick="BindQuizQuestion(this,' + lessonId + ', &#34;far fa-check-square&#34;);"><i class="far fa-check-square"></i>Multiple Choice</a>';
            html += '<a class="dropdown-item" onclick="BindQuizQuestion(this,' + lessonId + ', &#34;fas fa-dot-circle&#34;);"><i class="fas fa-dot-circle"></i>Radio Button</a>';
            html += '<a class="dropdown-item" onclick="BindQuizQuestion(this,' + lessonId + ', &#34;far fa-caret-square-down&#34;);"><i class="far fa-caret-square-down"></i>Dropdown</a>';
            html += '</div>';
            html += '</div>';

            html += '</div>';
            html += '</div>';

            html += '<div class="w-100"></div>';

            html += '<div class="action-btn">';
            html += '<a class="btn btn-outline blod black"><i class="fas fa-plus-circle"></i>Add New Content</a>';
            html += '<a class="btn btn-outline blod black"><i class="fas fa-plus-circle"></i>Add Resources</a>';
            html += '<a class="btn btn-outline blod black"><i class="fas fa-plus-circle"></i>Add Assignment</a>';
            html += '<a class="btn btn-outline blod black"><i class="fas fa-plus-circle"></i>Add Topic Quiz</a>';
            html += '</div>';
            html += '</div>';

            if (lessonId === 0) {
                html += '</div>';
            }

            $(el).append(html);

            new Jodit('#txtContentDescriptionLesson' + lessonId);
            new Jodit('#txtResourcesDescriptionLesson' + lessonId);
            inputInline();

            if (lessonId === 0) {
                $(el).find('.view').hide();
                $(el).find('.edit').show();

                $('#divLessonMain').show()
            }
        }

        function EditLessionFrom(ctrl, lessonId) {
            $(ctrl).parents('#collapseLession' + lessonId).find('.view').hide();
            $(ctrl).parents('#collapseLession' + lessonId).find('.edit').show();
        }


        function BindQuizQuestion(ctrl, lessonId, type) {

            html = '<div class="quiz">';
            html += '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">';
            html += '<span class="sr">Q <i class="' + type + '"></i><i class="fas fa-caret-down"></i></span>';
            html += '<div class="col-sm-8 col-md-10">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Add Question Text" />';
            html += '</div>';
            html += '</div>';
            html += '<span class="correct">Correct</span>';
            html += '</div>';
            html += '<div class="row answer-content">';
            html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + type + '"></i></span>';
            html += '<div class="col-sm-8 col-md-10">';
            html += '<div class="row">';
            html += '<div class="col-sm-12 col-md-10">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            html += '</div>';
            html += '</div>';
            html += '<div class="col-sm-3 col-md-2">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            html += '</div>';
            html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + type + '"></i></span>';
            html += '<div class="col-sm-8 col-md-10">';
            html += '<div class="row">';
            html += '<div class="col-sm-12 col-md-10">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            html += '</div>';
            html += '</div>';
            html += '<div class="col-sm-3 col-md-2">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            html += '</div>';
            html += '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">';
            html += '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + type + '"></i></span>';
            html += '<div class="col-sm-8 col-md-10">';
            html += '<div class="row">';
            html += '<div class="col-sm-12 col-md-10">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Answer Option" />';
            html += '</div>';
            html += '</div>';
            html += '<div class="col-sm-3 col-md-2">';
            html += '<div class="form-group">';
            html += '<input type="text" class="form-control" placeholder="Assign Score" />';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>';
            html += '</div>';
            html += '</div>';
            html += '<div class="offset-1 offset-sm-1 col-sm-11 mt-2 mb-4">';
            html += '<a onclick="AddAnswerOption(this, &#34;' + type + '&#34;)" class="btn btn-link"><i class="fas fa-plus-circle"></i>Add Answer Option</a>';
            html += '</div>';
            html += '</div>';

            $(ctrl).parents('#collapseLession' + lessonId).find('.quiz-wrapper').append(html);
        }

        function AddAnswerOption(ctrl, type) {

            var html = '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + type + '"></i></span>' +
                '<div class="col-sm-8 col-md-10">' +
                '    <div class="row">' +
                '        <div class="col-sm-12 col-md-10">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" placeholder="Answer Option" />' +
                '            </div>' +
                '        </div>' +
                '        <div class="col-sm-3 col-md-2">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" placeholder="Assign Score" />' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>' +
                '<span class="checked-icon"><i class="far fa-check-circle" onclick="changeAnsFlag(this)"></i></span>' +
                '<span class="checked-icon delete"><i class="fa fa-trash-alt" onclick="DeleteAnsOption(this)"></i></span>' +
                '</div>';

            $(ctrl).parents('.quiz').find('.answer-content').append(html);
        }

        function AddLession(flag) {

            ShowLoader();
            var getUrl;
            var _Topic_Id = CourseFlag;
            var _Title = $('#txtLessonTitle').val();
            var _Overview = $('#txtLessonDescription').val();
            var _Points = $('#txtPoint').val();
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
                    success: function (response) {
                        try {
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
                                                document.location = 'courses.aspx';
                                            }
                                        });
                                    }
                                    else if (flag == 'withcontent') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        AddContent('withlesson');
                                    }
                                    else if (flag == 'onlylesson') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                BindLessonGrid('');
                                            }
                                        });
                                    }
                                    else if (flag == 'savelesson') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                BindLessonInSubTile(LessonFlag, _Title, _Overview);
                                            }
                                        });
                                    }
                                    else if (flag == 'withquiz') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        AddQuiz('withlesson');
                                    }


                                    IsCoursePublishable();
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

        function DeleteLessionFromTile(obj, id) {

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete ? Yes or No !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {

                    LessonFlag = id;
                    ShowLoader();
                    var getUrl = "/API/Content/DeleteModule";

                    try {
                        var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, IsActive: 0 };

                        $.ajax({
                            type: "POST",
                            url: getUrl,
                            headers: { "Authorization": "Bearer " + accessToken },
                            data: JSON.stringify(requestParams),
                            contentType: "application/json",
                            //async: false,//Added on 18 APR
                            success: function (response) {
                                try {
                                    var DataSet = $.parseJSON(response);

                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {

                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.Data[0].ReturnMessage,
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    LessonFlag = '0';
                                                    ContentFlag = '0';
                                                    BindLessonGrid('');
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
            });
        }

        function EditLessionFromTile(obj, id) {

            AddMoreLesson();

            var _Title = $(obj).parent().find('#spTitle').text();
            var _Overview = $(obj).parent().find('#spOverview').text();
            var _CourseTime = $(obj).parent().find('#spCourseTime').text();
            var _Points = $(obj).parent().find('#spPoints').text();

            LessonFlag = id;
            ContentFlag = '0';

            BindLessonInSubTile(id, _Title, _Overview, _CourseTime, _Points);

            BindContentGrid('');
            BindResourceGrid('');
            BindQuizGrid('');
            //$('#dvbtnSaveLesson').show();
        }

        function BindLessonInSubTile(id, _Title, _Overview, _CourseTime, _Points) {
            var Lesson = '';

            Lesson = Lesson + '<div class="accordion">' +
                '<div class="card">' +
                '<div class="card-header" id="headingLesson">' +
                '<h5 id="hdgLessonTitle">' + _Title + '</h5>' +


                '<span style="display:none;" id="spSubTitle">' + _Title + '</span>' +
                '<span style="display:none;" id="spSubOverview">' + _Overview + '</span>' +
                '<span style="display:none;" id="spSubCourseTime">' + _CourseTime + '</span>' +
                '<span style="display:none;" id="spSubPoints">' + _Points + '</span>' +



                '<i class="fas fa-edit" title="Edit" onclick="EditLessonFromSubTile(this,' + id + ')";></i>' +

                '<a data-toggle="collapse" data-target="#collapseLesson" aria-expanded="false" aria-controls="collapseLesson" class="collapsed">' +
                '<i class="fas fa-chevron-down"></i>' +
                '</a>' +
                '</div>' +
                '<div id="collapseLesson" class="collapse" aria-labelledby="headingLesson">' +
                '<div class="card-body" id="divLessonOverview">' + _Overview +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';

            $('#dvLessonView').empty().append(Lesson);
            ManageLesson('editclear');
        }

        function EditLessonFromSubTile(obj, id) {

            ManageLesson('editbind');

            //ManageLesson('editbind');

            $('#txtLessonTitle').val($(obj).parent().find('#spSubTitle').text());
            $('#txtLessonDescription').val($(obj).parent().find('#spSubOverview').text());

            if ($(obj).parent().find('#spSubCourseTime').text() != undefined
                && $(obj).parent().find('#spSubCourseTime').text() != ''
                && $(obj).parent().find('#spSubCourseTime').text().split(":").length > 0
            ) {
                $('#txtHour').val($(obj).parent().find('#spSubCourseTime').text().split(":")[0]);
                if ($(obj).parent().find('#spSubCourseTime').text().split(":").length > 1) {
                    $('#txtMin').val($(obj).parent().find('#spSubCourseTime').text().split(":")[1]);
                }
            }
            else {
                $('#txtHour').val('');
                $('#txtMin').val('');
            }

            $('#txtPoint').val($(obj).parent().find('#spSubPoints').text());

            LessonFlag = id;
        }

        function AddLessonWithOthers(flag) {
            flag = $(flag).attr('name');

            if (flag == "btnAddContent") {
                if ($('#txtLessonTitle').val() != undefined && $('#txtContentHeader').val() != undefined) {
                    var resultLesson = validateAddLesson();
                    if (resultLesson.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultLesson.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    var resultContent = validateAddContent('withcontent');
                    if (resultContent.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultContent.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddLession('withcontent');

                }
                else if ($('#txtLessonTitle').val() == undefined && $('#txtContentHeader').val() != undefined) {

                    var resultContentOnly = validateAddContent('onlycontent');
                    if (resultContentOnly.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultContentOnly.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddContent('onlycontent');
                }
                else if ($('#txtLessonTitle').val() != undefined && $('#txtContentHeader').val() == undefined) {
                    var resultLesson = validateAddLesson();
                    if (resultLesson.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultLesson.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }
                    AddLession('onlylesson');
                }
                else if ($('#txtLessonTitle').val() == undefined && $('#txtContentHeader').val() == undefined) {
                    ManageContent('editbind');
                }
            }
            else if (flag == "btnAddResource") {

                if ($('#txtLessonTitle').val() == undefined && $('#txtResourcesDescription').val() == undefined) {
                    ManageContent('editclear');
                    $('#dvLessonResourceEdit').empty().append(dvLessonResourceEdit);
                    editorResourcesDescription = new Jodit('#txtResourcesDescription');
                }
                else if ($('#txtLessonTitle').val() != undefined && $('#txtResourcesDescription').val() != undefined) {
                    var resultLesson = validateAddLesson();
                    if (resultLesson.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultLesson.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    var resultResource = validateAddResource();
                    if (resultResource.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultResource.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddLession('withresource');
                }
                else if ($('#txtLessonTitle').val() == undefined && $('#txtResourcesDescription').val() != undefined) {
                    var resultResourceOnly = validateAddResource();
                    if (resultResourceOnly.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultResourceOnly.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddResource('onlyresource');
                }
            }

            else if (flag == "btnAddQuiz") {
                if ($('#txtLessonTitle').val() != undefined && $('#txtQuizTitle').val() != undefined) {
                    var resultLesson = validateAddLesson();
                    if (resultLesson.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultLesson.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    var resultQuiz = validateAddQuiz();
                    if (resultQuiz.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultQuiz.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddLession('withquiz');

                }
                else if ($('#txtLessonTitle').val() == undefined && $('#txtQuizTitle').val() != undefined) {

                    var resultQuiz = validateAddQuiz();
                    if (resultQuiz.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultQuiz.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }

                    AddQuiz('onlyquiz');
                }
                else if ($('#txtLessonTitle').val() != undefined && $('#txtQuizTitle').val() == undefined) {
                    var resultLesson = validateAddLesson();
                    if (resultLesson.error) {
                        Swal.fire({
                            title: "Alert",
                            text: resultLesson.msg,
                            icon: "error",
                            button: "Ok",
                        });
                        return false;
                    }
                    AddLession('onlylesson');
                }
                else if ($('#txtLessonTitle').val() == undefined && $('#txtQuizTitle').val() == undefined) {
                    ManageQuiz('editbind');
                }
            }
        }


        //Content
        function ManageContent(flag) {
            if (flag == 'editbind') {
                $('#dvLessonContentEdit').empty().append(dvLessonContentEdit);
                editorContentDescription = new Jodit('#txtContentDescription');
            }
            else if (flag == 'editclear') {
                $('#dvLessonContentEdit').empty();
            }
        }

        function validateAddContent(flag) {
            if ($("#txtContentHeader").val() == undefined || $("#txtContentHeader").val() == '') {
                return { error: true, msg: "Please enter Content Title" };
            }
            else if (editorContentDescription.value == undefined || editorContentDescription.value.trim() == '') {
                return { error: true, msg: "Please enter Content Details" };
            }
            else if (flag == 'onlycontent' && (CourseFlag == '0' || LessonFlag == '0')) {
                return { error: true, msg: "Oops ! Something went wrong. PLease try again." };
            }
            else if (flag == 'withcontent' && (CourseFlag == '0')) {
                return { error: true, msg: "Oops ! Something went wrong. PLease try again." };
            }
            return true;
        }

        function BindContentGrid(flag) {
            ShowLoader();
            var getUrl = "/API/Content/GetContentList";
            var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: ContentFlag, ContentTypeID: ContentContentTypeID, IsGift: "true", Flag: 'learningjourney' };
            $.ajax({
                type: "POST",
                url: getUrl,
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                //async: true,//Added on 18 APR
                success: function (response) {
                    try {
                        var DataSet = $.parseJSON(response);

                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {

                                var ContentTable = DataSet.Data;
                                var Content = '';
                                if (ContentTable.length > 0) {
                                    for (var i = 0; i < ContentTable.length; i++) {
                                        Content = Content + '<div class="accordion">' +
                                            '<div class="card">' +
                                            '<div class="tag content">Content</div>' +
                                            '<div class="card-header" id="headingLessonContent' + i + '">' +
                                            '<h5 id="hdgContentTitle">' + ContentTable[i].Title + '</h5>' +

                                            '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteContentFromTile(this,' + ContentTable[i].ContentID + ')";></i>' +
                                            '<i class="fas fa-edit" title="Edit"  onclick="EditContentFromTile(this,' + ContentTable[i].ContentID + ')";></i>' +

                                            '<a data-toggle="collapse" data-target="#collapseLessonContent' + i + '" aria-expanded="false" aria-controls="collapseLessonContent' + i + '" class="collapsed">' +
                                            '<i class="fas fa-chevron-down"></i>' +
                                            '</a>' +
                                            '</div>' +
                                            '<div id="collapseLessonContent' + i + '" class="collapse" aria-labelledby="headingLessonContent' + i + '">' +
                                            '<div class="card-body" id="divContentDescription">' + ContentTable[i].Description +
                                            '</div>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>';
                                    }
                                    $('#dvLessonContentView').empty().append(Content);

                                    ManageContent('editclear');
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

        function AddContent(flag) {
            ShowLoader();
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
            formdata.append("Description", editorContentDescription.value);
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
                        ""
                        var DataSet = $.parseJSON(response);
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                HideLoader();

                                if (flag == 'redirect') {
                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {
                                            document.location = 'courses.aspx';
                                        }
                                    });
                                }
                                else if (flag == 'withlesson') {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    BindLessonGrid();
                                    BindContentGrid('withlesson');

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {

                                        }
                                    });
                                }
                                else if (flag == 'onlycontent') {
                                    HideLoader();

                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        //ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    ContentFlag = '0';
                                    BindContentGrid('onlycontent');

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    }).then((value) => {
                                        if (value) {

                                        }
                                    });
                                }

                                IsCoursePublishable();
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

            ManageContent('editbind');

            $('#txtContentHeader').val($(obj).parent().parent().find('#hdgContentTitle').text());
            editorContentDescription.value = $(obj).parent().parent().find('#divContentDescription').text();

            ContentFlag = id;
        }

        function DeleteContentFromTile(obj, id) {

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete ? Yes or No !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    ContentFlag = id;
                    ShowLoader();
                    var getUrl = "/API/Content/DeleteContent";

                    try {
                        var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, p_ContentID: ContentFlag, IsActive: 0 };

                        $.ajax({
                            type: "POST",
                            url: getUrl,
                            headers: { "Authorization": "Bearer " + accessToken },
                            data: JSON.stringify(requestParams),
                            contentType: "application/json",
                            //async: false,
                            success: function (response) {
                                try {
                                    var DataSet = $.parseJSON(response);
                                    ""
                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {

                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.Data[0].ReturnMessage,
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    ContentFlag = '0';
                                                    BindContentGrid('');
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
            });
        }


        //Resource
        function ManageResource(flag) {
            if (flag == 'editbind') {
                $('#dvLessonResourceEdit').empty().append(dvLessonResourceEdit);
                editorResourcesDescription = new Jodit('#txtResourcesDescription');
            }
            else if (flag == 'editclear') {
                $('#dvLessonResourceEdit').empty();
            }
        }

        function validateAddResource() {
            if (editorResourcesDescription.value == undefined || editorResourcesDescription.value.trim() == '') {
                return { error: true, msg: "Please enter Resource Details" };
            }
            return true;
        }

        function BindResourceGrid(flag) {
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
                            ""
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {

                                    var Resource = '';
                                    Resource = Resource + '<div class="accordion">' +
                                        '<div class="card">' +
                                        '<div class="tag resource">Resource</div>' +
                                        '<div class="card-header" id="headingLessonResource">' +
                                        '<h5 id="hdgResourceTitle">Resources</h5>' +

                                        '<i class="fas fa-edit" title="Edit"  onclick="EditResourceFromTile(this,' + LessonFlag + ')";></i>' +

                                        '<a data-toggle="collapse" data-target="#collapseLessonResource" aria-expanded="false" aria-controls="collapseLessonResource" class="collapsed">' +
                                        '<i class="fas fa-chevron-down"></i>' +
                                        '</a>' +
                                        '</div>' +
                                        '<div id="collapseLessonResource" class="collapse" aria-labelledby="headingLessonResource">' +
                                        '<div class="card-body" id="divResourceDescription">' + DataSet.Data[0].Resource +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';

                                    $('#dvLessonResourceView').empty().append(Resource);
                                    $('#btnAddResource').hide();

                                    ManageResource('editclear');
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

        function AddResource(flag) {

            ShowLoader();
            var Description = editorResourcesDescription.value;
            var getUrl = "/API/Content/UpdateResource";

            try {
                var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, Description: Description };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    //async: false,//Added on 18 APR
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            ""
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    if (flag == 'redirect') {
                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                document.location = 'courses.aspx';
                                            }
                                        });
                                    }
                                    else if (flag == 'withresource') {
                                        HideLoader();
                                        ResourceFlag = LessonFlag;

                                        BindLessonGrid();
                                        BindResourceGrid('withlesson');

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {

                                            }
                                        });
                                    }
                                    else if (flag == 'onlyresource') {
                                        HideLoader();
                                        ResourceFlag = LessonFlag;

                                        BindResourceGrid('onlyresource');

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {

                                            }
                                        });
                                    }

                                    IsCoursePublishable();
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

        function EditResourceFromTile(obj, id) {

            ManageResource('editbind');
            editorResourcesDescription.value = $(obj).parent().parent().find('#divResourceDescription').text();
            $('#btnAddResource').show();
            ResourceFlag = id;
        }


        //Quiz
        function ManageQuiz(flag) {
            if (flag == 'editbind') {
                $('#dvLessonQuizEdit').empty().append(dvLessonQuizEdit);
                $('#divPassingPercentage').show();
            }
            else if (flag == 'editclear') {
                $('#dvLessonQuizEdit').empty();
                $('#divPassingPercentage').hide();
            }
        }

        function validateAddQuiz() {

            if ($("#txtQuizTitle").val() == undefined || $("#txtQuizTitle").val() == '') {
                return { error: true, msg: "Please enter Quiz Title" };
            }
            else if ($("#txtQuizDescription").val() == undefined || $("#txtQuizDescription").val() == '') {
                return { error: true, msg: "Please enter Quiz Description" };
            }
            else if ($("#txtPassingScorePercentage").val() == undefined || $("#txtPassingScorePercentage").val() == '') {
                return { error: true, msg: "Please enter Passing Percentage" };
            }
            return true;
        }

        function BindQuizGrid(flag) {
            ShowLoader();
            var getUrl = "/API/Quiz/GetContentList";
            try {
                var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: "0", ContentTypeID: 5, IsGift: "0" };
                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1" && DataSet.Data.length > 0) {


                                    QuizFlag = DataSet.Data[0].ContentID;

                                    var Quiz = '<div class="accordion">' +
                                        '<div class="card">' +
                                        '<div class="tag quiz">Quiz</div>' +
                                        '<div class="card-header" id="headingLessonQuiz">' +

                                        '<h5 id="hdgQuizTitle">' + DataSet.Data[0].Title + '</h5>' +

                                        '<i class="fas fa-edit" title="Edit"  onclick="EditQuizFromTile(this,' + DataSet.Data[0].ContentID + ')";></i>' +

                                        '<a data-toggle="collapse" data-target="#collapseLessonQuiz" aria-expanded="false" aria-controls="collapseLessonQuiz" class="collapsed">' +
                                        '<i class="fas fa-chevron-down"></i>' +
                                        '</a>' +
                                        '</div>' +
                                        '<div id="collapseLessonQuiz" class="collapse" aria-labelledby="headingLessonQuiz">' +
                                        '<div class="card-body" id="divQuizDescription">' + DataSet.Data[0].Description +
                                        '</div>' +
                                        '</div>' +
                                        '<span style="display:none;" id="spPassingPercent">' + DataSet.Data[0].PassingPercent + '</span>' +
                                        '</div>' +
                                        '</div>';

                                    $('#txtPassingScorePercentage').val(DataSet.Data[0].PassingPercent);

                                    $('#dvLessonQuizView').empty().append(Quiz);
                                    $('#btnAddQuiz').hide();

                                    ManageQuiz('editclear');



                                    Questions = DataSet.Data[0].Questions;
                                    BindQuestion('', Questions);

                                    //$('#divQuestionType').show();
                                    $('#divQuestionType').empty().append(divQuestionType);

                                    //BindQuestion(Questions);
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

        function AddQuiz(flag) {

            var Title = $("#txtQuizTitle").val();
            var Description = $("#txtQuizDescription").val();
            var PassingPercentage = $("#txtPassingScorePercentage").val();
            //var TotalScore = $("#lblTotalScore").text();
            //var PassingScore = $("#lblPassingScore").text().replace("Passing Score: ", "");

            var requestParams = {
                TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: QuizFlag, ContentTypeID: QuizContentTypeID, Title: Title, Description: Description, Points: '0', IsPublished: true
                , SkipFlashcard: false, IsGift: false, TotalScore: '', PassingScore: '', PassingPercentage: PassingPercentage
            };

            try {
                $.ajax({
                    method: "POST",
                    url: "../api/Quiz/SaveContent",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                }).then(function success(response) {

                    var DataSet = $.parseJSON(response);
                    if (DataSet != null && DataSet != "") {
                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                            QuizFlag = DataSet.Data[0].InsertedID;
                        }

                        HideLoader();

                        //$('#divQuestionType').show();
                        $('#divQuestionType').empty().append(divQuestionType);

                        if (flag == 'redirect') {
                            Swal.fire({
                                title: "Success",
                                text: DataSet.Data[0].ReturnMessage,
                                icon: "success"
                            }).then((value) => {
                                if (value) {
                                    document.location = 'Courses.aspx';
                                }
                            });
                        }
                        else if (flag == 'withlesson') {

                            BindLessonGrid();
                            BindQuizGrid('withlesson');

                            Swal.fire({
                                title: "Success",
                                text: DataSet.Data[0].ReturnMessage,
                                icon: "success"
                            }).then((value) => {
                                if (value) {

                                }
                            });
                        }
                        else if (flag == 'onlyquiz') {

                            BindQuizGrid('onlyquiz');
                            Swal.fire({
                                title: "Success",
                                text: DataSet.Data[0].ReturnMessage,
                                icon: "success"
                            }).then((value) => {
                                if (value) {

                                }
                            });
                        }
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error" });
            }
        }

        function EditQuizFromTile(obj, id) {

            ManageQuiz('editbind');
            $('#txtQuizTitle').val($(obj).parent().parent().find('#hdgQuizTitle').text());
            $('#txtQuizDescription').val($(obj).parent().parent().find('#divQuizDescription').text());
            $('#txtPassingScorePercentage').val($(obj).parent().parent().find('#spPassingPercent').text());
            $('#btnAddQuiz').show();
            QuizFlag = id;
        }


        //Question
        function BindQuestion(flag, Questions, ) {

            if (Questions.length > 0) {
                var QuestionString = '';
                for (var i = 0; i < Questions.length; i++) {

                    var className = '';
                    if (Questions[i].QuestionTypeID == '1') {
                        className = 'far fa-check-square';
                    }
                    else if (Questions[i].QuestionTypeID == '2') {
                        className = 'far fa-caret-square-down';
                    }
                    else if (Questions[i].QuestionTypeID == '3') {
                        className = 'fas fa-dot-circle';
                    }

                    QuestionString = QuestionString + '<div class="card">' +
                        '<div class="tag question">Question</div>' +
                        '<div class="card-header" id="headingQuestion">' +
                        '<span class="sr">Q' + (i + 1) + '<i class="' + className + '"></i><i class="fas fa-caret-down"></i></span>' +
                        '<h5>' + Questions[i].Title + '</h5>' +
                        '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteQuestion(this,' + Questions[i].QuestionID + ')";></i>' +
                        '<i class="fas fa-edit" title="Edit"  onclick="ShowQuestionInEditMode(this,' + Questions[i].QuestionID + ')";></i>' +
                        '</div>' +
                        '</div>';
                }
                $('#dvQuestionView').empty().append(QuestionString);
            }
        }

        var className = '';
        var AnswerTypeCode = '';
        function ShowQuestion(cls, flag, QuestionAnswer) {


            if (flag != 'edit') {

                if (cls == 'multiple') {
                    className = 'far fa-check-square';
                    AnswerTypeCode = "1";
                }
                else if (cls == 'dropdown') {
                    className = 'far fa-caret-square-down';
                    AnswerTypeCode = "2";
                }
                else if (cls == 'radio') {
                    className = 'fas fa-dot-circle';
                    AnswerTypeCode = "3";
                }

                var AnswerID = '0';

                var QuestionType = '<div class="row quiz" id="dvQuestion">' +
                    '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<span class="sr">Q1<i class="' + className + '" id="QuestionTypeClass"></i><i class="fas fa-caret-down"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtQuestion" placeholder="Add Question Text" />' +
                    '</div>' +
                    '</div>' +
                    '<span class="correct">Correct</span>' +
                    '</div>' +
                    '<div class="row" id="divAnswer">' +
                    '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                    '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="row">' +
                    '<div class="col-sm-12 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtAnswer" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3 col-md-2">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="checked-icon"><i class="fa fa-check-circle fa-w-16 correct" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                    '</div>' +

                    '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                    '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="row">' +
                    '<div class="col-sm-12 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtAnswer" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3 col-md-2">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                    '</div>' +

                    '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                    '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="row">' +
                    '<div class="col-sm-12 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtAnswer" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3 col-md-2">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                    '</div>' +
                    '</div>' +
                    '<div class="offset-1 offset-sm-1 col-sm-11 mt-2 mb-4">' +
                    '<a id="btnAddAnswer" onclick="AddAnswer()" class="btn btn-link"><i class="fas fa-plus-circle"></i>Add Answer Option</a>' +
                    '</div>' +
                    '</div>';

                $('#dvLessonQues').empty().append(QuestionType);

                var btnAddQuestion = '<div class="col-sm-4 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestion" onclick="AddQuestion(this,' + QuestionAction + ');"><i class="fas fa-plus-circle"></i>Add Question</a>' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestionCancel" onclick="AddQuestionCancel(this);">Cancel</a>' +
                    '</div>';

                $('#dvQuestion').append(btnAddQuestion);

                gbl_QuestionID = '0';
            }
            else {

                if (QuestionAnswer[0].QuestionTypeID == '1') {
                    className = 'far fa-check-square';
                    AnswerTypeCode = "1";
                }
                else if (QuestionAnswer[0].QuestionTypeID == '2') {
                    className = 'far fa-caret-square-down';
                    AnswerTypeCode = "2";
                }
                else if (QuestionAnswer[0].QuestionTypeID == '3') {
                    className = 'fas fa-dot-circle';
                    AnswerTypeCode = "3";
                }

                var AnswerID = '0';
                var QuestionType = '';

                QuestionType = '<div class="row quiz" id="dvQuestion">' +
                    '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<span class="sr">Q1<i class="' + className + '" id="QuestionTypeClass"></i><i class="fas fa-caret-down"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtQuestion" placeholder="Add Question Text" value="' + QuestionAnswer[0].Title + '"/>' +
                    '</div>' +
                    '</div>' +
                    '<span class="correct">Correct</span>' +
                    '</div>' +
                    '<div class="row" id="divAnswer">';

                for (var i = 0; i < QuestionAnswer.length; i++) {
                    var ansFlag = 'false';
                    var ansClass = 'fa fa-times-circle fa-w-16 wrong fal';
                    var ansMoreThanThree = '';
                    if (QuestionAnswer[i].IsCorrect == '1') {
                        ansFlag = 'true';
                        ansClass = 'fa fa-check-circle fa-w-16 correct';
                    }

                    if (i > 2) {
                        ansMoreThanThree = '<span class="checked-icon delete"><i class="fa fa-trash-alt" onclick="DeleteAnsOption(this)"></i></span>';
                    }

                    QuestionType = QuestionType + '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                        '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                        '<div class="col-sm-8 col-md-10">' +
                        '<div class="row">' +
                        '<div class="col-sm-12 col-md-10">' +
                        '<div class="form-group">' +
                        '<input type="text" class="form-control" id="txtAnswer" answerid="' + QuestionAnswer[i].AnswerID + '" value="' + QuestionAnswer[i].AnswerText + '" placeholder="Answer Option" />' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-sm-3 col-md-2">' +
                        '<div class="form-group">' +
                        '<input type="text" class="form-control" id="txtScore" value="' + QuestionAnswer[i].CorrectScore + '" placeholder="Assign Score" />' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '<span class="checked-icon"><i class="' + ansClass + '" id="ansFlag" value="' + ansFlag + '" onclick="changeAnsFlag(this)"></i></span>' +
                        ansMoreThanThree +
                        '</div>';
                }


                QuestionType = QuestionType + '</div>' +
                    '<div class="offset-1 offset-sm-1 col-sm-11 mt-2 mb-4">' +
                    '<a id="btnAddAnswer" onclick="AddAnswer()" class="btn btn-link"><i class="fas fa-plus-circle"></i>Add Answer Option</a>' +
                    '</div>' +
                    '</div>';

                $('#dvLessonQues').empty().append(QuestionType);

                var btnAddQuestion = '<div class="col-sm-4 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestion" onclick="AddQuestion(this,\'2\');"><i class="fas fa-plus-circle"></i>Add Question</a>' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestionCancel" onclick="AddQuestionCancel(this);">Cancel</a>' +
                    '</div>';

                $('#dvQuestion').append(btnAddQuestion);
            }

            //$('#btnQuestionDone').show();//This need to be show as per previous design
        }

        function AddQuestionCancel() {
            $('#dvLessonQues').empty();
        }

        function AddAnswer() {

            var AnswerID = '0';

            var addAns = '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                '<div class="col-sm-8 col-md-10">' +
                '    <div class="row">' +
                '        <div class="col-sm-12 col-md-10">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" id="txtAnswer" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                '            </div>' +
                '        </div>' +
                '        <div class="col-sm-3 col-md-2">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>' +
                '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                '<span class="checked-icon delete"><i class="fa fa-trash-alt" onclick="DeleteAnsOption(this)"></i></span>' +
                '</div>';

            $('#divAnswer').append(addAns);
        }

        function DeleteAnsOption(cntrl) {
            $(cntrl).parent().parent().remove();
        }

        function changeAnsFlag(obj) {
            if ($(obj).hasClass('correct')) {
                $(obj).removeClass('correct');
                $(obj).removeClass('fa-check-circle');
                $(obj).addClass('fa-times-circle');
                $(obj).addClass('wrong');
                $(obj).addClass('fal');
                $(obj).attr("value", "false");
            }
            else {
                $(obj).removeClass('wrong');
                $(obj).removeClass('fal');
                $(obj).removeClass('fa-times-circle');
                $(obj).addClass('fa-check-circle');
                $(obj).addClass('correct');
                $(obj).attr("value", "true");
            }
        }

        function validateAddQuestion(obj) {

            if ($("#txtQuestion").val() == undefined || $("#txtQuestion").val() == '') {
                return { error: true, msg: "Please enter Question" };
            }
            var Answer = $("input[id='txtAnswer']").map(function () { return $(this).val(); }).get();
            var Score = $("input[id='txtScore']").map(function () { return $(this).val(); }).get();
            var AnsFlag = $("svg[id='ansFlag']").map(function () { return $(this).attr('class'); }).get();

            if (Answer != undefined && Answer.length > 2) {
                for (var i = 0; i < Answer.length; i++) {
                    if (Answer[i] == undefined || Answer[i].trim() == '') {
                        return { error: true, msg: "Please enter answer" };
                    }
                }
            }
            else {
                return { error: true, msg: "Please enter answer" };
            }


            if (Score != undefined && Score.length > 2) {
                for (var i = 0; i < Score.length; i++) {
                    if (Score[i] != undefined && Score[i].trim() == '') {
                        return { error: true, msg: "Please enter score" };
                    }
                }
            }
            else {
                return { error: true, msg: "Please enter score" };
            }

            var className = $('#QuestionTypeClass').attr('class');
            if (className != 'svg-inline--fa fa-check-square fa-w-14') {
                var a = 0;
                for (var i = 0; i < AnsFlag.length; i++) {
                    if (AnsFlag[i].includes('correct')) {
                        a++;
                    }
                }
                if (a > 1) {
                    return { error: true, msg: "Please select only one as answer" };
                }
            }
            var b = 0;
            for (var i = 0; i < AnsFlag.length; i++) {
                if (AnsFlag[i].includes('correct')) {
                    b++;
                }
            }
            if (b < 1) {
                return { error: true, msg: "Please select any one as answer" };
            }
        }

        var gbl_QuestionID = 0;
        var Questions = [];
        function AddQuestion(obj, flag, type) {


            var actionType = flag;
            if (gbl_QuestionID != 0 && gbl_QuestionID != "") {
                actionType = "2"; // Update
            }

            var Question = $("#txtQuestion").val();

            if (type == "done" && (Question == "" || Question == null || Question == undefined) && Questions.length > 0) {
                //$("#dvQuizCongratulationScreen").show();
            }

            var result = validateAddQuestion(obj);
            if (result != null && result.error) {
                Swal.fire({
                    title: "Alert",
                    text: result.msg,
                    icon: "error",
                    button: "Ok",
                });
            }
            else {
                ShowLoader();

                var Answer = $("input[id='txtAnswer']").map(function () { return $(this).val(); }).get();
                var Score = $("input[id='txtScore']").map(function () { return $(this).val(); }).get();
                var answerIds = $("input[id='txtAnswer']").map(function () { return $(this).attr("answerid"); }).get();
                var arrIsCorrect = $("svg[id='ansFlag']").map(function () { return $(this).attr("value"); }).get();

                var AnswerOptions = [];
                for (var i = 0; i < Score.length; i++) {
                    var newAnsOption = {
                        "ContentTypeID": QuizContentTypeID // Final Quiz
                        , "SrNo": (i + 1)
                        , "AnswerText": Answer[i]
                        , "IsCorrect": arrIsCorrect[i]
                        , "CorrectScore": Score[i]
                        , "AnswerID": answerIds[i]
                    };
                    if (Answer[i] != "")
                        AnswerOptions.push(newAnsOption);
                }

                var index = Questions.length + 1;
                var newQuestion = {
                    "ContentTypeID": QuizContentTypeID
                    , Type: AnswerTypeCode
                    , "QuestionID": gbl_QuestionID == null ? 0 : gbl_QuestionID
                    , "ContentID": QuizFlag
                    , "SrNo": index
                    , "Title": Question
                    , "QType": AnswerTypeCode
                    , "IsBox": false
                    , "MaxScore": GetMaxScore(AnswerOptions)
                    , "AnswerOptions": AnswerOptions
                    , "Action": actionType
                };

                var requestParams = newQuestion;
                $.ajax({
                    method: "POST",
                    url: "../api/Quiz/ManageQuestion",
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                }).then(function success(response) {

                    IsCoursePublishable();

                    $('#dvLessonQues').empty();

                    if (type != "done") {
                        BindQuizGrid('');
                        Swal.fire({
                            title: 'Success',
                            icon: 'success',
                            html: "Question details updated successfully.",
                            showConfirmButton: true,
                            showCloseButton: true
                        });
                    }
                    else {
                        HideLoader();
                        //$("#dvQuizCongratulationScreen").show();
                    }
                });
            }
        }

        function GetMaxScore(ansOptions) {
            var maxScore = 0.0;
            $.grep(ansOptions, function (n, i) {
                if (n.IsCorrect == true) {
                    maxScore += parseFloat(n.CorrectScore);
                }
            });
            return maxScore;
        }

        function ShowQuestionInEditMode(obj, questionId) {

            ShowLoader();
            var getUrl = "/API/Quiz/GetQuestionAnswer";
            try {
                var requestParams = { QuestionID: questionId };
                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1" && DataSet.Data.Data.length > 0) {

                                    var QuestionAnswer = DataSet.Data.Data;
                                    if (QuestionAnswer.length > 0) {
                                        gbl_QuestionID = questionId;
                                        ShowQuestion('', 'edit', QuestionAnswer);
                                    }
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

        function DeleteQuestion(obj, questionId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to delete ? Yes or No !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {

                    ShowLoader();
                    var requestParams = { "Action": 3, "Type": "0", "ContentTypeID": QuizContentTypeID, "QuestionID": questionId, ContentID: QuizFlag };
                    var getUrl = "/API/Quiz/DeleteQuestion";

                    try {
                        $.ajax({
                            type: "POST",
                            url: getUrl,
                            headers: { "Authorization": "Bearer " + accessToken },
                            data: JSON.stringify(requestParams),
                            contentType: "application/json",
                            success: function (response) {
                                try {
                                    var DataSet = $.parseJSON(response);

                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {

                                            Swal.fire({
                                                title: 'Success',
                                                icon: 'success',
                                                html: "Question deleted successfully.",
                                                showConfirmButton: true,
                                                showCloseButton: true
                                            });
                                            BindQuestion('', DataSet.Data.Data);
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
            });
        }


        //Common
        var base64CourseLogo = '';
        var base64InstructorPhoto = '';
        function encodeImagetoBase64(element, flag) {

            var file = element.files[0];
            var size = file.size;
            if (file.size != undefined) {
                if (file.size < 5000000) {
                    var reader = new FileReader();
                    reader.onloadend = function () {

                        if (flag == 'CourseLogo') {
                            base64CourseLogo = reader.result;
                            $("#imgCourseLogo").attr("src", base64CourseLogo);

                            //$("#divCourseLogo").addClass('img');
                            //$("#divCourseLogo").attr("src", base64CourseLogo);
                        }
                        else if (flag == 'InstructorPhoto') {
                            base64InstructorPhoto = reader.result;
                            $("#imgInstructorPhoto").attr("src", base64InstructorPhoto);
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

        function IsCoursePublishable(flag) {
            ShowLoader();
            var TopicID = CourseFlag;
            var getUrl = "/API/Content/IsCoursePublishable";

            try {
                var requestParams = { TopicID: CourseFlag };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    //async: false,//Added on 18 APR
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                // Check if course is publishable or not..
                                CheckCoursePublishable(DataSet.Data.Data[0].IsPublishable, DataSet.Data.Data[0].IsPublished)
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

        function isNumberKey(flag, e) {

            flag = $(flag).attr('id');
            var result = false;
            try {
                var charCode = (e.which) ? e.which : e.keyCode;

                //if ((charCode >= 48 && charCode <= 57)) {
                if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105)) {
                    if (flag == 'txtMin') {
                        var min = parseInt($('#' + flag).val());
                        if (min < 0 || min > 59) {
                            $('#' + flag).val('');
                            Swal.fire({ title: "Failure", text: "! Please enter valid minute range between 0 to 59", icon: "error" });
                        }
                        else {
                            result = true;
                        }
                    }
                    else {
                        result = true;
                    }
                }
                else if (charCode == 8 || charCode == 9 || charCode == 13) {

                }
                else {
                    $('#' + flag).val('');
                }
            }
            catch (err) {
                //console.log(err);
            }
            return result;
        }

        function PublishCourse(flag) {
            ShowLoader();
            var TopicID = CourseFlag;
            var getUrl = "/API/Content/PublishCourse";

            try {
                var requestParams = { TopicID: CourseFlag };

                $.ajax({
                    type: "POST",
                    url: getUrl,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    //async: false,//Added on 18 APR
                    success: function (response) {
                        try {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                Swal.fire({
                                    title: "Success",
                                    text: "Course has been published",
                                    icon: "success"
                                }).then((value) => {
                                    if (value) {
                                        document.location = 'courses.aspx';
                                    }
                                });
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

        function CheckCoursePublishable(IsPublishable, IsPublished) {
            if (IsPublishable == 1 && IsPublished == 1) {
                $("#dvPublishCourse").show();
                // $("#dvSaveAsDraft").hide();
            }
            else if (IsPublished == 0 && IsPublishable == 1) {
                $("#dvPublishCourse").show();
                $("#dvSaveAsDraft").show();
            }
            else {
                $("#dvPublishCourse").hide();
                $("#dvSaveAsDraft").show();
            }
            if (IsPublished == 1)
                $("#dvPublishCourse").show();
        }


    </script>

</asp:Content>
