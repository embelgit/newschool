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
	String acdemicYear = null;
	try {
		String classs=(String)session.getAttribute("classNameForAdmitCard");
		String DivisionNameForAdmitCard=(String)session.getAttribute("DivisionNameForAdmitCard");
		String Academic=(String)session.getAttribute("AcademicForAdmitCard");
		String studentNameForAdmitCard=(String)session.getAttribute("studentNameForAdmitCard");
		String ToDateForAdmitCard=(String)session.getAttribute("ToDateForAdmitCard");
		String FromDateForAdmitCard=(String)session.getAttribute("FromDateForAdmitCard");
		String[] words=ToDateForAdmitCard.split("-");
		String year = words[0];
		String month = words[1];
		String date = words[2];
		String todate = date+"/"+month+"/"+year;
		String[] words1=FromDateForAdmitCard.split("-");
		String year1 = words1[0];
		String month1 = words1[1];
		String date1 = words1[2];
		String fromdate1 = date1+"/"+month1+"/"+year1;
		System.out.println("classs----------"+classs);
		System.out.println("DivisionNameForAdmitCard------------"+DivisionNameForAdmitCard);
		System.out.println("Academic--------"+Academic);
		System.out.println("studentNameForAdmitCard-------------"+studentNameForAdmitCard);
		System.out.println("todate------------"+todate);
		System.out.println("fromdate1-------"+fromdate1 );
		// step 1
		Document document = new Document(PageSize.A5,10,10,20,10);

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
		
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

		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("Admit Card For Exam",ufont14));
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
		
		
		
		PdfPTable tableThird = new PdfPTable(1);
		tableThird.setWidthPercentage(70);

		float[] columnWidthsThird = {0.5f};
		tableThird.setWidths(columnWidthsThird);

		PdfPCell table_cellThird;
		
		
		
		
		table_cellThird = new PdfPCell(new Phrase("    This  Admit  Card  is  For  Exam  Of  Academic  Year  "));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase("   Academic  Year   "+Academic));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		
			table_cellThird = new PdfPCell(new Phrase(" With  Name  of Mr :- "+studentNameForAdmitCard+"  is  a "));
			table_cellThird.setPaddingBottom(20f);
			table_cellThird.setBorder(table_cellThird.NO_BORDER);
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableThird.addCell(table_cellThird);
		
		table_cellThird = new PdfPCell(new Phrase("  Which is Held From   "+fromdate1+"  TO   "+fromdate1));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);	
/* 		table_cellThird = new PdfPCell(new Phrase("At:-    "+city+"   Taluka:-    "+taluka+ "    Dist:-        "+district,font13 ));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird); */
		
		table_cellThird = new PdfPCell(new Phrase(" Student  of  Class  Name  is "+classs));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
		
		Date dd = Calendar.getInstance().getTime();  
        DateFormat dateFormatt = new SimpleDateFormat("yyyy");  
        String strDatee = dateFormatt.format(d);
        System.out.println("strDatee - "+strDatee);
	//	Long a = Long.valueOf(strDate);
		
		table_cellThird = new PdfPCell(new Phrase("Please Carry This Admit Card On Exam Center"));
		table_cellThird.setPaddingBottom(20f);
		table_cellThird.setBorder(table_cellThird.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		tableThird.addCell(table_cellThird);
       
		
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

		table_cellFour = new PdfPCell(new Phrase("       PRINCIPAL"));
		table_cellFour.setPaddingTop(15f);
		table_cellFour.setPaddingBottom(20f);
		table_cellFour.setBorder(Rectangle.BOTTOM);
		tableFour.addCell(table_cellFour);
		document.add(tableFour);		
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>



