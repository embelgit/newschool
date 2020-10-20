<?php
$con = mysqli_connect('localhost','embelco_Driven-4','sarang@123#');
mysqli_select_db($con,'embelco_adminpaneldriven4');
if(isset($_POST['submit']))
{
    $title = $_POST['title'];
    $files = $_FILES['image'];
    $author = $_POST['author'];
    $date= $_POST['date'];
    $url=$_POST['url'];
    $description=$_POST['description'];
    $smallheading = $_POST['smallheading'];
    
   
    $filename = $files['name'];
    $fileerror = $files['error'];
    $filetmp = $files['tmp_name'];

    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');


              if(in_array($filecheck,$filetextstored))
              {
                $destinationfile = 'casestudy/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);
     
                    $q = "INSERT INTO `casestudy`(`title`, `image`, `author`, `date`, `url`, `description`,`smallheading`) VALUES ('$title','$destinationfile','$author','$date','$url','$description','$smallheading')";


                $query = mysqli_query($con, $q);
                $displayquery = "select * from casestudy";
                $querydisplay = mysqli_query($con,$displayquery);
                /*$row = mysqli_num_rows($querydisplay)*/
              }
              while ($result = mysqli_fetch_array($querydisplay)) {
                header('location:dashboard.php');
                ?>

                <?php

              }
              
}

?> 
