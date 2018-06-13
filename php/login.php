<?php
session_start();
if(!isset($_SESSION['user_id'])){
	$con = mysqli_connect("localhost","root","") or die('Cloud not connect:'.mysqli_error());
	mysqli_select_db($con,"test");
	$un = $_POST['username'];
	$pwd = $_POST['password'];
	$result=mysqli_query($con,"SELECT * from user where username=$un");
	$row = mysqli_fetch_array($result);
	if($row) {
		if($row['password'] == $pwd) {
			$_SESSION['username']=$un;
			echo "<script>alert('登录成功！');window.location.href='../html/index.html'</script>";
		} else {
			echo "<script>alert('密码错误！');window.location.href='login.html'</script>";
		}
	} else {
		echo "<script>alert('用户名不存在');window.location.href='login.html'</script>";
	}
}else{//如果用户已经登录，则直接跳转到已经登录页面
    $home_url = '../html/index.html';
    header('Location: '.$home_url);
}


?>