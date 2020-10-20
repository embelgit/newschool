<?php
$con = mysqli_connect('localhost', 'embelco_Driven-4','sarang@123#' );
if($con) {
  /*echo "connection succesfully";*/
}else{
  echo "no connection";
}
$db = mysqli_select_db($con, 'embelco_adminpaneldriven4');
?>