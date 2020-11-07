<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
        <script src="/srb/staticContent/JS/Student.js"></script>
      <!--   <script type="text/javascript">
	 function editStudent() {
			 window.location = "editStudentInfo.jsp";
	}
	 function studentList() {
		 window.location = "listForStudent2.jsp";
}
</script> -->
<script type="text/javascript">
	function TutorialList()
	{
		window.location="AddTutorial.jsp";
	}
	
</script>


</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                         <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Tutorial</h1>
                            <small>Tutorial</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success"  onclick="TutorialList()" accesskey="t""> <i class="fa fa-plus"></i>Add Tutorial </a>
                       
                </div>
                
            </div> 

            
            <div class="panel-body panel-form">
             <div class="row">
    <div class="col-md-3">
      <div class="vertical-class" align="center">
      <ul class="nav nav-pills">
        <li class="active"><a data-toggle="pill" href="#Class1">Class 1</a></li>
        <li><a data-toggle="pill" href="#Class2">Class 2</a></li>
        <li><a data-toggle="pill" href="#Class3">Class 3</a></li>
        <li><a data-toggle="pill" href="#Class4">Class 4</a></li>
        <li><a data-toggle="pill" href="#Class5">Class 5</a></li>
        <li><a data-toggle="pill" href="#Class6">Class 6</a></li>
        <li><a data-toggle="pill" href="#Class7">Class 7</a></li>
        <li><a data-toggle="pill" href="#Class8">Class 8</a></li>
        <li><a data-toggle="pill" href="#Class9">Class 9</a></li>
        <li><a data-toggle="pill" href="#Class10">Class 10</a></li>
      </ul>
      </div>
    </div>


    <div class="col-md-9">
      <div class="tab-content">
      <!-- class 1 -->
      <div id="Class1" class="tab-pane active">
        <div class="horizontal-sub" align="center">
          <h3>Standard  1<sup>st</sup></h3>
          <ul class="nav nav-pills">
            <li class="active"><a data-toggle="pill" href="#Sub1">English</a></li>
            <li><a data-toggle="pill" href="#Sub2">Hindi</a></li>
            <li><a data-toggle="pill" href="#Sub3">Marathi</a></li>
            <li><a data-toggle="pill" href="#Sub4">Mathematics</a></li>
            <li><a data-toggle="pill" href="#Sub5">EVS</a></li>
            <li><a data-toggle="pill" href="#Sub6">Social Study</a></li>
            <li><a data-toggle="pill" href="#Sub7">Computer</a></li>
          </ul>
        </div>

      <div class="tab-content">
        <div id="Sub1" class="tab-pane active">
          <h3>English</h3>
         <div class="container-video">
           <div class="row">
             <div class="col-md-6 pt-1">
               <div class="subvideo">

               <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/QGlKbsd4PWQ"></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>

           </div>
         </div>
        </div>
      <div id="Sub2" class="tab-pane">
          <h3>Hindi</h3>
          <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           </div>
         </div>
      </div>
      <div id="Sub3" class="tab-pane">
          <h3>Marathi</h3>
         <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>
      <div id="Sub4" class="tab-pane">
          <h3>Mathematics</h3>
          <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
           </div>
         </div>
      </div>
      <div id="Sub5" class="tab-pane">
          <h3>EVS</h3>
          <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
      </div>
      <div id="Sub6" class="tab-pane">
          <h3>Social Study</h3>
          <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

           

           </div>
         </div>
      </div>
      </div>
      <div id="Sub7" class="tab-pane">
          <h3>Computer</h3>
          <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>

 
    </div>
  </div>
  <!-- class 2 -->
  <div id="Class2" class="tab-pane">
      
      <div class="horizontal-sub">
      <h3>Standard 2<sup>nd</sup></h3>
        <ul class="nav nav-pills">
          <li class="active"><a data-toggle="pill" href="#Subs1">English</a></li>
          <li><a data-toggle="pill" href="#Subs2">Hindi</a></li>
          <li><a data-toggle="pill" href="#Subs3">Marathi</a></li>
          <li><a data-toggle="pill" href="#Subs4">Mathematics</a></li>
          <li><a data-toggle="pill" href="#Subs5">EVS</a></li>
          <li><a data-toggle="pill" href="#Subs6">Social Study</a></li>
          <li><a data-toggle="pill" href="#Subs7">Computer</a></li>
        </ul>
      </div>
    <div class="tab-content">
        <div id="Subs1" class="tab-pane active">
          <h3>English</h3>
       <div class="container-video">
           <div class="row">
         
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
        </div>
        <div id="Subs2" class="tab-pane">
          <h3>Hindi</h3>
           <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
        </div>
        <div id="Subs3" class="tab-pane">
          <h3>Marathi</h3>
           <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
        </div>
        <div id="Subs4" class="tab-pane">
          <h3>Mathematics</h3>
           <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
             

           </div>
         </div>
        </div>
        <div id="Subs5" class="tab-pane">
          <h3>EVS</h3>
           <div class="container-video">
           <div class="row">
         
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
        </div>
        <div id="Subs6" class="tab-pane">
          <h3>Social Study</h3>
           <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
        </div>
        <div id="Subs7" class="tab-pane">
          <h3>Computer</h3>
          <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="#">PDF</a></button> 
               </div>

             </div>
         

           </div>
         </div>
        </div>

  </div>
  </div>
