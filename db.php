<?php

$host = "localhost";
$user = "root";
$password = "oyster01";
$db = "petshop";

$connect = new mysqli($host, $user, $password, $db); 
global $connect;
 
if($connect->connect_error) {
    die("connection failed : " . $connect->connect_error);
}