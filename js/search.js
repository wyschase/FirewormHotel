$(function () {
    // 创建地图实例
    var map = new BMap.Map("map-container");
    // 创建点坐标
    var point = new BMap.Point(116.404, 39.915);
    // 初始化地图，设置中心点坐标和地图级别
    map.centerAndZoom(point, 15);

    // 登录名-session
    $.post("../php/session.php",
        {},
        function (data, status) {
            if (data != "") {
                $("#text-login").html(data);
                $("#text-register").html("注销");
                $("#text-register").attr("href", "../php/logout.php");
            }
        });

});