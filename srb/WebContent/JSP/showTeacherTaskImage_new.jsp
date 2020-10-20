  <%@page import="java.awt.Image"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>

<%@page import="javax.imageio.ImageReadParam"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.imageio.ImageIO"%>
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

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
	stmt = con.createStatement();
	rs = stmt.executeQuery("SELECT image from teacher_daily_task WHERE subject ='"+subjectName+"' AND academic_year='"+academicYr+"' AND fk_teacher_id="+fkTeacher+"  AND fk_class_id="+fkClass+" AND fk_division_id="+fkDiv+"");
	//rs = stmt.executeQuery("select image from teacher_daily_task where id = 1");
	if (rs.next()) {
	image = rs.getBlob(1);
	imgData = image.getBytes(1,(int)image.length());
	
	 ByteArrayInputStream bis = new ByteArrayInputStream(imgData);
     Iterator<?> readers = ImageIO.getImageReadersByFormatName("jpg");

     //ImageIO is a class containing static methods for locating ImageReaders
     //and ImageWriters, and performing simple encoding and decoding. 

     ImageReader reader = (ImageReader) readers.next();
     Object source = bis; 
     ImageInputStream iis = ImageIO.createImageInputStream(source); 
     reader.setInput(iis, true);
     ImageReadParam param = reader.getDefaultReadParam();

     Image image2 = reader.read(0, param);
   //got an image file
     
     BufferedImage bufferedImage = new BufferedImage(image2.getWidth(null), image2.getHeight(null), BufferedImage.TYPE_INT_RGB);
     //bufferedImage is the RenderedImage to be written

     Graphics2D g2 = bufferedImage.createGraphics();
     g2.drawImage(image2, null, null);
     
     File imageFile = new File("F:\\newrose2.jpg");
     ImageIO.write(bufferedImage, "jpg", imageFile);

     System.out.println(imageFile.getPath());
     
	System.out.println("Image data ="+imgData);
	} 
	else {
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