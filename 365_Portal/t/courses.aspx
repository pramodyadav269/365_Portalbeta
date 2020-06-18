<%@ Page Title="365" Language="C#" MasterPageFile="~/t/enduser.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Life.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular-sanitize.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid dashboard courses">

        <%-- floating button --%>
        <a href="LearningJourneynew2.aspx" id="dvAddNewCourse_Floating" style="display:none" class="btn btn-float bottom-right">
             <i class="fa fa-plus"></i><span>Create</span>
        </a>

        <section id="dvTopicContainer" ng-if="ActiveContainer =='Topic'">

            <ul class="nav nav-pills" id="pills-tab-courses" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="pills-all-tab" data-toggle="pill" href="#pills-all" role="tab" aria-controls="pills-all" aria-selected="true" title="This tab shows you all the courses created within the application.">All</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-global-tab" data-toggle="pill" href="#pills-global" role="tab" aria-controls="pills-global" aria-selected="true" title="This tab shows you all the courses that have been shared across all organizations within the application.">Global</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-published-tab" style="display: none;" data-toggle="pill" href="#pills-published" role="tab" aria-controls="pills-published" aria-selected="false">Published</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-organization-tab" data-toggle="pill" href="#pills-organization" role="tab" aria-controls="pills-organization" aria-selected="true" title="This tab shows you courses published specifically by the organization you are viewing this under.">Organization</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-assigned-tab" data-toggle="pill" href="#pills-assigned" role="tab" aria-controls="pills-assigned" aria-selected="true" title="This tab shows you courses that have been assigned and are in progress by the user.">Restricted</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-drafts-tab" style="display: none;" data-toggle="pill" href="#pills-drafts" role="tab" aria-controls="pills-drafts" aria-selected="false" title="This tab shows courses that are not yet published within the organization. Seen by all admins within the organization.">Drafts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-favourites-tab" data-toggle="pill" href="#pills-favourites" role="tab" aria-controls="pills-favourites" aria-selected="true" title="This tab shows you courses that you have marked with love to show your support and affection towards.">Favourites</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-LearningPath-tab" data-toggle="pill" href="#pills-LearningPath" role="tab" aria-controls="pills-LearningPath" aria-selected="true" title="This tab shows you courses that are creating a learning journey for you in your quest for knowledge.">Learning Path</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-Archieved-tab" style="display: none;" data-toggle="pill" href="#pills-Archieved" role="tab" aria-controls="pills-Archieved" aria-selected="true">Archived</a>
                </li>
            </ul>
            <div class="tab-content mt-3" id="pills-tabCoursesContent">

                <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
                    <%-- <h1>All Courses</h1>--%>

                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in AllTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>

                                        <a class="dropdown-item" href="#" ng-show="UserRole =='superadmin'" ng-click="DeleteTopic(topic.TopicID)" title="It will delete this course permanently.">
                                            <i class="fas fa-trash-alt"></i>
                                            Delete
                                        </a>

                                       <%-- <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 &&  UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Archive</a>--%>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)"></h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>

                    <%-- <div class="row content">
                        <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in AllTopics">
                            <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                                <div class="card-icon">
                                    <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                    <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                    <span class="point">+{{topic.Points}} Points</span>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{topic.Title}}</h5>
                                    <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                    <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                    <div class="action">
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-edit"></i></span>
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-trash-alt"></i></span>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="tab-pane fade" id="pills-global" role="tabpanel" aria-labelledby="pills-global-tab">
                    <%-- <h1>Global</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in GlobalTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>

                    <%--<div class="row content">
                        <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in GlobalTopics">
                            <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                                <div class="card-icon">
                                    <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                    <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                    <span class="point">+{{topic.Points}} Points</span>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{topic.Title}}</h5>
                                    <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                    <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                    <div class="action">
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-edit"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="tab-pane fade" id="pills-published" role="tabpanel" aria-labelledby="pills-published-tab">
                    <%--  <h1>Published</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in PublishedTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--   <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>

                    <%--<div class="row content">
                        <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in PublishedTopics">
                            <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                                <div class="card-icon">
                                    <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                    <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                    <span class="point">+{{topic.Points}} Points</span>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{topic.Title}}</h5>
                                    <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                    <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                    <div class="action">
                                        
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-edit"></i></span>
                                  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="tab-pane fade" id="pills-organization" role="tabpanel" aria-labelledby="pills-organization-tab">
                    <%--  <h1>Assigned</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in OrganizationTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--    <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type"  ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>
                </div>

                <div class="tab-pane fade" id="pills-assigned" role="tabpanel" aria-labelledby="pills-assigned-tab">
                    <%--  <h1>Assigned</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in AssignedTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--    <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type"  ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>

                    <%--<div class="row content">
                        <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in AssignedTopics">
                            <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                                <div class="card-icon">
                                    <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                    <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                    <span class="point">+{{topic.Points}} Points</span>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{topic.Title}}</h5>
                                    <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                    <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                    <div class="action">
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-edit"></i></span>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="tab-pane fade" id="pills-drafts" role="tabpanel" aria-labelledby="pills-drafts-tab">
                    <%--   <h1>Drafts</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in DraftTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.InstructorName)">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>
                    <%--<div class="row content">
                        <div class="col-sm-12 col-md-4 content-item" ng-repeat="topic in DraftTopics">
                            <div class="card" ng-style="{'border-color' : (topic.CategoryColor ==null || topic.CategoryColor =='')  ? '#2D7DD2' : topic.CategoryColor }">
                                <div class="card-icon">
                                    <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}">
                                    <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/sun.png">
                                    <span class="point">+{{topic.Points}} Points</span>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{topic.Title}}</h5>
                                    <div class="mb-2"><span class="text-muted mr-2"><i class="fas fa-stopwatch"></i></span><span class="time text-muted">{{ GetTopicTime(topic.CourseTime) }}</span></div>
                                    <p class="card-text text-muted mb-4">{{topic.CategoryName}}</p>
                                    <div class="action">
                                        
                                        <span ng-show="topic.CanEdit==1" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-edit"></i></span>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="tab-pane fade" id="pills-favourites" role="tabpanel" aria-labelledby="pills-favourites-tab">
                    <%--   <h1>Drafts</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in FavouriteTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>
                </div>

                <div class="tab-pane fade" id="pills-LearningPath" role="tabpanel" aria-labelledby="pills-LearningPath-tab">
                    <%--   <h1>Drafts</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in LearningPathTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,0)"><i class="fas fa-trash-alt"></i>Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item"  style="cursor: pointer" ng-click="GetModulesByTopic(topic.TopicID,0);">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>
                </div>

                <div class="tab-pane fade" id="pills-Archieved" role="tabpanel" aria-labelledby="pills-Archieved-tab">
                    <%--   <h1>Drafts</h1>--%>
                    <%-- Start new card style --%>
                    <div class="row">
                        <div class="courses-card" ng-repeat="topic in ArchivedTopics">
                            <div class="card card-with-img">
                                <div class="action-icon dropdown" ng-show="topic.CanEdit==1 && UserRole !='enduser'">
                                    <img src="../INCLUDES/Asset/images/dot-more-vertical-menu.svg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                    <div class="dropdown-menu br-0">
                                        <%--  <a class="dropdown-item" href="#"><i class="fas fa-graduation-cap"></i>Enroll</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-eye"></i>View more details</a>
                                        <a class="dropdown-item" href="#"><i class="far fa-bookmark"></i>Add to Favorites</a>
                                        <a class="dropdown-item" href="#"><i class="fas fa-plus"></i>Add to Learning Path</a>--%>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="EditTopic(topic.TopicID)"><i class="fas fa-pen"></i>Manage</a>
                                        <a class="dropdown-item" href="#" ng-show="topic.CanEdit==1 && UserRole !='enduser'" ng-click="ArchiveUnArchiveTopic(topic.TopicID,1)"><i class="fas fa-trash-alt"></i>Un-Archive</a>
                                    </div>
                                </div>
                                <img ng-show="topic.CourseLogo !=null" ng-src="{{'/Files/CourseLogo/' + topic.CourseLogo}}" class="card-img-top" alt="Card Image">
                                <img ng-show="topic.CourseLogo ==null" src="../INCLUDES/Asset/images/mobile-img.jpg" class="card-img-top" alt="Card Image">
                                <div class="card-body item">
                                    <p class="card-text type" ng-bind-html="trustAsHtml(topic.CategoryName)"></p>
                                    <h6 class="card-title" ng-bind-html="trustAsHtml(topic.Title)">{{topic.Title}}</h6>
                                    <p class="card-text ellipsis"  ng-bind-html="trustAsHtml(topic.Description)">{{topic.Description}}</p>
                                </div>
                                <div class="card-body profile">
                                    <img ng-show="topic.InstructorPic !=null" ng-src="{{topic.InstructorPic}}" />
                                    <img ng-show="topic.InstructorPic ==null" src="../INCLUDES/Asset/images/profile.png" />
                                    <h6 class="card-title">{{topic.InstructorName}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- End new card style --%>
                </div>
            </div>
        </section>

    </div>
    <script>

        var OrganizationName = '<%=Session["OrganizationName"]%>';
        var RoleName = '<%=Session["RoleName"]%>';

        $(document).ready(function () {
            debugger
            if (RoleName != undefined && (RoleName.toLowerCase() == 'companyadmin' || RoleName.toLowerCase() == 'subadmin' || RoleName.toLowerCase() == 'enduser'))
            {
                $('#pills-organization-tab').text(OrganizationName);
            }
            

            $(".nav-item").removeClass("active");
            $("#dvTopics").parent().addClass("active");

            //$("#dvMenu_Dashboard").addClass("active");
            $('select.select2').select2({
                placeholder: "Select a option",
                allowClear: true
            });
            //$('.date').datepicker({ uiLibrary: 'bootstrap4', format: 'yyyy-dd-mm' });
            bsCustomFileInput.init();

            GetAchievements();
        });

        function InitSlickSlider(el) {
            //$(el).removeClass("slick-initialized");
            //$(el).removeClass("slick-slider");
            //$(el).slick({
            //    dots: false,
            //    infinite: false,
            //    speed: 300,
            //    slidesToShow: 3,
            //    slidesToScroll: 1,
            //    centerMode: false,
            //    responsive: [
            //        {
            //            breakpoint: 1024,
            //            settings: {
            //                slidesToShow: 3,
            //                slidesToScroll: 1
            //            }
            //        },
            //        {
            //            breakpoint: 600,
            //            settings: {
            //                slidesToShow: 2,
            //                slidesToScroll: 1
            //            }
            //        },
            //        {
            //            breakpoint: 480,
            //            settings: {
            //                slidesToShow: 1,
            //                slidesToScroll: 1
            //            }
            //        }
            //    ]
            //});
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
        var userRole ='<%=Session["RoleName"]%>';


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

