<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2017/9/2
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ScenicSpots Tour</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

    <!-- Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="img/favicon-144.png">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="img/favicon-144.png">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="img/favicon-114.png">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="img/favicon-72.png">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="img/favicon-57.png">

    <!--  Resources style ================== -->
    <link href="css/theme-NeonSun.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<section class="animsition">

    <div id="leftSide">
        <!-- Your logo -->
        <a href="index2.jsp"><img src="img/logo.png" alt="" class="main-logo"/></a>
        <div class="h-content">
            <div class="heading text-white">
                <h1>Administrator mode</h1>
                <h2>Use administratior mode to manage this Scenic Spot.</h2>
            </div>
        </div>

        <ul class="social_icons">
            <li onClick="createGraph()"><i class="icon ion-map">Map</i></li>
            <li onClick="manageMap()"><i class="icon ion-settings">Manage Map</i></li>
            <li onClick="notification()"><i class="icon ion-edit">New Notification</i></li>
            <li><a href="index.jsp"><i class="icon ion-person-stalker">User mode</i></a></li>
        </ul>

        <div id="particles-js" class="gradient"></div>
        <div class="count-particles">
            <span class="js-count-particles"></span>
        </div>
    </div>
    </div>

    <div id="rightSide">

        <div class="project">
            <ul class="gallery project_navigation">
                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/1.jpeg" alt="This is my work" class="img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>北门</h4>
                                <span>景点入口</span>
                            </div>
                            <a href="#project1" class="view">VIEW</a>
                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/2.jpeg" alt="This is my work" class="img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>红叶亭</h4>
                                <span>亭子</span>
                            </div>
                            <a href="#project2" class="view">VIEW</a>
                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/3.jpeg" alt="This is my work"
                             class="img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>一线天</h4>
                                <span>山与山</span>
                            </div>
                            <a href="#project3" class="view">VIEW</a>
                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/4.jpeg" alt="This is my work"
                             class="img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>狮子山</h4>
                                <span>山</span>
                            </div>
                            <a href="#project4" class="view">VIEW</a>
                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/5.jpeg" alt="This is my work" class="img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>飞流瀑</h4>
                                <span>瀑布</span>
                            </div>
                            <a href="#project5" class="view">VIEW</a>
                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/6.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>仙武湖</h4>
                                <span>湖</span>
                            </div>
                            <a href="#project6" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/7.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>仙云石</h4>
                                <span>石头</span>
                            </div>
                            <a href="#project7" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/8.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>碧水潭</h4>
                                <span>潭</span>
                            </div>
                            <a href="#project8" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/9.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>朝日峰</h4>
                                <span>峰</span>
                            </div>
                            <a href="#project9" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/10.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>花卉园</h4>
                                <span>花园</span>
                            </div>
                            <a href="#project10" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/11.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>观云台</h4>
                                <span>楼阁</span>
                            </div>
                            <a href="#project11" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>

                <li class="item col-sm-6 col-xs-12">
                    <figure>
                        <!-- Your picture -->
                        <img src="img/12.jpeg" alt="This is my work" class="img img-responsive"/>
                        <!-- Picture's description below this one -->
                        <figcaption class="caption">
                            <div class="photo-details">
                                <h4>九曲桥</h4>
                                <span>桥</span>
                            </div>
                            <a href="#project12" class="view">VIEW</a>

                        </figcaption>
                    </figure>
                </li>
            </ul>

            <ul class="project_info">
                <li id="project1">
                    <div class="project_content">
                        <h2>北门</h2>
                        <p>景点入口
                        </p>
                    </div>
                </li>

                <li id="project2">
                    <div class="project_content">
                        <h2>红叶亭</h2>
                        <p>亭子
                        </p>
                    </div>
                </li>

                <li id="project3">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project4">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project5">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project6">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project7">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project8">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project9">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project10">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>

                <li id="project11">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>
                <li id="project12">
                    <div class="project_content">
                        <h2>YOUR TITLE GOES HERE</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, amet, voluptatibus et omnis
                            dolore illo saepe voluptatem qui quibusdam sunt corporis ut iure repellendus delectus
                            voluptate explicabo temporibus quos eaque?
                        </p>
                    </div>
                </li>
            </ul>
        </div>

        <footer>
            <p class="uppercase">© ScenicSpot Tour System by Ålan <i class="ion-heart"></i></p>
            <div class="drag">
                <i class="up ion-arrow-up-c"></i>
            </div>
        </footer>
    </div>

    <div class="modal fade" id="orderArcModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Choose the sorting method
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>Sort by</label>
                            <select class="form-control" id="selectStyle">
                                <option>Popularity</option>
                                <option>Junctions</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" data-dismiss="modal" onClick="orderArc()">submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addNodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>name </label>
                            <input type="text" class="form-control" id="name"
                                   placeholder="Please enter the name">
                        </div>
                        <div class="form-group">
                            <label>description </label>
                            <input type="text" class="form-control" id="des"
                                   placeholder="Please enter the description">
                        </div>
                        <div class="form-group">
                            <label>popularity </label>
                            <input type="text" class="form-control" id="pop"
                                   placeholder="Please enter the popularity">
                        </div>
                        <div class="form-group">
                            <label>has restroom? </label>
                            <input type="text" class="form-control" id="hasRest"
                                   placeholder="Please enter 1/0">
                        </div>
                        <div class="form-group">
                            <label>has bathroom? </label>
                            <input type="text" class="form-control" id="hasToilet"
                                   placeholder="Please enter 1/0">
                        </div>
                        <div class="form-group">
                            <label>end Node </label>
                            <input type="text" class="form-control" id="end1"
                                   placeholder="Please enter the end node">
                        </div>
                        <div class="form-group">
                            <label>weight </label>
                            <input type="text" class="form-control" id="weight1"
                                   placeholder="Please enter the weight">
                        </div>
                        <div class="form-group">
                            <label>time </label>
                            <input type="text" class="form-control" id="time1"
                                   placeholder="Please enter the time">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="addNode()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addEdgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>start </label>
                            <input type="text" class="form-control" id="start"
                                   placeholder="Please enter the name">
                        </div>
                        <div class="form-group">
                            <label>end </label>
                            <input type="text" class="form-control" id="end"
                                   placeholder="Please enter the description">
                        </div>
                        <div class="form-group">
                            <label>weight </label>
                            <input type="text" class="form-control" id="weight"
                                   placeholder="Please enter the popularity">
                        </div>
                        <div class="form-group">
                            <label>time</label>
                            <input type="text" class="form-control" id="time"
                                   placeholder="Please enter the time">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="addEdge()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteNodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>name </label>
                            <input type="text" class="form-control" id="dname"
                                   placeholder="Please enter the delete node name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="deleteNode()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteEdgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>start </label>
                            <input type="text" class="form-control" id="dstart"
                                   placeholder="Please enter the delete edeg's start node name">
                        </div>
                        <div class="form-group">
                            <label>end </label>
                            <input type="text" class="form-control" id="dend"
                                   placeholder="Please enter the delete edeg's end node name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="deleteEdge()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addNotiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the notification
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>notification </label>
                            <input type="text" class="form-control" id="noti"
                                   placeholder="Please enter the notification">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="addNoti()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>


