<?php
session_start();
$name = $_SESSION['username'];
echo $name;