
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
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
		String idMarks = (String)session.getAttribute("idMarksForLC");
		String reason = (String)session.getAttribute("reasonForLC");
		String promotion = (String)session.getAttribute("promotionForLC");
		String progress = (String)session.getAttribute("progressForLC");
		String conduct = (String)session.getAttribute("conductForLC");
		String dateOfLeaving = (String)session.getAttribute("dateOfLeavingForLC");;
		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT country,first_name,middle_name,last_name,general_reg_number,mother_name,cast,sub_cast,birth_place,previous_school_name,date_of_admission,date_of_birth,student_serial_number,stud_serial_id_number,c.class_name AS className FROM student_master LEFT JOIN class_master c on fk_class_id=c.pk_class_id WHERE pk_student_id="+studentId);
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

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
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
		
		table_cellFirst = new PdfPCell(new Phrase("No.Maha/453/2004 Ned", Normalfont11));
		table_cellFirst.setBorder(table_cellFirst.NO_BORDER);
		tableFirst.addCell(table_cellFirst);
		document.add(tableFirst);

		
		//second table
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.1f, 0.5f, 0.1f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Sanskruti & Paryavaran Sanvardhan Mandals"));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
	 	
		/* table_cell = new PdfPCell(new Phrase("Academic Year :"+acdemicYear, Normalfont11)); */
		table_cell = new PdfPCell(new Phrase());
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-----------------

		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("VENKATRAMANA HI-Tech English School", font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//--------

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("AMBALA Tal: Hadgaon, Dist: Nanded(MAHARASHTRA)", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("(NPRASHA-1008/679/PRASHI-3 Dt.20-08-2009)"));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
	 	
		/* table_cell = new PdfPCell(new Phrase("Academic Year :"+acdemicYear, Normalfont11)); */
		table_cell = new PdfPCell(new Phrase());
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		//-------------

		//String examName = rs.getString("exam_name");
		
		table_cell = new PdfPCell();
		table_cell.setPaddingBottom(10f);
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("LEAVING CERTIFICATE", font15Bold));
		table_cell.setPaddingBottom(10f);
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setPaddingBottom(10f);
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		document.add(table);

		//third table for note
		PdfPTable tableThird = new PdfPTable(1);
		tableThird.setWidthPercentage(100);

		float[] columnWidthsThird = {0.5f};
		tableThird.setWidths(columnWidthsThird);

		PdfPCell table_cellThird;
		
		table_cellThird = new PdfPCell(new Phrase("NOTE:- No change in an entry is to be made except/the authority issuing the certificate infrignment of the rule will be Punished with restrication as per inspector's circular 1-6-1940.", Normalfont11));
		table_cellThird.setPaddingBottom(6f);
		table_cellThird.setBorder(Rectangle.BOTTOM);
		tableThird.addCell(table_cellThird);
		document.add(tableThird);
		
		//fourth table for note
		PdfPTable tableForth = new PdfPTable(2);
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
		document.add(tableForth);
		
		
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
		
		
		table_cellFifth = new PdfPCell(new Phrase("1) Name of the pupil in full:- ", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase("Mr/Ms "+fullName, Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);

		String mother_name  = rs.getString("mother_name");
		table_cellFifth = new PdfPCell(new Phrase("2) Mother's Name:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(mother_name, Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		String dob  = rs.getString("date_of_birth");
		String[] words=dob.split("-");
		String year = words[0];
		String month = words[1];
		String date = words[2];
		String birthDate = date+"-"+month+"-"+year;
		table_cellFifth = new PdfPCell(new Phrase("3) Date Of Birth:-", font13));
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
		tableFifth.addCell(table_cellFifth);
		
		//String lastName  = rs.getString("last_name");
		
		String className = rs.getString("className");

/* 	 	int classNameInInt = Integer.parseInt(className); 
		DigitToWords w = new DigitToWords();
		String classInWords = w.convert(classNameInInt);
 */		
		table_cellFifth = new PdfPCell(new Phrase("5) Standard :-", font13));
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
		tableFifth.addCell(table_cellFifth);
		
		//String lastName  = rs.getString("last_name");
		table_cellFifth = new PdfPCell(new Phrase("7) Reason:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(reason,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		//String lastName  = rs.getString("last_name");
		table_cellFifth = new PdfPCell(new Phrase("8) Promotion:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(promotion,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		//String lastName  = rs.getString("last_name");
		table_cellFifth = new PdfPCell(new Phrase("9) Identity Marks:-", font13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		table_cellFifth = new PdfPCell(new Phrase(idMarks,Normalfont13));
		table_cellFifth.setBorder(table_cellFifth.NO_BORDER);
		table_cellFifth.setPaddingBottom(8f);
		tableFifth.addCell(table_cellFifth);
		
		document.add(tableFifth);
		
		//sixth table
		
		PdfPTable tableSix = new PdfPTable(4);
		tableSix.setWidthPercentage(100);

		float[] columnWidthsSix = {0.28f,0.14f,0.28f,0.14f};
		tableSix.setWidths(columnWidthsSix);

		PdfPCell table_cellSix;
		
		//String country = rs.getString("country");
		table_cellSix = new PdfPCell(new Phrase("10) Nationality:-", font13));
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
		tableSix.addCell(table_cellSix);
		
		String[] leacingDate =dateOfLeaving.split("-");
		String year2 = leacingDate[0];
		String month2 = leacingDate[1];
		String date2 = leacingDate[2];
		String leaveDate = date2+"-"+month2+"-"+year2;
		table_cellSix = new PdfPCell(new Phrase("15) Date of Leaving School:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(leaveDate,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		
		table_cellSix = new PdfPCell(new Phrase("16) Progress Of Student:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(10f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(progress,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(10f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase("17) Conduct:-", font13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		
		table_cellSix = new PdfPCell(new Phrase(conduct,Normalfont13));
		table_cellSix.setBorder(table_cellSix.NO_BORDER);
		table_cellSix.setPaddingBottom(8f);
		tableSix.addCell(table_cellSix);
		document.add(tableSix);
		
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
			PdfPTable tableThird1 = new PdfPTable(2);
		tableThird1.setWidthPercentage(100);

		float[] columnWidthsThird1 = {0.15f,0.30f};
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
		table_cellThird1.setPaddingBottom(15f);
		tableThird1.addCell(table_cellThird1);
		
		/*
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
		*/
		
		document.add(tableThird1);
		
		
		
		
		//seventh table for note
		PdfPTable tableSeven = new PdfPTable(1);
		tableSeven.setWidthPercentage(100);

		float[] columnWidthsSeven = {0.5f};
		tableSeven.setWidths(columnWidthsSeven);

		PdfPCell table_cellSeven;
		
		table_cellSeven = new PdfPCell(new Phrase("Certified That The Above Information Is In Accordance With The School General Register", font13));
		table_cellSeven.setBorder(table_cellSeven.NO_BORDER);
		table_cellSeven.setPaddingTop(8f);
		table_cellSeven.setPaddingBottom(60f);
		tableSeven.addCell(table_cellSeven);
		document.add(tableSeven);
		
		
		
		//seventh table for sign
         Date d = Calendar.getInstance().getTime();  
         DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
         String strDate = dateFormat.format(d);  
		
		PdfPTable tableEight = new PdfPTable(3);
		tableEight.setWidthPercentage(100);

		float[] columnWidthsEight = {0.3f,0.3f,0.3f};
		tableEight.setWidths(columnWidthsEight);

		PdfPCell table_cellEight;
		
		table_cellEight = new PdfPCell(new Phrase("Date:- "+strDate, font13));
		table_cellEight.setPaddingTop(20f);
		table_cellEight.setPaddingBottom(20f);
		
		table_cellEight.setBorder(Rectangle.BOTTOM);
		
		tableEight.addCell(table_cellEight);
	
		table_cellEight = new PdfPCell(new Phrase("Clerk", font13));
		table_cellEight.setPaddingTop(20f);
		table_cellEight.setPaddingBottom(20f);
	
		table_cellEight.setBorder(Rectangle.BOTTOM);
		tableEight.addCell(table_cellEight);
		
		
		table_cellEight = new PdfPCell(new Phrase("Principal", font13));
		table_cellEight.setPaddingTop(20f);
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorder(Rectangle.BOTTOM);
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



