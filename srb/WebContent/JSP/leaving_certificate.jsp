
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
<%@page import="com.sun.javafx.geom.Edge"%>
<%@page import="javafx.scene.shape.Circle"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.srb.utility.DigitToWords"%>
<%@page import="com.srb.utility.NumToWord"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>

<%@ page trimDirectiveWhitespaces="true"%>

<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.List"%>

<%@ page import="com.itextpdf.text.Element"%>
<%--  <%@page import="com.itextpdf.text.log.SysoLogger"%> --%>
<%@page import="java.util.List"%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>

<%
	response.setContentType("application/pdf");
	Connection conn = null;
	double totalAnnualFee = 0.0;
	double remainingFee = 0.0;
	int grandTotalMarks= 0;
	int obtained_marks =0;
	String acdemicYear = null;
	try {
		
		Long lcNumberForLC = (Long)session.getAttribute("lcNumberForLC");
		Long studentId = (Long)session.getAttribute("studentIdForLC");
		System.out.println("studentId - "+studentId);
		String idMarks = (String)session.getAttribute("idMarksForLC");
		String reason = (String)session.getAttribute("reasonForLC");
		String promotion = (String)session.getAttribute("promotionForLC");
		String progress = (String)session.getAttribute("progressForLC");
		String conduct = (String)session.getAttribute("conductForLC");
		String dateOfLeaving = (String)session.getAttribute("dateOfLeavingForLC");;
		String attendance = (String)session.getAttribute("attendance");
		String workingday = (String)session.getAttribute("workingday");
		// step 1
		
/* 		Rectangle layout = new Rectangle(PageSize.A4);
//	    layout.setBackgroundColor(new BaseColor(100, 200, 180)); //Background color
//	    layout.setBorderColor(BaseColor.DARK_GRAY);  //Border color
	    layout.setBorder(1);  */
/* 	    PdfContentByte cb = writer.getDirectContent();
	    Rectangle pageSize = writer.getPageSize();
	    cb.rectangle(pageSize.left() + 3, pageSize.bottom() + 3,
	      pageSize.width() - 6, pageSize.height() - 6);
	  		cb.stroke(); */

		Document document = new Document(PageSize.A4,10,10,10,5);
////		Border b1 = new DashedBorder(Color.RED, 3);
		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());
		
		// step 3
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT country,first_name,middle_name,last_name,general_reg_number,mother_name,cast,sub_cast,birth_place,previous_school_name,date_of_admission,date_of_birth,student_serial_number,stud_serial_id_number,c.class_name AS className,aadhar_number,father_name,gender,stud_serial_id_number,mothertongue,birth_tal,birth_dist,birth_country FROM student_master LEFT JOIN class_master c on fk_class_id=c.pk_class_id WHERE pk_student_id="+studentId);
	/* 	while (rs.next()) {
			acdemicYear = rs.getString("academic_year");
		} */
		int size= 0;
		if (rs != null)   
		{  
		  rs.beforeFirst();  
		  rs.last();  
		  size = rs.getRow();  
		} 
		System.out.println("Query Execute size ++"+size);
		rs.first();
		
	//	public static final String FONtT = "/home/Documents/Lohit-Devanagari.ttf";
	//    private static String aa = "/home/Documents/MarathiPdf.pdf";
		
		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate);

		String stdver1 = (String) sdf.format(d1);
		String day = sdf1.format(d1.getDate());
		String Time = sdf2.format(d1.getTime());
		String dtfinl = stdver1;

		DecimalFormat df = new DecimalFormat("#.00");

		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		
		Font fontred = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.RED);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font Normalfont9 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		

		// step 4

		//first table
		PdfPTable tableFirst = new PdfPTable(1);
		tableFirst.setWidthPercentage(100);

		float[] columnWidthsFirst = {0.5f};
		tableFirst.setWidths(columnWidthsFirst);

		PdfPCell table_cellFirst;
		
	/*	table_cellFirst = new PdfPCell(new Phrase("No.Maha/453/2004 Ned", Normalfont11));
		table_cellFirst.setBorder(table_cellFirst.NO_BORDER);
		tableFirst.addCell(table_cellFirst);
		document.add(tableFirst);*/

		
		//second table
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.1f, 0.5f, 0.1f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
	//	table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setBorderWidth(1f);
			table_cell.setBorderColor(BaseColor.RED);
		table_cell.setBorder(Rectangle.LEFT | Rectangle.TOP);
		table_cell.setPaddingLeft(50f);
		table_cell.setPaddingRight(50f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Godavari Manar Charitable Trust's"));
//		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	 	table_cell.setBorder(Rectangle.TOP);
/*		table_cell.setPaddingLeft(50f);
		table_cell.setPaddingRight(50f); */
	//	table_cell.setPaddingLeft(50f);
		table.addCell(table_cell);
	 	
		/* table_cell = new PdfPCell(new Phrase("Academic Year :"+acdemicYear, Normalfont11)); */
		table_cell = new PdfPCell(new Phrase());
	//	table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP);
		table_cell.setPaddingLeft(50f);
		table_cell.setPaddingRight(50f); 
		table.addCell(table_cell);

		//-----------------

		table_cell = new PdfPCell(new Phrase("", Normalfont11));
//		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT);
		table.addCell(table_cell);
		String classs = rs.getString("className");
		if(classs.equals("11th") || classs.equals("12th")){
			table_cell = new PdfPCell(new Phrase("GODAVARI MANAR PUBLIC SCHOOL & JUNIOR COLLEGE, SHANKARNAGAR", font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(table_cell);
		}
		else if(classs.equals("8th") || classs.equals("9th") || classs.equals("10th")){
			table_cell = new PdfPCell(new Phrase("GODAVARI MANAR PUBLIC HIGH SCHOOL, SHANKARNAGAR", font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
	/* 		table_cell.setBorderWidth(1f);
			table_cell.setBorderColor(BaseColor.RED);
 			table_cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT); */
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	//		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell.setPaddingLeft(50f);
			table_cell.setPaddingRight(50f);
			table.addCell(table_cell);
		}
		else{
		table_cell = new PdfPCell(new Phrase("GODAVARI MANAR PUBLIC SCHOOL, SHANKARNAGAR (PRIMARY)", font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		}
		table_cell = new PdfPCell();
	//	table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setBorderWidth(1f);
			table_cell.setBorderColor(BaseColor.RED);
 			table_cell.setBorder(Rectangle.RIGHT);
		
		table.addCell(table_cell);

		//--------

		table_cell = new PdfPCell(new Phrase(""));
//		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Tal: Biloli, Dist: Nanded-431736. (MAHARASHTRA) Email: gmps123@gmail.com", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	//	table_cell.setPaddingLeft(-1f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
//		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.RIGHT);
		table.addCell(table_cell);

		
		//
		table_cell = new PdfPCell(new Phrase(""));
//		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("(NOTE : Change in an entry is to be made except by the authority issuing the School Leaving-",Normalfont10));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	//	table_cell.setPaddingLeft(-1f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
	//	table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.RIGHT);
		table.addCell(table_cell);
		
		//
		
		//
		table_cell = new PdfPCell(new Phrase(""));
	//	table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Certificate. Any infringement of the rule will be Punished with rustication.)",Normalfont10));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	//	table_cell.setPaddingLeft(-1f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
	//	table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.RIGHT);
		table.addCell(table_cell);
		//
		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
	//	table_cell.setBorder(table_cell.NO_BORDER);
				table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT);
		table.addCell(table_cell);

		String clss = rs.getString("className");
		if(clss.equals("11th") || clss.equals("12th")){
		table_cell = new PdfPCell(new Phrase("College Reg.No.:HSC-1713(323/13) Higher Secondary Education-1 Dr. 17.07.2013 U-DISE Code:27150807403",Normalfont9));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table.addCell(table_cell);
		}
		else if(clss.equals("8th") || clss.equals("9th") || clss.equals("10th")){
			table_cell = new PdfPCell(new Phrase("School Registration No.:(Namasha/1099/678/.99/Ma.Shi.-1 dated- 1-02-1999) U-DISE Code:27150807403",Normalfont9));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(table_cell);
		}
		else {
			table_cell = new PdfPCell(new Phrase("(School Registration No.:(V.L.S/1089/4665/ P.E.E. Dated : 05-10-1989  U-DISE Code:27150807403",Normalfont9));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(table_cell);
		}
		/* table_cell = new PdfPCell(new Phrase("Academic Year :"+acdemicYear, Normalfont11)); */
		table_cell = new PdfPCell(new Phrase());
	//	table_cell.setBorder(table_cell.NO_BORDER);
				table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.RIGHT);
		table.addCell(table_cell);
		//-------------

		//String examName = rs.getString("exam_name");
		
		table_cell = new PdfPCell();
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
		table_cell.setPaddingBottom(10f);
//		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("LEAVING CERTIFICATE", font15Bold));
/* 		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT); */
 		table_cell.setBorderWidth(1f);
 		table_cell.setPaddingBottom(15f);
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setBorderColor(BaseColor.RED);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorderWidth(1f);
		table_cell.setBorderColor(BaseColor.RED);
 		table_cell.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
		table_cell.setPaddingBottom(10f);
	//	table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		document.add(table);

		//third table for note
		PdfPTable tableThird = new PdfPTable(4);
		tableThird.setWidthPercentage(100);

		float[] columnWidthsThird = {0.35f,0.55f,0.15f,0.20f};
		tableThird.setWidths(columnWidthsThird);

		PdfPCell table_cellThird;
		String grNumberr = rs.getString("general_reg_number");
		table_cellThird = new PdfPCell(new Phrase("Reg. No. of the Pupil :   ", font13));
		table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorderWidth(1f);
		table_cellThird.setBorderColor(BaseColor.RED);
		table_cellThird.setBorder(Rectangle.LEFT);
		table_cellThird.setPaddingLeft(10f);
		//	table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase(grNumberr));
		table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase("Medium :", font13));
		table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase("English"));
		table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
//		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cellThird.setBorderWidth(1f);
		table_cellThird.setBorderColor(BaseColor.RED);
		table_cellThird.setBorder(Rectangle.RIGHT);
		tableThird.addCell(table_cellThird);
		
//		PdfPCell table_cellThird;
	
	/* 		table_cellThird = new PdfPCell(new Phrase("Adhaar No. ", font13));
			table_cellThird.setPaddingBottom(6f);
			table_cellThird.setBorder(Rectangle.BOTTOM);
			tableThird.addCell(table_cellThird); */
		
//		PdfPCell table_cellThird;
/* 		String addd = rs.getString("aadhar_number");
		table_cellThird = new PdfPCell(new Phrase(addd, font13));
		table_cellThird.setPaddingBottom(6f);
		table_cellThird.setBorder(Rectangle.BOTTOM);
		tableThird.addCell(table_cellThird); */
		
		document.add(tableThird);
		
		PdfPTable tableFour = new PdfPTable(2);
		tableFour.setWidthPercentage(100);

		float[] columnWidthsFour = {0.25f,0.65f};
		tableFour.setWidths(columnWidthsFour);

		PdfPCell table_cellFour;
		String addd = rs.getString("aadhar_number");
	//	String grNumberr = rs.getString("general_reg_number");
		table_cellFour = new PdfPCell(new Phrase("UID No. (Aadhar No.) :  ", font13));
		table_cellFour.setPaddingBottom(10f);
//		table_cellFour.setBorder(table_cellFour.NO_BORDER);
		table_cellFour.setBorderWidth(1f);
		table_cellFour.setBorderColor(BaseColor.RED);
		table_cellFour.setBorder(Rectangle.LEFT);
		table_cellFour.setPaddingLeft(10f);
		tableFour.addCell(table_cellFour);
		
		table_cellFour = new PdfPCell(new Phrase(addd));
		table_cellFour.setPaddingBottom(10f);
//		table_cellFour.setBorder(table_cellFour.NO_BORDER);
		table_cellFour.setBorderWidth(1f);
		table_cellFour.setBorderColor(BaseColor.RED);
		table_cellFour.setBorder(Rectangle.RIGHT);
		tableFour.addCell(table_cellFour);
		
		document.add(tableFour);		

		
		PdfPTable tableabc = new PdfPTable(2);
		tableabc.setWidthPercentage(100);

		float[] columnWidthsabc = {0.25f,0.70f};
		tableabc.setWidths(columnWidthsabc);

		String stu = rs.getString("stud_serial_id_number");
		PdfPCell table_cellabc;
		table_cellabc = new PdfPCell(new Phrase("Saral ID :  ", font13));
		table_cellabc.setPaddingBottom(10f);
//		table_cellabc.setBorder(Rectangle.BOTTOM);
		table_cellabc.setBorderWidth(1f);
		table_cellabc.setBorderColor(BaseColor.RED);
		table_cellabc.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
		table_cellabc.setPaddingLeft(10f);
		tableabc.addCell(table_cellabc);
		
		table_cellabc = new PdfPCell(new Phrase(stu));
		table_cellabc.setPaddingBottom(10f);
		table_cellabc.setBorderWidth(1f);
		table_cellabc.setBorderColor(BaseColor.RED);
		table_cellabc.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
//		table_cellabc.setBorder(Rectangle.BOTTOM);
		tableabc.addCell(table_cellabc);
		
		document.add(tableabc);	
		//		PdfPCell table_cellThird;
	
 		/* table_cellFour = new PdfPCell(new Phrase("Adhaar No. "+addd, font13));
		table_cellFour.setPaddingBottom(6f);
		table_cellFour.setBorder(Rectangle.BOTTOM);
		tableFour.addCell(table_cellFour);  */
		

		

		
		//fourth table for note
	/* 	PdfPTable tableForth = new PdfPTable(2);
		tableForth.setWidthPercentage(100);

		float[] columnWidthsFourth = {0.3f,0.3f};
		tableForth.setWidths(columnWidthsFourth);

		PdfPCell table_cellFourth;
		
		table_cellFourth = new PdfPCell(new Phrase("NO:- "+lcNumberForLC, font13));
		table_cellFourth.setBorder(table_cellFourth.NO_BORDER);
		table_cellFourth.setPaddingBottom(8f);
		tableForth.addCell(table_cellFourth);
		
		String grNumber = rs.getString("general_reg_number");
		table_cellFourth = new PdfPCell(new Phrase("Gen.Reg.No.:-  "+grNumber, font13));
		table_cellFourth.setBorder(table_cellFourth.NO_BORDER);
		table_cellFourth.setPaddingBottom(8f);
		tableForth.addCell(table_cellFourth);
		document.add(tableForth); */
		
		
		//fifth table for student detail
		//data from table
		String firstName  = rs.getString("first_name");
		String middleName  = rs.getString("middle_name");
		String lastName  = rs.getString("last_name");
		String fullName = firstName+" "+middleName+" "+lastName;
		
		PdfPTable tableFifth = new PdfPTable(2);
		tableFifth.setWidthPercentage(100);

		float[] columnWidthsFifth = {0.2f,0.4f};
		tableFifth.setWidths(columnWidthsFifth);

		PdfPCell table_cellFifth;
		
		
		table_cellFifth = new PdfPCell(new Phrase("1) Name of the Pupil in full :- ", font13));
//		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setBorderWidth(1f);
		table_cellFifth.setBorderColor(BaseColor.RED);
		table_cellFifth.setBorder(Rectangle.LEFT);
		table_cellFifth.setPaddingTop(10f);
		table_cellFifth.setPaddingBottom(10f);
		table_cellFifth.setPaddingLeft(10f);
		tableFifth.addCell(table_cellFifth);
		
		String gen = rs.getString("gender");
		if(gen.equals("Male")){	
		table_cellFifth = new PdfPCell(new Phrase("Master "+fullName, Normalfont13));
//		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setBorderWidth(1f);
		table_cellFifth.setBorderColor(BaseColor.RED);
		table_cellFifth.setBorder(Rectangle.RIGHT);
		table_cellFifth.setPaddingTop(10f);
		table_cellFifth.setPaddingBottom(10f);
		tableFifth.addCell(table_cellFifth);
	}
		else {
			table_cellFifth = new PdfPCell(new Phrase("Miss "+fullName, Normalfont13));
//			table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setBorderWidth(1f);
		table_cellFifth.setBorderColor(BaseColor.RED);
		table_cellFifth.setBorder(Rectangle.RIGHT);
			table_cellFifth.setPaddingTop(10f);
			table_cellFifth.setPaddingBottom(10f);
			tableFifth.addCell(table_cellFifth);
		}
		document.add(tableFifth);
		
		
		PdfPTable tableSi = new PdfPTable(4);
		tableSi.setWidthPercentage(100);

		float[] columnWidthsSi = {0.5f,0.5f,0.5f,0.5f};
		tableSi.setWidths(columnWidthsSi);

		PdfPCell table_cellSi;
		
		String f = rs.getString("father_name");
//		String mother_name  = rs.getString("mother_name");
		table_cellSi = new PdfPCell(new Phrase("Father's Name: ", font13));
		table_cellSi.setPaddingBottom(10f);
//		table_cellSi.setBorder(table_cellSi.NO_BORDER);
			table_cellSi.setBorderWidth(1f);
			table_cellSi.setBorderColor(BaseColor.RED);
			table_cellSi.setBorder(Rectangle.LEFT);
			table_cellSi.setPaddingLeft(10f);
//		table_cellSi.setPaddingBottom(8f);
		tableSi.addCell(table_cellSi);
		
		table_cellSi = new PdfPCell(new Phrase("Mr. "+f));
		table_cellSi.setPaddingBottom(10f);
		table_cellSi.setBorder(table_cellSi.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableSi.addCell(table_cellSi);
		
/* 		table_cellSi = new PdfPCell(new Phrase(f, Normalfont13));
		table_cellSi.setBorder(table_cellSi.NO_BORDER);
//		table_cellSi.setPaddingBottom(8f);
		tableSi.addCell(table_cellSi); */
		
		
		String mother_name  = rs.getString("mother_name");
		table_cellSi = new PdfPCell(new Phrase("Mother's Name: ", font13));
		table_cellSi.setPaddingBottom(10f);
		table_cellSi.setBorder(table_cellSi.NO_BORDER);
		tableFour.addCell(table_cellFour);
//		table_cellSi.setPaddingBottom(8f);
		tableSi.addCell(table_cellSi);
		
		table_cellSi = new PdfPCell(new Phrase("Mrs. "+mother_name));
		table_cellSi.setPaddingBottom(10f);
		table_cellSi.setBorderWidth(1f);
		table_cellSi.setBorderColor(BaseColor.RED);
		table_cellSi.setBorder(Rectangle.RIGHT);
		//		table_cellSi.setBorder(table_cellSi.NO_BORDER);
		tableSi.addCell(table_cellSi);
		
	/* 	table_cellSi = new PdfPCell(new Phrase(mother_name, Normalfont13));
		table_cellSi.setBorder(table_cellSi.NO_BORDER);
	//	table_cellSi.setPaddingBottom(8f);
		tableSi.addCell(table_cellSi);*/
		document.add(tableSi); 
		//-
		
		PdfPTable tablefix = new PdfPTable(6);
		tablefix.setWidthPercentage(100);

		float[] columnWidthsfix = {0.15f,0.10f,0.20f,0.100f,0.15f,0.100f};
		tablefix.setWidths(columnWidthsfix);

		PdfPCell table_cellfix;
		

		table_cellfix = new PdfPCell(new Phrase("2) Nationality:-  ", font13));
		table_cellfix.setPaddingBottom(10f);
//		table_cellfix.setBorder(table_cellSi.NO_BORDER);
			table_cellfix.setBorderWidth(1f);
			table_cellfix.setBorderColor(BaseColor.RED);
			table_cellfix.setBorder(Rectangle.LEFT);
			table_cellfix.setPaddingLeft(10f);
//			table_cellfix.setPaddingRight(10f);
	//		tablefix.addCell(table_cellfix);
		tablefix.addCell(table_cellfix);
		
		table_cellfix = new PdfPCell(new Phrase("Indian",font12BoldUnderline));
		table_cellfix.setPaddingBottom(10f);
		table_cellfix.setBorder(table_cellSi.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablefix.addCell(table_cellfix);
		
		table_cellfix = new PdfPCell(new Phrase("3) Mother Tongue:-  ", font13));
		table_cellfix.setPaddingBottom(10f);
		table_cellfix.setBorder(table_cellfix.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablefix.addCell(table_cellfix);
		
		String ma = rs.getString("mothertongue");
		table_cellfix = new PdfPCell(new Phrase(ma));
		table_cellfix.setPaddingBottom(10f);
		table_cellfix.setBorder(table_cellfix.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablefix.addCell(table_cellfix);
		
		
		table_cellfix = new PdfPCell(new Phrase("4) Religion:- ", font13));
		table_cellfix.setPaddingBottom(10f);
		table_cellfix.setBorder(table_cellfix.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		tablefix.addCell(table_cellfix);
		
		table_cellfix = new PdfPCell(new Phrase(" Hindu"));
		table_cellfix.setPaddingBottom(10f);
		table_cellfix.setBorderWidth(1f);
		table_cellfix.setBorderColor(BaseColor.RED);
		table_cellfix.setBorder(Rectangle.RIGHT);
	//	table_cellfix.setPaddingRight(10f);
		//		table_cellfix.setBorder(table_cellfix.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablefix.addCell(table_cellfix);

		document.add(tablefix); 
		//==--
		PdfPTable tableaa = new PdfPTable(4);
		tableaa.setWidthPercentage(100);

		float[] columnWidthsaa = {0.60f,0.60f,0.30f,0.80f};
		tableaa.setWidths(columnWidthsaa);

		PdfPCell table_cellaa;
		

		table_cellaa = new PdfPCell(new Phrase("5) Cast:-  ", font13));
		table_cellaa.setPaddingBottom(10f);
		table_cellaa.setBorderWidth(1f);
		table_cellaa.setBorderColor(BaseColor.RED);
		table_cellaa.setBorder(Rectangle.LEFT);
		table_cellaa.setPaddingLeft(10f);
		//		table_cellaa.setBorder(table_cellaa.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableaa.addCell(table_cellaa);
		
		String castt  = rs.getString("cast");		
		table_cellaa = new PdfPCell(new Phrase(castt));
		table_cellaa.setPaddingBottom(10f);
		table_cellaa.setBorder(table_cellaa.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableaa.addCell(table_cellaa);
		

		table_cellaa = new PdfPCell(new Phrase("Sub-cast:-  ", font13));
		table_cellaa.setPaddingBottom(10f);
		table_cellaa.setBorder(table_cellaa.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableaa.addCell(table_cellaa);
		
		String subCastt  = rs.getString("sub_cast");
		table_cellaa = new PdfPCell(new Phrase(subCastt));
		table_cellaa.setPaddingBottom(10f);
		table_cellaa.setBorderWidth(1f);
		table_cellaa.setBorderColor(BaseColor.RED);
		table_cellaa.setBorder(Rectangle.RIGHT);
		//		table_cellaa.setBorder(table_cellaa.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableaa.addCell(table_cellaa);
		document.add(tableaa); 		
		//-
		//
		PdfPTable tablebb = new PdfPTable(4);
		tablebb.setWidthPercentage(100);

//		float[] columnWidthsbb = {0.20f,0.10f,0.10f,0.10f,0.10f,0.10f,0.10f,0.10f};
		float[] columnWidthsbb = {0.60f,0.60f,0.30f,0.80f};
		tablebb.setWidths(columnWidthsbb);

		PdfPCell table_cellbb;
		
		String birthpla  = rs.getString("birth_place");
		table_cellbb = new PdfPCell(new Phrase("6) Place of Birth:-  ", font13));
		table_cellbb.setPaddingBottom(8f);
		table_cellbb.setBorderWidth(1f);
		table_cellbb.setBorderColor(BaseColor.RED);
		table_cellbb.setBorder(Rectangle.LEFT);
		table_cellbb.setPaddingLeft(10f);
		//		table_cellbb.setBorder(table_cellbb.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablebb.addCell(table_cellbb);
		

		table_cellbb = new PdfPCell(new Phrase(birthpla));
		table_cellbb.setPaddingBottom(8f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablebb.addCell(table_cellbb);
		

		table_cellbb = new PdfPCell(new Phrase("Taluka -  ", font13));
		table_cellbb.setPaddingBottom(8f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tablebb.addCell(table_cellbb);
		
		String tal = rs.getString("birth_tal");
		table_cellbb = new PdfPCell(new Phrase(tal));
		table_cellbb.setPaddingBottom(8f);
		table_cellbb.setBorderWidth(1f);
		table_cellbb.setBorderColor(BaseColor.RED);
		table_cellbb.setBorder(Rectangle.RIGHT);
		//		table_cellbb.setBorder(table_cellbb.NO_BORDER);
		tablebb.addCell(table_cellbb);
		
		/*
		table_cellbb = new PdfPCell(new Phrase("Dist.-  ", font13));
		table_cellbb.setPaddingBottom(10f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);

		tablebb.addCell(table_cellbb);
		

		table_cellbb = new PdfPCell(new Phrase("Nanded"));
		table_cellbb.setPaddingBottom(10f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);

		tablebb.addCell(table_cellbb);
		
		table_cellbb = new PdfPCell(new Phrase("Country.-  ", font13));
		table_cellbb.setPaddingBottom(10f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);
		tablebb.addCell(table_cellbb);
		

		table_cellbb = new PdfPCell(new Phrase("India"));
		table_cellbb.setPaddingBottom(10f);
		table_cellbb.setBorder(table_cellbb.NO_BORDER);

		tablebb.addCell(table_cellbb); */
		document.add(tablebb); 
		//-- 
		PdfPTable tablebbb = new PdfPTable(4);
		tablebbb.setWidthPercentage(100);

//		float[] columnWidthsbb = {0.20f,0.10f,0.10f,0.10f,0.10f,0.10f,0.10f,0.10f};
		float[] columnWidthsbbb = {0.60f,0.60f,0.30f,0.80f};
		tablebbb.setWidths(columnWidthsbbb);

		PdfPCell table_cellbbb;
		table_cellbbb = new PdfPCell(new Phrase("District -  ", font13));
		table_cellbbb.setPaddingBottom(8f);
		table_cellbbb.setBorderWidth(1f);
		table_cellbbb.setBorderColor(BaseColor.RED);
		table_cellbbb.setBorder(Rectangle.LEFT);
		table_cellbbb.setPaddingLeft(10f);
		//		table_cellbbb.setBorder(table_cellbbb.NO_BORDER);
		tablebbb.addCell(table_cellbbb);
		
		String dist = rs.getString("birth_dist");
		table_cellbbb = new PdfPCell(new Phrase(dist));
		table_cellbbb.setPaddingBottom(8f);
		table_cellbbb.setBorder(table_cellbbb.NO_BORDER);
		tablebbb.addCell(table_cellbbb);
		
		table_cellbbb = new PdfPCell(new Phrase("Country -  ", font13));
		table_cellbbb.setPaddingBottom(8f);
		table_cellbbb.setBorder(table_cellbbb.NO_BORDER);
		tablebbb.addCell(table_cellbbb);
		
		String coun = rs.getString("birth_country");
		table_cellbbb = new PdfPCell(new Phrase(coun,font12BoldUnderline));
		table_cellbbb.setPaddingBottom(8f);
//		table_cellbbb.setBorder(table_cellbbb.NO_BORDER);
		table_cellbbb.setBorderWidth(1f);
		table_cellbbb.setBorderColor(BaseColor.RED);
		table_cellbbb.setBorder(Rectangle.RIGHT);
//		table_cellbbb.setPaddingLeft(10f);
		tablebbb.addCell(table_cellbbb);
		document.add(tablebbb); 
		
		//---
		String dob  = rs.getString("date_of_birth");
		String[] words=dob.split("-");
		String year = words[0];
		String month = words[1];
		String date = words[2];
		String birthDate = date+"/"+month+"/"+year;
		
		PdfPTable tableth = new PdfPTable(2);
		tableth.setWidthPercentage(100);

		float[] columnWidthsth = {0.2f,0.4f};
		tableth.setWidths(columnWidthsth);

		PdfPCell table_cellth;
		
		
		table_cellth = new PdfPCell(new Phrase("7) Date Of Birth month & year : ", font13));
	//	table_cellth.setBorder(table_cellth.NO_BORDER);
		table_cellth.setPaddingBottom(10f);
		table_cellth.setBorderWidth(1f);
		table_cellth.setBorderColor(BaseColor.RED);
		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth.setPaddingLeft(10f);
		tableth.addCell(table_cellth);
		
		table_cellth = new PdfPCell(new Phrase(birthDate));
//		table_cellth.setBorder(table_cellth.NO_BORDER);
		table_cellth.setPaddingBottom(10f);
		table_cellth.setBorderWidth(1f);
		table_cellth.setBorderColor(BaseColor.RED);
		table_cellth.setBorder(Rectangle.RIGHT);
//		table_cellth.setPaddingLeft(10f);
		tableth.addCell(table_cellth);
		document.add(tableth);
		//--
		Double dat = Double.parseDouble(date);
		long totalInLong = Math.round(dat);
		String grossTotal = String.valueOf(totalInLong);
		int grossTotalInInteger = Integer.parseInt(grossTotal);
		NumToWord w = new NumToWord();
		String amtInWord = w.convert(grossTotalInInteger);
		
		
		Double mon = Double.parseDouble(month);
		long totalIn = Math.round(mon);
		String grossTot = String.valueOf(totalIn);
		int grossTotalInInt = Integer.parseInt(grossTot);
		NumToWord wa = new NumToWord();
		String amtInWords = wa.convert(grossTotalInInt);
		
		Double yearr = Double.parseDouble(year);
		long totalInn = Math.round(yearr);
		String grossTott = String.valueOf(totalInn);
		int grossTotalInIntt = Integer.parseInt(grossTott);
		NumToWord waa = new NumToWord();
		String amtInWordss = wa.convert(grossTotalInIntt);
		
		PdfPTable tablethh = new PdfPTable(2);
		tablethh.setWidthPercentage(100);

		float[] columnWidthsthh = {0.2f,0.4f};
		tablethh.setWidths(columnWidthsthh);

		PdfPCell table_cellthh;
		
		
		table_cellthh = new PdfPCell(new Phrase("Date Of Birth in words : ", font13));
//		table_cellthh.setBorder(table_cellthh.NO_BORDER);
		table_cellthh.setPaddingBottom(10f);
		table_cellthh.setBorderWidth(1f);
		table_cellthh.setBorderColor(BaseColor.RED);
		table_cellthh.setBorder(Rectangle.LEFT);
		table_cellthh.setPaddingLeft(10f);
		tablethh.addCell(table_cellthh);
		
		table_cellthh = new PdfPCell(new Phrase(amtInWord+" "+amtInWords+" "+amtInWordss+"."));
//		table_cellthh.setBorder(table_cellthh.NO_BORDER);
		table_cellthh.setPaddingBottom(10f);
		table_cellthh.setBorderWidth(1f);
		table_cellthh.setBorderColor(BaseColor.RED);
		table_cellthh.setBorder(Rectangle.RIGHT);
//		table_cellth.setPaddingLeft(10f);
		tablethh.addCell(table_cellthh);
		document.add(tablethh);
		
		
		//--
		PdfPTable tablethe = new PdfPTable(2);
		tablethe.setWidthPercentage(100);

		float[] columnWidthsthe = {0.2f,0.4f};
		tablethe.setWidths(columnWidthsthe);

		PdfPCell table_cellthe;
		
		String lastSchooll  = rs.getString("previous_school_name");
		table_cellthe = new PdfPCell(new Phrase("8) Last School Attended : ", font13));
//		table_cellthe.setBorder(table_cellthe.NO_BORDER);
		table_cellthe.setBorderWidth(1f);
		table_cellthe.setBorderColor(BaseColor.RED);
		table_cellthe.setBorder(Rectangle.LEFT);
		table_cellthe.setPaddingLeft(10f);
		table_cellthe.setPaddingBottom(1f);
		tablethe.addCell(table_cellthe);
		
		table_cellthe = new PdfPCell(new Phrase(lastSchooll));
	//	table_cellthe.setBorder(table_cellthe.NO_BORDER);
		table_cellthe.setPaddingBottom(10f);
		table_cellthe.setBorderWidth(1f);
		table_cellthe.setBorderColor(BaseColor.RED);
		table_cellthe.setBorder(Rectangle.RIGHT);
//		table_cellthh.setPaddingLeft(10f);
		tablethe.addCell(table_cellthe);
		document.add(tablethe);
		//
		PdfPTable tablethee = new PdfPTable(2);
		tablethee.setWidthPercentage(100);

		float[] columnWidthsthee = {0.2f,0.4f};
		tablethee.setWidths(columnWidthsthee);

		PdfPCell table_cellthee;
		String doaa  = rs.getString("date_of_admission");
		String[] addde =doaa.split("-");
		String year11 = addde[0];
		String month11 = addde[1];
		String date11 = addde[2];
		String addDatee = date11+"/"+month11+"/"+year11;
		
		table_cellthee = new PdfPCell(new Phrase("9) Date of Admission : ", font13));
	//	table_cellthee.setBorder(table_cellthee.NO_BORDER);
		table_cellthee.setPaddingBottom(10f);
		table_cellthee.setBorderWidth(1f);
		table_cellthee.setBorderColor(BaseColor.RED);
		table_cellthee.setBorder(Rectangle.LEFT);
		table_cellthee.setPaddingLeft(10f);
		tablethee.addCell(table_cellthee);
		
		table_cellthee = new PdfPCell(new Phrase(addDatee));
//		table_cellthee.setBorder(table_cellthee.NO_BORDER);
		table_cellthee.setPaddingBottom(10f);
		table_cellthee.setBorderWidth(1f);
		table_cellthee.setBorderColor(BaseColor.RED);
		table_cellthee.setBorder(Rectangle.RIGHT);
//		table_cellthee.setPaddingLeft(10f);
		tablethee.addCell(table_cellthee);
		document.add(tablethee);
		//-
		PdfPTable tabletheea = new PdfPTable(2);
		tabletheea.setWidthPercentage(100);

		float[] columnWidthstheea = {0.2f,0.4f};
		tabletheea.setWidths(columnWidthstheea);

		PdfPCell table_celltheea;
		
		table_celltheea = new PdfPCell(new Phrase("10) Progress : ", font13));
//		table_celltheea.setBorder(table_celltheea.NO_BORDER);
		table_celltheea.setPaddingBottom(10f);
		table_celltheea.setBorderWidth(1f);
		table_celltheea.setBorderColor(BaseColor.RED);
		table_celltheea.setBorder(Rectangle.LEFT);
		table_celltheea.setPaddingLeft(10f);
		tabletheea.addCell(table_celltheea);
		
		table_celltheea = new PdfPCell(new Phrase(progress));
//		table_celltheea.setBorder(table_celltheea.NO_BORDER);
		table_celltheea.setPaddingBottom(10f);
		table_celltheea.setBorderWidth(1f);
		table_celltheea.setBorderColor(BaseColor.RED);
		table_celltheea.setBorder(Rectangle.RIGHT);
//		table_celltheea.setPaddingLeft(10f);
		tabletheea.addCell(table_celltheea);
		document.add(tabletheea);
		//-
		PdfPTable tablete = new PdfPTable(2);
		tablete.setWidthPercentage(100);

		float[] columnWidthste = {0.2f,0.4f};
		tablete.setWidths(columnWidthste);

		PdfPCell table_cellte;
		
		table_cellte = new PdfPCell(new Phrase("11) Conduct : ", font13));
//		table_cellte.setBorder(table_cellte.NO_BORDER);
		table_cellte.setPaddingBottom(10f);
		table_cellte.setBorderWidth(1f);
		table_cellte.setBorderColor(BaseColor.RED);
		table_cellte.setBorder(Rectangle.LEFT);
		table_cellte.setPaddingLeft(10f);
		tablete.addCell(table_cellte);
		
		table_cellte = new PdfPCell(new Phrase(conduct));
//		table_cellte.setBorder(table_cellte.NO_BORDER);
		table_cellte.setPaddingBottom(10f);
		table_cellte.setBorderWidth(1f);
		table_cellte.setBorderColor(BaseColor.RED);
		table_cellte.setBorder(Rectangle.RIGHT);
//		table_cellte.setPaddingLeft(10f);
		tablete.addCell(table_cellte);
		document.add(tablete);
		//
		
		PdfPTable tabletab = new PdfPTable(2);
		tabletab.setWidthPercentage(100);

		float[] columnWidthstab = {0.30f,0.2f};
		tabletheea.setWidths(columnWidthstab);

		PdfPCell table_celltab;
		
		table_celltab = new PdfPCell(new Phrase("12) Date of Leaving School : ", font13));
//		table_celltab.setBorder(table_celltab.NO_BORDER);
		table_celltab.setPaddingBottom(10f);
		table_celltab.setBorderWidth(1f);
		table_celltab.setBorderColor(BaseColor.RED);
		table_celltab.setBorder(Rectangle.LEFT);
		table_celltab.setPaddingLeft(10f);
		tabletab.addCell(table_celltab);
		
		String[] leacingDate =dateOfLeaving.split("-");
		String year2 = leacingDate[0];
		String month2 = leacingDate[1];
		String date2 = leacingDate[2];
		String leaveDate = date2+"/"+month2+"/"+year2;
		
		table_celltab = new PdfPCell(new Phrase(leaveDate));
//		table_celltab.setBorder(table_celltab.NO_BORDER);
		table_celltab.setPaddingBottom(10f);
		table_celltab.setBorderWidth(1f);
		table_celltab.setBorderColor(BaseColor.RED);
		table_celltab.setBorder(Rectangle.RIGHT);
//		table_cellthh.setPaddingLeft(10f);
		tabletab.addCell(table_celltab);
		document.add(tabletab);
		//
		PdfPTable tabletabb = new PdfPTable(2);
		tabletabb.setWidthPercentage(100);

		float[] columnWidthstabb = {0.30f,0.2f};
		tabletheea.setWidths(columnWidthstabb);

		PdfPCell table_celltabb;
		
		table_celltabb = new PdfPCell(new Phrase("13) Standard in which studying and since when : ", font13));
//		table_celltabb.setBorder(table_celltabb.NO_BORDER);
		table_celltabb.setPaddingBottom(10f);
		table_celltabb.setBorderWidth(1f);
		table_celltabb.setBorderColor(BaseColor.RED);
		table_celltabb.setBorder(Rectangle.LEFT);
		table_celltabb.setPaddingLeft(10f);
		tabletabb.addCell(table_celltabb);
		
		table_celltabb = new PdfPCell(new Phrase(leaveDate));
//		table_celltabb.setBorder(table_celltabb.NO_BORDER);
		table_celltabb.setPaddingBottom(10f);
		table_celltabb.setBorderWidth(1f);
		table_celltabb.setBorderColor(BaseColor.RED);
		table_celltabb.setBorder(Rectangle.RIGHT);
//		table_celltabb.setPaddingLeft(10f);
		tabletabb.addCell(table_celltabb);
		document.add(tabletabb);
		//
		
		PdfPTable tabletabbe = new PdfPTable(2);
		tabletabbe.setWidthPercentage(100);

		float[] columnWidthstabbe = {0.30f,0.3f};
		tabletabbe.setWidths(columnWidthstabbe);

		PdfPCell table_celltabbe;
		
		table_celltabbe = new PdfPCell(new Phrase("14) Reason of leaving the school : ", font13));
//		table_celltabbe.setBorder(table_celltabbe.NO_BORDER);
		table_celltabbe.setPaddingBottom(10f);
		table_celltabbe.setBorderWidth(1f);
		table_celltabbe.setBorderColor(BaseColor.RED);
		table_celltabbe.setBorder(Rectangle.LEFT);
		table_celltabbe.setPaddingLeft(10f);
		tabletabbe.addCell(table_celltabbe);
		
		table_celltabbe = new PdfPCell(new Phrase(leaveDate));
//		table_celltabbe.setBorder(table_celltabbe.NO_BORDER);
		table_celltabbe.setPaddingBottom(10f);
		table_celltabbe.setBorderWidth(1f);
		table_celltabbe.setBorderColor(BaseColor.RED);
		table_celltabbe.setBorder(Rectangle.RIGHT);
		tabletabbe.addCell(table_celltabbe);
		document.add(tabletabbe);
		//
		
		PdfPTable tableaab = new PdfPTable(4);
		tableaab.setWidthPercentage(100);

		float[] columnWidthsaab = {0.14f,0.10f,0.15f,0.100f};
		tableaab.setWidths(columnWidthsaab);

		PdfPCell table_cellaab;
		

		table_cellaab = new PdfPCell(new Phrase("15) Attendance :  ", font13));
		table_cellaab.setPaddingBottom(10f);
//		table_cellaab.setBorder(table_cellaab.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		table_cellaab.setBorderWidth(1f);
		table_cellaab.setBorderColor(BaseColor.RED);
		table_cellaab.setBorder(Rectangle.LEFT);
		table_cellaab.setPaddingLeft(10f);
		tableaab.addCell(table_cellaab);
		
//		String castt  = rs.getString("cast");		
		table_cellaab = new PdfPCell(new Phrase(attendance+"%"));
		table_cellaab.setPaddingBottom(10f);
		table_cellaab.setBorder(table_cellaab.NO_BORDER);
//		tablefix.addCell(table_cellfix);
		tableaab.addCell(table_cellaab);
		

		table_cellaab = new PdfPCell(new Phrase("16) Working days :  ", font13));
		table_cellaab.setPaddingBottom(10f);
		table_cellaab.setBorder(table_cellaab.NO_BORDER);
		tableaab.addCell(table_cellaab);
		
//		String subCastt  = rs.getString("sub_cast");
		table_cellaab = new PdfPCell(new Phrase(workingday));
		table_cellaab.setPaddingBottom(10f);
//		table_cellaab.setBorder(table_cellaab.NO_BORDER);
		table_cellaab.setBorderWidth(1f);
		table_cellaab.setBorderColor(BaseColor.RED);
		table_cellaab.setBorder(Rectangle.RIGHT);
		tableaab.addCell(table_cellaab);
		document.add(tableaab); 
		//
		PdfPTable tabletabbc = new PdfPTable(2);
		tabletabbc.setWidthPercentage(100);

		float[] columnWidthstabbc = {0.30f,0.80f};
		tabletabbc.setWidths(columnWidthstabbc);

		PdfPCell table_celltabbc;
		
		table_celltabbc = new PdfPCell(new Phrase("17) Remarks : ", font13));
		table_celltabbc.setPaddingBottom(10f);
		//	table_celltabbc.setBorder(table_celltabbc.NO_BORDER);
			table_celltabbc.setBorderWidth(1f);
			table_celltabbc.setBorderColor(BaseColor.RED);
			table_celltabbc.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
			table_celltabbc.setPaddingLeft(10f);
//			table_celltabbc.setBorder(Rectangle.BOTTOM);
		
		tabletabbc.addCell(table_celltabbc);
		
		table_celltabbc = new PdfPCell(new Phrase("Good"));
	//	table_celltabbc.setBorder(table_celltabbc.NO_BORDER);
	//	table_celltabbc.setBorder(Rectangle.BOTTOM);
		table_celltabbc.setPaddingBottom(20f);
		table_celltabbc.setBorderWidth(1f);
		table_celltabbc.setBorderColor(BaseColor.RED);
		table_celltabbc.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
		tabletabbc.addCell(table_celltabbc);
		document.add(tabletabbc);
		
		
		
		//
/*		table_cellFifth = new PdfPCell(new Phrase("3) Date Of Birth:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(birthDate, Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		String lastSchool  = rs.getString("previous_school_name");
		table_cellFifth = new PdfPCell(new Phrase("4) Last School Attended:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(lastSchool,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);*/
		
		//String lastName  = rs.getString("last_name");
		
	//	String className = rs.getString("className");

/* 	 	int classNameInInt = Integer.parseInt(className); 
		DigitToWords w = new DigitToWords();
		String classInWords = w.convert(classNameInInt);
 */		
/* 		table_cellFifth = new PdfPCell(new Phrase("5) Standard :-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(className,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		String doa  = rs.getString("date_of_admission");
		 
		 Date DoaiDate=new SimpleDateFormat("yyyy-MM-dd").parse(doa); 
		 SimpleDateFormat dateFormater2 = new SimpleDateFormat("dd-MM-yyyy");
		 String DoaiwDate = dateFormater2.format(DoaiDate);
		 
		table_cellFifth = new PdfPCell(new Phrase("6) Since when:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(DoaiwDate,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth); */
		
		//String lastName  = rs.getString("last_name");
/* 		table_cellFifth = new PdfPCell(new Phrase("7) Reason:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(reason,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth); */
		
		//String lastName  = rs.getString("last_name");
/* 		table_cellFifth = new PdfPCell(new Phrase("8) Promotion:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(promotion,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth); */
		
		//String lastName  = rs.getString("last_name");
	/* 	table_cellFifth = new PdfPCell(new Phrase("9) Identity Marks:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(idMarks,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
 */		
//		document.add(tableFifth);
		
		//sixth table
		
/* 		PdfPTable tableSix = new PdfPTable(4);
		tableSix.setWidthPercentage(100);

		float[] columnWidthsSix = {0.28f,0.14f,0.28f,0.14f};
		tableSix.setWidths(columnWidthsSix);

		PdfPCell table_cellSix; */
		
		//String country = rs.getString("country");
	/* 	table_cellSix = new PdfPCell(new Phrase("10) Nationality:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase("Indian",Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		String birthplace  = rs.getString("birth_place");
		table_cellSix = new PdfPCell(new Phrase("11) Place of birth:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(birthplace,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		String cast  = rs.getString("cast");
		table_cellSix = new PdfPCell(new Phrase("12) Cast:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(cast,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		String subCast  = rs.getString("sub_cast");
		table_cellSix = new PdfPCell(new Phrase("13) Sub-cast:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(subCast,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		String[] add =doa.split("-");
		String year1 = add[0];
		String month1 = add[1];
		String date1 = add[2];
		String addDate = date1+"-"+month1+"-"+year1;
		
		table_cellSix = new PdfPCell(new Phrase("14) Date Of Admission:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(addDate,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix); */
		
		/* String[] leacingDate =dateOfLeaving.split("-");
		String year2 = leacingDate[0];
		String month2 = leacingDate[1];
		String date2 = leacingDate[2];
		String leaveDate = date2+"-"+month2+"-"+year2; */
/* 		table_cellSix = new PdfPCell(new Phrase("15) Date of Leaving School:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		

		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		
		table_cellSix = new PdfPCell(new Phrase("16) Progress Of Student:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(25f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(progress,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(25f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase("17) Conduct:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(conduct,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		document.add(tableSix); */
		
		/* table_cellSix = new PdfPCell(new Phrase("18) Student serial ID No:-", font13));
		table_cellSix.setBorder(Rectangle.BOTTOM);
		table_cellSix.setPaddingBottom(25f);
		tableSix.addCell(table_cellSix);
		
		String serialIdNo =rs.getString("stud_serial_id_number");
		table_cellSix = new PdfPCell(new Phrase(serialIdNo,Normalfont13));
		table_cellSix.setBorder(Rectangle.BOTTOM);
		table_cellSix.setPaddingBottom(25f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(""));
		table_cellSix.setBorder(Rectangle.BOTTOM);
		table_cellSix.setPaddingTop(-18f);	
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix); 
		
	   
		
		//String serialId  = rs.getString("student_serial_number");
		table_cellSix = new PdfPCell();
		table_cellSix.setBorder(Rectangle.BOTTOM);
		table_cellSix.setPaddingTop(-18f);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);  */
		//document.add(tableSix);
		
		
		//Serial id no 
	/* 		PdfPTable tableThird1 = new PdfPTable(4);
		tableThird1.setWidthPercentage(100);

		float[] columnWidthsThird1 = {0.28f,0.14f,0.14f,0.14f};
		tableThird1.setWidths(columnWidthsThird1);

		PdfPCell table_cellThird1;
		
		table_cellThird1 = new PdfPCell(new Phrase("18) Student serial ID No:-", font13));
		table_cellThird1.setPaddingBottom(10f);
		table_cellThird1.setBorder(table_cellThird1.NO_BORDER);
		table_cellThird1.setBorder(Rectangle.BOTTOM);
		tableThird1.addCell(table_cellThird1);
		
	
		String serialIdNo =rs.getString("stud_serial_id_number");
		table_cellThird1 = new PdfPCell(new Phrase(serialIdNo,Normalfont13));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cellThird1.setBorder(Rectangle.BOTTOM);
		table_cellThird1.setPaddingBottom(1f);
		tableThird1.addCell(table_cellThird1);
		
		
		table_cellThird1 = new PdfPCell(new Phrase(""));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cellThird1.setBorder(Rectangle.BOTTOM);
		table_cellThird1.setPaddingBottom(1f);
		tableThird1.addCell(table_cellThird1);
		
		table_cellThird1 = new PdfPCell(new Phrase(""));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cellThird1.setBorder(Rectangle.BOTTOM);
		table_cellThird1.setPaddingBottom(1f);
		tableThird1.addCell(table_cellThird1);
		
		
		document.add(tableThird1); */
		
		
		
		
		//seventh table for note
		PdfPTable tableSeven = new PdfPTable(1);
		tableSeven.setWidthPercentage(100);

		float[] columnWidthsSeven = {0.5f};
		tableSeven.setWidths(columnWidthsSeven);

		PdfPCell table_cellSeven;
		
		table_cellSeven = new PdfPCell(new Phrase("Declared that above information/entries are according to the School Admission Register.", font13));
		table_cellSeven.setBorder(Rectangle.TOP);
//		table_cellSeven.setBorder(Rectangle.BOTTOM);
		table_cellSeven.setBorderWidth(1f);
		table_cellSeven.setBorderColor(BaseColor.RED);
		table_cellSeven.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table_cellSeven.setPaddingLeft(10f);
//		table_cellSeven.setBorder(table_cellSeven.NO_BORDER);
		table_cellSeven.setPaddingTop(15f);
		table_cellSeven.setPaddingBottom(15f);
		tableSeven.addCell(table_cellSeven);
		document.add(tableSeven);
		
		
		
		//seventh table for sign
         Date d = Calendar.getInstance().getTime();  
         DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
         String strDate = dateFormat.format(d);  
        
         PdfPTable tableEi = new PdfPTable(1);
 		tableEi.setWidthPercentage(100);

 		float[] columnWidthsEi = {0.3f};
 		tableEi.setWidths(columnWidthsEi);

 		PdfPCell table_cellEi;
 		table_cellEi = new PdfPCell(new Phrase("Date :-  "+strDate, font13));
 		table_cellEi.setPaddingBottom(20f);
// 		table_cellEi.setBorder(table_cellEi.NO_BORDER);	
		table_cellEi.setBorderWidth(1f);
		table_cellEi.setBorderColor(BaseColor.RED);
		table_cellEi.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
		table_cellEi.setPaddingLeft(10f);
		tableEi.addCell(table_cellEi);
		document.add(tableEi);
         
         
         
		PdfPTable tableEight = new PdfPTable(3);
		tableEight.setWidthPercentage(100);

		float[] columnWidthsEight = {0.4f,0.3f,0.15f};
		tableEight.setWidths(columnWidthsEight);

		PdfPCell table_cellEight;
		
/* 		table_cellEight = new PdfPCell(new Phrase("Date:- "+strDate, font13));
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorder(Rectangle.BOTTOM);
		
		tableEight.addCell(table_cellEight); */
		table_cellEight = new PdfPCell(new Phrase("Class Teacher", font13));
		table_cellEight.setPaddingTop(45f);
		table_cellEight.setPaddingBottom(20f);
//		table_cellEight.setBorder(Rectangle.BOTTOM);
		table_cellEight.setBorderWidth(1f);
		table_cellEight.setBorderColor(BaseColor.RED);
		table_cellEight.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
		table_cellEight.setPaddingLeft(10f);
		tableEight.addCell(table_cellEight);
		
		table_cellEight = new PdfPCell(new Phrase("Clerk", font13));
		table_cellEight.setPaddingTop(45f);
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorderWidth(1f);
		table_cellEight.setBorderColor(BaseColor.RED);
		table_cellEight.setBorder(Rectangle.BOTTOM);
		tableEight.addCell(table_cellEight);
		
		
		table_cellEight = new PdfPCell(new Phrase("Principal", font13));
		table_cellEight.setPaddingTop(45f);
		table_cellEight.setPaddingBottom(20f);
//		table_cellEight.setBorder(Rectangle.BOTTOM);
		table_cellEight.setBorderWidth(1f);
		table_cellEight.setBorderColor(BaseColor.RED);
		table_cellEight.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
		tableEight.addCell(table_cellEight);
		
		document.add(tableEight);

		// Gross Total in Words
		//String paymentAmountInWords = rs.getString("payment");
		//Double totalInLong = Math.round(obtained_marks);
		/*String grossTotal = String.valueOf(obtained_marks);
	 	int grossTotalInInteger = Integer.parseInt(grossTotal); */
		// int grossTotalInInteger = (int)grandTotalMarks;
/* 		NumToWord w = new NumToWord();
		String amtInWord = w.convert(grossTotalInInteger);

		table_cell3 = new PdfPCell(new Phrase("\n Secured Marks in words: "
				+ amtInWord + " Only/-\n ")); */


		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>



