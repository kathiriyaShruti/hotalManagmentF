<?php

//TODO changed file
session_start();
session_unset();
session_destroy();
$lastPageName = substr($_SERVER["HTTP_REFERER"], strrpos($_SERVER["HTTP_REFERER"], "/") + 1);

// echo "The current page name is: " . $curPageName;
// echo "</br>";

//if password matched
$_SESSION['logged_in'] = true;
$_SESSION['username'] = $result_fetch['username'];
header("location:" . $lastPageName);


?>