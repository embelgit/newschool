  <%@page import="org.hibernate.Hibernate"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>

<%@ page import="java.sql.*"%>


<%@ page import="java.io.*"%>


<% 

	Blob image = null;
	Connection con = null;
	byte[ ] imgData = null ;
	Statement stmt = null;
	ResultSet rs = null;

try {
	//HttpSession sessionToViewTask = request.getSession();
		String subjectName = (String)session.getAttribute("subjectToViewTask");
		String academicYr = (String)session.getAttribute("academicYearToViewTask");
		Long fkTeacher = (Long)session.getAttribute("fkteacheridToViewTask");
		Long fkClass = (Long)session.getAttribute("fkClassIdToViewTask");
		Long fkDiv = (Long)session.getAttribute("fkDivisionIdToViewTask");
		System.out.println("subjectName"+subjectName);
		System.out.println("academicYr"+academicYr);
		System.out.println("fkTeacher"+fkTeacher);
		System.out.println("fkClass"+fkClass);
		System.out.println("fkDiv"+fkDiv);

		Document document = new Document();	
		
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
	stmt = con.createStatement();
	rs = stmt.executeQuery("SELECT image from teacher_daily_task WHERE subject ='"+subjectName+"' AND academic_year='"+academicYr+"' AND fk_teacher_id="+fkTeacher+"  AND fk_class_id="+fkClass+" AND fk_division_id="+fkDiv+"");
	//rs = stmt.executeQuery("select image from teacher_daily_task where id = 1");
	if (rs.next()) {
	//image = rs.getBlob(1);
	//imgData = image.getBytes(1,(int)image.length());
	
	imgData = rs.getBytes("image");
	System.out.println(imgData);
	response.setHeader("expires", "0");
	response.setContentType("image/jpg");
	//File file = new File("image");
	//FileInputStream f = new FileInputStream(file);
	//f.read(imgData); 
	 FileInputStream fileInputStream = new FileInputStream("image");
		    fileInputStream.read(imgData);

	//Blob photo = Hibernate.createBlob(imgData);
		
	//FileOutputStream fileOutputStream = new FileOutputStream("F:/new.jpg");
	//fileOutputStream.write(imgData);

	InputStream in = new ByteArrayInputStream(imgData);
	BufferedImage bImageFromConvert = ImageIO.read(in);
	
	ImageIO.write(bImageFromConvert, "image", new File("E:/new.jpg")); 
	
	//Image i = Image.getInstance(imgData);
	//i.scaleAbsolute(300, 300);
	//Image imageCenter = Image.getInstance(i);
	//imageCenter.setAlignment(Image.ALIGN_CENTER);
	//document.add(imageCenter);
	
	System.out.println("Image data ="+imgData);
	fileInputStream.close();
	//fileOutputStream.close();
	} 
	else {
	out.println("Display Blob Example");
	out.println("image not found for given id>");
	return;
}


/* //convert byte array 

	InputStream in = new ByteArrayInputStream(imgData);
	BufferedImage bImageFromConvert = ImageIO.read(in);
	
	ImageIO.write(bImageFromConvert, "blob", new File("E:/new.jpg")); */	
	
// display the image
	//response.setContentType("image/gif");
	//OutputStream o = response.getOutputStream();
	//o.write(imgData);
	//o.flush();
	//o.close(); 
	
	
	} 
catch (Exception e) {

	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	return;
} 


finally {

try {
	rs.close();
	stmt.close();
	con.close();

	} catch (SQLException e) {
	e.printStackTrace();
}
	//out.clear();
	//out = pageContext.pushBody();
}

%> 
<%--  <html>
<body>
    <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="com.mysql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="true"%>
 <%@ page import="java.sql.*"%>
<% 
Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String iurl1=null;

try {
	
	//HttpSession sessionToViewTask = request.getSession();
			String subjectName = (String)session.getAttribute("subjectToViewTask");
			String academicYr = (String)session.getAttribute("academicYearToViewTask");
			Long fkTeacher = (Long)session.getAttribute("fkteacheridToViewTask");
			Long fkClass = (Long)session.getAttribute("fkClassIdToViewTask");
			Long fkDiv = (Long)session.getAttribute("fkDivisionIdToViewTask");
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
stmt = con.createStatement();
//rs = stmt.executeQuery("select * from tablename where id = 1");
rs = stmt.executeQuery("SELECT image from teacher_daily_task WHERE subject ='"+subjectName+"' AND academic_year='"+academicYr+"' AND fk_teacher_id="+fkTeacher+"  AND fk_class_id="+fkClass+" AND fk_division_id="+fkDiv+"");

%>
<table border="2">
<tr><th>DISPLAYING IMAGE</th></tr>
<tr><td>Image 2</td></tr>
<tr><td>
<%while(rs.next()){%>
 <img src="<%=rs.getString("image") %>" width="500" height="500"/>
 <%}%>
</td></tr>
</table>
<%}
catch (Exception e) {
out.println("DB problem"); 
return;
}
finally {
try {
rs.close();
stmt.close();
con.close();
}
catch (SQLException e) {
e.printStackTrace();
}
}
%>
</body>
</html> --%>
 
<%-- <%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try {
	//HttpSession sessionToViewTask = request.getSession();
			String subjectName = (String)session.getAttribute("subjectToViewTask");
			String academicYr = (String)session.getAttribute("academicYearToViewTask");
			Long fkTeacher = (Long)session.getAttribute("fkteacheridToViewTask");
			Long fkClass = (Long)session.getAttribute("fkClassIdToViewTask");
			Long fkDiv = (Long)session.getAttribute("fkDivisionIdToViewTask");


Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://192.168.0.118:3306/school","root","root");
								  
stmt = con.createStatement();

//rs = stmt.executeQuery("select image from inimage where id = '6'");
rs = stmt.executeQuery("SELECT image from teacher_daily_task WHERE subject ='"+subjectName+"' AND academic_year='"+academicYr+"' AND fk_teacher_id="+fkTeacher+"  AND fk_class_id="+fkClass+" AND fk_division_id="+fkDiv+"");


if (rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());
System.out.println("Image data ="+imgData);

} else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}

// display the image 

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%> --%> 

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