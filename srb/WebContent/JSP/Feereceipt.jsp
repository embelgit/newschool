
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
<%@page import="javafx.scene.layout.Border"%>
<%@page import="javafx.scene.transform.Rotate"%>
<%@page import="com.srb.utility.NumToWord"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%-- <%@page import="com." %> --%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>



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
	 System.out.print("hi this is receiptNumber == "+receiptNumber);

	Connection conn = null;
	double totalAnnualFee = 0.0;
	double remainingFee = 0.0;
	double payingFee= 0.0;
	String acdemicYear = null;
	try {

		// step 1
//		Document document = new Document(PageSize,Rotate.A5,15,15,20,10);
			Document document = new Document(PageSize.A5.rotate(),25,25,15,15);
		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
/* 		Image image1 = Image.getInstance("C:/Logo School.png"); */

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "root");
		Statement stmt = conn.createStatement();

		//ResultSet rs = stmt.executeQuery("SELECT first_name,middle_name,last_name,class_name,division,total_annual_fee,remaining_fee,paying_amount,accountant_name,academic_year FROM student_payment WHERE payment_receipt_number ='"+receiptNumber+"' ORDER BY pk_student_payment_id DESC LIMIT 1");
		ResultSet rs = stmt.executeQuery("SELECT sm.first_name,sm.middle_name,sm.last_name,sp.class_name,sp.division,sp.total_annual_fee,sp.remaining_fee,sp.paying_amount,sp.accountant_name,sp.academic_year FROM student_payment sp join student_master sm on  sm.first_name = sp.first_name and sm.middle_name = sp.middle_name and sm.last_name = sp.last_name WHERE payment_receipt_number ='"+receiptNumber+"' ");
		
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

//		Font  popin = new Font(Font.FontFamily);
		// step 4


/*          Font marFont = FontFactory.getFont("arial unicode ms",Font.IDENTITY_H,true);
         Font kruti_Dev = Font.createFont("c:/WINDOWS/Font/Kruti_Dev_010.ttf",BaseFont.CP1252,BaseFont.EMBEDDED); */
	//		Font font = new Font(kruti_Dev, 12, Font.NORMAL);
/* 			Paragraph preface = new Paragraph();

			FontFactory.registerDirectory("F:\\Poppins\\Poppins-BoldItalic.ttf");

            Font marFontt = FontFactory.getFont("arial unicode ms",BaseFont.IDENTITY_H,true);
//            Font mar = new Font(Font.FontFamily)
            // Lets write a big header
            preface.add(new Paragraph("मरा",marFontt));
			document.add(preface); */
	
	
		
/* 		image1.scaleToFit(100f, 200f);
		Image imageCenter = Image.getInstance(image1);
		imageCenter.setAlignment(Image.MIDDLE);
		document.add(imageCenter); */

		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.1f, 0.3f, 0.1f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Godavari Manar Charitable Trust's"));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
	 	
		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-----------------


		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Godavari Manar Public High School", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//-------------


		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("SHANKARNAGAR Tal- Biloli, Dist- Nanded", Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);
		//--------
 		/* table_cell = new PdfPCell(new Phrase("", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("Fee Receipt",  Normalfont14));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell();
		table_cell.setBorder(table_cell.NO_BORDER);*/
//		table.addCell(table_cell);  


		
		document.add(table);
		//--------
		/* table for customer name, village and date */

/* 		PdfPTable smallTable = new PdfPTable(3);
		smallTable.setWidthPercentage(100);

		float[] smallTablecolumnWidths = { 0.4f, 0.2f, 0.2f };
		smallTable.setWidths(smallTablecolumnWidths);

		PdfPCell table_cell2; */
		
