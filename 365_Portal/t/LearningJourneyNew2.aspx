<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="LearningJourneyNew2.aspx.cs" Inherits="_365_Portal.t.LearningJourneyNew2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Added on 24 JUN for dynamic div drag-drop--%>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $("#dvLessonViewParentView").sortable();
            $("#dvLessonViewParentView").disableSelection();
        });
    </script>
    <%--End Added on 24 JUN for dynamic div drag-drop--%>

    <style>
        .btnSpaceBottom {
            margin-bottom: 1%;
        }
        .btnSpaceRight {
            margin-right: 1%;
        }.btnSpaceLeft {
            margin-left: 1%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="course-flow">
        <div class="row">
            <div class="col-12 col-sm-12 d-flex justify-content-between header">
                <div class="d-flex align-items-center">
                    <h4 class="title" id="hdgPageTitle">Add Course</h4>
                </div>
                <div>
                    <div class="col dropdown p-0">
                        <a class="btn btn-yellow" id="btnPublish" style="display: none;" onclick="PublishCourse('');">Publish</a>
                        <a class="btn btn-yellow" id="btnDiscard" style="display: none;">Discard</a>

                        <%--<a class="btn btn-yellow dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Publish</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" id="btnPublish" style="display: none;" onclick="PublishCourse('');">Publish</a>
                            <a class="dropdown-item" id="btnDiscard" style="display: none;">Discard</a>
                        </div>--%>
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
                                            <div class="form-group color-picker" style="display:none;">
                                                <label for="txtCourseThemeColor">Theme Color</label>
                                                <input type="color" class="form-control" id="txtCourseThemeColor" onchange="clickColor(0, -1, -1, 5)" value="#161E98" />
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <a id="btnManageTags" data-toggle="modal" data-target="#modalAddTag" onclick="clearModalText();" href="#"><u>Manage Tags</u></a>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group editor" id="divCourseSummary">
                                                <label>Course Summary </label>
                                                <div id="txtCourseSummary"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6 btnSpaceBottom">
                                            <a class="btn btn-black" id="btnAddCourse" onclick="AddCourse('add');"><i class="fas fa-plus-circle"></i>Save & Proceed</a>
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
                                                    <input type="file" class="custom-file-input" id="imgCourseLogo" onchange="readURLCroppedImage(this, '.course-logo','learningjourney_courselogo')">
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
                                                        <input type="file" class="custom-file-input" id="imgInstructorPhoto" onchange="readURLCroppedImage(this, '.instructor-photo','learningjourney_instructorimage')">
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
                                                        <label class="custom-control-label" for="rbOrganization" id="lblOrganization"></label>
                                                        <small class="form-text">Anyone within this organization can find and access this course.</small>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="rbAssigned" value="3" name="rgSharing" class="custom-control-input">
                                                        <label class="custom-control-label" for="rbAssigned">Restricted</label>
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





            <a class="btn bg-blue text-white float-right" style="display:none;" id="savereorder" onclick="SaveLessonOrder();">Save Reordering</a>
            



            <%-- in progresss --%>
            <div class="col-12 col-sm-12 mt-4 accordion course-content-collapse" style="display: none;" id="divLessonMain">

                <div class="builder" id="divCourseBuilder">
                    <div class="builder-title">
                        <img src="../INCLUDES/Asset/images/builder.png" /><span>Course Builder</span>
                    </div>
                    <%--<div class="builder-action"><span onclick="collapseToggle('.course-content-collapse .collapse',1);">Expand All</span><span onclick="collapseToggle('.course-content-collapse .collapse',0);">Collapse All</span></div>--%>
                </div>


                <div class="lesson-container" id="dvLessonViewParentView">
                </div>


                <div class="card mb-4" id="dvLessonViewParentEdit">
                </div>

            </div>

            <div class="col-12 mb-5" id="divAddMoreLesson">
                <a class="btn btn-black" id="btnAddMoreLesson" style="display: none;" onclick="AddMoreLesson('0');"><i class="fas fa-plus-circle"></i>Add New Lesson</a>
                <%--<a class="btn btn-outline black" id="btnCancelLesson" style="display: none;" onclick="ClearNewLesson();">Cancel</a>--%>
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
                                <input type="text" class="form-control required" onkeyup="setTextCount(this);" placeholder="Tag Name *" maxlength="100" id="txtTagName" aria-describedby="txtTagNameHelp" />
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
        
        var accessToken = '<%=Session["access_token"]%>';
        var OrganizationName = '<%=Session["OrganizationName"]%>';
        

        var editorCourseSummary = new Jodit('#txtCourseSummary');
        var editorContentDescription = '';
        var editorResourcesDescription = '';

        var IsQueryString = '0';//To identify whether page load from query string or not

        var CourseFlag = '0';
        var LessonFlag = '0';
        var ContentFlag = '0';
        var ResourceFlag = '0';
        var QuizFlag = '0';

        var tmpLessonId = '0';

        var ContentContentTypeID = '1';
        var QuizContentTypeID = '5';
        var passingScore = 0;
        var pasingPercentage = 0;

        var QuestionAction = '1';

        var dvLessonEdit = '<div class="form-group asterisk">' +
            '<label for="txtLessonTitle" class="inline">Lesson Title</label>' +
            '<input type="text" class="form-control required" id="txtLessonTitle" onkeyup="IsChangedAnything(this);" placeholder="Lesson Title" />' +
            '</div>' +
            '<div class="form-group asterisk">' +
            '<label for="txtLessonDescription" class="inline">Lesson Description</label>' +
            '<textarea class="form-control required" id="txtLessonDescription" onkeyup="IsChangedAnything(this);" placeholder="Add Lesson Description"></textarea>' +
            '</div>';
        //'<div class="form-group">' +
        //    '<a class="btn btn-outline blod black" id="btnLessonCancel" onclick="LessonCancel(this);">Cancel</a>' +
        //'</div>';

        var dvLessonContentEdit = '<div class="form-group asterisk">' +
            '<div class="tag content">Content</div>' +
            '<label for="txtContentHeader" class="inline">Content Title</label>' +
            '<input type="text" class="form-control required" id="txtContentHeader" onkeyup="IsChangedAnything(this);" placeholder="Content Title" />' +
            '</div>' +
            '<div class="form-group editor asterisk" id="divContentSummary">' +
            '<div id="txtContentDescription"></div>' +
            '</div>';
        //'<div class="form-group">' +
        //'<a class="btn btn-outline blod black" id="btnContentCancel" onclick="ContentCancel(this);">Cancel</a>' +
        //'</div>';

        var dvLessonResourceEdit = '<div class="form-group editor" id="divResourceSummary">' +
            '<label>Resources</label>' +
            '<div id="txtResourcesDescription"></div>' +
            '</div>';

        var dvLessonQuizEdit = '' +
            '<div class="form-group asterisk">' +
            '<label for="txtQuizTitle" class="inline">Quiz Title</label>' +
            '<input type="text" class="form-control required" id="txtQuizTitle" onkeyup="IsChangedAnything(this);" placeholder="Quiz Title" />' +
            '</div>' +
            '<div class="form-group asterisk">' +
            '<label for="txtQuizDescription" class="inline">Quiz Description</label>' +
            '<textarea class="form-control required" id="txtQuizDescription" onkeyup="IsChangedAnything(this);" placeholder="Quiz Description"></textarea>' +
            '</div>';
        //'<div class="form-group">' +
        //'<a class="btn btn-outline blod black" id="btnQuizCancel" onclick="QuizCancel(this);">Cancel</a>' +
        //'</div>';

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
            debugger

            $('#lblOrganization').text(OrganizationName);


            if (readQueryString()["topic"] != undefined && readQueryString()["topic"] != '') {
                CourseFlag = readQueryString()["topic"];
                IsQueryString = '1';

                if(CourseFlag != '0')
                {
                    $('#btnAddCourse').text('Save');
                    $('#hdgPageTitle').text('Edit Course');
                }

                EditCourse();

                if (CourseFlag != '0') {
                    BindLessonGrid('');
                }
            }
            else {
                GetCourseCategoryTagsAndBadge('view', 0, 0, 0);
            }

            if(CourseFlag == '0')
            {
                $("#btnPublish").hide();
                $("#btnDiscard").hide();
            }  
            

            $("#divCourseSummary").keyup(function(){            
                debugger
                IsChangedField = '1';
            });            
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

                    flag = 'update';
                    _Topic_Id = CourseFlag;
                    getUrl = "/API/Content/ModifyTopic";
                }

                requestParams = {
                    TopicID: _Topic_Id, TopicTitle: _Title, TopicDescription: _Description, CourseCategory: _CourseCategory, selectedTags: _selectedTags, CategoryColor: _CategoryColor, Summary: _Summary
                    //, CourseLogoBase64: $('.course-logo img').attr('src'), IsCourseCreator: _IsCourseCreator, InstructorName: _InstructorName, InstructorPhotoBase64: $('.instructor-photo img').attr('src')
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
                                    debugger
                                    var DataSet = $.parseJSON(response);
                                    if (DataSet != null && DataSet != "") {

                                        $('#btnAddMoreLesson').show();

                                        if (DataSet.StatusCode == "1") {

                                            $("#btnDiscard").show();
                                            $('#btnAddCourse').text('Save');
                                            $('#hdgPageTitle').text('Edit Course');

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
                                                AddMoreLesson('0');

                                                HideLoader();
                                                if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                                    CourseFlag = DataSet.Data[0].InsertedID;
                                                }

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
                        debugger
                        HideLoader();
                        if (DataSet.StatusCode == "1") {

                            $('#btnAddMoreLesson').show();

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

                                debugger
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
                            LessonFlag = '0';

                            if (DataSet.Data != undefined && DataSet.Data.length > 0) {
                                Swal.fire(DataSet.Data[0].ReturnMessage, {
                                    icon: "error",
                                });
                            }
                            else {
                                $('#btnAddCourse').text('Save & Proceed');
                                $('#hdgPageTitle').text('Add Course');
                                $("#btnPublish").hide();
                                $("#btnDiscard").hide();

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
        function ManageLesson(flag, source) {
            if (flag == 'editbind') {

                if (source != undefined && source != '' && source == 'editfromgrid') {
                    $('#divLessonOverview').empty().append(dvLessonEdit);
                }
                else {
                    $('#dvLessonEdit').empty().append(dvLessonEdit);
                }
            }
            else if (flag == 'editclear') {
                $('#dvLessonEdit').empty();
            }
        }

        function AddMoreLesson(id) {
            debugger
            LessonFlag = id;

            //if($("div[id^='tempLessonGrid_']").length > 0)
            if(id == '0' && IsChangedField == '1')
            {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to discard this lesson ? Yes or No !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, clear it!'
                }).then((result) => {
                    debugger
                    if (result.value) {  
                        IsChangedField = '0';
                        AddMoreLessonBind(id);
                    }
                    else
                    {
                        return false;
                    }
                });
            }
            else
            {
                AddMoreLessonBind(id);
            }
        }

        function AddMoreLessonBind(id)
        {
            LessonFlag = id;

            var deleteIsEnabled = '', tagStyle = '';
            if (id != '0') {
                deleteIsEnabled = '<a><i class="fas fa-trash-alt" onclick="DeleteLessionFromTile(this,' + id + ')";></i></a>';
            }
            else {
                tagStyle = '<div class="tag lesson main-card">Lesson 1</div>';

                LessonFlag = '0';
                ContentFlag = '0';
                ResourceFlag = '0';
                QuizFlag = '0';
            }

            var dvLessonViewParentEdit = '<div class="row" id="tempLessonGrid_' + id + '">' +

                //Right Pane
                '<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-8 pr-0">' +
                '<div class="card-body arrows">' + tagStyle +
                '<div class="arrows-icon"><i class="fas fa-grip-vertical"></i></div>' +
                '<div class="row w-100" id="divLessonJourney">' +
                '<div class="col-sm-12" id="dvLessonView">' +
                '</div>' +
                '<div class="col-sm-12" id="dvLessonEdit"></div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                //End Right Panes

                //Left pane
                '<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-4 pl-0">' +
                '<div class="card-body right-side-content bg-white">' +
                //'<a class="lesson-save"><i class="fas fa-save" onclick="AddLessonWithOthers(this);"></i></a>' +
                '<div class="lesson-action">' + deleteIsEnabled +
                '</div>' +
                '<div class="row mt-2">' +

                '<div class="col-sm-3">' +
                '<div class="form-group">' +
                '<label class="inline active">Points</label>' +
                '<input type="text" class="form-control required" maxlength="5" id="txtPoint" placeholder="+100" onkeyup="return isNumberKey(this,event);IsChangedAnything(this);" />' +
                '</div>' +
                '</div>' +

                '<div class="col-sm-5">' +
                '<div class="form-group">' +
                '<label class="inline active">Estimated Time</label>' +
                '<input type="text" class="form-control required d-inline col-5" maxlength="2" id="txtHour" placeholder="HH" onkeyup="return isNumberKey(this,event);IsChangedAnything(this);" />' +
                '<input type="text" class="form-control required d-inline col-5" maxlength="2" id="txtMin" placeholder="MM" onkeyup="return isNumberKey(this,event);IsChangedAnything(this);" />' +
                '</div>' +
                '</div' +

                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                //End Left pane


                '<div class="w-100"></div>' +
                '<div class="col-12 col-sm-12">' +
                '<div class="card-body pl-5">' +
                '<div class="col-sm-12" id="dvLessonContentView" style="padding-left: 52px;"></div>' +
                '<div class="col-sm-12" id="dvLessonContentEdit" style="padding-left: 52px;"></div>' +


                '<div class="col-sm-12" id="dvContentContent" style="padding-left: 52px;">'+
                '<div class="form-group editor">'+
                '<a class="btn btn-outline blod black" style="display:none;" id="btnNewContent" onclick="AddNewContent(this);">Add New Content</a>'+
                '<a class="btn btn-outline blod black btnSpaceRight" style="display:none;" id="btnSaveContent" onclick="SaveContent(this);">Save Content</a>'+
                '<a class="btn btn-outline blod black btnSpaceRight" style="display:none;" id="btnCanelContent" onclick="ManageContent(\'editclear\');;">Cancel</a>'+                
                '</div>' +
                '</div>' +


                '<div class="col-sm-12" id="dvLessonResourceEdit"></div>' +
                '<div class="col-sm-12 d-flex justify-content-between align-items-center" id="dvLessonPassingPercentage">' +
                '<label>Quiz</label>' +
                '<div class="form-group mb-2 d-flex justify-content-end">' +
                '<label class="d-inline"><i class="fas fa-plus-circle"></i>Passing Percentage</label>' +
                '<input type="text" class="form-control required d-inline col-3" maxlength="5" id="txtPassingScorePercentage" placeholder="100" ' +
                'onkeyup="IsChangedAnything(this);return isNumberKey(this,event); " />' +
                '</div>' +
                '</div>' +
                '<div class="col-sm-12" id="dvLessonQuizView">' +
                '</div>' +
                '<div class="col-sm-12 edit" id="dvLessonQuizEdit"></div>' +
                '<div class="col-sm-12 quiz-wrapper" id="dvQuestionView">' +
                '</div>' +

                '<div class="col-sm-12 quiz-wrapper" id="dvLessonQues">' +
                '</div>' +

                '<div class="col-sm-12 mb-4" id="divQuestionType">' + divQuestionType +
                '</div>' +
                '</div>' +
                '</div>' +

                '<div class="w-100"></div>' +
                '<div class="action-btn" id="divAddContent">' +
                //'<a class="btn btn-outline blod black" id="btnAddContent"  name="btnAddContent" onclick="ManageContent(\'editbind\',\'\',\'addnew\');"><i class="fas fa-plus-circle"></i>Add New Content</a>' +
                '<a class="btn btn-outline blod black float-right btnSpaceLeft" id="btnSaveLesson" onclick="AddLessonWithOthers(this);">Save</a>'+
                '<a class="btn btn-outline blod black float-right btnSpaceLeft" id="btnCancelLesson" onclick="ClearNewLesson();">Cancel</a>'+                
                '</div>' +
                '</div>';


            if (id != undefined && id != '' && id != '0') {
                var allLessonGrid = $("div[id^='tempLessonGrid_']");
                if (allLessonGrid.length > 0) {
                    for (var i = 0; i < allLessonGrid.length; i++) {
                        if (allLessonGrid[i].id != 'tempLessonGrid_' + id) {
                            $('#' + allLessonGrid[i].id).remove();
                        }
                    }
                }

                if ($('#tempLessonGrid_' + id).length) {
                    $('#tempLessonGrid_' + id).remove();
                    $('#dvLessonGrid_' + id).append(dvLessonViewParentEdit);
                }
                else {
                    $('#dvLessonGrid_' + id).append(dvLessonViewParentEdit);
                }

                $('#btnAddMoreLesson').show();
                //$('#btnCancelLesson').hide();

                $('#btnNewContent').show();
                $('#btnSaveContent').hide();
                $('#btnCanelContent').hide();
            }
            else {
                var allLessonGrid = $("div[id^='tempLessonGrid_']");
                if (allLessonGrid.length > 0) {
                    for (var i = 0; i < allLessonGrid.length; i++) {
                        $('#' + allLessonGrid[i].id).remove();
                    }
                }

                $('#dvLessonViewParentEdit').show();
                $('#dvLessonViewParentEdit').empty().append(dvLessonViewParentEdit);

                ManageResource('editbind');
                ManageQuiz('editbind');

                $('#btnAddMoreLesson').hide();
                //$('#btnCancelLesson').show();

                $('#btnNewContent').hide();
                $('#btnSaveContent').show();
                $('#btnCanelContent').show();
            }

            ManageLesson('editbind');
            ManageContent('editbind');
            inputInline();

            //This is added after rendering controls otherwise onkeyup event won't work
            $("#divResourceSummary").keyup(function(){      
                debugger
                IsChangedField = '1';
            });
            $("#divContentSummary").keyup(function(){            
                debugger
                IsChangedField = '1';
            });
        }

        function ClearNewLesson() {
            debugger
            if(IsChangedField == '0')
            {
                $("div[id^='tempLessonGrid_']").remove();
                $('#btnAddMoreLesson').show();
            }
            else
            {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to discard this lesson ? Yes or No !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, clear it!'
                }).then((result) => {
                    if (result.value) {
                        debugger
                        $("div[id^='tempLessonGrid_']").remove();                    

                        //if($('#btnEditLesson_'+LessonFlag).hasClass('fa-chevron-down'))
                        //{
                        //    $('#btnEditLesson_'+LessonFlag).removeClass('fa-chevron-down');
                        //    $('#btnEditLesson_'+LessonFlag).addClass('fa-chevron-up');
                        //}
                        //else
                        //{
                        //    $('#btnEditLesson_'+LessonFlag).removeClass('fa-chevron-up');
                        //    $('#btnEditLesson_'+LessonFlag).addClass('fa-chevron-down');
                        //}

                        $('#btnAddMoreLesson').show();
                        IsChangedField = '0';
                    }
                });
            }
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
            debugger
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
                        debugger
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                var LessonTable = DataSet.Data;                                
                                $('#divLessonMain').show();

                                var Lesson = '';
                                if (LessonTable != undefined && LessonTable.length > 0) {
                                    for (var i = 0; i < LessonTable.length; i++) {

                                        Lesson = Lesson + '<div class="card mb-4" id="dvLessonGrid_' + LessonTable[i].ModuleID + '" >' +
                                            '<div class="tag lesson">Lesson ' + (i + 1) + '</div>' +
                                            '<div class="card-header">' +
                                            '<h5><i class="fas fa-grip-vertical"></i>' + LessonTable[i].Title + '</h5>' +
                                            '<div class="card-header-action">' +
                                            '<a><i class="fas fa-chevron-down" id="btnEditLesson_' + LessonTable[i].ModuleID + '" onclick="EditLessionFromTile(this,' + LessonTable[i].ModuleID + ')";></i></a>' +
                                            '</div>' +
                                            '</div>' +
                                            '<span style="display:none;" id="spTitle">' + LessonTable[i].Title + '</span>' +
                                            '<span style="display:none;" id="spOverview">' + LessonTable[i].Overview + '</span>' +
                                            '<span style="display:none;" id="spCourseTime">' + LessonTable[i].CourseTime + '</span>' +
                                            '<span style="display:none;" id="spPoints">' + LessonTable[i].Points + '</span>' +
                                            '<div id="collapseLession' + LessonTable[i].ModuleID + '" class="collapse"></div></div>';

                                    }

                                    $('#dvLessonViewParentView').empty().append(Lesson);
                                    $('#dvLessonViewParentEdit').empty();


                                    $('#savereorder').show();
                                    $('#btnAddMoreLesson').show();
                                }
                                else {
                                    $('#savereorder').hide();
                                    AddMoreLesson('0');
                                }
                                debugger
                                if(flag== "addcontentandlesson")
                                {
                                    $("#btnEditLesson_"+tmpLessonId).click();
                                }
                            }
                            else {
                                //Swal.fire({ title: "Failure", text: DataSet.StatusDescription, icon: "error" });
                                //Swal.fire(DataSet.StatusDescription, { icon: "error" });//Commented on 20 JUN 20
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

        function AddLession(flag, type) {

            if(flag != 'withquiz')
            {
                ShowLoader();
            }           
            
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
                            debugger
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {

                                    if (flag.includes('lastsave')) {
                                        HideLoader();
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        //save all details
                                        if (type == 'addnew') {
                                            AddContent(flag);
                                            AddResource(flag);
                                            AddQuiz(flag);
                                        }

                                        if (flag == 'lastsavelesson') {
                                            Swal.fire({
                                                title: "Success",
                                                text: 'Lesson details added successfully.',
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    BindLessonGrid(flag);
                                                }
                                            });
                                        }
                                    }
                                    else if (flag == 'addcontent') {
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        BindLessonGrid(flag);//Need to enable this
                                        AddContent(flag);
                                    }
                                    else if (flag == 'addcontentandlesson') {
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        tmpLessonId = LessonFlag;

                                        AddContent(flag);                                        
                                    }
                                    else if (flag == 'withquiz') {
                                        if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                            LessonFlag = DataSet.Data[0].InsertedID;
                                        }

                                        if($('#txtQuizTitle').val() != undefined)
                                        {
                                            AddQuiz('');
                                        }
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

        //Marked as not in use
        function LessonCancel() {
            $('#txtHour').val('');
            $('#txtMin').val('');
            $('#txtPoint').val('');
            ManageLesson('editclear');
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
                    debugger
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
                                    debugger
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

            debugger
            tmpLessonId = '0';
            
            if ($('#tempLessonGrid_' + id).length) {

                if(IsChangedField != '0')
                {
                    Swal.fire({
                        title: 'Are you sure?',
                        text: "Do you want to discard this lesson ? Yes or No !",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, clear it!'
                    }).then((result) => {
                        if (result.value) {
                            debugger
                            $('#tempLessonGrid_' + id).remove();
                            IsChangedField = '0';
                        }
                    });
                }
                else
                {
                    $('#tempLessonGrid_' + id).remove();
                }                
                return false;
            }

            AddMoreLesson(id);

            var _Title = $(obj).parent().parent().parent().parent().find('#spTitle').text();
            var _Overview = $(obj).parent().parent().parent().parent().find('#spOverview').text();
            var _CourseTime = $(obj).parent().parent().parent().parent().find('#spCourseTime').text();
            var _Points = $(obj).parent().parent().parent().parent().find('#spPoints').text();

            LessonFlag = id;
            ContentFlag = '0';

            BindLessonInSubTile(id, _Title, _Overview, _CourseTime, _Points);
            BindContentGrid('');
            BindResourceGrid('');
            BindQuizGrid('');
        }


        //Marked as not in use
        function BindLessonInSubTile(id, _Title, _Overview, _CourseTime, _Points) {
            debugger
            var Lesson = '';

            Lesson = Lesson + '<div class="accordion">' +
                '<div class="card">' +
                '<div class="card-header" id="headingLesson">' +
                '<h5 id="hdgLessonTitle">' + _Title + '</h5>' +


                '<span style="display:none;" id="spSubTitle">' + _Title + '</span>' +
                '<span style="display:none;" id="spSubOverview">' + _Overview + '</span>' +
                '<span style="display:none;" id="spSubCourseTime">' + _CourseTime + '</span>' +
                '<span style="display:none;" id="spSubPoints">' + _Points + '</span>' +



                '<i style="display:none;" class="fas fa-edit" title="Edit" onclick="EditLessonFromSubTile(this,' + id + ')";></i>' +

                '<a data-toggle="collapse" data-target="#collapseLesson" aria-expanded="false" aria-controls="collapseLesson" class="collapsed"  onclick="EditLessonFromSubTile(this,' + id + ')";>' +
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

            if (_CourseTime != undefined && _CourseTime != '' && _CourseTime.split(":").length > 0
            ) {
                $('#txtHour').val(_CourseTime.split(":")[0]);
                if (_CourseTime.split(":").length > 1) {
                    $('#txtMin').val(_CourseTime.split(":")[1]);
                }
            }
            else {
                $('#txtHour').val('');
                $('#txtMin').val('');
            }

            $('#txtPoint').val(_Points);
        }

        //Marked as not in use
        function EditLessonFromSubTile(obj, id) {
            debugger
            ManageLesson('editbind', 'editfromgrid');

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

            debugger
            var LastSaveFlag = '';

            if ($('#txtLessonTitle').val() != undefined) {
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
                LastSaveFlag = 'lastsavelesson';
            }
            if ($('#txtContentHeader').val() != undefined) {
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
                LastSaveFlag = 'lastsavecontent';
            }
            if ($('#txtResourcesDescription').val() != undefined) {
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
                LastSaveFlag = 'lastsaveresource';
            }
            if ($('#txtQuizTitle').val() != undefined) {
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
                LastSaveFlag = 'lastsavequiz';
            }

            if (LessonFlag != '0') {
                if ($('#txtLessonTitle').val() != undefined) {
                    AddLession(LastSaveFlag);
                }
                if ($('#txtContentHeader').val() != undefined) {
                    AddContent(LastSaveFlag);
                }
                if ($('#txtResourcesDescription').val() != undefined) {
                    AddResource(LastSaveFlag);
                }
                if ($('#txtQuizTitle').val() != undefined) {
                    AddQuiz(LastSaveFlag);
                }
            }
            else {
                AddLession(LastSaveFlag, 'addnew');
            }
        }



        //Content
        function AddNewContent(obj)
        {
            debugger
            ManageContent('editbind','','addnew');    

            //if($("#txtContentHeader").val() == undefined)
            //{
            //    ManageContent('editbind','','addnew');    
            //}
            //else
            //{
            //    AddContent('addcontent');
            //}
        }

        function SaveContent(obj)
        {
            var flag = 'addcontent';

            if(LessonFlag == '0')
            {
                if ($('#txtLessonTitle').val() != undefined) {
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
                }
                if ($('#txtContentHeader').val() != undefined) {
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
                }
                flag = 'addcontentandlesson';
                AddLession(flag);
            }
            else
            {
                var resultContent = validateAddContent('onlycontent');
                if (resultContent.error) {
                    Swal.fire({
                        title: "Alert",
                        text: resultContent.msg,
                        icon: "error",
                        button: "Ok",
                    });
                    return false;
                }
                else
                {
                    AddContent(flag);
                }
            }
        }

        function ManageContent(flag, contentId, source) {
            if (flag == 'editbind') {
                // Clear all open fields for content               
                if (source != undefined && source != '' && source == 'editfromgrid') {
                    $('#dvLessonContentEdit').empty();
                    $("[id^='divContentDescription_']").html("");
                    $('#divContentDescription_' + contentId).empty().append(dvLessonContentEdit);
                }
                else {
                    //This is collapse all content accordion
                    var allContentList = $("div[id^='collapseLessonContent']");
                    if (allContentList.length > 0) {
                        for (var i = 0; i < allContentList.length; i++) {
                            $('#' + allContentList[i].id).removeClass('show');
                        }
                    }
                    //End This is collapse all content accordion

                    ContentFlag = '0';//clear content because this div will be bind while new content creation
                    $("[id^='divContentDescription_']").empty();//to remove edit fields under accordion
                    $('#dvLessonContentEdit').empty().append(dvLessonContentEdit);                    
                }
                editorContentDescription = new Jodit('#txtContentDescription');

                $('#btnNewContent').hide();
                $('#btnSaveContent').show();
                $('#btnCanelContent').show();
            }
            else if (flag == 'editclear') {
                $('#dvLessonContentEdit').empty();

                $('#btnNewContent').show();
                $('#btnSaveContent').hide();
                $('#btnCanelContent').hide();
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
            else if (flag == 'withcontent' && CourseFlag == '0') {
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
                        debugger
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {

                                var ContentTable = DataSet.Data;
                                var Content = '';
                                if (ContentTable.length > 0) {
                                    for (var i = 0; i < ContentTable.length; i++) {
                                        Content = Content + '' +
                                            '<div class="card">' +
                                            '<div class="tag content">Content ' + (i + 1) + '</div>' +
                                            '<div class="card-header" id="headingLessonContent' + ContentTable[i].ContentID + '">' +
                                            '<h5 id="hdgContentTitle">' + ContentTable[i].Title + '</h5>' +
                                            '<span style="display:none;" id="spContentDescription_' + ContentTable[i].ContentID + '">' + ContentTable[i].Description + '</span>' +
                                            '<div class="card-header-action">' +
                                            '<a title="Delete" onclick="DeleteContentFromTile(this,' + ContentTable[i].ContentID + ')";><i class="fas fa-trash-alt"></i></a>' +
                                            '<a style="display:none;" title="Edit" onclick="EditContentFromTile(this,' + ContentTable[i].ContentID + ')";><i class="fas fa-edit"></i></a>' +

                                            '<a data-toggle="collapse" data-target="#collapseLessonContent_' + ContentTable[i].ContentID + '" aria-expanded="false" aria-controls="collapseLessonContent_' + ContentTable[i].ContentID + '" class="collapsed" onclick="EditContentFromTile(this,' + ContentTable[i].ContentID + ')";>' +
                                            '</i><i class="fas fa-chevron-down"></i>' +
                                            '</a>' +
                                            '</div>' +
                                            '</div>' +
                                            '<div id="collapseLessonContent_' + ContentTable[i].ContentID + '" class="collapse" aria-labelledby="headingLessonContent' + ContentTable[i].ContentID + '">' +
                                            '<div class="card-body" id="divContentDescription_' + ContentTable[i].ContentID + '">' + ContentTable[i].Description +
                                            '</div>' +
                                            '</div>' +
                                            '</div>';
                                    }
                                    $('#dvLessonContentView').empty().append(Content);

                                    if(flag == 'addcontent')
                                    {
                                        ManageContent('editbind');
                                    }
                                    else
                                    {
                                        ManageContent('editclear');
                                    }
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
            debugger
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
                        debugger
                        var DataSet = $.parseJSON(response);
                        if (DataSet != null && DataSet != "") {
                            if (DataSet.StatusCode == "1") {
                                HideLoader();

                                if (flag.includes('lastsave')) {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    if (flag == 'lastsavecontent') {
                                        Swal.fire({
                                            title: "Success",
                                            text: 'Lesson details added successfully.',
                                            icon: "success"
                                        }).then((value) => {
                                            if (value) {
                                                BindLessonGrid(flag);
                                            }
                                        });
                                    }
                                }
                                else if (flag == 'addcontent') {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    ContentFlag = '0';
                                    BindContentGrid(flag);

                                    Swal.fire({
                                        title: "Success",
                                        text: DataSet.Data[0].ReturnMessage,
                                        icon: "success"
                                    });                                    
                                }
                                else if (flag == 'addcontentandlesson') {
                                    HideLoader();
                                    if (DataSet.Data[0].InsertedID != null && DataSet.Data[0].InsertedID != undefined && DataSet.Data[0].InsertedID != '') {
                                        ContentFlag = DataSet.Data[0].InsertedID;
                                    }

                                    ContentFlag = '0';
                                    BindLessonGrid(flag);                                    

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

        function ContentCancel() {
            ManageContent('editclear');
        }

        function EditContentFromTile(obj, id) {
            debugger

            var ContentHeader = $(obj).parent().parent().find('#hdgContentTitle').text();
            var ContentDescription = $(obj).parent().parent().find('#spContentDescription_' + id).text();

            ManageContent('editbind', id, 'editfromgrid');

            $('#txtContentHeader').val(ContentHeader);
            editorContentDescription.value = ContentDescription;

            ContentFlag = id;


            //Added to collapse other content accordion
            var allContentList = $("div[id^='collapseLessonContent']");
            if (allContentList.length > 0) {
                for (var i = 0; i < allContentList.length; i++) {
                    if (allContentList[i].id != 'collapseLessonContent_' + id) {
                        $('#' + allContentList[i].id).removeClass('show');
                    }
                }
            }
            //End //Added to collapse other content accordion
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
            debugger
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

                                    /*
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
                                    */
                                    ManageResource('editbind');
                                    if(DataSet.Data.Data[0].Resource == null || DataSet.Data.Data[0].Resource == undefined)
                                    {
                                        editorResourcesDescription.value = '';
                                    }
                                    else
                                    {
                                        editorResourcesDescription.value = DataSet.Data.Data[0].Resource;
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
                                    
                                    if (flag.includes('lastsave')) {
                                        HideLoader();
                                        ResourceFlag = LessonFlag;

                                        if (flag == 'lastsaveresource') {
                                            Swal.fire({
                                                title: "Success",
                                                text: 'Lesson details added successfully.',
                                                icon: "success"
                                            }).then((value) => {
                                                if (value) {
                                                    BindLessonGrid('');
                                                }
                                            });
                                        }
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

        function ResourceCancel() {
            ManageResource('editclear');
        }

        function EditResourceFromTile(obj, id) {
            debugger
            ManageResource('editbind');
            editorResourcesDescription.value = $(obj).parent().parent().find('#divResourceDescription').text();
            $('#btnAddResource').show();
            ResourceFlag = id;
        }


        //Quiz
        function ManageQuiz(flag, source) {
            if (flag == 'editbind') {

                if (source != undefined && source != '' && source == 'editfromgrid') {
                    $('#divQuizDescription').empty().append(dvLessonQuizEdit);
                }
                else {
                    $('#dvLessonQuizEdit').empty().append(dvLessonQuizEdit);
                }
            }
            else if (flag == 'editclear') {
                $('#dvLessonQuizEdit').empty();
            }
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
                                    debugger

                                    QuizFlag = DataSet.Data[0].ContentID;

                                    var Quiz = '' +
                                        '<div class="card">' +
                                        '<div class="card-header" id="headingLessonQuiz">' +

                                        '<h5 id="hdgQuizTitle">' + DataSet.Data[0].Title + '</h5>' +
                                        '<span style="display:none;" id="spQuizDescription">' + DataSet.Data[0].Description + '</span>' +
                                        '<span style="display:none;" id="spPassingPercent">' + DataSet.Data[0].PassingPercent + '</span>' +

                                        //'<i class="fas fa-edit" title="Edit"  onclick="EditQuizFromTile(this,' + DataSet.Data[0].ContentID + ')";></i>' +

                                        '<a data-toggle="collapse" data-target="#collapseLessonQuiz" aria-expanded="false" aria-controls="collapseLessonQuiz" class="collapsed">' +
                                        '<i class="fas fa-chevron-down" onclick="EditQuizFromTile(this,' + DataSet.Data[0].ContentID + ')";></i>' +
                                        '</a>' +
                                        '</div>' +
                                        '<div id="collapseLessonQuiz" class="collapse" aria-labelledby="headingLessonQuiz">' +
                                        '<div class="card-body" id="divQuizDescription">' + DataSet.Data[0].Description +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '';

                                    $('#txtPassingScorePercentage').val(DataSet.Data[0].PassingPercent);

                                    $('#dvLessonQuizView').empty().append(Quiz);
                                    $('#btnAddQuiz').hide();

                                    ManageQuiz('editclear');



                                    Questions = DataSet.Data[0].Questions;
                                    BindQuestion('', Questions);

                                    //$('#divQuestionType').empty().append(divQuestionType);
                                }
                                else
                                {
                                    ManageQuiz('editbind');
                                    //$('#divQuestionType').empty().append(divQuestionType);
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
            debugger
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
                        
                        if (flag.includes('lastsave')) {
                            HideLoader();

                            if (flag == 'lastsavequiz') {
                                Swal.fire({
                                    title: "Success",
                                    text: 'Lesson details added successfully.',
                                    icon: "success"
                                }).then((value) => {
                                    if (value) {
                                        BindLessonGrid(flag);
                                    }
                                });
                            }
                        }                        
                    }
                });
            }
            catch (e) {
                HideLoader();
                Swal.fire({ title: "Alert", text: "Oops! An Occured. Please try again", icon: "error" });
            }
        }

        function QuizCancel() {
            $('#txtPassingScorePercentage').val('');
            ManageQuiz('editclear');
        }

        function EditQuizFromTile(obj, id) {
            debugger

            ManageQuiz('editbind', 'editfromgrid');
            $('#txtQuizTitle').val($(obj).parent().parent().find('#hdgQuizTitle').text());
            $('#txtQuizDescription').val($(obj).parent().parent().find('#spQuizDescription').text());
            $('#txtPassingScorePercentage').val($(obj).parent().parent().find('#spPassingPercent').text());
            $('#btnAddQuiz').show();
            QuizFlag = id;
        }


        //Question
        function BindQuestion(flag, Questions, ) {
            debugger
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
                       
                        '<div class="card-header p-0">' +
                        '<div class="d-flex align-items-center ques">' +
                        '<a class="sr head" onclick="ShowQuestionInEditMode(this,' + Questions[i].QuestionID + ',' + (i + 1) +')";>' +
                        'Q' + (i + 1) + '<i class="' + className + ' m-0 ml-2"></i><i class="fas fa-caret-down m-0 ml-1"></i></a>' +
                        '<h5 class="ml-3 mr-5">' + Questions[i].Title + '</h5></div>' +

                        '<a title="Delete" class="p-2 align-self-center" onclick="DeleteQuestion(this,' + Questions[i].QuestionID + ')";><i class="fas fa-trash-alt"></i></a>' +
                        '</div>' +




                        //'<div class="card-header" id="headingQuestion">' +
                        //'<span class="sr">Q' + (i + 1) + '<i class="' + className + '"></i><i class="fas fa-caret-down"></i></span>' +
                        //'<h5>' + Questions[i].Title + '</h5>' +
                        //'<i class="fas fa-trash-alt" title="Delete" onclick="DeleteQuestion(this,' + Questions[i].QuestionID + ')";></i>' +
                        //'<i class="fas fa-chevron-down" title="Edit"  onclick="ShowQuestionInEditMode(this,' + Questions[i].QuestionID + ','+ (i + 1) +')";></i>' +
                        //'</div>' +
                        '</div>' +
                        '<div id="dvLessonQues' + Questions[i].QuestionID + '"></div>';
                }
                $('#dvQuestionView').empty().append(QuestionString);
            }
        }

        var className = '';
        var AnswerTypeCode = '';
        function ShowQuestion(cls, flag, QuestionAnswer, questionSrNo) {
            debugger

            if($('#txtLessonTitle').val() != undefined)
            {
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
            }
            if($('#txtQuizTitle').val() != undefined)
            {
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
            }
            if($('#txtLessonTitle').val() != undefined)
            {
                AddLession('withquiz');
            }            
            else if($('#txtQuizTitle').val() != undefined)
            {
                AddQuiz('');
            }
            

            var allLessonGrid = $("div[id^='dvLessonQues']");
            if (allLessonGrid.length > 0) {
                for (var i = 0; i < allLessonGrid.length; i++) {
                    $('#' + allLessonGrid[i].id).empty();
                }
            }

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

                var QuestionNumber = '1';
                if (Questions != undefined && Questions != '') {
                    QuestionNumber = (Questions.length + 1).toString();
                }


                var QuestionType = '<div class="quiz mb-4" id="dvQuestion">' +
                    '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<span class="sr">Q' + QuestionNumber + '<i class="' + className + '" id="QuestionTypeClass"></i><i class="fas fa-caret-down"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtQuestion" onkeyup="IsChangedAnything(this);" placeholder="Add Question Text" />' +
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
                    '<input type="text" class="form-control" id="txtAnswer" onkeyup="IsChangedAnything(this);" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
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
                    '<input type="text" class="form-control" id="txtAnswer" onkeyup="IsChangedAnything(this);" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3 col-md-2">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="false" onclick="changeAnsFlag(this)"></i></span>' +
                    '</div>' +

                    '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                    '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="row">' +
                    '<div class="col-sm-12 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtAnswer" onkeyup="IsChangedAnything(this);" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-3 col-md-2">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="false" onclick="changeAnsFlag(this)"></i></span>' +
                    '</div>' +
                    '</div>' +
                    '<div class="offset-1 offset-sm-1 col-sm-11 mt-2 mb-4">' +
                    '<a id="btnAddAnswer" onclick="AddAnswer()" class="btn btn-link"><i class="fas fa-plus-circle"></i>Add Answer Option</a>' +
                    '</div>' +
                    '</div>';

                $('#dvLessonQues').empty().append(QuestionType);

                var btnAddQuestion = '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
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

                if (questionSrNo == undefined || questionSrNo == '0') {
                    questionSrNo = '';
                }

                var AnswerID = '0';
                var QuestionType = '';

                QuestionType = '<div class="quiz mb-4" id="dvQuestion">' +
                    '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<span class="sr">Q' + questionSrNo + '<i class="' + className + '" id="QuestionTypeClass"></i><i class="fas fa-caret-down"></i></span>' +
                    '<div class="col-sm-8 col-md-10">' +
                    '<div class="form-group">' +
                    '<input type="text" class="form-control" id="txtQuestion" onkeyup="IsChangedAnything(this);" placeholder="Add Question Text" value="' + QuestionAnswer[0].Title + '"/>' +
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
                        '<input type="text" class="form-control" id="txtAnswer" onkeyup="IsChangedAnything(this);" answerid="' + QuestionAnswer[i].AnswerID + '" value="' + QuestionAnswer[i].AnswerText + '" placeholder="Answer Option" />' +
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

                $('#dvLessonQues' + gbl_QuestionID).empty().append(QuestionType);

                var btnAddQuestion = '<div class="col-sm-12 mt-3 mb-3 d-flex justify-content-between align-items-center ques">' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestion" onclick="AddQuestion(this,\'2\');"><i class="fas fa-plus-circle"></i>Add Question</a>' +
                    '<a class="btn btn-outline blod black" id="btnAddQuestionCancel" onclick="AddQuestionCancel(this);">Cancel</a>' +
                    '</div>';

                $('#dvQuestion').append(btnAddQuestion);
            }

            //$('#btnQuestionDone').show();//This need to be show as per previous design
        }

        function AddQuestionCancel(obj) {
            debugger
            if(IsChangedInQuizField != '0')
            {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to discard this question ? Yes or No !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, clear it!'
                }).then((result) => {
                    if (result.value) {
                        debugger
                        $(obj).closest("div[id^='dvLessonQues']").empty();
                        IsChangedInQuizField = '0';
                    }
                });
            }
            else
            {
                $(obj).closest("div[id^='dvLessonQues']").empty();
            }
        }

        function AddAnswer() {
            debugger
            var AnswerID = '0';

            var addAns = '<div class="offset-1 offset-sm-1 col-sm-11 mb-2 d-flex justify-content-between align-items-center ans">' +
                '<span class="block"><i class="fas fa-grip-vertical grid-icon"></i><i class="' + className + '"></i></span>' +
                '<div class="col-sm-8 col-md-10">' +
                '    <div class="row">' +
                '        <div class="col-sm-12 col-md-10">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" id="txtAnswer" onkeyup="IsChangedAnything(this);" answerid="' + AnswerID + '" placeholder="Answer Option" />' +
                '            </div>' +
                '        </div>' +
                '        <div class="col-sm-3 col-md-2">' +
                '            <div class="form-group">' +
                '                <input type="text" class="form-control" id="txtScore" placeholder="Assign Score" />' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>' +
                '<span class="checked-icon"><i class="fa fa-times-circle fa-w-16 wrong fal" id="ansFlag" value="false" onclick="changeAnsFlag(this)"></i></span>' +
                '<span class="checked-icon delete"><i class="fa fa-trash-alt" onclick="DeleteAnsOption(this)"></i></span>' +
                '</div>';

            $('#divAnswer').append(addAns);
        }

        function DeleteAnsOption(cntrl) {
            debugger
            $(cntrl).parent().parent().remove();

            var AnsID = $(cntrl).parent().parent().find('#txtAnswer').attr('answerid');
            if (AnsID != undefined && AnsID != '' && AnsID != '0') {
                var requestParams = { "AnswerID": AnsID, "IsActive": 0 };
                var getUrl = "/API/Quiz/DeleteAnswer";

                try {
                    $.ajax({
                        type: "POST",
                        url: getUrl,
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: JSON.stringify(requestParams),
                        contentType: "application/json",
                        success: function (response) {
                            try {
                                debugger
                                var DataSet = $.parseJSON(response);
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
            debugger
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
            debugger

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

        function ShowQuestionInEditMode(obj, questionId, questionSrNo) {

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
                                    debugger
                                    var QuestionAnswer = DataSet.Data.Data;
                                    if (QuestionAnswer.length > 0) {
                                        gbl_QuestionID = questionId;
                                        ShowQuestion('', 'edit', QuestionAnswer, questionSrNo);
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

                                            IsCoursePublishable();

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
            debugger
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
                    else if (flag == 'txtPassingScorePercentage') {
                        var PassingPercent = $('#' + flag).val();
                        if (PassingPercent != undefined && PassingPercent != '' && parseInt(PassingPercent) > 100) {
                            $('#' + flag).val('');
                            Swal.fire({ title: "Failure", text: "! Passing percentage cannot exceed 100.", icon: "error" });
                        }
                    }
                    else {
                        result = true;
                    }
                }
                else if (charCode == 8 || charCode == 9 || charCode == 13 || charCode == 90) {//this is for some basic key like 90-Ctrl+Z , 9-Tab ,8-Backspace

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

            debugger
            if(IsChangedField != '0')
            {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to discard this lesson ? Yes or No !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, clear it!'
                }).then((result) => {
                    debugger
                    if (result.value) {          
                        IsChangedField = '0';
                        PublishCourseMain(flag);
                    }                
                });
            }
            else
            {
                PublishCourseMain(flag);
            }
        }

        function PublishCourseMain(flag)
        {
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
                $("#btnPublish").show();
                $("#btnDiscard").hide();
            }
            else if (IsPublished == 0 && IsPublishable == 1) {
                $("#btnPublish").show();
                $("#btnDiscard").show();
            }
            else {
                $("#btnPublish").hide();
                $("#btnDiscard").show();
            }
            //if (IsPublished == 1)
            //    $("#dvPublishCourse").show();
        }

        var IsChangedField = '0';
        var IsChangedInQuizField = '0';
        function IsChangedAnything(obj)
        {
            debugger
            var id = $(obj).attr('id');
            if(id == 'txtQuestion' || id == 'txtAnswer' || id == 'txtScore')
            {
                IsChangedInQuizField = '1';
            }

            IsChangedField = '1';
        }


        function SaveLessonOrder()
        {
            debugger
            ShowLoader();
            var sqnData = "";
            var array = [];
            var url = "/API/Content/ReOrderContent";

            var allLessonGrid = $("div[id^='dvLessonGrid_']");
            for(var i = 0; i < allLessonGrid.length; i++)
            {
                sqnData += allLessonGrid[i].id.split('_')[1] + ",";
            }
            
            sqnData = sqnData.replace(/,(?=\s*$)/, '');
            if (sqnData != "") {
                var requestParams = { Type: "2", IDs: sqnData };
                $.ajax({
                    type: "POST",
                    url: url,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    processData: false,
                    success: function (response) {
                        debugger

                        HideLoader();
                        if (response != null && response != undefined) 
                        {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    if (DataSet.Data.length > 0) 
                                    {
                                        $('#savereorder').show();

                                        Swal.fire({
                                            title: "Success",
                                            text: "Lesson re-ordered successfully.",
                                            icon: "success"
                                        });
                                        BindLessonGrid('');
                                    }
                                    else {
                                        Swal.fire({
                                            title: "Failure",
                                            text: "Please try Again",
                                            icon: "error"
                                        });
                                    }
                                }
                                else {
                                    Swal.fire({
                                        title: "Failure",
                                        text: DataSet.Data.ReturnMessage,
                                        icon: "error"
                                    });
                                }
                            }
                            else {
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error"
                                });
                            }
                        }
                    },
                    complete: function () {
                        HideLoader();
                    }
                });
            }
            else {
                Swal.fire({
                    title: "Failure",
                    text: "Please try Again",
                    icon: "error"
                });

            }
        }

    </script>
</asp:Content>