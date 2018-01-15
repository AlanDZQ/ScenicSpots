var results;
var tourList;
var tourCycle;
var logInfo;
var parkSize;
var bestCost;
var index;
var time;
var x;
var y;
var first = 0;
var startPic = new Image();
var arrowPic = new Image();
var endPic = new Image();
var parkInfo="";
startPic.src = "img/start.png";
arrowPic.src = "img/arrow.png";
endPic.src = "img/end.png";
function createGraph() {
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"createGraph()\"> <i class=\"ion-map\"></i> <h6>Map</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='outputDetails()'> <i class=\"ion-stats-bars\"></i> <h6>Details</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='outputGraph()'> <i class=\"ion-network\"></i> <h6>Network</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showOrderArcForm()'> <i class=\"ion-navicon\"></i> <h6>Sort</h6> </div> </div>";

    var udata = "";
    $.ajax({
        url: "createGraph",
        data: udata,
        success: function (data) {
            updateCanvas();

            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            results = eval(data);

            //绘制原始图
            paintOriginalGraph(context);
        },
        error: "error_",
        dataType: "json"
    });
}

function outputDetails() {

    document.getElementById("main").innerHTML = '<div> <table id= "table" class="table table-bordered"> <tr> <th>Name</th><td>Describe</td> <td>Popularity</td> <td>Lounge</td> <td>Bathroom</td> </tr></table> </div>';

    for (var i = 0; i < results.arcNum; i++) {
        var arcNode = results.nodes[i];
        var nodeInfos = [arcNode.name, arcNode.des, arcNode.pop, arcNode.hasRest == true ? "Yes" : "No", arcNode.hasToilet == true ? "Yes" : "No"];
        var str = "";
        for (j = 0; j < 5; j++) {
            str += '<td>' + nodeInfos[j] + '</td>';
        }
        document.getElementById("table").innerHTML += str;
    }
}

function outputGraph() {

    document.getElementById("main").innerHTML = '<div> <table id= "table" class="table table-bordered"> </table> </div>';
    var arcNodes = results.nodes;

    for (var i = -1; i < results.arcNum; i++) {
        var str = '';
        if (i == -1) {
            str += '<th></th>';
            for (var j = 0; j < results.arcNum; j++) {
                str += '<td>' + arcNodes[j].name + '</td>';
            }

            document.getElementById("table").innerHTML += str;
            continue;
        }

        for (j = 0; j < results.arcNum + 1; j++) {
            if (j == 0) {
                str = '<td>' + arcNodes[i].name + '</td>';
            }
            else if (i + 1 == j) {
                str += '<td>0</td>';
            } else {
                var dis = isContact(i, j - 1);
                str += '<td>' + dis + '</td>';
            }
        }
        document.getElementById("table").innerHTML += str;
    }
}

function mapTour() {
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onclick='showTourMapForm()'> <i class=\"ion-navigate\"></i> <h6>Guide route</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='tourMapCycle()'> <i class=\"ion-refresh\"></i> <h6>Guide Loop</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showShortestPathForm()'> <i class=\"ion-merge\"></i> <h6>Shortcut</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showSearchForm()'> <i class=\"ion-search\"></i> <h6>Search</h6> </div> </div>";
    var udata = "";
    $.ajax({
        url: "createGraph",
        data: udata,
        success: function (data) {
            updateCanvas();

            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            results = eval(data);

            //绘制原始图
            paintOriginalGraph(context);
        },
        error: "error_",
        dataType: "json"
    });
}


function showTourMapForm() {
    if (results == null) {
        showTipDialog("Please create a scenic map first!");
        return;
    }
    $('#start').val("");
    $('#end').val("");
    $('#tourListModal').modal();
}

