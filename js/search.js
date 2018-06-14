$(function () {
    // 登录名-session
    $.post("../php/session.php",
        {
        },
        function (data, status) {
            if(data!=""){
                $("#text-login").html(data);
                $("#text-register").html("注销");
                $("#text-register").attr("href","../php/logout.php");
            }
        });

});