/* 		String custName;
		
		String cn = String.valueOf(rs.getString("customer_name")); */
		
		/* if(cn.equals("N/A")){
			custName = creditCustomerName;
		}else
		{
			custName = cn;
		}
		 */
			

	/* 	table_cell2 = new PdfPCell();
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
		document.add(new Paragraph(" ")); */
		//Middle table
		PdfPTable tableth = new PdfPTable(4);
		tableth.setWidthPercentage(100);

		float[] columnWidthsth = {0.2f,0.5f,0.1f,0.2f};
		tableth.setWidths(columnWidthsth);

		PdfPCell table_cellth;
		
		
		table_cellth = new PdfPCell(new Phrase(""));
		table_cellth.setBorder(table_cellth.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
//		table_cellth.setPaddingLeft(10f);
		tableth.addCell(table_cellth);
		
		table_cellth = new PdfPCell(new Phrase(""));
		table_cellth.setBorder(table_cellth.NO_BORDER);
//		table_cellth.setPaddingLeft(10f);
		tableth.addCell(table_cellth);
		
		table_cellth = new PdfPCell(new Phrase("Date : ", font13));
		table_cellth.setBorder(table_cellth.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth.setPaddingBottom(10f);
		tableth.addCell(table_cellth);
		
		table_cellth = new PdfPCell(new Phrase(StrBillDate));
		table_cellth.setBorder(table_cellth.NO_BORDER);
//		table_cellth.setPaddingLeft(10f);
		tableth.addCell(table_cellth);
		
		document.add(tableth);
		//
		PdfPTable tableth1 = new PdfPTable(3);
		tableth1.setWidthPercentage(100);

		float[] columnWidthsth1 = {0.2f,0.5f,0.2f};
		tableth1.setWidths(columnWidthsth1);

		PdfPCell table_cellth1;
		
		table_cellth1 = new PdfPCell(new Phrase("", font15Bold));
		table_cellth1.setBorder(table_cellth1.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
//		table_cellth1.setPaddingLeft(220f);
//		table_cellth1.setPaddingTop(10f);
		table_cellth1.setPaddingBottom(10f);
		tableth1.addCell(table_cellth1);
		
		table_cellth1 = new PdfPCell(new Phrase("Fee Receipt (Voucher)", font15Bold));
//		table_cellth1.setBorder(table_cellth1.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
//		table_cellth1.setPaddingTop(100f);
//		table_cellth1.setPaddingTop(10f);
		table_cellth1.setPaddingLeft(90f);
		table_cellth1.setPaddingBottom(10f);
		tableth1.addCell(table_cellth1);
				
		table_cellth1 = new PdfPCell(new Phrase("", font15Bold));
		table_cellth1.setBorder(table_cellth1.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
//		table_cellth1.setPaddingLeft(220f);
//		table_cellth1.setPaddingTop(10f);
		table_cellth1.setPaddingBottom(10f);
		tableth1.addCell(table_cellth1);
		
		document.add(tableth1);
		
		PdfPTable tableth2 = new PdfPTable(2);
		tableth2.setWidthPercentage(100);

		float[] columnWidthsth2 = {0.2f,0.5f};
		tableth2.setWidths(columnWidthsth2);

		PdfPCell table_cellth2;
		
		table_cellth2 = new PdfPCell(new Phrase("Receipt To : "));
		table_cellth2.setBorder(table_cellth2.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth2.setPaddingTop(20f);
//		table_cellth2.setPaddingBottom(10f);
		tableth2.addCell(table_cellth2);
		
 		table_cellth2 = new PdfPCell(new Phrase("Godavari Manar Public School",font13));
		table_cellth2.setBorder(table_cellth2.NO_BORDER);
		table_cellth2.setPaddingTop(20f);
		table_cellth2.setPaddingBottom(10f);
		tableth2.addCell(table_cellth2); 
		
		document.add(tableth2);
		
		PdfPTable tableth3 = new PdfPTable(1);
		tableth2.setWidthPercentage(100);

		float[] columnWidthsth3 = {0.5f};
		tableth3.setWidths(columnWidthsth3);

		PdfPCell table_cellth3;
		
		table_cellth3 = new PdfPCell(new Phrase("Shankarnagar Tal- Biloli, Dist- Nanded", Normalfont13));
		table_cellth3.setBorder(table_cellth3.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth3.setPaddingLeft(100f);
		table_cellth3.setPaddingBottom(10f);
		tableth3.addCell(table_cellth3);
				
		document.add(tableth3);
		
		
		PdfPTable tableth4 = new PdfPTable(2);
		tableth4.setWidthPercentage(100);

		float[] columnWidthsth4 = {0.2f,0.4f};
		tableth4.setWidths(columnWidthsth4);

		PdfPCell table_cellth4;
		
		table_cellth4 = new PdfPCell(new Phrase("Payment Receipt From : "));
		table_cellth4.setBorder(table_cellth4.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth2.setPaddingTop(50f);
		table_cellth2.setPaddingBottom(10f);
		tableth4.addCell(table_cellth4);
		
		String ft = rs.getString("sm.first_name");
		String sd = rs.getString("sm.middle_name");
		String lt = rs.getString("sm.last_name");
		String namee = ft+" "+" "+sd+" "+lt;
		
 		table_cellth4 = new PdfPCell(new Phrase("Mr/Mrs "+namee,font15Bold));
		table_cellth4.setBorder(table_cellth4.NO_BORDER);
		table_cellth2.setPaddingTop(50f);
		table_cellth4.setPaddingBottom(10f);
		tableth4.addCell(table_cellth4); 
		
		document.add(tableth4);
		//
		
		PdfPTable tableth5 = new PdfPTable(2);
		tableth5.setWidthPercentage(100);

		float[] columnWidthsth5 = {0.3f,0.4f};
		tableth5.setWidths(columnWidthsth5);

		PdfPCell table_cellth5;
		
		table_cellth5 = new PdfPCell(new Phrase("I here by declared on today's date that : "));
		table_cellth5.setBorder(table_cellth5.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth5.setPaddingTop(10f);
		table_cellth5.setPaddingBottom(10f);
		tableth5.addCell(table_cellth5);
		
		String amount = rs.getString("sp.paying_amount");
 		table_cellth5 = new PdfPCell(new Phrase(amount+" /-",font15Bold));
		table_cellth5.setBorder(table_cellth5.NO_BORDER);
		table_cellth5.setPaddingTop(10f);
		table_cellth5.setPaddingBottom(10f);
		tableth5.addCell(table_cellth5); 
		
		document.add(tableth5);
		
		PdfPTable tableth6 = new PdfPTable(2);
		tableth6.setWidthPercentage(100);

		float[] columnWidthsth6 = {0.2f,0.4f};
		tableth6.setWidths(columnWidthsth6);

		PdfPCell table_cellth6;
		
		table_cellth6 = new PdfPCell(new Phrase("Amount in Words : "));
		table_cellth6.setBorder(table_cellth6.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth6.setPaddingTop(10f);
		table_cellth6.setPaddingBottom(10f);
		tableth6.addCell(table_cellth6);
		
		Double amt = Double.parseDouble(amount);
		long totalIn = Math.round(amt);
		String grossTot = String.valueOf(totalIn);
		int grossTotalInInt = Integer.parseInt(grossTot);
		NumToWord wa = new NumToWord();
		String amtInWords = wa.convert(grossTotalInInt);
		
		table_cellth6 = new PdfPCell(new Phrase(amtInWords+" only",font13));
		table_cellth6.setBorder(table_cellth6.NO_BORDER);
		table_cellth6.setPaddingTop(10f);
		table_cellth6.setPaddingBottom(10f);
		tableth6.addCell(table_cellth6); 
		
/* 		table_cellth6 = new PdfPCell(new Phrase("Cash Received ",Normalfont13));
		table_cellth6.setBorder(table_cellth6.NO_BORDER);

		table_cellth6.setPaddingLeft(450f);
		table_cellth6.setPaddingBottom(10f);
		tableth6.addCell(table_cellth6); */
		
		document.add(tableth6);
		//
		
		PdfPTable tableth7 = new PdfPTable(1);
		tableth7.setWidthPercentage(100);

		float[] columnWidthsth7 = {0.5f};
		tableth7.setWidths(columnWidthsth7);

		PdfPCell table_cellth7;
		
		table_cellth7 = new PdfPCell(new Phrase("Cash Received ",Normalfont13));
		table_cellth7.setBorder(table_cellth7.NO_BORDER);
//		table_cellth.setBorder(Rectangle.LEFT);
		table_cellth7.setPaddingLeft(450f);
		table_cellth7.setPaddingBottom(10f);
		tableth7.addCell(table_cellth7);
		
		document.add(tableth7);
		//
		
		PdfPTable tablethh7 = new PdfPTable(2);
		tablethh7.setWidthPercentage(100);

		float[] columnWidthsthh7 = {0.2f,0.6f};
		tablethh7.setWidths(columnWidthsthh7);

		PdfPCell table_cellthh7;
		
		table_cellthh7 = new PdfPCell(new Phrase("Rs : "+amount+" /-",font13));
//		table_cellthh7.setBorder(table_cellthh7.NO_BORDER);
//		table_cellthh7.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM );
//		table_cellthh7.setBorder(1);
		table_cellthh7.setBorderWidth(1f);
		table_cellthh7.setBorderWidthTop(5f);
		table_cellthh7.setBorderWidthBottom(5f);
		table_cellthh7.setPaddingLeft(40f);
		table_cellthh7.setPaddingTop(30f);
		table_cellthh7.setPaddingBottom(20f);
		tablethh7.addCell(table_cellthh7);
		
		table_cellthh7 = new PdfPCell(new Phrase("Receiver's Signature",font13));
		table_cellthh7.setBorder(table_cellthh7.NO_BORDER);
		table_cellthh7.setPaddingTop(50f);
		table_cellthh7.setPaddingBottom(10f);
		table_cellthh7.setPaddingLeft(280f);
		tablethh7.addCell(table_cellthh7); 
				
		document.add(tablethh7);
		
		//
/* 		PdfPTable table3 = new PdfPTable(5);
		table3.setWidthPercentage(100);

		float[] columnWidths3 = { 0.4f, 0.4f,0.4f, 0.4f,0.4f};
		table3.setWidths(columnWidths3);

		PdfPCell table_cell3;

		table_cell3 = new PdfPCell(new Phrase("Student Name", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Accountant Name", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Total Fee Amount(INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		 table_cell3 = new PdfPCell(new Phrase("Paid Amount(INR)", Normalfont14));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		 table_cell3 = new PdfPCell(new Phrase("Remaining Fee (INR)", Normalfont14));
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
		table3.addCell(table_cell3); */
		
		rs.beforeFirst();
		
		//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, batch_no, expiry_date, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + billno);
/* 		while (rs.next()) {
			String lastName = rs.getString("last_name");
			String firstName = rs.getString("first_name");
			String middleName = rs.getString("middle_name");
			
			 
			table_cell3 = new PdfPCell(new Phrase("Mr/Ms. "+firstName+" "+middleName+" "+lastName, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			String person_name = rs.getString("accountant_name");
			
			table_cell3 = new PdfPCell(new Phrase(person_name, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			totalAnnualFee = rs.getDouble("total_annual_fee");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(totalAnnualFee), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			payingFee = rs.getDouble("paying_amount");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(payingFee), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			remainingFee = rs.getDouble("remaining_fee");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(remainingFee), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
		} */

	/* 	table_cell3 = new PdfPCell(new Phrase("\n\n"));
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
/*		long totalInLong = Math.round(payingFee);
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
 */		// step 5 

		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>



