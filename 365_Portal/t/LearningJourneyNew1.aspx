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

            <div class="col-12 col-sm-12 mt-4">
                <div class="card">
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
                                    <div class="col-sm-6">
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

                                    <%--<div class="col-sm-6">--%>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="form-group color-picker">
                                            <label for="txtThemeColor">Theme Color</label>
                                            <input type="color" class="form-control" id="txtCourseThemeColor" onchange="clickColor(0, -1, -1, 5)" value="#161E98" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <a id="btnManageTags" data-toggle="modal" data-target="#modalAddTag" onclick="clearModalText();" href="#"><u>Manage Tags</u></a>
                                    </div>

                                    <div class="col-sm-12">                                    
                                        <div class="form-group editor">
                                            <label>Course Summary </label><%--<span>Highlight why the course should be taken and who is the appropriate audience for the course.</span>--%>
                                            <div id="txtCourseSummary"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-4 pl-0">
                            <div class="card-body right-side-content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label><i class="fas fa-plus-circle"></i>Course Logo </label><%--<span>Set the image for the course.</span>--%>
                                            <div class="custom-file logo">
                                                <input type="file" class="custom-file-input" id="imgCourseLogo" onchange="encodeImagetoBase64(this,'CourseLogo')">
                                                <label class="custom-file-label" for="imgCourseLogo">Drop your image here or </label>
                                            </div>                                            
                                        </div>

                                        <div class="logo-img" id="divCourseLogo"></div>

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
                                            <div class="instructor" style="display:none;" id="divInstructorName">
                                                <input type="text" class="form-control" id="txtInstructorName" placeholder="Instructor Name" />

                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="imgInstructorPhoto" onchange="encodeImagetoBase64(this,'InstructorPhoto')">
                                                    <label class="custom-file-label" for="imgInstructorPhoto">Add Image</label>
                                                </div>
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

            <div class="col-12 mb-5">
                <a class="btn btn-black" onclick="AddCourse('add');"><i class="fas fa-plus-circle"></i>Add Course</a>
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
        //var editorContentDescription = new Jodit('#txtContentDescription');

        var accessToken = '<%=Session["access_token"]%>';

        var IsQueryString = '0';//To identify whether page load from query string or not

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
        var divQuizFlag = 'question';//quiz

        var ContentContentTypeID = '1';
        var QuizContentTypeID = '5';
        var passingScore = 0;
        var pasingPercentage = 0;

        $(document).ready(function ()
        {
            debugger
            if (readQueryString()["topic"] != undefined && readQueryString()["topic"] != '')
            {
                CourseFlag = readQueryString()["topic"];
                IsQueryString = '1';
                EditCourse();
            }
            else {
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


        function GetCourseCategoryTagsAndBadge(flag, CourseCategoryID, TagID)
        {
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
                        if (DataSet.StatusCode == "1")
                        {
                            var Tags = DataSet.Data.Tag;
                            var CourseCategory = DataSet.Data.CourseCategory;

                            if (Tags != undefined && Tags.length > 0)
                            {
                                $('#ddlTags').empty();
                                for (var i = 0; i < Tags.length; i++) {
                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                }
                                selectInit('#ddlTags', 'Tags');
                            }
                            if (CourseCategory != undefined && CourseCategory.length > 0)
                            {
                                $('#ddlCourseCategory').empty().append('<option></option>');
                                for (var i = 0; i < CourseCategory.length; i++) {
                                    $('#ddlCourseCategory').append('<option value="' + CourseCategory[i].CategoryID + '">' + CourseCategory[i].Title + '</option>');
                                }
                                selectInit('#ddlCourseCategory', 'Course Category');
                            }
                            if (flag == 'edit')
                            {
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
            }
        }

        function ClearFieldsAddCourse() {
            debugger
            $('#txtCourseTitle').val('');            
            $('#txtCourseDescription').val('');

            //$('#ddlCourseCategory').val('').trigger('change');
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
            debugger
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
                                                        ""
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
                        debugger
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
                            debugger
                            if (EditTopic[0].FilePath != undefined && EditTopic[0].FilePath != null && EditTopic[0].FilePath != '') {
                                $("#imgCourseLogo").attr("src", "../Files/CourseLogo/" + EditTopic[0].FilePath);
                                $("#divCourseLogo").addClass('img');
                                $("#divCourseLogo").append('<img src="../Files/CourseLogo/' + EditTopic[0].FilePath + '" alt="Course Logo" class="img-fluid">');
                            }

                            if (EditTopic[0].InstructorName != undefined && EditTopic[0].InstructorName != null) {
                                $("#cbxInstructorName").prop("checked", false)
                                $("#divInstructorName").show();
                                $("#txtInstructorName").val(EditTopic[0].InstructorName);
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


        function ClearFieldsAddLesson() {
            $('#txtLessonTitle').val('');
            //$('#txtLearningObjectives').val('');
            //$('#divLessonDescription').empty().append('<div id="txtLessonDescription"></div>');
            //var editorContentDesc = new Jodit('#txtLessonDescription');

            editorLessonDesc.value = '';

            //$('#divLessonDescription').find('.jodit_placeholder').text('')
            //editorContentDesc.value = '';
            //$('#txtEstimatedTime').val('');
            $('#txtHour').val('');
            $('#txtMin').val('');
            $('#txtPoint').val('');
        }

        function validateAddLesson() {
            if ($("#txtLessonTitle").val() == undefined || $("#txtLessonTitle").val() == '') {
                return { error: true, msg: "Please enter Lesson Title" };
            }
            //else if ($("#txtLearningObjectives").val() == undefined || $("#txtLearningObjectives").val() == '') {
            //    return { error: true, msg: "Please enter Learning Objectives" };
            //}
            else if (editorLessonDesc.value == undefined || editorLessonDesc.value.trim() == '') {
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

        function AddLessionFromContent() {
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

        function AddLession(flag) {

            var getUrl;
            //ShowLoader();
            var _Topic_Id = CourseFlag;
            var _Title = $('#txtLessonTitle').val();
            //var _Overview = $('#txtLearningObjectives').val();
            var _Overview = editorLessonDesc.value;
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
                                    else if (flag == 'nexttab') {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        SetProgressBar();
                                        //ClearFieldsAddLesson();
                                        //BindLesson('nexttab');
                                        BindContent('addmore');

                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.Data[0].ReturnMessage,
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                if (AddMoreLessonFlag == 'add') {
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

        function EditLessionFromTile(obj, id) {
            //debugger
            $('#txtLessonTitle').val($(obj).parent().parent().parent().parent().find('#spTitle').text());
            //$('#txtLearningObjectives').val($(obj).parent().parent().parent().parent().find('#spOverview').text());

            //$('#divLessonDescription').find('.jodit_wysiwyg').text($(obj).parent().parent().parent().parent().find('#spOverview').text());
            editorLessonDesc.value = $(obj).parent().parent().parent().parent().find('#spOverview').text();

            //$('#txtEstimatedTime').val($(obj).parent().parent().parent().parent().find('#spCourseTime').text());

            if ($(obj).parent().parent().parent().parent().find('#spCourseTime').text() != undefined
                && $(obj).parent().parent().parent().parent().find('#spCourseTime').text() != ''
                && $(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":").length > 0
            ) {
                $('#txtHour').val($(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":")[0]);
                if ($(obj).parent().parent().parent().parent().find('#spCourseTime').text().split(":").length > 1) {
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


            ClearFieldsAddResource();
            ClearFieldsAddContent();
            ClearFieldsAddQuiz();

            BindContent('');
            BindResource();
            BindQuiz();

            nextTab('pills-lesson-tab');
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
                                    ""
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
                                                    BindLesson('addmore');
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

        function BindLesson(flag) {
            var getUrl = "/API/Content/GetModules";
            var requestParams = { TopicID: CourseFlag, Flag: 'learningjourney' };
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

                                var Modules = DataSet.Data;
                                var tblModules = '';

                                $('#divLessonGrid').empty();
                                if (Modules != undefined && Modules.length > 0) {

                                    for (var i = 0; i < Modules.length; i++) {

                                        tblModules = tblModules + '<div class="card shadow-sm" id="divLessonTile"><div class="card-body">';
                                        tblModules = tblModules + '<div class="tag">Lesson</div>';
                                        tblModules = tblModules + '<i class="fas fa-grip-vertical grid-icon"></i>';
                                        tblModules = tblModules + '<div class="row">';
                                        tblModules = tblModules + '<div class="col-sm-12 col-md-9 col-lg-10">';
                                        tblModules = tblModules + '<h5 class="card-title" id="spTitle">' + Modules[i].Title + '</h5>';
                                        tblModules = tblModules + '<h5 class="card-title" style="display:none;" id="spOverview">' + Modules[i].Overview + '</h5>';
                                        tblModules = tblModules + '<p class="card-text">~<span id="spCourseTime">' + Modules[i].CourseTime + '</span> mins</p>';
                                        tblModules = tblModules + '<span id="spPoints" style="display:none;">' + Modules[i].Points + '</span>';
                                        tblModules = tblModules + '</div>';
                                        tblModules = tblModules + '<div class="col-sm-12 col-md-3 col-lg-2"><div class="action">';
                                        //tblContents = tblContents + '<i class="far fa-eye"></i>';
                                        tblModules = tblModules + '<i class="fas fa-trash-alt" title="Delete" onclick="DeleteLessionFromTile(this,' + Modules[i].ModuleID + ')";></i><span></span>';
                                        tblModules = tblModules + '<i class="fas fa-edit" title="Edit" id="sp' + Modules[i].ModuleID + '" onclick="EditLessionFromTile(this,' + Modules[i].ModuleID + ')";></i>';
                                        //tblModules = tblModules + '<span id="sp' + Modules[i].ModuleID + '" onclick="EditLessionFromTile(this,' + Modules[i].ModuleID + ')"; style="display:none";>' + Modules[i].ModuleID + '</span>';
                                        tblModules = tblModules + '</div></div></div></div></div>';
                                    }
                                }
                                else {
                                    tblModules = tblModules + '<div class="container"><h6>No lesson added yet</h6></div>';
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
                                else if (flag == 'afterquiz') {
                                    AddMoreLessonFlag = 'bindtile';
                                    divLessonFlag = 'bindtile';
                                    AddMore('btnAddMoreLesson');
                                    nextTab('pills-lesson-tab');
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

        function ShowLessonTile() {
            LessonFlag = '0';
            ContentFlag = '0';

            $('#divContentGrid').empty().append('<div class="container"><h6>No content added yet</h6></div>');

            AddMoreLessonFlag = 'bindtile';
            AddMore('btnAddMoreLesson');
        }


        function ClearFieldsAddContent() {
            $('#txtContentHeader').val('');

            //Commented on 19 APR 20
            //$('#divContentDescription').empty().append('<div id="txtContentDescription"></div>');
            //var editorContentDesc = new Jodit('#txtContentDescription');
            //$('#divContentDescription').find('.jodit_placeholder').text('')

            //Added on 19 APR 20
            editorContentDesc.value = '';
        }

        function validateAddContent() {
            if ($("#txtContentHeader").val() == undefined || $("#txtContentHeader").val() == '') {
                return { error: true, msg: "Please enter Content Header" };
            }
            else if (editorContentDesc.value == undefined || editorContentDesc.value.trim() == '') {
                return { error: true, msg: "Please enter Content Details" };
            }
            else if (CourseFlag == '0' || LessonFlag == '0') {
                return { error: true, msg: "Oops ! Something went wrong. PLease try again." };
            }
            return true;
        }

        function AddContentFromResource() {
            ""
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

        function AddContent(flag) {
            ""
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
            formdata.append("Description", editorContentDesc.value);
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
                                ClearFieldsAddContent();
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
            ""
            $('#txtContentHeader').val($(obj).parent().parent().parent().parent().find('#spTitle').text());
            //$('#divContentDescription').find('.jodit_wysiwyg').text($(obj).parent().parent().parent().parent().find('#spOverview').text());
            editorContentDesc.value = $(obj).parent().parent().parent().parent().find('#spOverview').text();

            ContentFlag = id;
            AddMoreContentFlag = 'add';
            divContentFlag = 'add';
            nextTab('pills-content-tab');
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
            });
        }

        function BindContent(flag) {
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
                        //debugger
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {

                                var Contents = DataSet.Data;
                                var tblContents = '';
                                $('#divContentGrid').empty();
                                if (Contents != undefined && Contents.length > 0) {

                                    for (var i = 0; i < Contents.length; i++) {

                                        tblContents = tblContents + '<div class="card shadow-sm" id="divContentTile"><div class="card-body">';
                                        tblContents = tblContents + '<div class="tag">Content</div>';
                                        //tblContents = tblContents + '<div class="tag" ><span id="spTitle" >' + Contents[i].Title + '</span></div>';
                                        tblContents = tblContents + '<i class="fas fa-grip-vertical grid-icon"></i>';
                                        tblContents = tblContents + '<div class="row">';
                                        tblContents = tblContents + '<div class="col-sm-12 col-md-9 col-lg-10">';
                                        tblContents = tblContents + '<h5 class="card-title" id="spTitle">' + Contents[i].Title + '</h5>';
                                        tblContents = tblContents + '<a style="display:none;" target="_blank" href="' + Contents[i].Description + '"><h5 class="card-title" id="spOverview">' + Contents[i].Description + '</h5></a>';

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
                                    tblContents = tblContents + '<div class="container"><h6>No content added yet</h6></div>';
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

        function ShowContentTile() {
            ContentFlag = '0';
            AddMoreContentFlag = 'bindtile';
            AddMore('btnAddMoreContent');
        }



        function ClearFieldsAddResource() {
            //$('#divResourcesDescription').empty().append('<div id="txtResourcesDescription"></div>');
            //var editorResourcesDesc = new Jodit('#txtResourcesDescription');
            //$('#divResourcesDescription').find('.jodit_placeholder').text('')
            editorResourcesDesc.value = '';
        }

        function validateAddResource() {
            if (editorResourcesDesc.value == undefined || editorResourcesDesc.value.trim() == '') {
                return { error: true, msg: "Please enter Resource Details" };
            }
            return true;
        }

        function AddResourceFromQuiz() {
            AddResource('samepage');
        }

        function AddResource(flag) {
            ""
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
                var Description = editorResourcesDesc.value;
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
        }

        function BindResource() {
            ""
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
                            ""
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    //$('#divResourcesDescription').find('.jodit_wysiwyg').text(DataSet.Data[0].Resource);
                                    //debugger
                                    //editorResourcesDesc.value = unescape(DataSet.Data[0].Resource);
                                    $('#divResourcesAsHTML').html(DataSet.Data[0].Resource);
                                    editorResourcesDesc.value = $('#divResourcesAsHTML').text();
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
            $('#lblPercentage').text('0%');
            //$('#txtPassingPercentage').val('');
        }

        function ChangePercentage(val) {
            pasingPercentage = val;
            $("#lblPercentage").text(val + "%");
            passingScore = Math.round((parseFloat($("#lblTotalScore").text()) * parseInt(val)) / 100);
            $("#lblPassingScore").text("Passing Score: " + passingScore);
        }

        function validateAddQuiz() {
            debugger
            if ($("#txtQuizTitle").val() == undefined || $("#txtQuizTitle").val() == '') {
                return { error: true, msg: "Please enter Quiz Title" };
            }
            else if ($("#txtQuizDescription").val() == undefined || $("#txtQuizDescription").val() == '') {
                return { error: true, msg: "Please enter Quiz Description" };
            }
            else if ($("#txtPassingScorePercentage").val() == undefined || $("#txtPassingScorePercentage").val() == '') {
                return { error: true, msg: "Please select Passing Percentage" };
            }
            else if ($("#lblPassingScore").text() == undefined || $("#lblPassingScore").text() == '') {
                return { error: true, msg: "Please select Passing Percentage" };
            }

            return true;
        }

        function validateAddQuestion(obj) {
            if ($("#txtQuestion").val() == undefined || $("#txtQuestion").val() == '') {
                return { error: true, msg: "Please enter Question" };
            }
            var Answer = $("input[id='txtAnswer']").map(function () { return $(this).val(); }).get();
            var Score = $("input[id='txtScore']").map(function () { return $(this).val(); }).get();

            /*
            if (Answer != undefined && Answer.length > 2) {
                for (var i = 0; i < Answer.length; i++) {
                    if (Answer[i] != undefined && Answer[i].trim() != '') {
                        //break;
                    }
                    if (i == Answer.length - 1) {
                        invalidAnswer = true;
                        return { error: true, msg: "Please enter answer" };
                    }
                }
            }
            else {
                return { error: true, msg: "Please enter answer" };
            }
 
            if (Score != undefined && Score.length > 2) {
                for (var i = 0; i < Score.length; i++) {
                    if (Score[i] != undefined && Score[i].trim() != '') {
                        ///break;
                    }
                    if (i == Score.length - 1) {
                        return { error: true, msg: "Please enter score" };
                    }
                }
            }
            else {
                return { error: true, msg: "Please enter score" };
            }          */

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
        }

        var Questions = [];

        function BindQuiz() {

            ClearFieldsAddQuiz();
            ShowLoader();
            var getUrl = "/API/Quiz/GetContentList";

            try {
                // var requestParams = { TopicID: CourseFlag, ModuleID: LessonFlag };
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
                                if (DataSet.StatusCode == "1") {
                                    debugger
                                    if (DataSet.Data.length != 0) {
                                        QuizFlag = DataSet.Data[0].ContentID;

                                        $('#txtQuizTitle').val(DataSet.Data[0].Title);
                                        $('#txtQuizDescription').val(DataSet.Data[0].Description);
                                        $('#txtPassingScorePercentage').val(DataSet.Data[0].PassingPercent);
                                        $('#lblTotalScore').text(DataSet.Data[0].TotalScore);
                                        $('#lblPassingScore').text('Passing Score: ' + DataSet.Data[0].PassingScore);
                                        $('#lblPercentage').text(DataSet.Data[0].PassingPercent + '%');

                                        Questions = DataSet.Data[0].Questions;

                                        if (Questions.length == 0) {
                                            $(".quiz-wrapper").hide();
                                            $("#dvQuizDone").hide();
                                        }
                                        else {
                                            $(".quiz-wrapper").show();
                                            $("#dvQuizDone").show();
                                        }

                                        BindQuestion(Questions);
                                    }
                                    else {
                                        $('#txtQuizTitle').val("");
                                        $('#txtQuizDescription').val("");
                                        $('#txtPassingScorePercentage').val("0");
                                        $('#lblTotalScore').text("0");
                                        $('#lblPassingScore').text("");
                                        $('#lblPercentage').text("0%");

                                        Questions = [];

                                        if (Questions.length == 0) {
                                            $(".quiz-wrapper").hide();
                                            $("#dvQuizDone").hide();
                                        }
                                        else {
                                            $(".quiz-wrapper").show();
                                            $("#dvQuizDone").show();
                                        }

                                        BindQuestion(Questions); ``
                                    }

                                }
                                else {
                                    ClearFieldsAddQuiz();
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

        function AddQuizFinal() {
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
                // AddQuiz('nexttab');
                AddQuiz('');
            }
        }

        function AddQuiz(showLoader, flag) {
            debugger
            if (showLoader)
                ShowLoader();
            var Title = $("#txtQuizTitle").val();
            var Description = $("#txtQuizDescription").val();
            var TotalScore = $("#lblTotalScore").text();
            var PassingScore = $("#lblPassingScore").text().replace("Passing Score: ", "");
            var PassingPercentage = $("#lblPercentage").text().replace("%", "");

            var requestParams = {
                TopicID: CourseFlag, ModuleID: LessonFlag, ContentID: QuizFlag, ContentTypeID: QuizContentTypeID, Title: Title, Description: Description, Points: '0', IsPublished: true
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
                    if (showLoader)
                        HideLoader();
                    var DataSet = $.parseJSON(response);
                    if (DataSet != null && DataSet != "") {
                        if (DataSet.Data[0].InsertedID != null) {
                            QuizFlag = DataSet.Data[0].InsertedID;
                        }
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

                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error" });
            }
        }

        var gbl_QuestionID = 0;
        function AddQuestion(obj, flag, type) {

            var actionType = flag;
            if (gbl_QuestionID != 0 && gbl_QuestionID != "") {
                actionType = "2"; // Update
            }
            var Question = $("#txtQuestion").val();

            if (type == "done" && (Question == "" || Question == null) && Questions.length > 0) {
                HideLoader();
                $("#dvQuizCongratulationScreen").show();
                $(".quiz-wrapper").hide();
                $("#divQuizAdd").hide();

                $('#divQuestionType').hide();
                $('#dvQuizDone').hide();
                $('#dvCancelQuestion').hide();

                return;
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
                    ShowLoader();
                    AddQuiz(false);


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
                        $('#divQuestionAdd').html("");
                        IsCoursePublishable();
                        ManageQuizButton('addquestion');
                        if (type != "done") {
                            BindQuiz();
                            Swal.fire({
                                title: 'Success',
                                icon: 'success',
                                html: "Question details updated successfully.",
                                showConfirmButton: true,
                                showCloseButton: true
                            });
                            $("#dvSaveQuestion").hide();
                            $("#dvCancelQuestion").hide();
                            $("#divQuestionType").show();
                            $("#divAddQuestion").hide();
                        }
                        else {
                            HideLoader();
                            $("#dvQuizCongratulationScreen").show();
                            $(".quiz-wrapper").hide();
                            $("#divQuizAdd").hide();

                            $('#divQuestionType').hide();
                            $('#dvQuizDone').hide();
                            $('#dvCancelQuestion').hide();

                        }
                    });
                }
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

        //var QuizFlag = 'addquestion';
        function ManageQuizButton(flag) {
            if (flag == 'addquestion') {
                $('#divQuestionType').show();
                $('#divAddQuestion').hide();
            }
            else if (flag == 'questiontype') {
                $('#divQuestionType').hide();
                $('#divAddQuestion').show();
            }
        }

        var lastQuestionIndex = 0;
        function BindQuestion(questions) {
            debugger
            // Bind Questions..
            var divQuestionTile = "";
            $.grep(questions, function (n, i) {


                divQuestionTile = divQuestionTile + '<div class="card shadow-sm"><div class="card-body">';
                divQuestionTile = divQuestionTile + '<div class="col-sm-12 d-flex justify-content-between align-items-center ques">';
                divQuestionTile = divQuestionTile + '<span class="sr" id="spQuestionId">Q' + (i + 1) + ' <i class="far fa-circle"></i><i class="fas fa-caret-down"></i></span>';
                divQuestionTile = divQuestionTile + '<div class="col-sm-8 col-md-10">';
                divQuestionTile = divQuestionTile + '<h5 class="font-weight-bold" id="spQuestion">' + n.Title + '</h5>';
                divQuestionTile = divQuestionTile + '</div><a onclick="ShowQuestionInEditMode(' + n.QuestionID + ')"><i class="fas fa-pen"></i></a><a onclick="DeleteQuestion(' + n.QuestionID + ')"><i class="fas fa-trash-alt"></i></a></div>';
                divQuestionTile = divQuestionTile + '</div></div>';
                lastQuestionIndex = i + 1;
            });
            $('#divQuestionTile').empty().append(divQuestionTile);
        }

        function CancelQuestion() {
            $("#dvSaveQuestion").hide();
            $("#dvCancelQuestion").hide();
            $("#divQuestionType").show();
            $("#divAddQuestion").hide();
            $('#divQuestionAdd').html("");
        }

        var addClass = '';
        var AnswerTypeCode = '';
        function ShowQuestion(AnswerType, questionDetails) {

            // $("#divQuestionType").show();
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
                $("#dvQuizDone").show();
                if (questionDetails == null) {
                    AddQuiz('');
                    // Add New Question
                    $("#dvSaveQuestion").hide();
                    $("#divAddQuestion").show();
                    $("#dvCancelQuestion").show();
                    $('#divQuestionType').hide();
                    gbl_QuestionID = 0;
                }
                else {
                    // Edit Question
                    gbl_QuestionID = questionDetails.QuestionID;
                    $("#dvSaveQuestion").show();
                    $("#divAddQuestion").hide();
                    $("#dvCancelQuestion").show();
                    $('#divQuestionType').hide();
                }
                $(".quiz-wrapper").show();

                // $('#divQuestionType').hide();
                // $('#divAddQuestion').show();

                if (AnswerType == 'multiple') {
                    addClass = 'far fa-check-square';
                    AnswerTypeCode = "1";
                }
                else if (AnswerType == 'dropdown') {
                    addClass = 'far fa-caret-square-down';
                    AnswerTypeCode = "2";
                }
                else if (AnswerType == 'radio') {
                    addClass = 'fas fa-dot-circle';
                    AnswerTypeCode = "3";
                }
                else {
                    Swal.fire({ title: "Alert", text: result.msg, icon: "error", button: "Ok" });
                    return false;
                }

                //ManageQuizButton('questiontype');

                $('#txtQuestion').val('');

                //Bind question text field
                var divQuestionAdd = '<div class="col-sm-12 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<span class="sr">Q' + (lastQuestionIndex + 1) + '<i class="far fa-circle"></i><i class="fas fa-caret-down"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" value="' + (questionDetails == null ? "" : questionDetails.Title) + '" id="txtQuestion" placeholder="Enter Question"/>' +
                    '</div></div><span class="correct">Correct</span></div>';

                //Bind Add dynamic answer text field
                var dvAnswerOptions = '<div id="divAnswer">';
                if (questionDetails != null) {
                    $.grep(questionDetails.AnswerOptions, function (answOption, indx) {
                        //if (indx == 0) {
                        //    ansOptions += "<tr><th>Sr No</th>";
                        //    ansOptions += "<th>Answer Text</th>";
                        //    if (contentType == 2 || contentType == 3) {
                        //        ansOptions += "<th>Is Correct</th>";
                        //    }
                        //    if (contentType == 3) {
                        //        ansOptions += "<th>Score</th></tr>";
                        //    }
                        //}
                        //var checkedValue = "disabled " + (answOption.IsCorrect == true ? "Checked" : "");
                        //ansOptions += "<tr><td>" + answOption.SortOrder + "</td>";
                        //ansOptions += "<td>" + answOption.AnswerText + "</td>";
                        //if (contentType == 2 || contentType == 3) {
                        //    ansOptions += "<td>" + "<input index=" + answOption.AnswerID + " type='checkbox' " + checkedValue + " />" + "</td>";
                        //}
                        //if (contentType == 3) {
                        //    ansOptions += "<td>" + answOption.CorrectScore + "</td></tr>";
                        //}
                        //answOption.IsCorrect

                        var correctAnswerCSS = "fa fa-check-circle fa-w-16 correct";
                        if (!answOption.IsCorrect) {
                            correctAnswerCSS = "fa fa-times-circle fa-w-16 fal";
                        }

                        dvAnswerOptions = dvAnswerOptions + '' +
                            '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                            '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + addClass + '" aria-hidden="true"></i></span>' +
                            '<div class="col-sm-8 col-md-10">' +
                            '<div class="row">' +
                            '<div class="col-sm-12 col-md-10">' +
                            '<div class="form-group">' +
                            '<input type="text" class="form-control" answerid="' + answOption.AnswerID + '" id="txtAnswer" value="' + answOption.AnswerText + '"/>' +
                            '</div></div>' +
                            '<div class="col-sm-3 col-md-2">' +
                            '<div class="form-group">' +
                            '<input type="text" id="txtScore" class="form-control" value="' + answOption.CorrectScore + '" />' +
                            '</div></div></div></div>' +
                            '<span class="checked-icon"><i class="' + correctAnswerCSS + '" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                            '</div>';
                    });
                }
                else {
                    $.grep([1, 2, 3], function (answOption, indx) {
                        dvAnswerOptions = dvAnswerOptions + '' +
                            '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                            '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + addClass + '" aria-hidden="true"></i></span>' +
                            '<div class="col-sm-8 col-md-10">' +
                            '<div class="row">' +
                            '<div class="col-sm-12 col-md-10">' +
                            '<div class="form-group">' +
                            '<input type="text" class="form-control" answerid="0" id="txtAnswer" value=""/>' +
                            '</div></div>' +
                            '<div class="col-sm-3 col-md-2">' +
                            '<div class="form-group">' +
                            '<input type="text" id="txtScore" class="form-control" value="0" />' +
                            '</div></div></div></div>' +
                            '<span class="checked-icon"><i class="fa fa-check-circle fa-w-16 correct" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>'
                            + '</div>';
                    });
                }

                dvAnswerOptions = dvAnswerOptions + "</div>";

                // Bind Answer Options
                divQuestionAdd = divQuestionAdd + dvAnswerOptions;

                //Bind Add more answer button
                divQuestionAdd = divQuestionAdd + '<div class="offset-1 offset-sm-1 col-sm-11 mb-2">' +
                    '<div class="form-group mt-2">' +
                    '<a id="btnAddAnswer" onclick="AddAnswer();" class="label"><i class="fas fa-plus-circle black"></i>Add Answer</a>' +
                    '</div></div>';
                //Bind Entire Add question div
                $('#divQuestionAdd').empty().append(divQuestionAdd);
            }
        }

        function ShowQuestionInEditMode(questionId) {
            var question = $.grep(Questions, function (n, i) {
                return n.QuestionID == parseInt(questionId);
            })[0];
            //AnswerOptions = question.AnswerOptions;
            var qtype = "";
            if (question.QuestionTypeID == 1) {
                qtype = "multiple";
            }
            else if (question.QuestionTypeID == 2) {
                qtype = "dropdown";
            }
            else if (question.QuestionTypeID == 3) {
                qtype = "radio";
            }

            ShowQuestion(qtype, question);
        }

        function DeleteQuestion(questionId) {
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
                    debugger
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
                                    debugger
                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {
                                            BindQuestion(DataSet.Data.Data);
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

        function changeAnsFlag(obj) {
            if ($(obj).hasClass('fa-check-circle')) {
                $(obj).removeClass('far');
                $(obj).removeClass('fa-check-circle');
                $(obj).removeClass('correct');

                $(obj).addClass('fal');
                $(obj).addClass('fa-times-circle');
                $(obj).attr("value", "false");
            }
            else {
                $(obj).removeClass('fal');
                $(obj).removeClass('fa-times-circle');

                $(obj).addClass('far');
                $(obj).addClass('fa-check-circle');
                $(obj).addClass('correct');
                $(obj).attr("value", "true");
            }
        }

        function AddAnswer() {
            var AddAnswer = '';
            AddAnswer = AddAnswer + '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + addClass + '" aria-hidden="true"></i></span>' +
                '<div class="col-sm-8 col-md-10">' +
                '<div class="row">' +
                '<div class="col-sm-12 col-md-10">' +
                '<div class="form-group">' +
                '<input type="text" class="form-control" answerid="0" value="" id="txtAnswer"/>' +
                '</div></div>' +
                '<div class="col-sm-3 col-md-2">' +
                '<div class="form-group">' +
                '<input type="text" id="txtScore" class="form-control" value="0" />' +
                '</div></div></div></div>' +
                '<span class="checked-icon"><i class="fa fa-check-circle fa-w-16 correct" id="ansFlag" value="true" onclick="changeAnsFlag(this)"></i></span>' +
                '<span class="checked-icon delete"><i class="fa fa-trash-alt fa-w-16" id="ansFlag" value="true" onclick="DeleteAnsOption(this)"></i></span>' +
                '</div>';
            $('#divAnswer').append(AddAnswer);
        }

        function DeleteAnsOption(cntrl) {
            $(cntrl).parent().parent().remove();
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

        function SetProgressBar() {
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
        var base64InstructorPhoto = '';
        function encodeImagetoBase64(element, flag) {
            debugger
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