function tourMap() {
    if ($('#start').val() == "") {
        showTipDialog("The information can not be empty!");
        return;
    }

    var udata = "start=" + $('#start').val()+ "&end=" + $('#end').val();

    $.ajax({
        url: "tourList",
        data: udata,
        type: "post",
        success: function (data) {
            var listAndCycle = eval(data);
            tourList = listAndCycle.tourList;
            tourCycle = listAndCycle.tourCycle;
            bestCost = listAndCycle.bestCost;
            time = listAndCycle.time;
            index = listAndCycle.index;

            if (tourList.length == 0) {
                showTipDialog("Attraction name fill in error, please re-fill!");
                return;
            }

            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            context.clearRect(0, 0, canvas.width, canvas.height);
            //绘制原始图
            paintOriginalGraph(context);

            var arrowPic = new Image();
            arrowPic.src = "img/arrow.png";

            var ind = 0;
            var visIndex = new Array(results.arcNum);
            for (i = 0; i < results.arcNum; i++) {
                visIndex[i] = 0;
            }
            visIndex[tourList[0]] = 1;
            var inter = setInterval(function () {
                context.beginPath();
                context.strokeStyle = 'rgb(25,180,250)';
                context.lineWidth = 5;

                var r = 10;
                context.moveTo(results.nodes[tourList[ind]].x, results.nodes[tourList[ind]].y);
                if (visIndex[tourList[ind + 1]] == 1) {
                    context.quadraticCurveTo(results.nodes[tourList[ind]].x - r, results.nodes[tourList[ind]].y - r, results.nodes[tourList[ind + 1]].x, results.nodes[tourList[ind + 1]].y);
                } else {
                    context.quadraticCurveTo(results.nodes[tourList[ind]].x + r, results.nodes[tourList[ind]].y + r, results.nodes[tourList[ind + 1]].x, results.nodes[tourList[ind + 1]].y);
                }
                visIndex[tourList[ind + 1]]++;
                context.stroke();

                context.strokeStyle = '#000000';
                context.lineWidth = 1;

                if (ind < 8) {
                    context.drawImage(arrowPic, ind * 80, 480, 30, 30);
                    context.fillText(results.nodes[tourList[ind + 1]].name, 30 + ind * 80, 500);
                }
                else {
                    context.drawImage(arrowPic, (ind - 8) * 80, 510, 30, 30);
                    context.fillText(results.nodes[tourList[ind + 1]].name, 30 + (ind - 8) * 80, 530);
                }

                ind++;
                if (ind >= tourList.length - 1) {
                    clearInterval(inter);
                }
            }, 500);
        },
        error: "error_",
        dataType: "json"
    });
}

function tourMapCycle() {
    var str = '';
    if (results == null) {
        showTipDialog("Please create a scenic map first!");
        return;
    }
    if (tourList == null) {
        showTipDialog("Please output the road map first!");
        return;
    }
    if (bestCost == 32767) {
        showTipDialog("There is no shortest cost loop in the road map!");
        return;
    }

    updateCanvas();
    var canvas = document.getElementById("myCanvas");
    if (canvas == null) {
        return false;
    }
    var context = canvas.getContext('2d');

    var arrowPic = new Image();
    arrowPic.src = "img/arrow.png";

    var ind = 0;
    var visIndex = new Array(results.arcNum);
    for (i = 0; i < results.arcNum; i++) {
        visIndex[i] = 0;
    }
    visIndex[tourList[0]] = 1;

    paintOriginalGraph(context);

    context.beginPath();
    context.strokeStyle = 'rgb(25,180,250)';
    context.lineWidth = 5;

    for (i = 0; i < index.length - 1; i++) {
        var r = 10;
        context.moveTo(results.nodes[index[i]].x, results.nodes[index[i]].y);
        context.quadraticCurveTo(results.nodes[index[i]].x, results.nodes[index[i]].y, results.nodes[index[i + 1]].x, results.nodes[index[i + 1]].y);
        context.stroke();
    }
    context.moveTo(results.nodes[index[index.length - 1]].x, results.nodes[index[index.length - 1]].y);
    context.quadraticCurveTo(results.nodes[index[0]].x, results.nodes[index[0]].y, results.nodes[index[0]].x, results.nodes[index[0]].y);
    context.stroke();

    var num = 0;
    arrowPic = new Image();
    arrowPic.src = "img/arrow.png";
    for (i = 0; i < tourCycle.length; i++) {
        if (i < 8) {
            context.fillText(tourCycle[i], i * 80, 500);
            context.drawImage(arrowPic, 50 + i * 80, 480, 30, 30);
        }
        else {
            context.fillText(tourCycle[i], (i - 8) * 80, 530);
            context.drawImage(arrowPic, 50 + (i - 8) * 80, 510, 30, 30);
        }
        num = i;
    }
    context.fillText(tourCycle[0], (num - 7) * 80, 530);
    context.fillText("The cost is: " + bestCost, 200, 560);
    context.fillText("Use time: " + time, 350, 560);
}

