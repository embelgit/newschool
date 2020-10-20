<%-- <%@page import="org.apache.batik.script.Window"%> --%>
<%@page import="org.w3c.dom.css.Rect"%>
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
		Long studentId = (Long)session.getAttribute("studentIdForLC");
		System.out.println("studentId===="+studentId);
		// step 1
		Document document = new Document(PageSize.A5,10,10,20,10);

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT first_name,middle_name,last_name,city,taluka,district,cast,date_of_birth,c.class_name AS className,general_reg_number,gender,mother_name FROM student_master LEFT JOIN class_master c ON fk_class_id = c.pk_class_id WHERE pk_student_id="+studentId);
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
		System.out.println("Query Execute size ++  "+size);
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
		//Font Normalfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLUE);
		

		// step 4

		//second table
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.1f, 0.5f, 0.1f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Godavari Manar Charitable Trust's         ESTD 1989"));
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

		String classs  = rs.getString("className");
	//	String a = "8";
	//	Long  c = Long.valueOf(classs);
//		long cs = Long.parseLong(classs);
		System.out.println("classs - "+classs);
		if(classs.equals("11th") || classs.equals("12th")){
		table_cell = new PdfPCell(new Phrase("Godavari Manar Public Jr. College, Shankarnagar", font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setPaddingTop(3f);
		table.addCell(table_cell);
		System.out.println("if -");
		}
 		else if(classs.equals("8th") || classs.equals("9th") || classs.equals("10th")){
			table_cell = new PdfPCell(new Phrase("Godavari Manar Public High School, Shankarnagar", font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setPaddingTop(3f);
			table.addCell(table_cell);
			System.out.println("else if -");
		}
		else {
			table_cell = new PdfPCell(new Phrase("Godavari Manar Public School, Shankarnagar", font15Bold));
			table_cell.setBorder(table_cell.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setPaddingTop(3f);
			table.addCell(table_cell);
			System.out.println("else -");
		} 
		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//--------

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(" Tal: Biloli, Dist: Nanded (MAHARASHTRA)", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setPaddingTop(3f);
//		table_cell.setBorder(Rectangle.BOTTOM);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		

		//-------------

		//String examName = rs.getString("exam_name");
		
		/* table_cell = new PdfPCell();
		table_cell.setPaddingBottom(10f);
		table_cell.setBorder(Rectangle.NO_BORDER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell); */
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("BONAFIDE & CHARACTER CERTIFICATE",ufont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setPaddingTop(5f);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	//	table_cell.setBorder(Rectangle.BOTTOM);
		table.addCell(table_cell);
	/*	table_cell.setPaddingBottom(10f);
	//	table_cell.setBorder(Rectangle.BOTTOM| Rectangle.LEFT | Rectangle.RIGHT | Rectangle.TOP );
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);*/
	//	table.addCell(table_cell);
		

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
	//--
	     Date d = Calendar.getInstance().getTime();  
         DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
         String strDate = dateFormat.format(d);  
		
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("Date:- "+strDate));
		table_cell.setPaddingTop(10f);
		table_cell.setPaddingBottom(20f);
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
	/*	table_cell = new PdfPCell(new Phrase(""));
		//table_cell.setPaddingBottom(10f);
		table_cell.setBorder(table_cell.NO_BORDER);
		//table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);*/

		document.add(table);

		String first_name  = rs.getString("first_name");
		String middle_name  = rs.getString("middle_name");
		String last_name  = rs.getString("last_name");
		String fullname = first_name+" "+middle_name+" "+last_name;
		String city  = rs.getString("city");
		String taluka  = rs.getString("taluka");
		String district  = rs.getString("district");
		String className  = rs.getString("className");
		String cast  = rs.getString("cast");
		String date_of_birth  = rs.getString("date_of_birth");
		String generalRegNo = rs.getString("general_reg_number");
		String gender = rs.getString("gender");
		String mother_name = rs.getString("mother_name");
		String gn  ="Male";
		System.out.println("gender - "+gender+" , mother_name"+mother_name);
		//third table for note
		PdfPTable tableThird = new PdfPTable(1);
		tableThird.setWidthPercentage(70);

		float[] columnWidthsThird = {0.5f};
		tableThird.setWidths(columnWidthsThird);

		PdfPCell table_cellThird;
		
		
		
		
		table_cellThird = new PdfPCell(new Phrase("        This  is  to  Certify  that,  "));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		if(gender.equals(gn)){
		table_cellThird = new PdfPCell(new Phrase("Master :- "+fullname+"   is  a "));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		}
		else{
			table_cellThird = new PdfPCell(new Phrase("Miss :- "+fullname+"  is  a "));
			table_cellThird.setPaddingBottom(20f);
			table_cellThird.setBorder(table_cellThird.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableThird.addCell(table_cellThird);
		}
		
/* 		table_cellThird = new PdfPCell(new Phrase("At:-    "+city+"   Taluka:-    "+taluka+ "    Dist:-        "+district,font13 ));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird); */
		
		table_cellThird = new PdfPCell(new Phrase("bonafied  student  of  this  school  studying  in  Std  "+className));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		Date dd = Calendar.getInstance().getTime();  
        DateFormat dateFormatt = new SimpleDateFormat("yyyy");  
        String strDatee = dateFormatt.format(d);
        System.out.println("strDatee - "+strDatee);
	//	Long a = Long.valueOf(strDate);
		Long a = Long.parseLong(strDatee);		
		Long b = a+1;
		 System.out.println("b - "+b);
        if(gender.equals(gn)){
		table_cellThird = new PdfPCell(new Phrase("in  the  academic  year  "+strDatee+"-"+b+".  His  date-of-birth"));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
        }
        else{
        	table_cellThird = new PdfPCell(new Phrase("in  the  academic  year  "+strDatee+"-"+b+".  Her  date-of-birth"));
    		table_cellThird.setPaddingBottom(20f);
    		table_cellThird.setBorder(table_cellThird.NO_BORDER);
    		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		tableThird.addCell(table_cellThird);
        }
		String[] words=date_of_birth.split("-");
		String year = words[0];
		String month = words[1];
		String date = words[2];
		String birthDate = date+"/"+month+"/"+year;
		
		
		table_cellThird = new PdfPCell(new Phrase("as  per  the  admission  register  is  "+birthDate+"."));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		if(gender.equals(gn)){
		table_cellThird = new PdfPCell(new Phrase("His  Mother's  Name  is - "+mother_name+"."));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		}
		else {
			table_cellThird = new PdfPCell(new Phrase("Her  Mother's  Name  is - "+mother_name+"."));
			table_cellThird.setPaddingBottom(20f);
			table_cellThird.setBorder(table_cellThird.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableThird.addCell(table_cellThird);
		}
		if(gender.equals(gn)){
		table_cellThird = new PdfPCell(new Phrase("       He  is  regular  in  attendance."));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		}
		else {
			table_cellThird = new PdfPCell(new Phrase("       She  is  regular  in  attendance."));
			table_cellThird.setPaddingBottom(20f);
			table_cellThird.setBorder(table_cellThird.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableThird.addCell(table_cellThird);
		}
		
		if(gender.equals(gn)){
		table_cellThird = new PdfPCell(new Phrase("      He  bears  a  good  moral  character."));
		table_cellThird.setPaddingBottom(35f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		}
		else {
			table_cellThird = new PdfPCell(new Phrase("      She  bears  a  good  moral  character."));
			table_cellThird.setPaddingBottom(35f);
			table_cellThird.setBorder(table_cellThird.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableThird.addCell(table_cellThird);	
		}
		
		
		document.add(tableThird);
		
		
		PdfPTable tableFour = new PdfPTable(2);
		tableFour.setWidthPercentage(70);

		float[] columnWidthsFour = {0.3f,0.3f};
		tableFour.setWidths(columnWidthsFour);

		PdfPCell table_cellFour;
		table_cellFour = new PdfPCell(new Phrase("Clerk"));
		table_cellFour.setPaddingTop(15f);
		table_cellFour.setPaddingBottom(20f);
		table_cellFour.setBorder(Rectangle.BOTTOM); 
//		table_cell.setBorder(Rectangle.TOP );
		tableFour.addCell(table_cellFour);

		table_cellFour = new PdfPCell(new Phrase("          PRINCIPAL"));
		table_cellFour.setPaddingTop(15f);
		table_cellFour.setPaddingBottom(20f);
		table_cellFour.setBorder(Rectangle.BOTTOM);
		tableFour.addCell(table_cellFour);
		document.add(tableFour);
/* 		//seventh table for note
		PdfPTable tableSeven = new PdfPTable(1);
		tableSeven.setWidthPercentage(100);

		float[] columnWidthsSeven = {0.5f};
		tableSeven.setWidths(columnWidthsSeven);

		PdfPCell table_cellSeven;
		
		table_cellSeven = new PdfPCell(new Phrase("Certified that the above information is in accordance with the school general register", font13));
		table_cellSeven.setBorder(table_cellSeven.NO_BORDER);
		table_cellSeven.setPaddingBottom(50f);
		tableSeven.addCell(table_cellSeven);
		document.add(tableSeven); */
		
		
		
		//Eighth table for sign
      /*    Date d = Calendar.getInstance().getTime();  
         DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
         String strDate = dateFormat.format(d);   */
		
/*  		PdfPTable tableEight = new PdfPTable(3);
		tableEight.setWidthPercentage(70);

		float[] columnWidthsEight = {0.3f,0.3f,0.3f};
		tableEight.setWidths(columnWidthsEight);

		PdfPCell table_cellEight;
		
		
		table_cellEight = new PdfPCell(new Phrase("General Register No:-  ",font13));
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER); 
		table_cell.setBorder(Rectangle.TOP );
		tableEight.addCell(table_cellEight);

		table_cellEight = new PdfPCell(new Phrase(""+generalRegNo,font13));
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER);
		tableEight.addCell(table_cellEight);
		

		table_cellEight = new PdfPCell(new Phrase(""));
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER);
		tableEight.addCell(table_cellEight);
		
//		table_cellEight = new PdfPCell(new Phrase("Place :- Ambala", font13));
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER);
		tableEight.addCell(table_cellEight);
	
		table_cellEight = new PdfPCell(new Phrase(""));
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER);
		tableEight.addCell(table_cellEight);
		
		
		table_cellEight = new PdfPCell(new Phrase());
		table_cellEight.setPaddingTop(15f);
		table_cellEight.setPaddingBottom(5f);
		table_cellEight.setBorder(table_cellEight.NO_BORDER);
		tableEight.addCell(table_cellEight);
		
	//	table_cellEight = new PdfPCell(new Phrase("Date:- "+strDate, font13));
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorder(Rectangle.BOTTOM);
		tableEight.addCell(table_cellEight);
	
		table_cellEight = new PdfPCell(new Phrase("    Clerk"));
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorder(Rectangle.BOTTOM);
		tableEight.addCell(table_cellEight);
		
		
		table_cellEight = new PdfPCell(new Phrase("  PRINCIPAL"));
		table_cellEight.setPaddingBottom(20f);
		table_cellEight.setBorder(Rectangle.BOTTOM);
		tableEight.addCell(table_cellEight);
		
		document.add(tableEight);  */

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