<!-- class 3 -->
  <div id="Class3" class="tab-pane">
    <div class="horizontal-sub">
      <h3>Standard 3<sup>rd</sup></h3>
      <ul class="nav nav-pills">
        <li class="active"><a data-toggle="pill" href="#Sub31">English</a></li>
        <li><a data-toggle="pill" href="#Sub32">Hindi</a></li>
        <li><a data-toggle="pill" href="#Sub33">Marathi</a></li>
        <li><a data-toggle="pill" href="#Sub34">Mathematics</a></li>
        <li><a data-toggle="pill" href="#Sub35">Science</a></li>
        <li><a data-toggle="pill" href="#Sub36">Social Study</a></li>
        <li><a data-toggle="pill" href="#Sub37">Computer</a></li>
      </ul>
    </div>
    <div class="tab-content">
      <div id="Sub31" class="tab-pane active">
         <h3>English</h3>
          <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
      </div>
      <div id="Sub32" class="tab-pane">
        <h3>Hindi</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
      </div>
      <div id="Sub33" class="tab-pane">
        <h3>Marathi</h3>
        <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub34" class="tab-pane">
        <h3>Mathematics</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>
      <div id="Sub35" class="tab-pane">
        <h3>Science</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub36" class="tab-pane">
        <h3>Social Study</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
             

           </div>
         </div>
      </div>
      <div id="Sub37" class="tab-pane">
        <h3>Computer</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
      </div>
    </div>
  </div>
  <!-- class 4 -->
  <div id="Class4" class="tab-pane">
      <div class="horizontal-sub">
        <h3>Standard 4<sup>th</sup></h3>
        <ul class="nav nav-pills">
          <li class="active"><a data-toggle="pill" href="#Sub41">English</a></li>
          <li><a data-toggle="pill" href="#Sub42">Hindi</a></li>
          <li><a data-toggle="pill" href="#Sub43">Marathi</a></li>
          <li><a data-toggle="pill" href="#Sub44">Mathematics</a></li>
          <li><a data-toggle="pill" href="#Sub45">Science</a></li>
          <li><a data-toggle="pill" href="#Sub46">Social Study</a></li>
          <li><a data-toggle="pill" href="#Sub47">Computer</a></li>
        </ul>
      </div>
      <div class="tab-content">
      <div id="Sub41" class="tab-pane active">
        <h3>English</h3>
       <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub42" class="tab-pane">
        <h3>Hindi</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
           </div>
         </div>
      </div>
      <div id="Sub43" class="tab-pane">
        <h3>Marathi</h3>
        <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
         

           </div>
         </div>
      </div>
      <div id="Sub44" class="tab-pane">
        <h3>Mathematics</h3>
        <div class="container-video">
           <div class="row">

             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub45" class="tab-pane">
        <h3>Science</h3>
        <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub46" class="tab-pane">
        <h3>Social Study</h3>
       <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>
      <div id="Sub47" class="tab-pane">
        <h3>Computer</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
    </div>
  </div>
  <!-- class 5 -->
  <div id="Class5" class="tab-pane">
      <div class="horizontal-sub">
        <h3>Standard 5<sup>th</sup></h3>
        <ul class="nav nav-pills">
          <li class="active"><a data-toggle="pill" href="#Sub51">English</a></li>
          <li><a data-toggle="pill" href="#Sub52">Hindi</a></li>
          <li><a data-toggle="pill" href="#Sub53">Marathi</a></li>
          <li><a data-toggle="pill" href="#Sub54">Mathematics</a></li>
          <li><a data-toggle="pill" href="#Sub55">Science</a></li>
          <li><a data-toggle="pill" href="#Sub56">Social Study</a></li>
          <li><a data-toggle="pill" href="#Sub57">Computer</a></li>
        </ul>
      </div>
      <div class="tab-content">
      <div id="Sub51" class="tab-pane active">
        <h3>English</h3>
           <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>

           </div>
         </div>
      </div>
      <div id="Sub52" class="tab-pane">
        <h3>Hindi</h3>
        <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            
           </div>
         </div>
      </div>
      <div id="Sub53" class="tab-pane">
        <h3>Marathi</h3>
        <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
      <div id="Sub54" class="tab-pane">
        <h3>Mathematics</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>
      <div id="Sub55" class="tab-pane">
        <h3>Science</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
           </div>
         </div>
      </div>
      <div id="Sub56" class="tab-pane">
        <h3>Social Study</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
      </div>
      <div id="Sub57" class="tab-pane">
        <h3>Computer</h3>
        <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
      </div>
    </div>
  </div>

  <!-- class 6 -->
  <div id="Class6" class="tab-pane ">
      <div class="horizontal-sub">
        <h3>Standard 6<sup>th</sup></h3>
        <ul class="nav nav-pills">
          <li class="active"><a data-toggle="pill" href="#Sub61">English</a></li>
          <li><a data-toggle="pill" href="#Sub62">Hindi</a></li>
          <li><a data-toggle="pill" href="#Sub63">Marathi</a></li>
          <li><a data-toggle="pill" href="#Sub64">Mathematics</a></li>
          <li><a data-toggle="pill" href="#Sub65">Science</a></li>
          <li><a data-toggle="pill" href="#Sub66">Social Study</a></li>
          <li><a data-toggle="pill" href="#Sub67">Computer</a></li>
        </ul>
      </div>
      <div class="tab-content">
        <div id="Sub61" class="tab-pane active">
          <h3>English</h3>
          <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
        </div>

        <div id="Sub62" class="tab-pane">
          <h3>Hindi</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
        </div>
        <div id="Sub63" class="tab-pane">
          <h3>Marathi</h3>
          <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
        </div>
        <div id="Sub64" class="tab-pane">
          <h3>Mathematics</h3>
         <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
           </div>
         </div>
        </div>
        <div id="Sub65" class="tab-pane">
          <h3>Science</h3>
          <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
        </div>
        <div id="Sub66" class="tab-pane">
          <h3>Social Study</h3>
         <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
        </div>
        <div id="Sub67" class="tab-pane">
          <h3>Computer</h3>
         <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
        </div>
      </div>
  </div>
  
  <!-- class 7 -->
      <div id="Class7" class="tab-pane">
      <div class="horizontal-sub">
        <h3>Standard 7<sup>th</sup></h3>
        <ul class="nav nav-pills">
          <li class="active"><a data-toggle="pill" href="#Sub71">English</a></li>
          <li><a data-toggle="pill" href="#Sub72">Hindi</a></li>
          <li><a data-toggle="pill" href="#Sub73">Marathi</a></li>
          <li><a data-toggle="pill" href="#Sub74">Mathematics</a></li>
          <li><a data-toggle="pill" href="#Sub75">Science</a></li>
          <li><a data-toggle="pill" href="#Sub76">Social Study</a></li>
          <li><a data-toggle="pill" href="#Sub77">Computer</a></li>
        </ul>
      </div>
    <div class="tab-content">
      <div id="Sub71" class="tab-pane active">
        <h3>English</h3>
       <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
         

           </div>
         </div>
      </div>
      <div id="Sub72" class="tab-pane">
        <h3>Hindi</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
        

           </div>
         </div>
      </div>
      <div id="Sub73" class="tab-pane">
        <h3>Marathi</h3>
        <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
         
           </div>
         </div>
      </div>
      <div id="Sub74" class="tab-pane">
        <h3>Mathematics</h3>
         <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3> </h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
      </div>
    <div id="Sub75" class="tab-pane">
      <h3>Science</h3>
      <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
    </div>
   <div id="Sub76" class="tab-pane">
      <h3>Social Study</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
    </div>
    <div id="Sub77" class="tab-pane">
      <h3>Computer</h3>
     <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
         

           </div>
         </div>
    </div>

  </div>
    </div>
  
  <!-- class 8 -->
   <div id="Class8" class="tab-pane">
    <div class="horizontal-sub">
      <h3>Standard 8<sup>th</sup></h3>
       <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#Sub81">English</a></li>
    <li><a data-toggle="pill" href="#Sub82">Hindi</a></li>
    <li><a data-toggle="pill" href="#Sub83">Marathi</a></li>
    <li><a data-toggle="pill" href="#Sub84">Mathematics</a></li>
    <li><a data-toggle="pill" href="#Sub85">Science</a></li>
    <li><a data-toggle="pill" href="#Sub86">Social Study</a></li>
    <li><a data-toggle="pill" href="#Sub87">Computer</a></li>
    
  </ul>