function showShortestPathForm() {
    if (results == null) {
        showTipDialog("Please create a scenic map first!");
        return;
    }
    $('#startName').val("");
    $('#endName').val("");
    $('#shortestPathModal').modal();
}

function shortestPath() {
    if ($('#startName').val() == "" || $('#endName').val() == "") {
        showTipDialog("The information can not be empty!");
        return;
    }

    var udata = "startName=" + $('#startName').val() + "&endName=" + $('#endName').val();

    $.ajax({
        url: "Shortest",
        data: udata,
        type: "post",
        success: function (data) {
            var shortest = eval(data);

            if (shortest.pathDis == -1) {
                showTipDialog("Start point or end point name fill in error, please re-fill!");
                return;
            }

            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            //绘制原始图
            paintOriginalGraph(context);

            var ind = 0;
            var inter = setInterval(function () {
                var sx = results.nodes[shortest.nodesIndex[ind]].x;
                var sy = results.nodes[shortest.nodesIndex[ind]].y;
                var ex = results.nodes[shortest.nodesIndex[ind + 1]].x;
                var ey = results.nodes[shortest.nodesIndex[ind + 1]].y;

                context.beginPath();
                context.strokeStyle = 'rgb(25,180,250)';
                context.lineWidth = 5;
                context.moveTo(sx, sy);
                context.lineTo(ex, ey);
                context.stroke();


                //context.fillText(results.nodes[shortest.nodesIndex[ind]].name, ind * 100 , 500);

                context.drawImage(arrowPic, ind * 80, 480, 30, 30);
                context.fillText(results.nodes[shortest.nodesIndex[ind + 1]].name, 30 + ind * 80, 500);

                ind++;
                if (ind == shortest.nodesIndex.length - 1) {
                    context.font = '20px Arial';
                    context.fillText("The shortest path length is: " + shortest.pathDis, 200, 550);
                    context.font = '17px Arial';
                }
                if (ind >= shortest.nodesIndex.length - 1) {
                    clearInterval(inter);
                }
            }, 500);
        },
        error: "error_",
        dataType: "json"
    });
}

function loginList() {
    $('#userName').val("");
    $('#passWord').val("");
    $('#loginModal').modal();
}

function login() {
    if ($('#userName').val() === "") {
        showTipDialog("The user name can not be empty!");
        return;
    } else if ($('#passWord').val() === "") {
        showTipDialog("The user name can not be empty!");
        return;
    }

    var udata = "userName=" + $('#userName').val() + "&passWord=" + $('#passWord').val();
    $.ajax({
        url: "login",
        data: udata,
        success: function (data) {
            logInfo = eval(data);
            var name = logInfo.userName;
            if (logInfo.admin) {
                alert("Welcome administrator " + name + " !");
                window.self.location = 'index2.jsp';
            }
            else {
                alert("User name or password is wrong!");
            }
        },
        error: "error_",
        dataType: "json"
    });
}

function showSearchForm() {
    if (results == null) {
        showTipDialog("Please initialize the map!");
        return;
    }
    $('#keyWord').val("");
    $('#searchModal').modal();
}

