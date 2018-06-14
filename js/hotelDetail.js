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

    $("#from").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function (selectedDate) {
            $("#to").datepicker("option", "minDate", selectedDate);
        }
    });
    $("#to").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        onClose: function (selectedDate) {
            $("#from").datepicker("option", "maxDate", selectedDate);
        }
    });

});



