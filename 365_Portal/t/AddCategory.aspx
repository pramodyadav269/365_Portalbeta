<%@ Page Title="" Language="C#" MasterPageFile="~/t/admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="_365_Portal.t.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row">

        <div class="col-md-12 header mb-5">
            <a class="back" href="dashboard.aspx"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
            <h2 class="text-center font-weight-bold">Add Category</h2>
        </div>

        <div class="col-md-12" id="divGird">
            <div class="card shadow border-0 border-radius-0">
                <div class="card-body">
                    <a class="btn bg-yellow float-left" onclick="AddNew();">Add New</a>
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
                                <label for="txtTitle">Title</label>
                                <input type="text" class="form-control required" id="txtTitle" maxlength="50" placeholder="Title" />
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12 mt-4">
                            <a class="btn bg-yellow float-left" onclick="toggle('divGird', 'divForm')">Back</a>
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
            View();
        });

        function AddNew() {
            clearFields('.input-validation')
            toggle('divForm', 'divGird')
            $('#submit').attr('name', INSERT);
        }

        function back() {
            toggle('divGird', 'divForm');
            View();
        }

        function Submit() {
            var getUrl;
            var requestParams;
            ShowLoader();
            if (inputValidation('.input-validation')) {
                var _ID;
                var _Title = $('#txtTitle').val();
                var _Description = $('#txtDescription').val();

                if ($('#submit')[0].name == INSERT) {
                    getUrl = "/API/User/CreateCategory";
                } else {
                    _ID = id;
                    getUrl = "/API/User/ModifyCategory";
                }
                requestParams = { ID: _ID, Title: _Title, Description: _Description };

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

                                    if (DataSet.StatusCode == "1") {
                                        clearFields('.input-validation');
                                        HideLoader();
                                        Swal.fire({
                                            title: "Success",
                                            text: DataSet.StatusDescription,
                                            icon: "success",
                                            button: "Ok",
                                        })
                                        toggle('divGird', 'divForm');
                                        View();
                                    }
                                    else {
                                        HideLoader();
                                        Swal.fire({
                                            title: "Failure",
                                            text: DataSet.StatusDescription,
                                            icon: "error",
                                            button: "Ok",
                                        });
                                        //clearFields('.input-validation');
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
                    text: "Fill all fields",
                    icon: "error",
                    button: "Ok",
                });
            }
        }

        function Edit(_ID) {

            id = _ID;

            $('#' + id).find("td:not(:last-child)").each(function (i, data) {
                if (this.className == 'title') {
                    $('#txtTitle').val(this.innerText); ///This will find title for Topic 
                }
            });
            toggle('divForm', 'divGird');
            $('#submit').attr('name', EDIT);
            $('#submit').text('UPDATE');
            $('#back').text('CANCEL');
            inputValidation('.input-validation');
            //Submit button name attribute changed to EDIT(Modify);
        }

        function Delete(_ID) {
            id = _ID;

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
                        var requestParams = { ID: id, IsActive: 0 };
                        var getUrl = "/API/User/DeleteCategory";

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
                                                icon: "success",
                                                button: "Ok",
                                            }).then((value) => {
                                                if (value) {

                                                    View();
                                                }
                                            });
                                        }
                                        else {
                                            HideLoader();
                                            Swal.fire({
                                                title: "Failure",
                                                text: DataSet.StatusDescription,
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
                                alert(response.data);
                                Swal.fire({
                                    title: "Failure",
                                    text: "Please try Again",
                                    icon: "error",
                                    button: "Ok",
                                })
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
            })
        }

        function View() {
            var url = "/API/User/GetCategory";
            try {
                debugger
                requestParams = { ID: "", Title: "", Description: "" };
                ShowLoader();
                $.ajax({
                    type: "POST",
                    url: url,
                    headers: { "Authorization": "Bearer " + accessToken },
                    data: JSON.stringify(requestParams),
                    contentType: "application/json",
                    processData: false,
                    success: function (response) {
                    debugger
                        var tbl = '<table id="tblGird" class="table table-bordered" style="width: 100%">';
                        tbl += '<thead><tr>';
                        tbl += '<th>Sr.No.';
                        tbl += '<th>Title';
                        //tbl += '<th>Description';
                        tbl += '<th>Action';
                        tbl += '<tbody>';
                        if (response != null && response != undefined) {
                            var DataSet = $.parseJSON(response);
                            if (DataSet != null && DataSet != "") {
                                if (DataSet.StatusCode == "1") {
                                    if (DataSet.Data.length > 0) {
                                        $.each(DataSet.Data, function (i, data) {
                                            tbl += '<tr id="' + data.Id + '">';
                                            tbl += '<td>' + (i + 1);
                                            tbl += '<td class="title">' + data.CatName;
                                            //tbl += '<td class="description">' + data.Description;
                                            tbl += '<td><i title="Edit" onclick="Edit(' + data.Id + ');" class="fas fa-edit text-warning"></i>' +
                                                '<i title="Delete" onclick="Delete(' + data.Id + ');" class="fas fa-trash text-danger"></i>';
                                        });
                                    }
                                    else {
                                        tbl += '<td colspan=3 align=center>No Records found';
                                    }
                                    $('#divTable').empty().append(tbl);
                                }
                                else {
                                    HideLoader();
                                    Swal.fire({
                                        title: "Failure",
                                        text: DataSet.StatusDescription,
                                        icon: "error",
                                        button: "Ok",
                                    });
                                }
                            }
                            else {
                                HideLoader();
                                Swal.fire({
                                    title: "Failure",
                                    text: DataSet.StatusDescription,
                                    icon: "error",
                                    button: "Ok",
                                });
                            }
                        }
                        else {
                            HideLoader();
                            Swal.fire({
                                title: "Failure",
                                text: DataSet.StatusDescription,
                                icon: "error",
                                button: "Ok",
                            });
                        }
                        $('#divTable').empty().append(tbl);
                        $('#tblGird').DataTable()
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
                    icon: "error",
                    button: "Ok",
                });
            }
            HideLoader();
        }

        //This funcion is to get and save changes of Serial No
        function SaveGrid() {
            var sqnData = "";
            var array = [];

            $.each($('#tblGird tbody tr'), function (i, data) {
                var obj = {};
                sqnData += $(data).attr('id') + ",";
            });
        }        

    </script>
</asp:Content>