function searchArc() {
    if ($('#keyWord').val() == "") {
        showTipDialog("Please input the keyword!");
        return;
    }

    var udata = "keyWord=" + $('#keyWord').val();

    $.ajax({
        url: "findArc",
        data: udata,
        type: "post",
        success: function (data) {
            var searchNodes = eval(data);

            if (searchNodes.length == 0) {
                showTipDialog("Please enter another keyword search based on the result of keyword search!");
                return;
            }

            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            context.clearRect(0, 0, canvas.width, canvas.height);
            //绘制原始图
            paintOriginalGraph(context);
            //将搜索到的景点标红
            context.beginPath();
            context.strokeStyle = 'rgb(25,180,250)';
            context.lineWidth = 5;
            for (i = 0; i < searchNodes.length; i++) {
                context.beginPath();
                context.arc(results.nodes[searchNodes[i]].x, results.nodes[searchNodes[i]].y, 30, 0, Math.PI * 2, true);
                context.stroke();
            }
            context.strokeStyle = '#000000';
            context.lineWidth = 1;

            context.font = '25px Arial';
            context.fillText("search results", 0, 480);
            context.font = '17px Arial';
            //绘制表格
            for (col = 0; col <= 5; col++) {
                var x = col * 100;
                context.moveTo(x, 500);
                context.lineTo(x, 50 * (searchNodes.length + 1) + 500);
            }
            for (var row = 0; row <= searchNodes.length + 1; row++) {
                var y = row * 50 + 500;
                context.moveTo(0, y);
                context.lineTo(5 * 100, y);
            }
            context.stroke();
            //填写表格信息
            var chartTitle = ["Name", "Description", "Popularity", "Lounge", "Bathroom"];
            for (i = 0; i < 5; i++) {
                var x = 100 * (i + 0.1);
                var y = 500 + 50 * 0.6;
                context.fillText(chartTitle[i], x, y);
            }
            for (i = 0; i < searchNodes.length; i++) {
                var arcNode = results.nodes[searchNodes[i]];
                var nodeInfos = [arcNode.name, arcNode.des, arcNode.pop, arcNode.hasRest == true ? "Yes" : "No", arcNode.hasToilet == true ? "Yes" : "No"];
                for (j = 0; j < 5; j++) {
                    var x = 100 * (j + 0.1);
                    var y = 500 + 50 * (i + 1.6);
                    context.fillText(nodeInfos[j], x, y);
                }
            }
        },
        error: "error_",
        dataType: "json"
    });
}

function showOrderArcForm() {
    if (results == null) {
        showTipDialog("Please create a scenic map first!");
        return;
    }
    $('#orderArcModal').modal();
}

function orderArc() {
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"createGraph()\"> <i class=\"ion-map\"></i> <h6>Map</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='outputDetails()'> <i class=\"ion-stats-bars\"></i> <h6>Details</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='outputGraph()'> <i class=\"ion-network\"></i> <h6>Network</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showOrderArcForm()'> <i class=\"ion-navicon\"></i> <h6>Sort</h6> </div> </div>";

    var udata = "type=" + $('#selectStyle').val();

    $.ajax({
        url: "orderArc",
        data: udata,
        type: "post",
        success: function (data) {
            var orderResults = eval(data);

            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            var label = "[";
            for (i = 0; i < orderResults.length - 1; i++) {
                label = label + "\"" + orderResults[i].name + "\",";
            }
            label = label + "\"" + orderResults[i].name + "\"]";
            var dataset = "[";
            for (i = 0; i < orderResults.length - 1; i++) {
                dataset = dataset + orderResults[i].value + ",";
            }
            dataset = dataset + orderResults[i].value + "]";

            var show = {
                labels: eval(label),
                datasets: [
                    {
                        label: "number",
                        backgroundColor: 'rgba(25,180,250,0.2)',
                        borderColor: 'rgba(25,180,250,1)',
                        borderWidth: 1,
                        data: eval(dataset),
                    }
                ]
            };
            var options = "scales: {xAxes: [{stacked: true}],yAxes: [{stacked: true}]}";


            var chart = new Chart(context, {
                type: 'bar',
                data: show,
                options: options
            });
        },
        error: "error_",
        dataType: "json"
    });
}

function showInitForm() {
    $('#parkSize').val("");
    $('#initParkingModal').modal();
}

function initParking() {
    parkSize = $('#parkSize').val();
    if (parkSize == "") {
        showTipDialog("Initialize the car size can not be empty!");
        return;
    }
    if (parseInt(parkSize) != parkSize) {
        showTipDialog("Please enter the correct number format!");
        return;
    }
    if (parkSize <= 0 || parkSize >= 6) {
        showTipDialog("The parking lot size is not appropriate. Please re-enter!");
        return;
    }
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"showInitForm()\"> <i class=\"ion-ionic\"></i> <h6>Initialize</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showAddParkForm()'> <i class=\"ion-log-in\"></i> <h6>In</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showDeleteParkForm()'> <i class=\"ion-log-out\"></i> <h6>Out</h6> </div><div class=\"feature col-sm-3 col-xs-3\" onClick=\"showRecord()\"> <i class=\"ion-clipboard\"></i> <h6>Record</h6> </div>  </div>";
    var udata = "parkSize=" + parkSize;
    updateCanvas();

    $.ajax({
        url: "initPark",
        data: udata,
        type: "post",
        success: function (data) {
            first = 1;
            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            paintParkingGraph(context, parkSize);
        },
        error: "error_",
        dataType: "json"
    });
}

