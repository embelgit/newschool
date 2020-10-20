
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
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
	 Long receiptNumber = (Long)session.getAttribute("receiptNumberForPDf");

	Connection conn = null;
	double totalAnnualFee = 0.0;
	double remainingFee = 0.0;
	double payingFee= 0.0;
	double total_amount = 0.0;
	double tot = 0.0;
	String acdemicYear = null;
	
	
                     String name1 = "";
		             if (session != null) {
			
			         if (session.getAttribute("user") != null) {
				     name1 = (String) session.getAttribute("user");
			         } 
			         else {
							
					     response.sendRedirect("/srb/JSP/login.jsp");
				//	     out.println("Please Login ");
				        }
			         
		           }
		             else {
		            	 response.sendRedirect("/srb/JSP/login.jsp");
			//		     out.println("Please Login ");
		             	  }
	           
	
	
	try {

		// step 1
		Document document = new Document(PageSize.A4,15,15,5,5);

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
/* 		Image image1 = Image.getInstance("C:/Logo School.png"); */

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT first_name,middle_name,last_name,class_name,payment_receipt_number,division,first_installment,second_installment,admissionfees,tuitionfees,computer_fees,medicalfees,gymnassiumfees,laboratoryfees,stationaryfees,exam_Fees,competitivefees,hostelfees,messfees,uniformfees,raincoat,undergarments,otherfees,lumpsumfees,academic_year,fee_paid_due,roll_no FROM student_fee_structure ORDER BY pk_fee_structure_id DESC LIMIT 1");
		while (rs.next()) {
			acdemicYear = rs.getString("academic_year");
		}
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
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		// step 4
		
/* 		image1.scaleToFit(100f, 200f);
		Image imageCenter = Image.getInstance(image1);
		imageCenter.setAlignment(Image.MIDDLE);
		document.add(imageCenter); */

		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.1f, 0.5f, 0.1f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Godavari Manar Charitable Trust's", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase());
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		//

		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		String clss = rs.getString("class_name");
		if(clss.equals("11th") || clss.equals("12th")){
		table_cell = new PdfPCell(new Phrase("Godavari Manar Public School & Junior College",font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		}
		else if(clss.equals("8th") || clss.equals("9th") || clss.equals("10th")){
			table_cell = new PdfPCell(new Phrase("Godavari Manar Public High School",font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(table_cell);
		}
		else {
			table_cell = new PdfPCell(new Phrase("Godavari Manar Public School (Primary)",font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(table_cell);
		}
		
		table_cell = new PdfPCell(new Phrase());
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
	 	
		//
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("(English Medium)  E-mail : gmps123@gmail.com ", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		//-----------------


		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("SHANKARNAGAR - 431736 Tal- Biloli, Dist- Nanded", Normalfont12));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-------------


		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
//		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Phone- (02465) 267044/47 ", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
//		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);
		//--------
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("Date: "+StrBillDate));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);


		
		document.add(table);
		//--------
		/* table for customer name, village and date */

		PdfPTable smallTable = new PdfPTable(2);
		smallTable.setWidthPercentage(100);

		float[] smallTablecolumnWidths = { 0.25f, 0.50f};
		smallTable.setWidths(smallTablecolumnWidths);

		PdfPCell table_cell2;
		
/* 		String custName;
		
		String cn = String.valueOf(rs.getString("customer_name")); */
		
		/* if(cn.equals("N/A")){
			custName = creditCustomerName;
		}else
		{
			custName = cn;
		}
		 */
			

/* 		table_cell2 = new PdfPCell();
		table_cell2.setBorder(table_cell.NO_BORDER);
		smallTable.addCell(table_cell2); */

		table_cell2 = new PdfPCell(new Phrase("No : B"));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
		smallTable.addCell(table_cell2);
		
		table_cell2 = new PdfPCell(new Phrase(""));
		table_cell2.setPaddingBottom(10f);
		table_cell2.setBorder(table_cell2.NO_BORDER);
		smallTable.addCell(table_cell2);
		/* table_cell2 = new PdfPCell(new Phrase("No : B"));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
		smallTable.addCell(table_cell2);

		table_cell2 = new PdfPCell(new Phrase("No : B"));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
		smallTable.addCell(table_cell2); */

		document.add(smallTable);
//		document.add(new Paragraph(" "));
		//Middle table
		PdfPTable tableFour = new PdfPTable(2);
		tableFour.setWidthPercentage(100);

		float[] columnWidthsFour = {0.20f,0.65f};
		tableFour.setWidths(columnWidthsFour);

		PdfPCell table_cellFour;
		
		String firstNamee  = rs.getString("first_name");
		String middleNamee  = rs.getString("middle_name");
		String lastNamee  = rs.getString("last_name");
		String fullNamee = firstNamee+" "+middleNamee+" "+lastNamee;
		
		table_cellFour = new PdfPCell(new Phrase("Name of the Pupil :  ", font13));
		table_cellFour.setPaddingBottom(10f);
		table_cellFour.setBorder(table_cellFour.NO_BORDER);
		tableFour.addCell(table_cellFour);
		
		table_cellFour = new PdfPCell(new Phrase(fullNamee));
		table_cellFour.setPaddingBottom(10f);
		table_cellFour.setBorder(table_cellFour.NO_BORDER);
		tableFour.addCell(table_cellFour);
		
		document.add(tableFour);	
		
		PdfPTable tableThird = new PdfPTable(4);
		tableThird.setWidthPercentage(100);

		float[] columnWidthsThird = {0.30f,0.55f,0.15f,0.20f};
		tableThird.setWidths(columnWidthsThird);

		PdfPCell table_cellThird;
		String clsss = rs.getString("class_name");
		table_cellThird = new PdfPCell(new Phrase("Class :   ", font13));
//		table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase(clsss));
	//	table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase("Roll No. :", font13));
	//	table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		
		String roll = rs.getString("roll_no");
		table_cellThird = new PdfPCell(new Phrase(roll));
	//	table_cellThird.setPaddingTop(10f);
		table_cellThird.setPaddingBottom(10f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		tableThird.addCell(table_cellThird);
		document.add(tableThird);
		
		
		// --
		PdfPTable table3 = new PdfPTable(4);
		table3.setWidthPercentage(100);

		float[] columnWidths3 = { 0.10f, 0.80f,0.4f, 0.3f};
		table3.setWidths(columnWidths3);

		PdfPCell table_cell3;

		table_cell3 = new PdfPCell(new Phrase("No.", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingTop(10f);
		table_cell3.setPaddingBottom(10f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("PARTICULARS", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingTop(10f);
		table_cell3.setPaddingBottom(10f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Period of the Fee Paid", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingTop(10f);
		table_cell3.setPaddingBottom(10f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Amount ", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingTop(10f);
		table_cell3.setPaddingBottom(10f);
		table3.addCell(table_cell3);
		
		document.add(table3);
		// -
		String feedue = rs.getString("fee_paid_due");
		
		PdfPTable table31 = new PdfPTable(4);
		table31.setWidthPercentage(100);

		float[] columnWidths31 = {0.10f, 0.80f,0.4f, 0.3f};
		table31.setWidths(columnWidths31);

		PdfPCell table_cell31;

		table_cell31 = new PdfPCell(new Phrase("1", Normalfont14));
		table_cell31.setBorderWidth(1f);
		table_cell31.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell31.setPaddingTop(8f);
		table_cell31.setPaddingBottom(8f);
		table31.addCell(table_cell31);

		table_cell31 = new PdfPCell(new Phrase("Admission Fees", Normalfont14));
		table_cell31.setBorderWidth(1f);
		table_cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell31.setPaddingTop(8f);
		table_cell31.setPaddingBottom(8f);
		table31.addCell(table_cell31);
		
		table_cell31 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell31.setBorderWidth(1f);
		table_cell31.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell31.setPaddingTop(8f);
		table_cell31.setPaddingBottom(8f);
		table31.addCell(table_cell31);

		String addd = rs.getString("admissionfees");
		double ad = Double.parseDouble(addd);
		
		table_cell31 = new PdfPCell(new Phrase(addd, Normalfont14));
		table_cell31.setBorderWidth(1f);
		table_cell31.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell31.setPaddingTop(8f);
		table_cell31.setPaddingBottom(8f);
		table31.addCell(table_cell31);
		
		document.add(table31);
		// --
		
		PdfPTable table32 = new PdfPTable(4);
		table32.setWidthPercentage(100);

		float[] columnWidths32 = {0.10f, 0.80f,0.4f, 0.3f};
		table32.setWidths(columnWidths32);

		PdfPCell table_cell32;

		table_cell32 = new PdfPCell(new Phrase("2", Normalfont14));
		table_cell32.setBorderWidth(1f);
		table_cell32.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell32.setPaddingTop(8f);
		table_cell32.setPaddingBottom(8f);
		table32.addCell(table_cell32);

		table_cell32 = new PdfPCell(new Phrase("Tuition Fees", Normalfont14));
		table_cell32.setBorderWidth(1f);
		table_cell32.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell32.setPaddingTop(8f);
		table_cell32.setPaddingBottom(8f);
		table32.addCell(table_cell32);
		
		table_cell32 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell32.setBorderWidth(1f);
		table_cell32.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell32.setPaddingTop(8f);
		table_cell32.setPaddingBottom(8f);
		table32.addCell(table_cell32);

		String tuit = rs.getString("tuitionfees");
		double tu = Double.parseDouble(tuit);
		table_cell32 = new PdfPCell(new Phrase(tuit, Normalfont14));
		table_cell32.setBorderWidth(1f);
		table_cell32.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell32.setPaddingTop(8f);
		table_cell32.setPaddingBottom(8f);
		table32.addCell(table_cell32);
		
		document.add(table32);
		// -
		
		PdfPTable table33 = new PdfPTable(4);
		table33.setWidthPercentage(100);

		float[] columnWidths33 = {0.10f, 0.80f,0.4f, 0.3f};
		table33.setWidths(columnWidths33);

		PdfPCell table_cell33;

		table_cell33 = new PdfPCell(new Phrase("3", Normalfont14));
		table_cell33.setBorderWidth(1f);
		table_cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell33.setPaddingTop(8f);
		table_cell33.setPaddingBottom(8f);
		table33.addCell(table_cell33);

		table_cell33 = new PdfPCell(new Phrase("Library and Computer Lab Fees", Normalfont14));
		table_cell33.setBorderWidth(1f);
		table_cell33.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell33.setPaddingTop(8f);
		table_cell33.setPaddingBottom(8f);
		table33.addCell(table_cell33);
		
		table_cell33 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell33.setBorderWidth(1f);
		table_cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell33.setPaddingTop(8f);
		table_cell33.setPaddingBottom(8f);
		table33.addCell(table_cell33);

		String comp = rs.getString("computer_fees");
		double comm = Double.parseDouble(comp);
		
		table_cell33 = new PdfPCell(new Phrase(comp, Normalfont14));
		table_cell33.setBorderWidth(1f);
		table_cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell33.setPaddingTop(8f);
		table_cell33.setPaddingBottom(8f);
		table33.addCell(table_cell33);
		
		document.add(table33);
		
		// -
		
		PdfPTable table34 = new PdfPTable(4);
		table34.setWidthPercentage(100);

		float[] columnWidths34 = {0.10f, 0.80f,0.4f, 0.3f};
		table34.setWidths(columnWidths34);

		PdfPCell table_cell34;

		table_cell34 = new PdfPCell(new Phrase("4", Normalfont14));
		table_cell34.setBorderWidth(1f);
		table_cell34.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell34.setPaddingTop(8f);
		table_cell34.setPaddingBottom(8f);
		table34.addCell(table_cell34);

		table_cell34 = new PdfPCell(new Phrase("Security Deposit and Medical Fees", Normalfont14));
		table_cell34.setBorderWidth(1f);
		table_cell34.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell34.setPaddingTop(8f);
		table_cell34.setPaddingBottom(8f);
		table34.addCell(table_cell34);
		
		table_cell34 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell34.setBorderWidth(1f);
		table_cell34.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell34.setPaddingTop(8f);
		table_cell34.setPaddingBottom(8f);
		table34.addCell(table_cell34);

		String med = rs.getString("medicalfees");
		double me = Double.parseDouble(med);
		table_cell34 = new PdfPCell(new Phrase(med, Normalfont14));
		table_cell34.setBorderWidth(1f);
		table_cell34.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell34.setPaddingTop(8f);
		table_cell34.setPaddingBottom(8f);
		table34.addCell(table_cell34);
		
		document.add(table34);
		// --
		PdfPTable table35 = new PdfPTable(4);
		table35.setWidthPercentage(100);

		float[] columnWidths35 = {0.10f, 0.80f,0.4f, 0.3f};
		table35.setWidths(columnWidths35);

		PdfPCell table_cell35;

		table_cell35 = new PdfPCell(new Phrase("5", Normalfont14));
		table_cell35.setBorderWidth(1f);
		table_cell35.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell35.setPaddingTop(8f);
		table_cell35.setPaddingBottom(8f);
		table35.addCell(table_cell35);

		table_cell35 = new PdfPCell(new Phrase("Gymnasium Fees", Normalfont14));
		table_cell35.setBorderWidth(1f);
		table_cell35.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell35.setPaddingTop(8f);
		table_cell35.setPaddingBottom(8f);
		table35.addCell(table_cell35);
		
		table_cell35 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell35.setBorderWidth(1f);
		table_cell35.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell35.setPaddingTop(8f);
		table_cell35.setPaddingBottom(8f);
		table35.addCell(table_cell35);

		String gym = rs.getString("gymnassiumfees");
		double gy = Double.parseDouble(gym);
		table_cell35 = new PdfPCell(new Phrase(gym, Normalfont14));
		table_cell35.setBorderWidth(1f);
		table_cell35.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell35.setPaddingTop(8f);
		table_cell35.setPaddingBottom(8f);
		table35.addCell(table_cell35);
		
		document.add(table35);
		//--
		PdfPTable table36 = new PdfPTable(4);
		table36.setWidthPercentage(100);

		float[] columnWidths36 = {0.10f, 0.80f,0.4f, 0.3f};
		table36.setWidths(columnWidths36);

		PdfPCell table_cell36;

		table_cell36 = new PdfPCell(new Phrase("6", Normalfont14));
		table_cell36.setBorderWidth(1f);
		table_cell36.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell36.setPaddingTop(8f);
		table_cell36.setPaddingBottom(8f);
		table36.addCell(table_cell36);

		table_cell36 = new PdfPCell(new Phrase("Laboratory Fees", Normalfont14));
		table_cell36.setBorderWidth(1f);
		table_cell36.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell36.setPaddingTop(8f);
		table_cell36.setPaddingBottom(8f);
		table36.addCell(table_cell36);
		
		table_cell36 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell36.setBorderWidth(1f);
		table_cell36.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell36.setPaddingTop(8f);
		table_cell36.setPaddingBottom(8f);
		table36.addCell(table_cell36);

		String lab = rs.getString("laboratoryfees");
		double la = Double.parseDouble(lab);
		table_cell36 = new PdfPCell(new Phrase(lab, Normalfont14));
		table_cell36.setBorderWidth(1f);
		table_cell36.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell36.setPaddingTop(8f);
		table_cell36.setPaddingBottom(8f);
		table36.addCell(table_cell36);
		
		document.add(table36);
		//--
		PdfPTable table37 = new PdfPTable(4);
		table37.setWidthPercentage(100);

		float[] columnWidths37 = {0.10f, 0.80f,0.4f, 0.3f};
		table37.setWidths(columnWidths37);

		PdfPCell table_cell37;

		table_cell37 = new PdfPCell(new Phrase("7", Normalfont14));
		table_cell37.setBorderWidth(1f);
		table_cell37.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell37.setPaddingTop(8f);
		table_cell37.setPaddingBottom(8f);
		table37.addCell(table_cell37);

		table_cell37 = new PdfPCell(new Phrase("Stationary Fees", Normalfont14));
		table_cell37.setBorderWidth(1f);
		table_cell37.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell37.setPaddingTop(8f);
		table_cell37.setPaddingBottom(8f);
		table37.addCell(table_cell37);
		
		table_cell37 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell37.setBorderWidth(1f);
		table_cell37.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell37.setPaddingTop(8f);
		table_cell37.setPaddingBottom(8f);
		table37.addCell(table_cell37);

		String sat = rs.getString("stationaryfees");
		double sa = Double.parseDouble(sat);
		table_cell37 = new PdfPCell(new Phrase(sat, Normalfont14));
		table_cell37.setBorderWidth(1f);
		table_cell37.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell37.setPaddingTop(8f);
		table_cell37.setPaddingBottom(8f);
		table37.addCell(table_cell37);
		
		document.add(table37);
		// --
		PdfPTable table38 = new PdfPTable(4);
		table38.setWidthPercentage(100);

		float[] columnWidths38 = {0.10f, 0.80f,0.4f, 0.3f};
		table38.setWidths(columnWidths38);

		PdfPCell table_cell38;

		table_cell38 = new PdfPCell(new Phrase("8", Normalfont14));
		table_cell38.setBorderWidth(1f);
		table_cell38.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell38.setPaddingTop(8f);
		table_cell38.setPaddingBottom(8f);
		table38.addCell(table_cell38);

		table_cell38 = new PdfPCell(new Phrase("Exam Fees", Normalfont14));
		table_cell38.setBorderWidth(1f);
		table_cell38.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell38.setPaddingTop(8f);
		table_cell38.setPaddingBottom(8f);
		table38.addCell(table_cell38);
		
		table_cell38 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell38.setBorderWidth(1f);
		table_cell38.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell38.setPaddingTop(8f);
		table_cell38.setPaddingBottom(8f);
		table38.addCell(table_cell38);

		String xam = rs.getString("exam_Fees");
		double xa = Double.parseDouble(xam);
		table_cell38 = new PdfPCell(new Phrase(xam, Normalfont14));
		table_cell38.setBorderWidth(1f);
		table_cell38.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell38.setPaddingTop(8f);
		table_cell38.setPaddingBottom(8f);
		table38.addCell(table_cell38);
		
		document.add(table38);
		//--
		

		//--
		PdfPTable table39 = new PdfPTable(4);
		table39.setWidthPercentage(100);

		float[] columnWidths39 = {0.10f, 0.80f,0.4f, 0.3f};
		table39.setWidths(columnWidths39);

		PdfPCell table_cell39;

		table_cell39 = new PdfPCell(new Phrase("9", Normalfont14));
		table_cell39.setBorderWidth(1f);
		table_cell39.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell39.setPaddingTop(8f);
		table_cell39.setPaddingBottom(8f);
		table39.addCell(table_cell39);

		table_cell39 = new PdfPCell(new Phrase("Competitive Exam Fees", Normalfont14));
		table_cell39.setBorderWidth(1f);
		table_cell39.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell39.setPaddingTop(8f);
		table_cell39.setPaddingBottom(8f);
		table39.addCell(table_cell39);
		
		table_cell39 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell39.setBorderWidth(1f);
		table_cell39.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell39.setPaddingTop(8f);
		table_cell39.setPaddingBottom(8f);
		table39.addCell(table_cell39);

		String compe = rs.getString("competitivefees");
		double co = Double.parseDouble(compe);
		table_cell39 = new PdfPCell(new Phrase(compe, Normalfont14));
		table_cell39.setBorderWidth(1f);
		table_cell39.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell39.setPaddingTop(8f);
		table_cell39.setPaddingBottom(8f);
		table39.addCell(table_cell39);
		
		document.add(table39);
		//--
		
		PdfPTable table40 = new PdfPTable(4);
		table40.setWidthPercentage(100);

		float[] columnWidths40 = {0.10f, 0.80f,0.4f, 0.3f};
		table40.setWidths(columnWidths40);

		PdfPCell table_cell40;

		table_cell40 = new PdfPCell(new Phrase("10", Normalfont14));
		table_cell40.setBorderWidth(1f);
		table_cell40.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell40.setPaddingTop(8f);
		table_cell40.setPaddingBottom(8f);
		table40.addCell(table_cell40);

		table_cell40 = new PdfPCell(new Phrase("Hostel Fees", Normalfont14));
		table_cell40.setBorderWidth(1f);
		table_cell40.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell40.setPaddingTop(8f);
		table_cell40.setPaddingBottom(8f);
		table40.addCell(table_cell40);
		
		table_cell40 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell40.setBorderWidth(1f);
		table_cell40.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell40.setPaddingTop(8f);
		table_cell40.setPaddingBottom(8f);
		table40.addCell(table_cell40);

		String hos = rs.getString("hostelfees");
		double ho = Double.parseDouble(hos);
		table_cell40 = new PdfPCell(new Phrase(hos, Normalfont14));
		table_cell40.setBorderWidth(1f);
		table_cell40.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell40.setPaddingTop(8f);
		table_cell40.setPaddingBottom(8f);
		table40.addCell(table_cell40);
		
		document.add(table40);
		//--
		
			PdfPTable table41 = new PdfPTable(4);
		table41.setWidthPercentage(100);

		float[] columnWidths41 = {0.10f, 0.80f,0.4f, 0.3f};
		table41.setWidths(columnWidths41);

		PdfPCell table_cell41;

		table_cell41 = new PdfPCell(new Phrase("11", Normalfont14));
		table_cell41.setBorderWidth(1f);
		table_cell41.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell41.setPaddingTop(8f);
		table_cell41.setPaddingBottom(8f);
		table41.addCell(table_cell41);

		table_cell41 = new PdfPCell(new Phrase("Mess Fees", Normalfont14));
		table_cell41.setBorderWidth(1f);
		table_cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell41.setPaddingTop(8f);
		table_cell41.setPaddingBottom(8f);
		table41.addCell(table_cell41);
		
		table_cell41 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell41.setBorderWidth(1f);
		table_cell41.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell41.setPaddingTop(8f);
		table_cell41.setPaddingBottom(8f);
		table41.addCell(table_cell41);

		String mes = rs.getString("messfees");
		double mess = Double.parseDouble(mes);
		table_cell41 = new PdfPCell(new Phrase(mes, Normalfont14));
		table_cell41.setBorderWidth(1f);
		table_cell41.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell41.setPaddingTop(8f);
		table_cell41.setPaddingBottom(8f);
		table41.addCell(table_cell41);
		
		document.add(table41);
		//--
		
			PdfPTable table42 = new PdfPTable(4);
		table42.setWidthPercentage(100);

		float[] columnWidths42 = {0.10f, 0.80f,0.4f, 0.3f};
		table42.setWidths(columnWidths42);

		PdfPCell table_cell42;

		table_cell42 = new PdfPCell(new Phrase("12", Normalfont14));
		table_cell42.setBorderWidth(1f);
		table_cell42.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell42.setPaddingTop(8f);
		table_cell42.setPaddingBottom(8f);
		table42.addCell(table_cell42);

		table_cell42 = new PdfPCell(new Phrase("Uniform with Shoes & Socks Fees", Normalfont14));
		table_cell42.setBorderWidth(1f);
		table_cell42.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell42.setPaddingTop(8f);
		table_cell42.setPaddingBottom(8f);
		table42.addCell(table_cell42);
		
		table_cell42 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell42.setBorderWidth(1f);
		table_cell42.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell42.setPaddingTop(8f);
		table_cell42.setPaddingBottom(8f);
		table42.addCell(table_cell42);

		String uni = rs.getString("uniformfees");
		double unn = Double.parseDouble(uni);
		table_cell42 = new PdfPCell(new Phrase(uni, Normalfont14));
		table_cell42.setBorderWidth(1f);
		table_cell42.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell42.setPaddingTop(8f);
		table_cell42.setPaddingBottom(8f);
		table42.addCell(table_cell42);
		
		document.add(table42);
		//--
		
		PdfPTable table43 = new PdfPTable(4);
		table43.setWidthPercentage(100);

		float[] columnWidths43 = {0.10f, 0.80f,0.4f, 0.3f};
		table43.setWidths(columnWidths43);

		PdfPCell table_cell43;

		table_cell43 = new PdfPCell(new Phrase("13", Normalfont14));
		table_cell43.setBorderWidth(1f);
		table_cell43.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell43.setPaddingTop(8f);
		table_cell43.setPaddingBottom(8f);
		table43.addCell(table_cell43);

		table_cell43 = new PdfPCell(new Phrase("Raincoat", Normalfont14));
		table_cell43.setBorderWidth(1f);
		table_cell43.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell43.setPaddingTop(8f);
		table_cell43.setPaddingBottom(8f);
		table43.addCell(table_cell43);
		
		table_cell43 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell43.setBorderWidth(1f);
		table_cell43.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell43.setPaddingTop(8f);
		table_cell43.setPaddingBottom(8f);
		table43.addCell(table_cell43);

		String ran = rs.getString("raincoat");
		double rann = Double.parseDouble(ran);
		table_cell43 = new PdfPCell(new Phrase(ran, Normalfont14));
		table_cell43.setBorderWidth(1f);
		table_cell43.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell43.setPaddingTop(8f);
		table_cell43.setPaddingBottom(8f);
		table43.addCell(table_cell43);
		
		document.add(table43);
		//--
		
		PdfPTable table44 = new PdfPTable(4);
		table44.setWidthPercentage(100);

		float[] columnWidths44 = {0.10f, 0.80f,0.4f, 0.3f};
		table44.setWidths(columnWidths44);

		PdfPCell table_cell44;

		table_cell44 = new PdfPCell(new Phrase("14", Normalfont14));
		table_cell44.setBorderWidth(1f);
		table_cell44.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell44.setPaddingTop(8f);
		table_cell44.setPaddingBottom(8f);
		table44.addCell(table_cell44);

		table_cell44 = new PdfPCell(new Phrase("Undergarments", Normalfont14));
		table_cell44.setBorderWidth(1f);
		table_cell44.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell44.setPaddingTop(8f);
		table_cell44.setPaddingBottom(8f);
		table44.addCell(table_cell44);
		
		table_cell44 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell44.setBorderWidth(1f);
		table_cell44.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell44.setPaddingTop(8f);
		table_cell44.setPaddingBottom(8f);
		table44.addCell(table_cell44);

		String un = rs.getString("undergarments");
		double und = Double.parseDouble(un);
		table_cell44 = new PdfPCell(new Phrase(un, Normalfont14));
		table_cell44.setBorderWidth(1f);
		table_cell44.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell44.setPaddingTop(8f);
		table_cell44.setPaddingBottom(8f);
		table44.addCell(table_cell44);
		
		document.add(table44);
		
		//--
		
		PdfPTable table45 = new PdfPTable(4);
		table45.setWidthPercentage(100);

		float[] columnWidths45 = {0.10f, 0.80f,0.4f, 0.3f};
		table45.setWidths(columnWidths45);

		PdfPCell table_cell45;

		table_cell45 = new PdfPCell(new Phrase("15", Normalfont14));
		table_cell45.setBorderWidth(1f);
		table_cell45.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell45.setPaddingTop(8f);
		table_cell45.setPaddingBottom(8f);
		table45.addCell(table_cell45);

		table_cell45 = new PdfPCell(new Phrase("Other Fees (Tour, Parent's Day, etc.)", Normalfont14));
		table_cell45.setBorderWidth(1f);
		table_cell45.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell45.setPaddingTop(8f);
		table_cell45.setPaddingBottom(8f);
		table45.addCell(table_cell45);
		
		table_cell45 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell45.setBorderWidth(1f);
		table_cell45.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell45.setPaddingTop(8f);
		table_cell45.setPaddingBottom(8f);
		table45.addCell(table_cell45);

		String oth = rs.getString("otherfees");
		double ot = Double.parseDouble(oth);
		table_cell45 = new PdfPCell(new Phrase(oth, Normalfont14));
		table_cell45.setBorderWidth(1f);
		table_cell45.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell45.setPaddingTop(8f);
		table_cell45.setPaddingBottom(8f);
		table45.addCell(table_cell45);
		
		document.add(table45);
		//--
		
			PdfPTable table46 = new PdfPTable(4);
		table46.setWidthPercentage(100);

		float[] columnWidths46 = {0.10f, 0.80f,0.4f, 0.3f};
		table46.setWidths(columnWidths46);

		PdfPCell table_cell46;

		table_cell46 = new PdfPCell(new Phrase("16", Normalfont14));
		table_cell46.setBorderWidth(1f);
		table_cell46.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell46.setPaddingTop(8f);
		table_cell46.setPaddingBottom(8f);
		table46.addCell(table_cell46);

		table_cell46 = new PdfPCell(new Phrase("Lump - Sum", Normalfont14));
		table_cell46.setBorderWidth(1f);
		table_cell46.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell46.setPaddingTop(8f);
		table_cell46.setPaddingBottom(8f);
		table46.addCell(table_cell46);
		
		table_cell46 = new PdfPCell(new Phrase(feedue, Normalfont14));
		table_cell46.setBorderWidth(1f);
		table_cell46.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell46.setPaddingTop(8f);
		table_cell46.setPaddingBottom(8f);
		table46.addCell(table_cell46);

		String lump = rs.getString("lumpsumfees");
		double laa = Double.parseDouble(lump);
	
		table_cell46 = new PdfPCell(new Phrase(lump, Normalfont14));
		table_cell46.setBorderWidth(1f);
		table_cell46.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell46.setPaddingTop(8f);
		table_cell46.setPaddingBottom(8f);
		table46.addCell(table_cell46);
		
		document.add(table46);
		//
		
		PdfPTable table47 = new PdfPTable(4);
		table47.setWidthPercentage(100);

		float[] columnWidths47 = {0.10f, 0.80f,0.4f, 0.3f};
		table47.setWidths(columnWidths47);

		PdfPCell table_cell47;

		table_cell47 = new PdfPCell(new Phrase("", Normalfont14));
		table_cell47.setBorderWidth(1f);
		table_cell47.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell47.setPaddingTop(8f);
		table_cell47.setPaddingBottom(8f);
		table47.addCell(table_cell47);

		table_cell47 = new PdfPCell(new Phrase("Total", font15Bold));
		table_cell47.setBorderWidth(1f);
		table_cell47.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell47.setPaddingTop(8f);
		table_cell47.setPaddingBottom(8f);
		table47.addCell(table_cell47);
		
		table_cell47 = new PdfPCell(new Phrase("", Normalfont14));
		table_cell47.setBorderWidth(1f);
		table_cell47.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell47.setPaddingTop(8f);
		table_cell47.setPaddingBottom(8f);
		table47.addCell(table_cell47);

		double tota  = ad+tu+comm+me+gy+la+sa+xa+co+ho+mess+unn+rann+und+ot+laa;
				//ad+tu+comm+me+gy+la+sa+xa+co+ho+mess+unn+rann+und+ot+laa;
		
		System.out.println("total - "+tota);
		table_cell47 = new PdfPCell(new Phrase(""+tota, font15Bold));
		table_cell47.setBorderWidth(1f);
		table_cell47.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell47.setPaddingTop(8f);
		table_cell47.setPaddingBottom(8f);
		table47.addCell(table_cell47);
		
		document.add(table47);
		//
		long totalInLong = Math.round(tota);
		String grossTotal = String.valueOf(totalInLong);
		int grossTotalInInteger = Integer.parseInt(grossTotal);
		NumToWord w = new NumToWord();
		String amtInWord = w.convert(grossTotalInInteger);
		
		PdfPTable tableFo = new PdfPTable(2);
		tableFo.setWidthPercentage(100);

		float[] columnWidthsFo = {0.20f,0.65f};
		tableFo.setWidths(columnWidthsFo);

		PdfPCell table_cellFo;
				
		table_cellFo = new PdfPCell(new Phrase("Rupees in Words :  ", font13));
		table_cellFo.setBorderWidth(1f);
//		table_cellFo.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cellFo.setPaddingLeft(10f);
		table_cellFo.setPaddingTop(10f);
		table_cellFo.setPaddingBottom(20f);
	//	table_cellFo.setBorder(table_cellFour.NO_BORDER);
		tableFo.addCell(table_cellFo);
		
		table_cellFo = new PdfPCell(new Phrase(amtInWord+" only."));
		table_cellFo.setBorderWidth(1f);
//		table_cellFo.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cellFo.setPaddingLeft(10f);
		table_cellFo.setPaddingTop(10f);
		table_cellFo.setPaddingBottom(20f);
	//	table_cellFo.setBorder(table_cellFo.NO_BORDER);
		tableFo.addCell(table_cellFo);
		
		document.add(tableFo);	
		//----
		
		PdfPTable tableFoo = new PdfPTable(2);
		tableFoo.setWidthPercentage(100);

		float[] columnWidthsFoo = {0.80f,0.30f};
		tableFoo.setWidths(columnWidthsFoo);

		PdfPCell table_cellFoo;
				
		table_cellFoo = new PdfPCell(new Phrase(name1, font15Bold));
		table_cellFoo.setBorderWidth(1f);
//		table_cellFo.setHorizontalAlignment(Element.ALIGN_CENTER);
//		table_cellFoo.setBorder(Rectangle.BOTTOM);
		table_cellFoo.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);	
		table_cellFoo.setPaddingLeft(70f);
		table_cellFoo.setPaddingTop(50f);
		table_cellFoo.setPaddingBottom(5f);
	//	table_cellFo.setBorder(table_cellFour.NO_BORDER);
		tableFoo.addCell(table_cellFoo);
		
		table_cellFoo = new PdfPCell(new Phrase("PRINCIPAL",font15Bold));
		table_cellFoo.setBorderWidth(1f);
//		table_cellFo.setHorizontalAlignment(Element.ALIGN_CENTER);
//		table_cellFoo.setBorder(Rectangle.BOTTOM);
		table_cellFoo.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
		table_cellFoo.setPaddingLeft(10f);
		table_cellFoo.setPaddingTop(50f);
		table_cellFoo.setPaddingBottom(5f);
	//	table_cellFo.setBorder(table_cellFo.NO_BORDER);
		tableFoo.addCell(table_cellFoo);
		
		document.add(tableFoo);	
		
		
		
		//----
/* 		 table_cell3 = new PdfPCell(new Phrase("Computer Fees (INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Activities Fees(INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Exam Fees (INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Total Fees (INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3); */
		
/* 		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
	    table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3); */
		
/* 		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3); */
		
		rs.beforeFirst();
//		Long countt = 1l;
		//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, batch_no, expiry_date, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + billno);
//		while (rs.next()) {
		/* 	String lastName = rs.getString("last_name");
			String firstName = rs.getString("first_name");
			String middleName = rs.getString("middle_name"); */
			
			 
		/* 	table_cell3 = new PdfPCell(new Phrase((""+countt)));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			double first_installment = rs.getDouble("first_installment");
			
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(first_installment), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			double second_installment = rs.getDouble("second_installment");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(second_installment), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			double gathering_fees  = rs.getDouble("admissionfees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(gathering_fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3); */

/* 			double computer_fees = rs.getDouble("computer_fees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(computer_fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			double activity_fees  = rs.getDouble("medicalfees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(activity_fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			double exam_Fees = rs.getDouble("exam_Fees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(exam_Fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			total_amount= activity_fees + computer_fees + gathering_fees + exam_Fees + second_installment + first_installment;
			
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(total_amount), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3); */
		//	countt++;
	//	} 

/* 		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		document.add(table3); */
/* 		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3); */
		
		
		// Gross Total in Words
		//String paymentAmountInWords = rs.getString("payment");
		
		/* String numberAsString = Double.toString(total_amount); */
	// this should uncomment further	
	/* 	long totalInLong = Math.round(total_amount);
		String grossTotal = String.valueOf(totalInLong);
		int grossTotalInInteger = Integer.parseInt(grossTotal);
		NumToWord w = new NumToWord();
		String amtInWord = w.convert(grossTotalInInteger);

		table_cell3 = new PdfPCell(new Phrase("\n Fee Paid in words (INR): "
				+ amtInWord + " Only/-\n "));
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setPaddingBottom(1f);
		table_cell3.setPaddingTop(1f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		
		table_cell3 = new PdfPCell(new Phrase());
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.TOP);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n\n Accountant Sign                            Seal                                Student Sign", font12NoBold));
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);

		document.add(table3); */
		// step 5 

		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (Exception de) {
		throw new IOException(de.getMessage());
	}
%>