</section>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/animsition.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/twitterFetcher_min.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/photoswipe.min.js"></script>
<script src="js/photoswipe-ui-default.min.js"></script>
<script src="js/jqinstapics.min.js"></script>
<script src="js/particles.min.js"></script>
<script src="js/chart.js" type="text/javascript"></script>
<script src="js/toursystem.js" type="text/javascript"></script>
<script type="text/javascript">
    particlesJS("particles-js", {
        "particles": {
            "number": {"value": 160, "density": {"enable": true, "value_area": 800}},
            "color": {"value": "#ffffff"},
            "shape": {
                "type": "circle",
                "stroke": {"width": 0, "color": "#000000"},
                "polygon": {"nb_sides": 5},
                "image": {"src": "img/github.svg", "width": 100, "height": 100}
            },
            "opacity": {
                "value": 1,
                "random": true,
                "anim": {"enable": true, "speed": 1, "opacity_min": 0, "sync": false}
            },
            "size": {"value": 6, "random": true, "anim": {"enable": false, "speed": 4, "size_min": 0.3, "sync": false}},
            "line_linked": {"enable": false, "distance": 150, "color": "#ffffff", "opacity": 0.4, "width": 1},
            "move": {
                "enable": true,
                "speed": 1,
                "direction": "none",
                "random": true,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {"enable": false, "rotateX": 600, "rotateY": 600}
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {"enable": false, "mode": "bubble"},
                "onclick": {"enable": false, "mode": "repulse"},
                "resize": true
            },
            "modes": {
                "grab": {"distance": 400, "line_linked": {"opacity": 1}},
                "bubble": {"distance": 250, "size": 0, "duration": 2, "opacity": 0, "speed": 3},
                "repulse": {"distance": 400, "duration": 0.4},
                "push": {"particles_nb": 4},
                "remove": {"particles_nb": 2}
            }
        },
        "retina_detect": true
    });
    var count_particles, stats, update;
    stats = new Stats;
    stats.setMode(0);
    stats.domElement.style.position = 'absolute';
    stats.domElement.style.left = '0px';
    stats.domElement.style.top = '0px';
    document.body.appendChild(stats.domElement);
    count_particles = document.querySelector('.js-count-particles');
    update = function () {
        stats.begin();
        stats.end();
        if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
            count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
        }
        requestAnimationFrame(update);
    };
    requestAnimationFrame(update);
    ;
</script>
<script src="js/script.js"></script>
</body>
</html>