function showAddParkForm() {
    if (first == 0) {
        showTipDialog("Please initialize the parking lot!");
        return;
    }
    $('#number').val("");
    $('#addParkModal').modal();
}

function addPark() {

    var number = $('#number').val();
    if (number == "") {
        showTipDialog("License plate number can not be empty!");
        return;
    }
    var time = getNowFormatDate();
    var udata = "number=" + number;
    parkInfo += '<tr><td>' + time + '</td><td>' + number + '</td><td>in</td></tr>';
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"showInitForm()\"> <i class=\"ion-ionic\"></i> <h6>Initialize</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showAddParkForm()'> <i class=\"ion-log-in\"></i> <h6>In</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showDeleteParkForm()'> <i class=\"ion-log-out\"></i> <h6>Out</h6> </div><div class=\"feature col-sm-3 col-xs-3\" onClick=\"showRecord()\"> <i class=\"ion-clipboard\"></i> <h6>Record</h6> </div>  </div>";
    $.ajax({
        url: "addPark",
        data: udata,
        type: "post",
        success: function (data) {
            var results = eval(data);
            console.log(results);
            if (results.exist == true) {
                showTipDialog("There is a car in the car park number, please re-enter!");
                return;
            }

            updateCanvas();
            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            paintParkingGraph(context, parkSize);

            var carPic = new Image();
            carPic.src = "img/favicon-144.png";
            context.beginPath();
            for (i = 0; i < results.tempParking.length; i++) {
                context.drawImage(carPic, 30 + 150 * i, 40, 100, 100);
                context.fillText(results.tempParking[i].number, 150 * i, 80);
                context.fillText(new Date(results.tempParking[i].ar_time).Format("hh:mm"), 150 * i, 100);
            }
            for (i = 0; i < results.parking.length; i++) {
                context.drawImage(carPic, 30 + 150 * i, 280, 100, 100);
                context.fillText(results.parking[i].number, 150 * i, 330);
                context.fillText(new Date(results.parking[i].ar_time).Format("hh:mm"), 150 * i, 300);
            }
            for (i = 0; i < results.shortcut.length; i++) {
                context.drawImage(carPic, 30 + 150 * i, 500, 100, 100);
                context.fillText(results.shortcut[i].number, 150 * i, 560);
                context.fillText(new Date(results.shortcut[i].ar_time).Format("hh:mm"), 150 * i, 530);
            }
        },
        error: "error_",
        dataType: "json"
    });
}

function showDeleteParkForm() {
    if (first == 0) {
        showTipDialog("Please initialize the parking lot!");
        return;
    }
    $('#delNumber').val("");
    $('#deleteParkModal').modal();
}

