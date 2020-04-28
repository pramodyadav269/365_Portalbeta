<%@ Page Title="Topics" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="_365_Portal.Admin.Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12 header mb-5">
            <a class="back" href="dashboard.aspx"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
            <h2 class="text-center font-weight-bold">Courses</h2>
        </div>

        <div class="col-md-12" id="divGird">
            <div class="card shadow border-0 border-radius-0">
                <div class="card-body">
                    <a class="btn bg-yellow float-left " onclick="AddNew();" style="display:none;">Add New</a> 
                    <a class="btn bg-blue text-white float-right" style="display:none;" id="savereorder" onclick="SaveGrid();">Save Reordering</a>

                    <a onclick="ArchiveUnArchiveTopic(0);" id="btnArchive" style="display:none;"><i class="fas fa-trash-alt"></i>Archive</a>
                    <a onclick="ArchiveUnArchiveTopic(1);" id="btnUnArchive" style="display:none;"><i class="fas fa-trash-alt"></i>Un-Archive</a> 

                    <div class="w-100"></div>
                    <div id="divTable" class="mt-5 table-responsive"></div>
                </div>
            </div>
        </div>

        <div class="col-md-12 d-none" id="divForm"> 
            <div class="card shadow border-0 border-radius-0">
                <div class="card-body">

                    <div class="row input-validation">

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtTitle">Course Name</label>
                                <input type="text" class="form-control required" id="txtTitle" maxlength="50" placeholder="Course Name" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtDescription">Course Summary</label>
                                <textarea class="form-control required" placeholder="Course Summary" id="txtDescription"></textarea>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlCourseCategory">Course Category</label>
                                <select class="form-control required select2" id="ddlCourseCategory" style="width: 100% !important">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtCategoryColor">Category Color</label>
                                <input type="text" class="form-control required" id="txtCategoryColor" placeholder="Category Color" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtPoints">Points</label>
                                <input type="text" class="form-control required" id="txtPoints"  placeholder="Points" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtCourseTime">Course Time</label>
                                <input type="text" class="form-control required" id="txtCourseTime" placeholder="Course Time" />
                            </div>
                        </div>



                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlAchievementBadge">Achievement Badge</label>
                                <select class="form-control required select2" id="ddlAchievementBadge" style="width: 100% !important">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlAccessibility">Accessibility</label>
                                <select class="form-control required select2" id="ddlAccessibility" style="width: 100% !important">
                                    <option></option>
                                    <option value="1">Global</option>
                                    <option value="2">Organization</option>
                                    <option value="3">Assigned</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-9">
                            <div class="form-group">
                                <label for="ddlTags">Tags</label>
                                <select class="form-control select2 required" id="ddlTags" style="width: 100% !important" multiple>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <img class="circle user-photo" id="imgCourseLogo" src="../includes/Asset/images/CourseLogo.png" />
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="fileCourseLogo" onchange="encodeImagetoBase64(this,'CourseLogo')">
                                <label class="custom-file-label mt-2" for="fileCourseLogo">Course Logo</label><br />
                                <br />
                            </div>
                        </div>




                        <div class="col-md-3">
                            <div class="form-group checkbox ">
                                <label>Is Published</label>
                                <div class="custom-control custom-checkbox custom-control-inline">
                                    <input type="checkbox" id="cbIsPublished" name="cgIsPublished" class="custom-control-input">
                                    <label class="custom-control-label" for="cbIsPublished">Yes</label>
                                </div>
                            </div>
                        </div>

                        <div class="w-100"></div>

                        <div class="col-md-12 mt-4">
                            <a class="btn bg-yellow float-left" id="back" onclick="toggle('divGird', 'divForm')">Back</a>
                            <a class="btn bg-yellow float-right" id="submit" onclick="Submit();">Submit</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        var accessToken = '<%=Session["access_token"]%>';
        var id;

        $(document).ready(function () {
            //var s; $('#tblGird').find('tr').each(function i(i, index) { if (this.id != "") { s = s + this.id + ','; } console.log(this.id); }); console.log(s.length);
            View();
            GetCourseCategoryTagsAndBadge('view', 0, 0, 0);
        });

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
                        if (DataSet.StatusCode == "1")
                        {
                            var Tags = DataSet.Data.Tag;
                            var AchievementBadge = DataSet.Data.AchievementBadge;
                            var CourseCategory = DataSet.Data.CourseCategory;

                            if (Tags != undefined && Tags.length > 0)
                            {
                                $('#ddlTags').empty().append('<option></option>');
                                for (var i = 0; i < Tags.length; i++) {
                                    $('#ddlTags').append('<option value="' + Tags[i].TagID + '">' + Tags[i].TagName + '</option>');
                                }
                                selectInit('#ddlTags', 'Select Tag');
                            }
                            if (AchievementBadge != undefined && AchievementBadge.length > 0)
                            {
                                $('#ddlAchievementBadge').empty().append('<option></option>');
                                for (var i = 0; i < AchievementBadge.length; i++) {
                                    $('#ddlAchievementBadge').append('<option value="' + AchievementBadge[i].BadgeID + '">' + AchievementBadge[i].BadgeName + '</option>');
                                }
                                selectInit('#ddlAchievementBadge', 'Select Achievement Badge');
                            }
                            if (CourseCategory != undefined && CourseCategory.length > 0)
                            {
                                $('#ddlCourseCategory').empty().append('<option></option>');
                                for (var i = 0; i < CourseCategory.length; i++) {
                                    $('#ddlCourseCategory').append('<option value="' + CourseCategory[i].CategoryID + '">' + CourseCategory[i].Title + '</option>');
                                }
                                selectInit('#ddlCourseCategory', 'Select Course Category');
                            }
                            if (flag == 'update') {
                                debugger
                                $('#ddlCourseCategory').val(CourseCategoryID).trigger('change');                                
                                $('#ddlAchievementBadge').val(AchievementBadgeID).trigger('change');

                                if (TagID != undefined)
                                {
                                    for (i = 0; i < 1; i++)
                                    {
                                        if (TagID.includes(',,'))
                                        {
                                            TagID = TagID.replace(",,", ",");
                                            if (TagID.includes(',,'))
                                            {
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
        
        function AddNew() {

            clearFields('.input-validation')
            toggle('divForm', 'divGird')
            $('#submit').attr('name', INSERT);
            $('#submit').text('SUBMIT');
            $('#back').text('BACK');
            //Submit button name attribute changed to Insert;
        }

        function Submit() {
            debugger
            var getUrl;
            var requestParams;
            ShowLoader();
            if (inputValidation('.input-validation')) {
                var _Topic_Id;
                var _SrNo = "1";
                var _Title = $('#txtTitle').val();
                var _Description = $('#txtDescription').val();
                var _IsPublished = $('#cbIsPublished').prop('checked');


                var _CourseCategory = $("#ddlCourseCategory option:selected").val();
                var _CategoryColor = $('#txtCategoryColor').val();
                var _Points = $('#txtPoints').val();
                var _CourseTime = $('#txtCourseTime').val();
                //var _IsGlobal = $('#cbIsGlobal').prop('checked');
                var _AchievementBadge = $("#ddlAchievementBadge option:selected").val();
                var _Accessibility = $("#ddlAccessibility option:selected").val();

                debugger
                var selectedTagsArray = $('#ddlTags').val();
                var _selectedTags = '';
                if (selectedTagsArray.length > 0)
                {
                    for (i = 0; i < selectedTagsArray.length; i++)
                    {
                        _selectedTags = _selectedTags + selectedTagsArray[i] + ',';
                    }
                    _selectedTags = _selectedTags.replace(/,\s*$/, "");
                }                

                if ($('#submit')[0].name == INSERT) {
                    getUrl = "/API/Content/CreateTopic";

                } else {
                    _Topic_Id = id;
                    getUrl = "/API/Content/ModifyTopic";
                }

                requestParams = { TopicID: _Topic_Id, TopicTitle: _Title, TopicDescription: _Description, IsPublished: _IsPublished, SrNo: _SrNo, MinUnlockedModules: "", UserID: "", IsActive: true, CourseCategory: _CourseCategory, CategoryColor: _CategoryColor, Points: _Points, CourseTime: _CourseTime, AchievementBadge: _AchievementBadge, Accessibility: _Accessibility, CourseLogoBase64: base64CourseLogo, selectedTags: _selectedTags };

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
                                    if (DataSet != null && DataSet != "") {
                                        if (DataSet.StatusCode == "1") {
                                            clearFields('.input-validation');
                                            HideLoader();
                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.StatusDescription,
                                                icon: "success"

                                            }).then((value) => {
                                                if (value) {
                                                    toggle('divGird', 'divForm');
                                                    View();
                                                }
                                            });

                                        }
                                        else {
                                            HideLoader();
                                            Swal.fire({
                                                title: "Failure",
                                                text: DataSet.StatusDescription,
                                                icon: "error"
                                            });
                                            //clearFields('.input-validation');
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
            else {
                HideLoader();
                Swal.fire({
                    title: "Alert",
                    text: "Fill all fields",
                    icon: "error"

                });
            }
        }

        function Edit_New(Topicid)
        {
            debugger
            document.location = 'LearningJourney.aspx?topic=' + Topicid;
        }

        function Edit(Topicid) {
            debugger
            id = Topicid;

            //$('#' + id).find("td:not(:last-child)").each(function (i, data) {
            //    if (this.className == 'title') {
            //        $('#txtTitle').val(this.innerText); ///This will find title for Topic 

            //    }
            //    if (this.className == 'description') {
            //        $('#txtDescription').val(this.innerText);
            //    }
            //    if (this.className == 'isPublished') {
            //        if (this.innerText == "Yes") {
            //            $('#cbIsPublished').prop('checked', true);
            //        }
            //        else {
            //            $('#cbIsPublished').prop('checked', false);
            //        }

            //    }
            //});

            $('#txtTitle').val();
            $('#txtDescription').val();
            $('#txtCategoryColor').val();
            $('#txtPoints').val();
            $('#txtCourseTime').val();
            $('#cbIsPublished').prop('checked', false);
            $("#imgCourseLogo").attr("src", "../includes/Asset/images/CourseLogo.png");
            //$('#cbIsGlobal').prop('checked', false);

            ShowLoader();
            var getUrl = "/API/Content/EditTopic";
            var requestParams = { TopicID: Topicid };
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
                        if (DataSet.StatusCode == "1")
                        {
                            debugger
                            var EditTopic = DataSet.Data.Data;

                            $('#txtTitle').val(EditTopic[0].Title);
                            $('#txtDescription').val(EditTopic[0].Description);
                            $('#txtCategoryColor').val(EditTopic[0].CategoryColor);
                            $('#txtPoints').val(EditTopic[0].Points);
                            $('#txtCourseTime').val(EditTopic[0].CourseTime);
                            
                            if (EditTopic[0].IsPublished == "1") {
                                $('#cbIsPublished').prop('checked', true);
                            }
                            else {
                                $('#cbIsPublished').prop('checked', false);
                            }
                            //if (EditTopic[0].IsGlobal == "1") {
                            //    $('#cbIsGlobal').prop('checked', true);
                            //}
                            //else {
                            //    $('#cbIsGlobal').prop('checked', false);
                            //}

                            $('#ddlAccessibility').val(EditTopic[0].Accessibility).trigger('change');
                            $("#imgCourseLogo").attr("src", "../Files/CourseLogo/" + EditTopic[0].FilePath);

                            GetCourseCategoryTagsAndBadge('update', EditTopic[0].CategoryID, EditTopic[0].AchievementBadgeID, EditTopic[0].TagID);
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


            inputValidation('.input-validation');
            toggle('divForm', 'divGird');
            $('#submit').attr('name', EDIT);
            $('#submit').text('UPDATE');
            $('#back').text('CANCEL');

            //Submit button name attribute changed to EDIT(Modify);
        }

        function Delete(Topicid) {
            id = "";
            id = Topicid;

            Swal.fire({
                title: 'Are you sure?',
                text: "Once deleted, you will not be able to revert changes!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    ShowLoader();
                    try {
                        var requestParams = { TopicID: id, IsActive: 0, Action: 2 };
                        var getUrl = "/API/Content/DeleteTopic";

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
                                            HideLoader();
                                            Swal.fire({
                                                title: "Success",
                                                text: DataSet.StatusDescription, 
                                                icon: "success"

                                            });
                                            View();
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
                    catch (e) {
                        HideLoader();
                        Swal.fire({
                            title: "Alert",
                            text: "Please try again",
                            icon: "error"

                        });
                    }
                }
            })


            //Swal.fire({
            //    title: "Are you sure?",
            //    text: "Once deleted, you will not be able to revert changes!",
            //    icon: "warning",
            //    buttons: true,
            //    dangerMode: true,
            //})
            //    .then((willDelete) => {
            //        if (willDelete) {
            //            ShowLoader();
            //            try {
            //                var requestParams = { TopicID: id, IsActive: 0 };
            //                var getUrl = "/API/Content/DeleteTopic";

            //                $.ajax({
            //                    type: "POST",
            //                    url: getUrl,
            //                    headers: { "Authorization": "Bearer " + accessToken },
            //                    data: JSON.stringify(requestParams),
            //                    contentType: "application/json",
            //                    success: function (response) {
            //                        try {

            //                            var DataSet = $.parseJSON(response);
            //                            if (DataSet != null && DataSet != "") {
            //                                if (DataSet.StatusCode == "1") {
            //                                    HideLoader();
            //                                    Swal.fire({
            //                                        title: "Success",
            //                                        text: DataSet.StatusDescription,
            //                                        icon: "success"

            //                                    });
            //                                    View();
            //                                }
            //                                else {
            //                                    HideLoader();
            //                                    Swal.fire({
            //                                        title: "Failure",
            //                                        text: DataSet.StatusDescription,
            //                                        icon: "error"

            //                                    });
            //                                }
            //                            }
            //                            else {
            //                                HideLoader();
            //                                Swal.fire({
            //                                    title: "Failure",
            //                                    text: "Please try Again",
            //                                    icon: "error"

            //                                });
            //                            }
            //                        }
            //                        catch (e) {
            //                            HideLoader();
            //                            Swal.fire({
            //                                title: "Failure",
            //                                text: "Please try Again",
            //                                icon: "error"

            //                            });
            //                        }
            //                    },
            //                    complete: function () {
            //                        HideLoader();
            //                    },
            //                    failure: function (response) {
            //                        HideLoader();
            //                        alert(response.data);
            //                        Swal.fire({
            //                            title: "Failure",
            //                            text: "Please try Again",
            //                            icon: "error"

            //                        });
            //                    }
            //                });
            //            }
            //            catch (e) {
            //                HideLoader();
            //                Swal.fire({
            //                    title: "Alert",
            //                    text: "Please try again",
            //                    icon: "error"

            //                });
            //            }

            //        }
            //    });
        }

        function View() {
            
            $('#btnArchive').hide();
            $('#btnUnArchive').hide();

            var url = "/API/Content/GetTopics";

            try {

                var requestParams = { TopicID: "", TopicTitle: "", TopicDescription: "", IsPublished: "", SrNo: "", MinUnlockedModules: "", UserID: "", IsActive: "" };
                ShowLoader();
                $.ajax({
                    type: "POST",
                    url: url,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    processData: false,
                    success: function (response) {
                        HideLoader();
                        var tbl = '<table id="tblGird" class="table table-bordered" style="width: 100%">';
                        tbl += '<thead><tr>';
                        tbl += '<th>Sr.No.';
                        tbl += '<th>';
                        tbl += '<th>Title';
                        tbl += '<th>Category';
                        tbl += '<th>Instructor Name';
                        tbl += '<th>Points';
                        tbl += '<th>Total Lessons';
                        tbl += '<th>Is Published';
                        tbl += '<th>Is Active';                        
                        tbl += '<th>Action';
                        tbl += '<tbody>';
                        if (response != null && response != undefined) {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    if (DataSet.Data.length > 0) {
                                        $.each(DataSet.Data, function (i, data) {
                                            if (data.IsPublished == "1") {
                                                data.IsPublished = "Yes";
                                            }
                                            else {
                                                data.IsPublished = "No";
                                            }

                                            if (data.IsActive == "1") {
                                                data.IsActive = "Yes";
                                            }
                                            else {
                                                data.IsActive = "No";
                                            }

                                            tbl += '<tr id="' + data.TopicID + '">';
                                            tbl += '<td>' + (i + 1);                                            
                                            
                                            if (data.CanEdit == "1") {
                                                tbl += '<td><input type="checkbox" onclick="SelectCourse(' + data.TopicID + ');" name="' + data.TopicID + '" id="cbxArchiveorUnArchive" >';
                                            }
                                            else {
                                                tbl += '<td>';
                                            }
                                            

                                            tbl += '<td title="' + data.Title + '" class="title">' + data.Title;
                                            tbl += '<td title="' + data.CategoryName + '" class="CategoryName">' + data.CategoryName;
                                            tbl += '<td title="' + data.InstructorName + '" class="CategoryName">' + data.InstructorName;
                                            tbl += '<td title="' + data.Points + '" class="title">' + data.Points;                                            
                                            tbl += '<td title="' + data.ModuleCount + '"><a href=Modules.aspx?Id=' + data.TopicID + '>' + data.ModuleCount + '</a>';
                                            tbl += '<td title="' + data.IsPublished + '" class="isPublished">' + data.IsPublished;
                                            tbl += '<td title="' + data.IsActive + '" class="isActive">' + data.IsActive;                                            
                                            //tbl += '<td title="' + data.Description + '" class="description">' + data.Description;
                                            //tbl += '<td><i title="Edit" onclick="Edit(' + data.TopicID + ');" class="fas fa-edit text-warning"></i><i title="Delete" onclick="Delete(' + data.TopicID + ');" class="fas fa-trash text-danger"></i>';
                                            tbl += '<td><i title="Edit" onclick="Edit_New(' + data.TopicID + ');" class="fas fa-edit text-warning"></i>';
                                            //<i title="Delete" onclick="Delete(' + data.TopicID + ');" class="fas fa-trash text-danger"></i>';
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
                            else {
                                HideLoader();
                                Swal.fire({
                                    title: "Warning",
                                    text: DataSet.StatusDescription,
                                    icon: "error"

                                });
                            }
                        }
                        else {
                            HideLoader();
                            Swal.fire({
                                title: "Warning",
                                text: DataSet.StatusDescription,
                                icon: "error"

                            });
                        }
                        $('#divTable').empty().append(tbl);
                        $('#tblGird').DataTable();
                        $('#tblGird').tableDnD({
                            onDragStart: function (table, row) {
                                $('#savereorder').show();  
                            }
                        });
                    },
                    complete: function () {
                        HideLoader();
                    }
                });

            }
            catch (e) {
                Swal.fire({
                    title: "Failure",
                    text: "Please try Again",
                    icon: "error"
                });
            }
        }

        
        function SelectCourse(TopicID)
        {
            var selected = new Array();
            $('#tblGird').DataTable().$('input[type="checkbox"]:checked').each(function () {
                selected.push($(this).attr('name'));
            });
            if (selected.length > 0) {
                $('#btnArchive').show();
                $('#btnUnArchive').show();
            }
            else {
                $('#btnArchive').hide();
                $('#btnUnArchive').hide();
            }
        }

        function ArchiveUnArchiveTopic(ArchiveFlag)
        {
            debugger
            var selected = new Array();
            $('#tblGird').DataTable().$('input[type="checkbox"]:checked').each(function () {
                selected.push($(this).attr('name'));
            });

            if (selected.length > 0)
            {
                var TopicIDs = ''
                for (var a = 0; a < selected.length; a++) {
                    TopicIDs = TopicIDs + selected[a] + ',';
                }

                TopicIDs = TopicIDs.replace(/,\s*$/, "");

                var text = '';
                var confirmButtonText = '';
                if (ArchiveFlag == 0) {
                    text = 'Do you want to archive ? Yes or No !';
                    confirmButtonText = 'Yes, archive it!';
                }
                else {
                    text = 'Do you want to un-archive ? Yes or No !';
                    confirmButtonText = 'Yes, un-archive it!';
                }

                Swal.fire({
                    title: 'Are you sure?',
                    text: text,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: confirmButtonText
                }).then((result) => {
                    if (result.value) {
                        ShowLoader();
                        try {
                            var requestParams = { TopicIDs: TopicIDs, IsActive: ArchiveFlag, Action: 3 };
                            var getUrl = "/API/Content/DeleteTopicMultiple";

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
                                                HideLoader();
                                                Swal.fire({ title: "Success", text: DataSet.Data[0].ReturnMessage, icon: "success" });
                                                View();
                                            }
                                            else {
                                                HideLoader();
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
                        catch (e) {
                            HideLoader();
                            Swal.fire({ title: "Alert", text: "Please try again", icon: "error" });
                        }
                    }
                });

            }
            else {
                Swal.fire({ title: "Failure", text: "! Please select Course", icon: "error" });
            }
        }

        //This funcion is to get and save changes of Serial No
        function SaveGrid() {
            try {
                ShowLoader();
                var sqnData = "";
                var array = [];
                var url = "/API/Content/ReOrderContent";
                $.each($('#tblGird tbody tr'), function (i, data) {
                    //var obj = {};
                    //obj['id'] = $(data).attr('id');
                    //obj['title'] = $(data).find('.title').text();
                    //obj['sqn'] = i + 1;

                    //array.push(obj);
                    sqnData += $(data).attr('id') + ",";
                });
                sqnData = sqnData.replace(/,(?=\s*$)/, '');
                //sqnData = JSON.stringify(array);
                if (sqnData != "") {
                    var requestParams = { Type: "1", IDs: sqnData };
                    $.ajax({
                        type: "POST",
                        url: url,
                        headers: { "Authorization": "Bearer " + accessToken },
                        data: JSON.stringify(requestParams),
                        contentType: "application/json",
                        processData: false,
                        success: function (response) {
                            if (response != null && response != undefined) {
                                var DataSet = $.parseJSON(response);
                                if (DataSet != null && DataSet != "") {
                                    if (DataSet.StatusCode == "1") {
                                        if (DataSet.Data.length > 0) {
                                            $('#savereorder').hide();
                                            View();
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
                            else {
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error"
                                });
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
            catch (e) {
                Swal.fire({
                    title: "Failure",
                    text: "Please try Again",
                    icon: "error"
                });
            }

        }

        function back() {
            toggle('divGird', 'divForm');
            View();
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

    </script>
</asp:Content>
