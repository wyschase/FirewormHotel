<?php
session_start();
$name = $_SESSION['username'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>莹家 - 走遍天下，落脚此家</title>
    <link rel="shortcut icon" href="../../../../htdocs/FirewormHotel/images/LOGO-label.ico">
    <link rel="stylesheet" href="../../../../htdocs/FirewormHotel/css/common.css" type="text/css">
    <link rel="stylesheet" href="../../../../htdocs/FirewormHotel/css/index.css" type="text/css">
    <link href="../../../../htdocs/FirewormHotel/js/mf-pattern/mF_kdui.css" rel="stylesheet" type="text/css">
    <script src="../../../../htdocs/FirewormHotel/js/myfocus-2.0.4.full.js" type="text/javascript"></script>
    <script src="../../../../htdocs/FirewormHotel/js/mf-pattern/mF_kdui.js" type="text/javascript"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="../../../../htdocs/FirewormHotel/js/index.js"></script>
</head>
<body>
<div class="index-header">
    <div class="index-header-banner" id="header-banner">
        <div class="loading"><img src="../../../../htdocs/FirewormHotel/js/mf-pattern/img/loading.gif" alt="图片加载中..."></div>
        <div class="pic">
            <ul>
                <li><img src="../../../../htdocs/FirewormHotel/images/search01.jpg"></li>
                <li><img src="../../../../htdocs/FirewormHotel/images/search02.jpg"></li>
                <li><img src="../../../../htdocs/FirewormHotel/images/search03.jpg"></li>
                <li><img src="../../../../htdocs/FirewormHotel/images/search04.jpg"></li>
            </ul>
        </div>
        <div class="index-header-cover"></div>
        <div class="index-header-nav">
            <a href=""><img class="logo" src="../../../../htdocs/FirewormHotel/images/logo-2.png"></a>
            <a href="../../../../htdocs/FirewormHotel/html/login.html" class="login">注销</a>
            <a href="#" class="register"><? echo $name?></a>
        </div>
        <div class="index-header-slogan box">
            <img src="../../../../htdocs/FirewormHotel/images/slogan.png">
        </div>
        <div class="index-header-search box">
            <input type="text" placeholder="输入你的向往之地……">
        </div>
    </div>
</div>
<div class="index-display-panel box">
    <div class="big-title"><img src="../../../../htdocs/FirewormHotel/images/当季热门.png" alt="当季热门"></div>
    <div class="sub-title">
        <ul>
            <li><a href="#" class="city-active">广州</a></li>
            <li><a href="#">上海</a></li>
            <li><a href="#">石家庄</a></li>
            <li><a href="#">北京</a></li>
        </ul>
    </div>
    <div class="hotel-display">
        <div id="dialog_large_image"></div>
        <li>
            <div><img class="apreview" src="../../../../htdocs/FirewormHotel/images/gz01.jpg"></div>
            <a href="#"><p class="hotel-name">莹家广州南沙广场店</p></a>
            <p class="hotel-price">人均￥180/晚</p>
        </li>
        <li>
            <div><img class="apreview" src="../../../../htdocs/FirewormHotel/images/gz02.jpg"></div>
            <a href="#"><p class="hotel-name">莹家广州番禺长隆北门店</p></a>
            <p class="hotel-price">人均￥288/晚</p>
        </li>
        <li>
            <div><img class="apreview" src="../../../../htdocs/FirewormHotel/images/gz03.jpg"></div>
            <a href="#"><p class="hotel-name">莹家广州天河沙河服装城店</p></a>
            <p class="hotel-price">人均￥340/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/gz04.jpg"></div>
            <a href="#"><p class="hotel-name">莹家黄浦东区时代城店</p></a>
            <p class="hotel-price">人均￥220/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/gz05.jpg"></div>
            <a href="#"><p class="hotel-name">莹家广州盘福路越秀公园店</p></a>
            <p class="hotel-price">人均￥330/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/gz06.jpg"></div>
            <a href="#"><p class="hotel-name">莹家广州萝岗香雪地铁站店</p></a>
            <p class="hotel-price">人均￥178/晚</p>
        </li>
    </div>
</div>
<div class="index-sub-banner">
    <div class="index-sub-banner-cover"></div>
    <div class="index-sub-banner-text box">
        <img src="../../../../htdocs/FirewormHotel/images/特别推出莹家夏日度假村.png">
    </div>
    <div class="index-sub-banner-button box">
        <a href="">浏览莹家夏季精选</a>
    </div>
</div>
<div class="index-display-panel box">
    <div class="big-title"><img src="../../../../htdocs/FirewormHotel/images/高分收藏.png" alt="高分收藏"></div>
    <div class="sub-title"></div>
    <div class="hotel-display">
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite01.jpg"></div>
            <a href="#"><p class="hotel-name">莹家三亚红糖湾建国度假酒店</p></a>
            <p class="hotel-price">人均￥310/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite02.jpg"></div>
            <a href="#"><p class="hotel-name">莹家三亚南山休闲会馆</p></a>
            <p class="hotel-price">人均￥598/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite03.jpg"></div>
            <a href="#"><p class="hotel-name">莹家珠海海泉湾度假温泉酒店</p></a>
            <p class="hotel-price">人均￥480/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite04.jpg"></div>
            <a href="#"><p class="hotel-name">莹家亚欧大酒店</p></a>
            <p class="hotel-price">人均￥660/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite05.jpg"></div>
            <a href="#"><p class="hotel-name">莹家三亚美高梅度假酒店</p></a>
            <p class="hotel-price">人均￥1399/晚</p>
        </li>
        <li>
            <div><img src="../../../../htdocs/FirewormHotel/images/favourite06.jpg"></div>
            <a href="#"><p class="hotel-name">莹家长白沙酒店</p></a>
            <p class="hotel-price">人均￥2206/晚</p>
        </li>
    </div>
</div>
<div class="public-footer">
    <div class="footer-content box">
        <ul>
            <li><a href="">关于我们&nbsp;|&nbsp;</a></li>
            <li><a href="">联系我们&nbsp;|&nbsp;</a></li>
            <li><a href="">意见反馈&nbsp;|&nbsp;</a></li>
            <li><a href="">营业执照&nbsp;|&nbsp;</a></li>
            <li><a href="">会员中心&nbsp;|&nbsp;</a></li>
            <li><a href="">指南</a></li>
        </ul>
        <br>
        <p>© 2018 莹家酒店 yingjia.com 版权所有</p>
    </div>
</div>
</body>
</html>