function deletePark() {

    var delNumber = $('#delNumber').val();
    if (delNumber == "") {
        showTipDialog("License plate number can not be empty!");
        return;
    }
    var time = getNowFormatDate();
    var udata = "number=" + delNumber;
    parkInfo += '<tr><td>' + time + '</td><td>' + delNumber + '</td><td>out</td></tr>';
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"showInitForm()\"> <i class=\"ion-ionic\"></i> <h6>Initialize</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showAddParkForm()'> <i class=\"ion-log-in\"></i> <h6>In</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='showDeleteParkForm()'> <i class=\"ion-log-out\"></i> <h6>Out</h6> </div><div class=\"feature col-sm-3 col-xs-3\" onClick=\"showRecord()\"> <i class=\"ion-clipboard\"></i> <h6>Record</h6> </div>  </div>";
    $.ajax({
        url: "deletePark",
        data: udata,
        type: "post",
        success: function (data) {
            var results = eval(data);

            if (results.exist == null) {
                showTipDialog("There is no vehicle in the parking lot. Please add the vehicle first!");
                return;
            }
            if (results.exist == false) {
                showTipDialog("Please do not re-enter the car without this number in the parking lot!");
                return;
            }

            var carPic = new Image();
            carPic.src = "img/favicon-144.png";

            var index = 1;
            var inter = setInterval(function () {
                updateCanvas();
                var canvas = document.getElementById("myCanvas");
                if (canvas == null) {
                    return false;
                }
                var context = canvas.getContext('2d');

                paintParkingGraph(context, parkSize);

                for (i = 0; i < results.tempParking[index].length; i++) {
                    context.drawImage(carPic, 30 + 150 * i, 60, 100, 100);
                    context.fillText(results.tempParking[index][i].number, 150 * i, 80);
                    context.fillText(new Date(results.tempParking[index][i].ar_time).Format("hh:mm"),150 * i, 100);
                }
                for (i = 0; i < results.parking[index].length; i++) {
                    context.drawImage(carPic, 30 + 150 * i, 280, 100, 100);
                    context.fillText(results.parking[index][i].number, 150 * i, 330);
                    context.fillText(new Date(results.parking[index][i].ar_time).Format("hh:mm"),150 * i, 300);
                }
                for (i = 0; i < results.shortcut[index].length; i++) {
                    context.drawImage(carPic,  30 + 150 * i, 500, 100, 100);
                    context.fillText(results.shortcut[index][i].number, 150 * i, 560);
                    context.fillText(new Date(results.shortcut[index][i].ar_time).Format("hh:mm"),150 * i, 530);
                }
                index++;
                if (index >= results.length) {
                    showTipDialog("License plate number" + delNumber + "of the car in the parking lot to stay" + results.parkTime + "minutes, should pay" + results.cost);
                    clearInterval(inter);
                }
            }, 1000);
        },
        error: "error_",
        dataType: "json"
    });
}

function showRecord() {
    document.getElementById("main").innerHTML = '<div> <table id= "table" class="table table-bordered"> <tr> <th>Time</th><td>Plate Number</td> <td>Action</td> </tr></table> </div>';
    document.getElementById("table").innerHTML+=parkInfo;
}

// function clearAll() {
//     results = null;
//     first = 0;
//
//     var canvas = document.getElementById("myCanvas");
//     if (canvas == null) {
//         return false;
//     }
//     var context = canvas.getContext('2d');
//
//     context.clearRect(0, 0, canvas.width, canvas.height);
// }
//
// function error_() {
//     alert("出错啦！");
// }

//
// function createChart(context, cols, rows) {
//     var grid_cols = cols;
//     var grid_rows = rows;
//     var cell_width = 500 / grid_cols;
//     var cell_height = 500 / grid_rows;
//     context.beginPath();
//     for (col = 0; col <= grid_cols; col++) {
//         var x = col * cell_width + 400;
//         context.moveTo(x, 20);
//         context.lineTo(x, 520);
//     }
//     for (var row = 0; row <= grid_rows; row++) {
//         var y = row * cell_height + 20;
//         context.moveTo(400, y);
//         context.lineTo(900, y);
//     }
//     context.stroke();
//
//     var rule = [cell_width, cell_height];
//     return rule;
// }

function isContact(fromIndex, toIndex) {
    var dis = '∞';
    var edges = results.nodes[fromIndex].edges;
    for (k = 0; k < edges.length; k++) {
        if (edges[k].index == toIndex) {
            dis = edges[k].dist;
            break;
        }
    }

    return dis;
}

function paintOriginalGraph(context) {
    for (i = 0; i < results.arcNum; i++) {
        context.beginPath();
        context.arc(results.nodes[i].x, results.nodes[i].y, 30, 0, Math.PI * 2, true);
        context.closePath();
        context.stroke();
        context.font = '17px Arial';
        context.fillText(results.nodes[i].name, results.nodes[i].x - 23, results.nodes[i].y + 5);
    }
    context.beginPath();
    for (i = 0; i < results.arcNum; i++) {
        var edges = results.nodes[i].edges;
        for (j = 0; j < edges.length; j++) {
            if (i < edges[j].index) {
                context.moveTo(results.nodes[i].x, results.nodes[i].y);
                context.lineTo(results.nodes[edges[j].index].x, results.nodes[edges[j].index].y);
                context.stroke();
                context.font = '17px Arial';
                context.fillText(edges[j].dist, (results.nodes[i].x + results.nodes[edges[j].index].x) / 2 + 10, (results.nodes[i].y + results.nodes[edges[j].index].y) / 2);
            }
        }
    }
}

