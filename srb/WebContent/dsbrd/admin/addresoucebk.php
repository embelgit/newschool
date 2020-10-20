<?php
$con = mysqli_connect('localhost','embelco_Driven-4','sarang@123#');
mysqli_select_db($con,'embelco_adminpaneldriven4');
if(isset($_POST['submit']))
{
    $title = $_POST['title'];
    $file = $_FILES['image'];
    $description=$_POST['description'];
    $files = $_FILES['pdf'];
    
    $filename = $file['name'];
    $fileerror = $file['error'];
    $filetmp = $file['tmp_name'];


    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');

    $filenames = $files['name'];
    $fileerrors = $files['error'];
    $filetmps = $files['tmp_name'];
    
    $filetexts = explode('.', $filenames);
    $filechecks = strtolower(end($filetexts));

    $filetextstoreds = array('pdf');


              if(in_array($filecheck,$filetextstored) && in_array($filechecks,$filetextstoreds))
              {
                $destinationfile = 'addresourcedata/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);
     
                $destinationfiles = 'addresourcedata/'.$filenames;
                move_uploaded_file($filetmps,$destinationfiles);
                

                    $q = "INSERT INTO `addresourcedata`(`title`, `image`, `description`,`pdf`) VALUES ('$title','$destinationfile','$description','$destinationfiles')";


                $query = mysqli_query($con, $q);

                header('location:dashboard.php');
                ?>

                <?php

              }
              
}

?> 
