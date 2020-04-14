<%@ Page Title="365" Language="C#" MasterPageFile="~/t/enduser.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Life.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular-sanitize.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
        <div class="container courses">
            <section id="dvTopicContainer" ng-if="ActiveContainer =='Topic'">
                <div id="dvMyTopics" class="row content">
                    <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in AllTopics">
                        <div class="card bc-blue">
                            <div class="card-icon">
                                <img src="../INCLUDES/Asset/images/sun.png">
                                <span class="point">+{{topic.Points}} Points</span>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">{{topic.Title}}</h5>
                                <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                <div class="action">
                                    <span ng-click="ChangeTopicProperty(topic,1,topic.TopicId,!topic.IsFavourite)"><i class="fas fa-heart"></i></span>
                                    <span ng-click="ChangeTopicProperty(topic,3,topic.TopicId,!topic.IsBookmark)"><i class="fas fa-plus"></i></span>

                                    <span class="play bg-blue bc-blue" ng-click="GetModulesByTopic(topic.TopicId,0);" style="cursor: pointer;">
                                        <i class="fas fa-play"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#dvMenu_Dashboard").addClass("active");
            $('select.select2').select2({
                placeholder: "Select a option",
                allowClear: true
            });
            //$('.date').datepicker({ uiLibrary: 'bootstrap4', format: 'yyyy-dd-mm' });
            bsCustomFileInput.init();

            GetAchievements();
        });

        function InitSlickSlider(el) {
            $(el).removeClass("slick-initialized");
            $(el).removeClass("slick-slider");
            $(el).slick({
                dots: false,
                infinite: false,
                speed: 300,
                slidesToShow: 3,
                slidesToScroll: 1,
                centerMode: false,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
        }

        //This code loads the IFrame Player API code asynchronously.
        //var tag = document.createElement('script');
        //tag.src = "https://www.youtube.com/iframe_api";
        //var firstScriptTag = document.getElementsByTagName('script')[0];
        //firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // This function creates an iframe and YouTube player
        // after the API code downloads.
        var ik_player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('ik_player', {
                height: '390',
                width: '640',
                videoId: '',
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange,
                    'onPlaybackQualityChange': onPlayerPlaybackQualityChange,
                    'onPlaybackRateChange': onPlayerPlaybackRateChange,
                    'onError': onPlayerError,
                    'onApiChange': onPlayerApiChange
                }
            });
        }

        // The API will call this function when the video player is ready.
        function onPlayerReady(event) {
            console.log('player is ready');
        }

        // The API calls this function when the player's state changes.
        function onPlayerStateChange(event) {

            switch (event.data) {
                case YT.PlayerState.UNSTARTED:
                    console.log('unstarted');
                    break;
                case YT.PlayerState.ENDED:
                    $("#dvVideoRating").show();
                    $('#dvVideoRating').removeClass('d-none');
                    $('#videoControl').addClass('d-none');
                    $('#videoControl').hide();
                    break;
                case YT.PlayerState.PLAYING:
                    console.log('playing');
                    break;
                case YT.PlayerState.PAUSED:
                    console.log('paused');
                    break;
                case YT.PlayerState.BUFFERING:
                    console.log('buffering');
                    break;
                case YT.PlayerState.CUED:
                    console.log('video cued');
                    break;
            }
        }

        function onPlayerPlaybackQualityChange(playbackQuality) {
            //alert("onPlayerPlaybackQualityChange");
            console.log('playback quality changed to ' + playbackQuality.data);
        }

        function onPlayerPlaybackRateChange(playbackRate) {
            //alert("onPlayerPlaybackRateChange");
            console.log('playback rate changed to ' + playbackRate.data);
        }

        function onPlayerError(e) {
            //alert("onPlayerError");
            console.log('An error occurred: ' + e.data);
        }

        function onPlayerApiChange() {
            //alert("onPlayerApiChange");
            console.log('The player API changed');
        }



        var achievements = [];

        function GetAchievements() {
            ShowLoader();
            var requestParams = { contact_name: "Scott", company_name: "HP" };
            $.ajax({
                type: "POST",
                url: "../api/Trainning/GetAchievementNGifts",
                headers: { "Authorization": "Bearer " + accessToken },
                data: JSON.stringify(requestParams),
                contentType: "application/json",
                success: function (response) {
                    achievements = $.parseJSON(response).Achievements;
                    gifts = $.parseJSON(response).Gifts;
                    HideLoader();
                }
            });
        }

        function openModal(achievementId) {
            $.each(achievements, function (i, data) {
                if (data.AchievementID == achievementId) {
                    $("#dvAchievementTitle").html(data.Title);
                    $("#dvAchievmentDescription").html(data.Description);

                    if (data.Title.includes("quiz master"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/quiz-master-c-icon.svg');
                    if (data.Title.includes("world"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/perfectionist-c-icon.svg');
                    if (data.Title.includes("wordsmith"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/wordsmith-c-icon.svg');
                    if (data.Title.includes("engager"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/engager-icon.svg');
                    if (data.Title.includes("Guru"))
                        $("#imgAchievementIcon").attr("src", '../Asset/images/diploma.png');

                    var reqHtml = "";
                    $.each(data.Requirements, function (indx, req) {
                        reqHtml += '<li class="list-group-item border-0">' + req.Description + '</li>';
                    });
                    $("#dvRequirements").html(reqHtml);

                    return false;
                }
            });

            $('#modalAchievements').modal('show');
        }

        function VideoFinished(e) {
            $("#dvVideoRating").show();
            $('#dvVideoRating').removeClass('d-none');
            $('#videoControl').addClass('d-none');
            $('#videoControl').hide();
        }

        function VideoPlayPause(action) {
            if (action == 1) {
                // video.play();
                $('#vdVideoPlayer')[0].play();
                $('#videoControl').addClass('d-none');
                $('#videoControl').hide();
            }
        }

        function VideoPaused(e) {
            //alert("Video Paused");
            $('#videoControl').removeClass('d-none');
            $('#videoControl').hide();
            $('#vdVideoPlayer')[0].pause();
        }

        var accessToken = '<%=Session["access_token"]%>';


        function ChangeFileName(cntrl) {
            var scope = angular.element(cntrl).scope();
            var selectedQuestion = jQuery.grep(scope.SpecialContents.Questions, function (obj) {
                return obj.QuestionID === parseInt($(cntrl).attr("questionid"));
            });

            selectedQuestion[0].Value_Text = cntrl.files[0].name;
            //selectedQuestion.Value_Text = cntrl.files[0].name;
        }

        //function GetFormattedDate(date) {
        //    var dateParts = date.split("-");
        //    date = format(dateParts[1]) + "-" + format(dateParts[0]) + "-" + format(dateParts[2]);
        //    var todayTime = new Date(date);
        //    var month = format(todayTime.getMonth() + 1);
        //    var day = format(todayTime.getDate());
        //    var year = format(todayTime.getFullYear());
        //    return day + "/" + month + "/" + year;
        //}

        function format(str) {
            return str < 10 ? "0" + str : str;
        }

        function encodeImagetoBase64(element, scope) {
            var uploadFile = true;
            if (!(/\.(gif|jpg|jpeg|tiff|png)$/i).test(element.files[0].name)) {
                uploadFile = false;
            }

            if (uploadFile) {
                var sizeInMB = parseInt(element.files[0].size / 1024 / 1024);
                if (sizeInMB <= 2) {
                    var file = element.files[0];
                    var reader = new FileReader();
                    reader.onloadend = function () {
                        scope.question.FilePath = reader.result;
                        scope.question.Value_Text = element.files[0].name;
                    }
                    reader.readAsDataURL(file);
                }
                else {
                    Swal.fire({
                        title: 'Failure',
                        icon: 'error',
                        html: "Maximum file upload size is 2 MB",
                        showConfirmButton: false,
                        showCloseButton: true
                    });
                }
            }
            else {
                Swal.fire({
                    title: 'Failure',
                    icon: 'error',
                    html: "Only images with (gif|jpg|jpeg|tiff|png) extensions can be uploaded.",
                    showConfirmButton: false,
                    showCloseButton: true
                });
            }
        }

    </script>
</asp:Content>

