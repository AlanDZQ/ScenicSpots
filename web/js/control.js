function createGraph (){
    document.getElementById("rightSide").innerHTML = "<div class=\"service row\"> <div class=\"feature col-sm-3 col-xs-3\"> <i class=\"ion-heart\"></i> <h6>Like</h6> </div> <div class=\"feature col-sm-3 col-xs-3\"> <i class=\"ion-navigate\"></i> <h6>Tour</h6> </div> <div class=\"feature col-sm-3 col-xs-3\"> <i class=\"ion-alert-circled\"></i> <h6>Construction</h6> </div> <div class=\"feature col-sm-3 col-xs-3\"> <i class=\"ion-merge\"></i> <h6>Shortcut</h6> </div> </div>"
    document.getElementById("rightSide").innerHTML += "<div id=\"myCanvasParent\" style=\"height:100%; margin-left:0px\"> <canvas id=\"myCanvas\" style=\"border:1px solid #ffffff; width:100%\" width=\"1313px\" height=\"555px\"></canvas></div>"

    var udata = "";
    $.ajax({
        url: "createGraph",
        data: udata,
        success: function (data) {

        },
        error: "error_",
        dataType: "json"
    });
}