function paintParkingGraph(context, parkSize) {
    context.beginPath();
    context.moveTo(0, 50);
    context.lineTo(0 + 150 * parkSize, 50);
    context.moveTo(0, 170);
    context.lineTo(0 + 150 * parkSize, 170);

    context.moveTo(0, 270);
    context.lineTo(0 + 150 * parkSize, 270);
    context.moveTo(0, 390);
    context.lineTo(0 + 150 * parkSize, 390);

    context.moveTo(0, 480);
    context.lineTo(700, 480);
    context.moveTo(0, 600);
    context.lineTo(700, 600);

    context.moveTo(0, 50);
    context.lineTo(0, 170);
    for (i = 0; i < parkSize; i++) {
        context.moveTo(0 + i * 150, 270);
        context.lineTo(0 + i * 150, 390);
    }

    context.font = '130px Arial';
    for (i = 1; i <= parkSize; i++) {
        context.fillText(i, 30 + (i - 1) * 150, 375);
    }

    context.stroke();
    context.font = '17px Arial';
}

function showTipDialog(message) {
    // $('#tipMessage').html(message);
    // $('#tipModal').modal();
    alert(message);
}

function updateCanvas() {
    $('#myCanvas').remove();
    document.getElementById("rightSide").innerHTML += "<div id='main'><div id=\"myCanvasParent\"></div></div>";
    $('#myCanvasParent').append('<canvas id="myCanvas" style="border:1px solid #ffffff;" width="700px" height="600px" onmousedown="cnvs_getCoordinates(event)"></canvas>');
    $('#myCanvasParent').append('<div id="write"></div>');
}

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

function manageMap() {
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\" onClick=\"addNodeform()\"> <i class=\"ion-plus-circled\"></i> <h6>Add Spots</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='deleteNodeform()'> <i class=\"ion-minus-circled\"></i> <h6>Delete Spots</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='addEdgeform()'> <i class=\"ion-plus\"></i> <h6>Add Ways</h6> </div> <div class=\"feature col-sm-3 col-xs-3\" onclick='deleteEdgeform()'> <i class=\"ion-minus\"></i> <h6>Delete Ways</h6> </div> </div>";
    var udata = "";
    $.ajax({
        url: "createGraph",
        data: udata,
        success: function (data) {
            updateCanvas();

            var canvas = document.getElementById("myCanvas");
            if (canvas == null) {
                return false;
            }
            var context = canvas.getContext('2d');

            results = eval(data);

            //绘制原始图
            paintOriginalGraph(context);
        },
        error: "error_",
        dataType: "json"
    });
}

function addNodeform() {
    $('#name').val("");
    $('#des').val("");
    $('#pop').val("");
    $('#hasRest').val("");
    $('#hasToilet').val("");
    $('#end1').val("");
    $('#weight1').val("");
    $('#time1').val("");
    $('#addNodeModal').modal();
}

function addNode() {
    if ($('#name').val() === "") {
        showTipDialog("The name can not be empty!");
        return;
    } else if ($('#des').val() === "") {
        showTipDialog("The desciption can not be empty!");
        return;
    } else if ($('#pop').val() === "") {
        showTipDialog("The popularity can not be empty!");
        return;
    } else if ($('#hasRest').val() === "") {
        showTipDialog("The restroom can not be empty!");
        return;
    } else if ($('#hasToilet').val() === "") {
        showTipDialog("The bathroom can not be empty!");
        return;
    } else if ($('#end1').val() === "") {
        showTipDialog("The first edge can not be empty!");
        return;
    } else if ($('#weight1').val() === "") {
        showTipDialog("The first edge can not be empty!");
        return;
    } else if ($('#time1').val() === "") {
        showTipDialog("The first edge can not be empty!");
        return;
    }
    var udata = "name=" + $('#name').val() + "&des=" + $('#des').val() + "&pop=" + $('#pop').val()
        + "&hasRest=" + $('#hasRest').val() + "&hasToilet=" + $('#hasToilet').val()
        + "&end1=" + $('#end1').val() + "&weight1=" + $('#weight1').val() + "&time1=" + $('#time1').val() + "&x=" + x + "&y=" + y;
    $.ajax({
        url: "addNode",
        data: udata,
        success: function (data) {
        },
        error: "error_",
        dataType: "json"
    });
    sleep(100);
    manageMap();
}

