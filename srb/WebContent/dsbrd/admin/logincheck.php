<?php
session_start();
include("config.php");
if (isset($_POST['submit'])) {
$username=$_POST['user'];
$password=$_POST['pass'];
$sql = "select * from adminlogin where user = '$username' and pass = '$password'";
$query = mysqli_query($con,$sql);

$row =mysqli_num_rows($query);
	if ($row == 1) {
echo "Login Succesful";
$_SESSION['user'] = $username;
 header('location:dashboard.php');
	}else{
		echo "Login Failed";
		header('location:Adminlogin.php');
	}

}
?>