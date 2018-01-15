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
    <link href="css/theme-Mountise.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<section class="animsition">

    <div id="leftSide">

        <div id="home" class="">
            <!-- Your logo -->
            <a href="index.jsp"><img src="img/logo.png" alt="" class="main-logo"/></a>

            <div class="h-content">
                <h1>Hello Guys!<br> I am a tourist guide!</h1>
                <p>I can lead you to enjoy all this Scenic Spot.</p>
            </div>

            <ul class="social_icons">
                <li onClick="createGraph()"><i class="icon ion-map">Map</i></li>
                <li onClick="mapTour()"><i class="icon ion-navigate">Tour</i></li>
                <li onClick="showInitForm()"><i class="icon ion-model-s">Parking</i></li>
                <li onclick="read()"><i class="icon ion-email-unread">Notification</i></li>
                <li onclick="loginList()"><i class="icon ion-person">Administrator</i></li>
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

    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        please enter the keyword!
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="keyWord">search for the keyword</label>
                            <input type="text" class="form-control" id="keyWord"
                                   placeholder="please enter the keyword">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="searchArc()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tourListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the start
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="start">start name</label>
                            <input type="text" class="form-control" id="start"
                                   placeholder="Please enter the start ">
                        </div>
                        <div class="form-group">
                            <label>end name</label>
                            <input type="text" class="form-control" id="end"
                                   placeholder="Please enter the end ">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="tourMap()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="shortestPathModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        Please enter the start and the end
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="startName">start name </label>
                            <input type="text" class="form-control" id="startName"
                                   placeholder="Please enter the start name">
                        </div>
                        <div class="form-group">
                            <label for="endName">end name </label>
                            <input type="text" class="form-control" id="endName"
                                   placeholder="Please enter the end name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="shortestPath()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
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
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="orderArc()">submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 填写停车场最大容量 -->
    <div class="modal fade" id="initParkingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please fill in the maximum capacity
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="keyWord">the maximum capacity</label>
                            <input type="text" class="form-control" id="parkSize"
                                   placeholder="Please fill in the maximum capacity">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="initParking()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 填写到达车辆信息 -->
    <div class="modal fade" id="addParkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Fill in the arrival vehicle information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="keyWord">number plate</label>
                            <input type="text" class="form-control" id="number"
                                   placeholder="Fill in the arrival vehicle information">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="addPark()">submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 填写离开车辆信息 -->
    <div class="modal fade" id="deleteParkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Fill the leaving vehicle information
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="keyWord">license plate number</label>
                            <input type="text" class="form-control" id="delNumber"
                                   placeholder=" Fill the leaving vehicle information">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="deletePark()">submit
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">
                        Please enter the user name and the password
                    </h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label>user name </label>
                            <input type="text" class="form-control" id="userName"
                                   placeholder="Please enter the user name">
                        </div>
                        <div class="form-group">
                            <label>password </label>
                            <input type="text" class="form-control" id="passWord"
                                   placeholder="Please enter the password">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" data-dismiss="modal" onClick="login()">submit
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
<script src="js/toursystem.js" type="text/javascript"></script>
<%--<script src="js/control.js" type="text/javascript"></script>--%>
<script src="js/chart.js" type="text/javascript"></script>
<script type="text/javascript">
    particlesJS("particles-js", {
        "particles": {
            "number": {"value": 67, "density": {"enable": true, "value_area": 800}},
            "color": {"value": "#ffffff"},
            "shape": {
                "type": "triangle",
                "stroke": {"width": 0, "color": "#000000"},
                "polygon": {"nb_sides": 5},
                "image": {"src": "img/github.svg", "width": 100, "height": 100}
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {"enable": false, "speed": 1, "opacity_min": 0.1, "sync": false}
            },
            "size": {
                "value": 12,
                "random": true,
                "anim": {"enable": false, "speed": 40, "size_min": 0.1, "sync": false}
            },
            "line_linked": {"enable": true, "distance": 150, "color": "#ffffff", "opacity": 0.4, "width": 1},
            "move": {
                "enable": true,
                "speed": 6,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {"enable": false, "rotateX": 600, "rotateY": 1200}
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {"enable": false, "mode": "repulse"},
                "onclick": {"enable": false, "mode": "push"},
                "resize": true
            },
            "modes": {
                "grab": {"distance": 400, "line_linked": {"opacity": 1}},
                "bubble": {"distance": 400, "size": 40, "duration": 2, "opacity": 8, "speed": 3},
                "repulse": {"distance": 200, "duration": 0.4},
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