function deleteNodeform() {
    $('#dname').val("");
    $('#deleteNodeModal').modal();
}

function deleteNode() {
    if ($('#dname').val() === "") {
        showTipDialog("The name can not be empty!");
        return;
    }
    var udata = "dname=" + $('#dname').val();
    $.ajax({
        url: "deleteNode",
        data: udata,
        success: function (data) {
        },
        error: "error_",
        dataType: "json"
    });
    sleep(100);
    manageMap();
}

function addEdgeform() {
    $('#start').val("");
    $('#end').val("");
    $('#weight').val("");
    $('#time').val("");
    $('#addEdgeModal').modal();
}

function addEdge() {
    if ($('#start').val() === "") {
        showTipDialog("The start can not be empty!");
        return;
    } else if ($('#end').val() === "") {
        showTipDialog("The end can not be empty!");
        return;
    } else if ($('#weight').val() === "") {
        showTipDialog("The weight can not be empty!");
        return;
    } else if ($('#time').val() === "") {
        showTipDialog("The time can not be empty!");
        return;
    }
    var udata = "start=" + $('#start').val() + "&end=" + $('#end').val() + "&weight=" + $('#weight').val() + "&time=" + $('#time').val();
    $.ajax({
        url: "addEdge",
        data: udata,
        success: function (data) {
        },
        error: "error_",
        dataType: "json"
    });
    sleep(100);
    manageMap();
}

function deleteEdgeform() {
    $('#dstart').val("");
    $('#dend').val("");
    $('#deleteEdgeModal').modal();
}

function deleteEdge() {
    if ($('#dstart').val() === "") {
        showTipDialog("The start can not be empty!");
        return;
    } else if ($('#dend').val() === "") {
        showTipDialog("The end can not be empty!");
        return;
    }
    var udata = "dstart=" + $('#dstart').val() + "&dend=" + $('#dend').val();
    $.ajax({
        url: "deleteEdge",
        data: udata,
        success: function (data) {
        },
        error: "error_",
        dataType: "json"
    });
    sleep(100);
    manageMap();
}

function notification() {
    $('#noti').val("");
    $('#addNotiModal').modal();
}

function addNoti() {
    if ($('#noti').val() === "") {
        showTipDialog("The notification can not be empty!");
        return;
    }
    var udata = "time=" + getNowFormatDate() + "&noti=" + $('#noti').val();
    $.ajax({
        url: "addNoti",
        data: udata,
        success: function (data) {
        },
        error: "error_",
        dataType: "json"
    });
    alert("The message was sent successfully！");
}

function cnvs_getCoordinates(e) {
    x = e.screenX - 720;
    y = e.screenY - 255;
    document.getElementById("write").innerHTML = "Coordinates: (" + x + "," + y + ")";
    var canvas = document.getElementById("myCanvas");
    if (canvas == null) {
        return false;
    }
    var context = canvas.getContext('2d');
    context.drawImage(startPic, x, y, 20, 30);
}

function cnvs_clearCoordinates() {
    document.getElementById("myCanvas").innerHTML = "";
}

function sleep(n) {
    var start = new Date().getTime();
    while (true) if (new Date().getTime() - start > n) break;
}

function read() {
    document.getElementById("rightSide").innerHTML = '<div> <table id= "table" class="table table-bordered"> <tr> <th>time</th><td>notification</td> </tr></table> </div>';
    var udata = '';
    $.ajax({
        url: "readNoti",
        data: udata,
        type: "post",
        success: function (data) {
            var notiResults = eval(data);
            var time = notiResults.time;
            var noti = notiResults.noti;
            var str = "";
            for (var j = 0; j < time.length; j++) {
                str += '<tr><td>' + time[j] + '</td>' + '<td>' + noti[j] + '</td></tr>';
            }
            document.getElementById("table").innerHTML += str;
        },
        error: "error_",
        dataType: "json"
    });
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}