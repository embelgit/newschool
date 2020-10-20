<?php
$title=$_POST['title'];
$description=$_POST['description'];
$author=$_POST['author'];
$date=date('d-m-y h:i:s');
$url=$_POST['url'];

//Database Connection
$conn = new mysqli('localhost','embelco_Driven-4','sarang@123#','embelco_adminpaneldriven4');
if($conn->connect_error){
	die('Connection Failed : '.$conn->connect-error);
}else{
	$stmt = $conn->prepare("insert into bannertext(title,description,author,date,url)
	values(?,?,?,?,?)");
	$stmt->bind_param("sssss",$title,$description,$author,$date,$url,);
	$stmt->execute();
	/*echo "Registration Successfully...";*/
			header('location:dashboard.php');
	$stmt->close();
	$conn->close();
}
?>
