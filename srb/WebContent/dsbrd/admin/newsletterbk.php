<?php
$con = mysqli_connect('localhost','embelco_Driven-4','sarang@123#');
mysqli_select_db($con,'embelco_adminpaneldriven4');
if(isset($_POST['submit']))
{
    $title = $_POST['title'];
    $files = $_FILES['pdf'];    
    $date= $_POST['date'];
    $year = $_POST['year'];
    $subtitle = $_POST['subtitle'];
    $file = $_FILES['image'];    
    $description= $_POST['description'];
    

    $filenames = $files['name'];
    $fileerrors = $files['error'];
    $filetmps = $files['tmp_name'];

    $filetexts = explode('.', $filenames);
    $filechecks = strtolower(end($filetexts));

    $filetextstoreds = array('pdf');

    $filename = $file['name'];
    $fileerror = $file['error'];
    $filetmp = $file['tmp_name'];


    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');


              if(in_array($filechecks,$filetextstoreds) && in_array($filecheck,$filetextstored))
              {
                $destinationfiles = 'newletterpdf/'.$filenames;
                move_uploaded_file($filetmps,$destinationfiles);

                $destinationfile = 'newletterimg/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);







                $check_query = "SELECT * FROM `newslettercat` WHERE `year` = '$year'";
                $check = mysqli_query($con, $check_query);

                $condition = 0;
                while($row = mysqli_fetch_array($check))
                {
                    if($row['year'] == $year)
                    {
                        $condition = 1;
                        break;
                    }
                }

                if($condition == 1)
                {
                    echo "year is present";
                }
                else
                {
                    $yearinsert = "INSERT INTO `newslettercat`(`year`) VALUES ('$year')";
                    $run = mysqli_query($con, $yearinsert);
                }





     
                $q = "INSERT INTO `newsletter`(`title`, `pdf`, `date`, `year`,`subtitle`,`image`,`description`) VALUES ('$title','$destinationfiles','$date','$year','$subtitle','$destinationfile','$description')";


                $query = mysqli_query($con, $q);
               
                header('location:dashboard.php');
                ?>

                <?php

              }
              
}

?> 
