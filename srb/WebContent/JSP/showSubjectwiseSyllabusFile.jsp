<%@page import="com.itextpdf.text.log.SysoLogger"%>

<%@ page import="java.sql.*"%>


<%@ page import="java.io.*"%>


<% 

	Blob image = null;
	Connection con = null;
	byte[ ] imgData = null ;
	Statement stmt = null;
	ResultSet rs = null;
	ServletOutputStream sos=null;
try {
	//HttpSession sessionToViewTask = request.getSession();
	System.out.println("in showSubjectwiseSyllabusFile ");
		String subjectName = (String)session.getAttribute("subjectToViewSyllabus");
		System.out.println("subjectName=="+subjectName);
		String academicYr = (String)session.getAttribute("academicYearToViewSyllabus");
		System.out.println("academicYr=="+academicYr);
		Long fkTeacher = (Long)session.getAttribute("fkteacheridToViewSyllabus");
		System.out.println("fkTeacher=="+fkTeacher);
		Long fkClass = (Long)session.getAttribute("fkClassIdToViewSyllabus");
		System.out.println("fkClass=="+fkClass);
		Long fkDiv = (Long)session.getAttribute("fkDivisionIdToViewSyllabus");
		System.out.println("fkDiv=="+fkDiv);
	
	response.setContentType("application/pdf");
	out.println("errorrrr");
	sos = response.getOutputStream();
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
	stmt = con.createStatement();
	rs = stmt.executeQuery("SELECT syllabus_uploaded_file from subject_wise_syllabus_entry WHERE subject ='"+subjectName+"' AND academic_year='"+academicYr+"' AND fk_teacher_id="+fkTeacher+"  AND fk_class_id="+fkClass+" AND fk_division_id="+fkDiv+"");

	if (rs.next()) {
	/* image = rs.getBlob(1);
	imgData = image.getBytes(1,(int)image.length());
	System.out.println("Image data ="+imgData); */
	System.out.println("in rs.next()");
		sos.write(rs.getBytes("syllabus_uploaded_file"));
	} 
	else {
	out.println("Display Blob Example");
	out.println("image not found for given id>");
	System.out.println("in else part");
	return;
}


// display the image
 	
	
	//OutputStream o = response.getOutputStream();
	//sos.write(imgData);
	sos.flush();
	sos.close();
	} 
catch (Exception e) {
	System.out.println("in catch 1st block");
	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	
	return;
} 


finally {

try {
	rs.close();
	stmt.close();
	con.close();
	System.out.println("in finally block");
	} catch (SQLException e) {
	e.printStackTrace();
	System.out.println("in 2nd catch block");
}
}

%> 



<%-- <%@page import="com.srb.utility.RetrieveImage"%>

<html>

	<head>

		<title>This is the date example</title>

	</head>

	<body>

	<% RetrieveImage demo = new RetrieveImage();

	demo.doPost(request, response);

	%>

	</body>

</html> --%>