<?php
$con = mysqli_connect('localhost','embelco_Driven-4','sarang@123#');
mysqli_select_db($con,'embelco_adminpaneldriven4');
if(isset($_POST['submit']))
{
    $namef = $_POST['namef'];
    $filef = $_FILES['imagef'];
    $descriptionf=$_POST['descriptionf'];
    $urlf=$_POST['urlf'];
   
    $filename = $filef['name'];
    $fileerror = $filef['error'];
    $filetmp = $filef['tmp_name'];

    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');



              if(in_array($filecheck,$filetextstored))
              {
                $destinationfile = 'digitalplm/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);
     
                    $q = "UPDATE digitalplm SET namef='$namef',imagef='$destinationfile',descriptionf='$descriptionf',urlf='$urlf' WHERE num = 1";
                    $query = mysqli_query($con, $q);
              }


              /*second data*/
    $namef = $_POST['names'];
    $filef = $_FILES['images'];
    $descriptionf=$_POST['descriptions'];
    $urlf=$_POST['urls'];
   
    $filename = $filef['name'];
    $fileerror = $filef['error'];
    $filetmp = $filef['tmp_name'];

    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');



              if(in_array($filecheck,$filetextstored))
              {
                $destinationfile = 'digitalplm/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);
     
                    $q = "UPDATE digitalplm SET namef='$namef',imagef='$destinationfile',descriptionf='$descriptionf',urlf='$urlf' WHERE num = 2";
                    $query = mysqli_query($con, $q);
              }



              /*third data*/
    $namef = $_POST['namet'];
    $filef = $_FILES['imaget'];
    $descriptionf=$_POST['descriptiont'];
    $urlf=$_POST['urlt'];
   
    $filename = $filef['name'];
    $fileerror = $filef['error'];
    $filetmp = $filef['tmp_name'];

    $filetext = explode('.', $filename);
    $filecheck = strtolower(end($filetext));

    $filetextstored = array('png','jpg','jpeg');



              if(in_array($filecheck,$filetextstored))
              {
                $destinationfile = 'digitalplm/'.$filename;
                move_uploaded_file($filetmp,$destinationfile);
     
                    $q = "UPDATE digitalplm SET namef='$namef',imagef='$destinationfile',descriptionf='$descriptionf',urlf='$urlf' WHERE num = 3";
                    $query = mysqli_query($con, $q);
                    header('location:dashboard.php');
              }
              
              
}
?>
