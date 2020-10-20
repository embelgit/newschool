
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
	String acdemicYear = null;
	try {

		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
		Image image1 = Image.getInstance("C:/Logo School.png");

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT first_name,middle_name,last_name,class_name,payment_receipt_number,division,first_installment,second_installment,admissionfees,computer_fees,medicalfees,exam_Fees,academic_year FROM student_fee_structure ORDER BY pk_fee_structure_id DESC LIMIT 1");
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
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		// step 4
		
		image1.scaleToFit(100f, 200f);
		Image imageCenter = Image.getInstance(image1);
		imageCenter.setAlignment(Image.MIDDLE);
		document.add(imageCenter);

		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.2f, 0.3f, 0.2f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase("Bill Cash/Credit Memorandum", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Sanskruti & Paryavaran Sanvardhan Mandals"));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
	 	
		table_cell = new PdfPCell(new Phrase("Academic Year :"+acdemicYear, Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-----------------


		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("VENKATARAMANA HI-TECH ENGLISH SCHOOL", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-------------


		
		table_cell = new PdfPCell();
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("AMBALA, Tal- Hadgaon, Dist- Nanded(Maharashtra)", Normalfont14));
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);
		//--------
		table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("Fee Receipt",  Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);


		
		document.add(table);
		//--------
		/* table for customer name, village and date */

		PdfPTable smallTable = new PdfPTable(3);
		smallTable.setWidthPercentage(100);

		float[] smallTablecolumnWidths = { 0.4f, 0.2f, 0.2f };
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
			

		table_cell2 = new PdfPCell();
		table_cell2.setBorder(table_cell.NO_BORDER);
		smallTable.addCell(table_cell2);


		table_cell2 = new PdfPCell();
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
		smallTable.addCell(table_cell2);

		table_cell2 = new PdfPCell(new Phrase("Date: " + StrBillDate));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
		smallTable.addCell(table_cell2);

		document.add(smallTable);
		document.add(new Paragraph(" "));
		//Middle table

		PdfPTable table3 = new PdfPTable(8);
		table3.setWidthPercentage(100);

		float[] columnWidths3 = { 0.4f, 0.4f,0.4f, 0.4f,0.4f,0.4f,0.4f,0.4f};
		table3.setWidths(columnWidths3);

		PdfPCell table_cell3;

		table_cell3 = new PdfPCell(new Phrase("Student Name", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("1st Installment", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("2nd Installment", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Gathering Fees(INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		 table_cell3 = new PdfPCell(new Phrase("Computer Fees (INR)", Normalfont14));
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
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		rs.beforeFirst();
		
		//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, batch_no, expiry_date, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + billno);
		while (rs.next()) {
			String lastName = rs.getString("last_name");
			String firstName = rs.getString("first_name");
			String middleName = rs.getString("middle_name");
			
			 
			table_cell3 = new PdfPCell(new Phrase("Mr/Ms. "+firstName+" "+middleName+" "+lastName, font12NoBold));
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

			double gathering_fees  = rs.getDouble("gathering_fees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(gathering_fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			double computer_fees = rs.getDouble("computer_fees");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(computer_fees), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			double activity_fees  = rs.getDouble("activity_fees");
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
			table3.addCell(table_cell3);
			
		} 

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

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		
		// Gross Total in Words
		//String paymentAmountInWords = rs.getString("payment");
		
		/* String numberAsString = Double.toString(total_amount); */
		
		long totalInLong = Math.round(total_amount);
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

		document.add(table3);
		// step 5 

		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (Exception de) {
		throw new IOException(de.getMessage());
	}
%>