</div>
      <div class="tab-content">
    <div id="Sub81" class="tab-pane active">
      <h3>English</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
    <div id="Sub82" class="tab-pane">
      <h3>Hindi</h3>
      <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
    </div>
   <div id="Sub83" class="tab-pane">
      <h3>Marathi</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
    </div>
    <div id="Sub84" class="tab-pane">
      <h3>Mathematics</h3>
      <div class="container-video">
           <div class="row">
          
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
    </div>
    <div id="Sub85" class="tab-pane">
      <h3>Science</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
   <div id="Sub86" class="tab-pane">
      <h3>Social Study</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
            

           </div>
         </div>
    </div>
    <div id="Sub87" class="tab-pane">
      <h3>Computer</h3>
       <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>

  </div>
    </div>
  
  <!-- class 9 -->
  <div id="Class9" class="tab-pane">
    <div class="horizontal-sub">
      <h3>Standard 9<sup>th</sup></h3>
       <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#Sub91">English</a></li>
    <li><a data-toggle="pill" href="#Sub92">Hindi</a></li>
    <li><a data-toggle="pill" href="#Sub93">Marathi</a></li>
    <li><a data-toggle="pill" href="#Sub94">Mathematics</a></li>
    <li><a data-toggle="pill" href="#Sub95">Science</a></li>
    <li><a data-toggle="pill" href="#Sub96">Social Study</a></li>
    
    
  </ul>
