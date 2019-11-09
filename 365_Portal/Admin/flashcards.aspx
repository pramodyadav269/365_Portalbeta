﻿<%@ Page Title="Flashcards" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="flashcards.aspx.cs" Inherits="_365_Portal.Admin.Flashcards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Flashcards</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12 header mb-5">
            <a class="back" href="dashboard.aspx"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
            <h1 class="text-center font-weight-bold">Flashcards</h1>
        </div>
        <div>
            <table>
                <tr>
                    <td colspan="2">
                        <h2>Flashcard</h2>
                    </td>
                </tr>
                <tr>
                    <td>Flashcard Title
                    </td>
                    <td>
                        <input type="text" id="txtFlashcardTitle" />
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <textarea rows="4" cols="50" id="txtFlashcardDescription"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Overview</td>
                    <td>
                        <textarea rows="4" cols="50" id="txtFlashcardOverview"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Is Gift</td>
                    <td>
                        <input type="checkbox" id="chkIsGift" />
                    </td>
                </tr>
                <tr>
                    <td>Skip Flashcards</td>
                    <td>
                        <input type="checkbox" id="chkSkipFlashcards" />
                    </td>
                </tr>
                <tr>
                    <td>Is Published</td>
                    <td>
                        <input type="checkbox" id="chkIsPublished" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button id="btnSubmitFlashcard" onclick="SubmitChanges(this);return false;">Save Changes</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div id="dvFlashcardJson"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>Flashcard Introduction</h2>
                    </td>
                </tr>
                <tr>
                    <td>Introduction Title
                    </td>
                    <td>
                        <textarea rows="2" cols="50" id="txtIntroTitle"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Bullet Points</td>
                    <td>
                        <input type="text" id="txtDescription" />
                    </td>
                    <td>
                        <button id="btnAddIntroItem" onclick="AddIntroItem(this);return false;">Add Bullet</button>
                        <button id="btnCancelIntro" onclick="CancelIntro(this);return false;" style="display: none;">Cancel</button>
                    </td>
                </tr>
            </table>
            <br />
            <table id="tblFlashcardIntro" border="1">
                <thead>
                    <tr>
                        <th>Sr No</th>
                        <th>Bullet Point</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

        <div id="dvFlashcardIntroJson"></div>

        <br />
        <br />

        <table>
            <tr>
                <td colspan="2">
                    <h2>Flashcard Slides</h2>
                </td>
            </tr>
            <tr>
                <td>Title</td>
                <td>
                    <input type="text" id="txtSlideTitle" />
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <textarea rows="4" cols="50" id="txtSlideDescription"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="btnAddSlide" onclick="AddSlide(this);return false;">Add</button>
                    <button id="btnCancelSlide" style="margin-left: 10px;" onclick="CancelSlides(this);return false;">Cancel</button>
                </td>
            </tr>
        </table>
        <br />
        <table id="tblFlashcardSlides" border="1">
            <thead>
                <tr>
                    <th>Sr No</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <br />
        <br />
        <div id="dvFlashcardSlidesJson"></div>
    </div>

    <script>

        var flashcardIntro = [];
        var flashcardSlides = [];

        $(document).ready(function () {
            BindFlashcardIntro();
            BindFlashcardSlides();
        });

        //--------------Start of Flashcard Intro-------------//

        function AddIntroItem(cntrl) {
            if ($("#txtDescription").val().trim() != "") {

                var index = flashcardIntro.length + 1;
                var newFlashcard = { "ID": (index * 10), "SrNo": index, "Description": $("#txtDescription").val() };
                if ($(cntrl).attr("index") == null) {
                    // Add Flashcard Intro Item
                    // Ajax Call

                    flashcardIntro.push(newFlashcard);
                }
                else {
                    // Update Flashcard Intro Item
                    var index = parseInt($(cntrl).attr("index"));
                    var flashCard = $.grep(flashcardIntro, function (n, i) {
                        return n.ID == index;
                    })[0];
                    flashCard.Description = newFlashcard.Description;
                }
                CancelIntro(cntrl);
                BindFlashcardIntro(cntrl);
            }
            else {
                alert("Please enter required fields");
            }
        }

        function CancelIntro(cntrl) {
            $("#btnCancelIntro").hide();
            $("#btnAddIntroItem").show();
            $("#btnAddIntroItem").text("Add Bullet");
            $("#btnAddIntroItem").removeAttr("index");
            ClearAllFields_Intro(this);
        }

        function ClearAllFields_Intro(cntrl) {
            $("#txtDescription").val("");
        }

        function EditIntroRow(row) {
            var index = $(row).attr("index");

            var introItem = $.grep(flashcardIntro, function (n, i) {
                return n.ID == parseInt(index);
            })[0];

            $("#txtDescription").val(introItem.Description);
            $("#btnAddIntroItem").text("Save Item");
            $("#btnAddIntroItem").attr("index", index);
            $("#btnCancelIntro").show();
        }

        function DeleteIntroRow(row) {
            var index = row.attr("index");
            flashcardIntro = $.grep(flashcardIntro, function (n, i) {
                return n.ID != parseInt(index);
            });

            BindFlashcardIntro();
        }

        function BindFlashcardIntro(cntrl) {

            $("#dvFlashcardIntroJson").html(JSON.stringify(flashcardIntro));

            var tableBody = $("#tblFlashcardIntro tbody");
            tableBody.html("");

            if (flashcardIntro.length == 0) {
                tableBody.append("<td colspan='10'><center>No Bullet Points</center></td>");
            }

            $.grep(flashcardIntro, function (n, i) {
                var markup = "<tr>";
                markup += "<td>" + n.SrNo + "</td>";
                markup += "<td>" + n.Description + "</td>";
                markup += "<td index=" + n.ID + " onclick ='EditIntroRow($(this))'>Edit</td>";
                markup += "<td index=" + n.ID + " onclick ='DeleteIntroRow($(this))'>Delete</td></tr>";
                markup += "</tr>";
                tableBody.append(markup);
            });
        }

        //--------------Start of Flashcard Slides-------------//

        function BindFlashcardSlides() {
            $("#dvFlashcardSlidesJson").html(JSON.stringify(flashcardSlides));

            var tableBody = $("#tblFlashcardSlides tbody");
            tableBody.html("");

            if (flashcardSlides.length == 0) {
                tableBody.append("<td colspan='10'><center>No Flashcards</center></td>");
            }

            $.grep(flashcardSlides, function (n, i) {
                var markup = "<tr>";
                markup += "<td>" + n.SrNo + "</td>";
                markup += "<td>" + n.Title + "</td>";
                markup += "<td>" + n.Description + "</td>";
                markup += "<td index=" + n.ID + " onclick ='EditSlideRow($(this))'>Edit</td>";
                markup += "<td index=" + n.ID + " onclick ='DeleteSlideRow($(this))'>Delete</td></tr>";
                markup += "</tr>";
                tableBody.append(markup);
            });
        }

        function EditSlideRow(row) {
            var index = $(row).attr("index");

            var slideItem = $.grep(flashcardSlides, function (n, i) {
                return n.ID == parseInt(index);
            })[0];

            $("#txtSlideTitle").val(slideItem.Title);
            $("#txtSlideDescription").val(slideItem.Description);
            $("#btnAddSlide").text("Save");
            $("#btnAddSlide").attr("index", index);
            $("#btnCancelSlide").show();
        }

        function DeleteSlideRow(row) {
            var index = row.attr("index");
            flashcardSlides = $.grep(flashcardSlides, function (n, i) {
                return n.ID != parseInt(index);
            });

            BindFlashcardSlides();
        }

        function AddSlide(cntrl) {
            if ($("#txtSlideTitle").val().trim() != "" && $("#txtSlideTitle").val().trim() != "" && $("#txtSlideDescription").val().trim() != "") {

                var index = flashcardSlides.length + 1;
                var newFlashCardSlide = { "ID": (index * 10), "SrNo": index, "Title": $("#txtSlideTitle").val(), "Description": $("#txtSlideDescription").val() };

                if ($(cntrl).attr("index") == null) {
                    // Add Slide
                    // Ajax Call

                    if (IsTitleDuplicate(flashcardSlides, newFlashCardSlide.Title)) {
                        alert("Title cannot be duplicate.");
                        return false;
                    }

                    flashcardSlides.push(newFlashCardSlide);
                }
                else {
                    // Update Slide
                    // Ajax Call

                    var index = parseInt($(cntrl).attr("index"));
                    if (IsTitleDuplicate(flashcardSlides, newFlashCardSlide.Title, index)) {
                        alert("Title cannot be duplicate.");
                        return false;
                    }

                    var flashCard = $.grep(flashcardSlides, function (n, i) {
                        return n.ID == index;
                    })[0];
                    flashCard.Title = newFlashCardSlide.Title;
                    flashCard.Description = newFlashCardSlide.Description;
                }
                CancelSlides(cntrl);
                BindFlashcardSlides(cntrl);
            }
            else {
                alert("Please enter required fields");
            }
        }

        function CancelSlides(cntrl) {
            $("#btnCancelSlide").hide();
            $("#btnAddSlide").show();
            $("#btnAddSlide").text("Add Bullet");
            $("#btnAddSlide").removeAttr("index");
            ClearAllFields_Slides(this);
        }

        function ClearAllFields_Slides(cntrl) {
            $("#txtSlideTitle").val("");
            $("#txtSlideDescription").val("");
        }

        function IsTitleDuplicate(jsonArray, title, ID) {
            var duplicateTitle = false;
            $.grep(jsonArray, function (n, i) {
                if (n.Title.trim().toUpperCase() == title.trim().toUpperCase() && n.ID != ID) {
                    duplicateTitle = true;
                    return false;
                }
            });
            return duplicateTitle;
        }

        //--------------End of Flashcard Slides-------------//

        function SubmitChanges() {
            var flashcard = {
                "ContentID": 1001
                , "Title": $("#txtFlashcardTitle").val()
                , "Description": $("#txtFlashcardDescription").val()
                , "Overview": $("#txtFlashcardOverview").val()
                , "IsGift": $("#chkIsGift").prop("checked")
                , "IsSkipFlashcards": $("#chkSkipFlashcards").prop("checked")
                , "IsPublished": $("#chkIsPublished").prop("checked")
                , "FlashcardIntro": flashcardIntro
                , "FlashcardSlides": flashcardSlides
            };

            $("#dvFlashcardJson").html(JSON.stringify(flashcard));

            if ($("#txtFlashcardTitle").val().trim() != "" && $("#txtFlashcardDescription").val().trim() != "" && $("#txtFlashcardOverview").val().trim() != "") {
                // Make Ajax Call
            }
            else {
                alert("Please enter all required fields.");
            }
        }

    </script>
</asp:Content>