</div>
      <div class="tab-content">
    <div id="Sub91" class="tab-pane active">
      <h3>English</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=" "></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
         

           </div>
         </div>
    </div>
    <div id="Sub92" class="tab-pane">
      <h3>Hindi</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
   <div id="Sub93" class="tab-pane">
      <h3>Marathi</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          
           </div>
         </div>
    </div>
    <div id="Sub94" class="tab-pane">
      <h3>Mathematics</h3>
      <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
    </div>
    <div id="Sub95" class="tab-pane">
      <h3>Science</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
          

           </div>
         </div>
    </div>
   <div id="Sub96" class="tab-pane">
      <h3>Social Study</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>


           </div>
         </div>
    </div>

  </div>
    </div>
  <!-- class 10 -->
  <div id="Class10" class="tab-pane">
      <div class="horizontal-sub">
        <h3>Standard 10<sup>th</sup></h3>
       <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#Sub101">English</a></li>
    <li><a data-toggle="pill" href="#Sub102">Hindi</a></li>
    <li><a data-toggle="pill" href="#Sub103">Marathi</a></li>
    <li><a data-toggle="pill" href="#Sub104">Mathematics</a></li>
    <li><a data-toggle="pill" href="#Sub105">Science</a></li>
    <li><a data-toggle="pill" href="#Sub106">Social Study</a></li>
    
    
  </ul>
</div>
      <div class="tab-content">
    <div id="Sub101" class="tab-pane active">
      <h3>English</h3>
       <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
    <div id="Sub102" class="tab-pane">
      <h3>Hindi</h3>
      <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
   <div id="Sub103" class="tab-pane">
      <h3>Marathi</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           

           </div>
         </div>
    </div>
    <div id="Sub104" class="tab-pane">
      <h3>Mathematics</h3>
       <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
    </div>
    <div id="Sub105" class="tab-pane">
      <h3>Science</h3>
       <div class="container-video">
           <div class="row">
           
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
           
           </div>
         </div>
    </div>
   <div id="Sub106" class="tab-pane">
      <h3>Social Study</h3>
      <div class="container-video">
           <div class="row">
            
             <div class="col-md-6">
               <div class="subvideo">
              <iframe class="embed-responsive-item" src=""></iframe>
               <div class="heading">
                 <h3></h3>
               </div>
              <button class="btn btn-primary"><a href="">PDF</a></button> 
               </div>

             </div>
        

           </div>
         </div>
    </div>
  </div>
  </div>
  

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>
<%@include file="commons/newFooter.jsp" %> 