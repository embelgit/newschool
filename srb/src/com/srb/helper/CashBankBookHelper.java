package com.srb.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.srb.bean.FeeStructureReportBean;
import com.srb.bean.GetStudentDetailsBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.dao.CashBankBookDAO;
import com.srb.dao.FeeStructureDao;
import com.srb.dao.StudentPaymentDAO;
import com.srb.hibernate.FeeStructureHiberenate;
import com.srb.hibernate.StudentCashBankBookHibernate;

public class CashBankBookHelper {
	Long studentPaymentReceiptNumber;
	Long receiptNumberForPDf;
	//Add student payment
	public void addStudentPayment(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fk_class_id = request.getParameter("fk_class_id"); 
		String fk_division_id = request.getParameter("fk_division_id"); 
		String fk_Student_id = request.getParameter("fk_Student_id");
		//System.out.println(" hi this is fk_Student_id ==="+fk_Student_id);
		String className = request.getParameter("className"); 
		String divisionName = request.getParameter("divisionName"); 
		String firstName = request.getParameter("firstName"); 
		String middleName = request.getParameter("middleName"); 
		String lastName = request.getParameter("lastName"); 
		String academicYear = request.getParameter("academicYear"); 
		String accountantName = request.getParameter("accountantName"); 
		String totalAnnualFee = request.getParameter("totalAnnualFee"); 
		String remainingFee = request.getParameter("remainingFee"); 
		String payingFee = request.getParameter("payingFee"); 
		String expectedPaymentDate = request.getParameter("expectedPaymentDate");
		
		String paymentMode = request.getParameter("paymentMode"); 
		String chequeNum = request.getParameter("chequeNum"); 
		String nameOnCheck = request.getParameter("nameOnCheck"); 
		String cardNum = request.getParameter("cardNum"); 
		String accNum = request.getParameter("accNum"); 
		String bankName = request.getParameter("bankName"); 
		String studenttype = request.getParameter("studenttype");
		String namankit = request.getParameter("namankit");
		
		StudentCashBankBookHibernate bean = new StudentCashBankBookHibernate();
		
		
		StudentPaymentDAO d = new StudentPaymentDAO();
		List receiptNumber = d.getPaymentReceiptNumber();
		
		for(int i=0;i<receiptNumber.size();i++){
			StudentCashBankBookHibernate sa=(StudentCashBankBookHibernate)receiptNumber.get(i);
			studentPaymentReceiptNumber = sa.getPaymentReceiptNumber();
			System.out.println(studentPaymentReceiptNumber);
		
			studentPaymentReceiptNumber++;
			System.out.println(studentPaymentReceiptNumber);
		
		}
		
		if(studentPaymentReceiptNumber == null){
			bean.setPaymentReceiptNumber(1l);
			receiptNumberForPDf = 1l;
		}
		else{
			bean.setPaymentReceiptNumber(studentPaymentReceiptNumber);
			receiptNumberForPDf = studentPaymentReceiptNumber;
		}
		bean.setFkClassId(Long.parseLong(fk_class_id));
		bean.setFkDivisionId(Long.parseLong(fk_division_id));
		bean.setFkStudentId(Long.parseLong(fk_Student_id));
		bean.setClassName(className);
		bean.setDivisionName(divisionName);
		bean.setFirstName(firstName);
		bean.setMiddleName(middleName);
		bean.setLastName(lastName);
		bean.setAcademicYear(academicYear);
		bean.setAccountantName(accountantName);
		bean.setPayingFee(Double.parseDouble(payingFee));
		bean.setTotalAnnualFee(Double.parseDouble(totalAnnualFee));
		bean.setPaymentMode(paymentMode);
		bean.setAccNum(accNum);
		bean.setChequeNum(chequeNum);
		bean.setBankName(bankName);
		bean.setCardNum(cardNum);
		bean.setNameOnCheck(nameOnCheck);
		bean.setStudenttype(studenttype);
		bean.setNamankit(namankit);
		System.out.println("stu "+bean.getStudenttype()+" namankit - "+bean.getNamankit());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date pDD = null;
		try {
			pDD = dateFormat.parse(expectedPaymentDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bean.setExpectedPaymentDate(pDD);
		
		
		Date date = new Date();
		bean.setInsertDate(date);
		
		//remaining fee calculation
		Double payingAmount = Double.parseDouble(payingFee);
		Double remAmount = Double.parseDouble(remainingFee);
		Double remMinusPayingAmount = remAmount - payingAmount;
		bean.setRemainingFee(remMinusPayingAmount);
		
		//for pdf
		HttpSession studentPaymentSession = request.getSession();
		studentPaymentSession.setAttribute("receiptNumberForPDf", receiptNumberForPDf);

		
		StudentPaymentDAO dao = new StudentPaymentDAO();
		dao.addStudentPayment(bean);
	}
	
	// get student name as per class nd div
	public Map getStudentName(String fk_class_id, String fk_division_id) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getNameOfStudent(fk_class_id,fk_division_id);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			System.out.println("result - "+Arrays.toString(o));
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setPkStudentId(o[0].toString());
			bean.setFirstName(o[1].toString());
			bean.setMiddleName(o[2].toString());
			bean.setLastName(o[3].toString());
			bean.setRollno(Long.parseLong(o[4].toString()));
			System.out.println("rollno - "+bean.getRollno());
			System.out.println("***************"+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	}
	//nirgum student name
public Map getStudentNameng(String fk_class_id, String fk_division_id) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getNameOfStudentng(fk_class_id,fk_division_id);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			System.out.println("result - "+Arrays.toString(o));
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setPkStudentId(o[0].toString());
			bean.setFirstName(o[1].toString());
			bean.setMiddleName(o[2].toString());
			bean.setLastName(o[3].toString());
			bean.setRollno(Long.parseLong(o[4].toString()));
			System.out.println("rollno - "+bean.getRollno());
			System.out.println("***************"+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	}
	
	
	
	// get parent name as per student
		public Map getParentName(String studentName) {
			
			CashBankBookDAO dao = new CashBankBookDAO();
			List list = dao.getNameOfParent(studentName);
			Map  map =  new HashMap();
			
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				GetStudentDetailsBean bean = new GetStudentDetailsBean();
				bean.setPkStudentId(o[0].toString());
				bean.setFatherName(o[1].toString());
				//bean.setMiddleName(o[2].toString());
				//bean.setLastName(o[3].toString());
				
				System.out.println("***************"+o[0]);
				map.put(bean.getPkStudentId(),bean);
			}
			return map;
		
		}
	
	
	// Copy Of Leaving Certificate 
public Map getStudentNameCopy(String fk_class_id, String fk_division_id) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getNameOfStudentCopy(fk_class_id,fk_division_id);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setFirstName(o[0].toString());
			bean.setMiddleName(o[1].toString());
			bean.setLastName(o[2].toString());
			bean.setPkStudentId(o[3].toString());
			System.out.println("***************"+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	}

	// get total annual fee
	public Map getTotalAnnualFeeAsPerStudentName(String fk_class_id,
			String fk_division_id, String fk_Student_id) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getTotalAnnualFeeAspErNameOfStudent(fk_class_id,fk_division_id,fk_Student_id);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setPkStudentId(o[1].toString());
			bean.setTotalAnnualFee(Double.parseDouble(o[0].toString()));
			System.out.println("***************"+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	
	}
	
	//to get StudentFeegetTotalAnnualFee
	
	public Map getTotalAnnualFeeAsPerStudentNameStudentFee(String fk_class_id,
			String fk_division_id, String firstName, String middleName,String lastName) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getTotalAnnualFeeAsPerStudentNameStudentFee(fk_class_id,fk_division_id,firstName,middleName,lastName);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			System.out.println("result - "+Arrays.toString(o));
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setPkStudentId(o[1].toString());
			bean.setTotalAnnualFee(Double.parseDouble(o[0].toString()));
			bean.setStudenttype(o[2].toString());
			bean.setNamankittype(o[3].toString());
			bean.setRollno(Long.parseLong(o[4].toString()));
			System.out.println("*************** "+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	
	}

	
	//to get All Total by All PAyment
	
	
	public Map TrasnportionDetailsAllTotal(String fk_class_id,
			String fk_division_id, String fk_Student_id) {
		
		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.TrasnportionDetailsAllTotal(fk_class_id,fk_division_id,fk_Student_id);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			StudentInformationForReport bean = new StudentInformationForReport();
			bean.setPkStudentId(o[0].toString());
			bean.setTotalAnnualFee(Double.parseDouble(o[1].toString()));
			System.out.println("***************"+o[0]);
			map.put(bean.getPkStudentId(),bean);
		}
		return map;
	
	
	}
	
	// get remaining fee
	public Map getBalanceOfAnnualFeeAsPerStudentName(String fk_class_id,
			String fk_division_id,String firstName, String middleName,String lastName) {

		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getRemainingFeeAmount(fk_class_id,fk_division_id,firstName,middleName,lastName);
		Map  map =  new HashMap();
		//System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if(sic==0)
		{
			StudentInformationForReport bean = new StudentInformationForReport();
			CashBankBookDAO dao1 = new CashBankBookDAO();
			Double totalAmt = dao1.getTotalAnnualAmt(fk_class_id,fk_division_id,firstName,middleName,lastName);
			bean.setBalanceFee(totalAmt);
			map.put(bean.getBalanceFee(),bean);
		}
		else {
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				StudentInformationForReport bean = new StudentInformationForReport();
				Double newBal = (Double.parseDouble(o[1].toString()));
				//bean.setTotalAnnualFee(newBal);	
				bean.setBalanceFee((newBal));
				System.out.println("***************"+o[0]);
				System.out.println("hi this is Balance(o[1].toString())"+(o[1].toString()));
				map.put(bean.getBalanceFee(),bean);
			}
		}
		
		return map;
	
	}
	// get Remaining Fee For Trasnportaion Bus 
	public Map TransportionBusRemainingFeesList(String fk_class_id,
			String fk_division_id,String fk_Student_id) {

		CashBankBookDAO dao = new CashBankBookDAO();
		List list = dao.getRemainingFeeAmountTransport(fk_class_id,fk_division_id,fk_Student_id);
		Map  map =  new HashMap();
		//System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if(sic==0)
		{
			StudentInformationForReport bean = new StudentInformationForReport();
			CashBankBookDAO dao1 = new CashBankBookDAO();
			Double totalAmt = dao1.getTotalAnnualAmtTransport(fk_class_id,fk_division_id,fk_Student_id);
			bean.setBalanceFee(totalAmt);
			map.put(bean.getBalanceFee(),bean);
		}
		else {
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				StudentInformationForReport bean = new StudentInformationForReport();
				Double newBal = (Double.parseDouble(o[1].toString()));
				//bean.setTotalAnnualFee(newBal);	
				bean.setBalanceFee((newBal));
				System.out.println("***************"+o[0]);
				System.out.println("hi this is Balance(o[1].toString())"+(o[1].toString()));
				map.put(bean.getBalanceFee(),bean);
			}
		}
		
		return map;
	
	}
	
	
//add fee structure
	public void doFeeStrucHelper(HttpServletRequest request, HttpServletResponse response) {
		
		 // for auto incre Receipt No 
		Long ReceiptNo = 1l;
		
		 	FeeStructureDao dao1 = new FeeStructureDao();

			List bill = dao1.getAutoReceipt();

			for (int i = 0; i < bill.size(); i++) {
				FeeStructureHiberenate sa = (FeeStructureHiberenate) bill.get(i);
				ReceiptNo = sa.getPaymentReceiptNumber();
				System.out.println(ReceiptNo);

				ReceiptNo++;
				System.out.println(ReceiptNo);
			}
		
		
		String fk_class_id = request.getParameter("fk_class_id"); 
		String fk_division_id = request.getParameter("fk_division_id"); 
		String className = request.getParameter("className"); 
		String divisionName = request.getParameter("divisionName"); 
		String firstName = request.getParameter("firstName"); 
		String middleName = request.getParameter("middleName"); 
		String lastName = request.getParameter("lastName"); 
		String academicYear = request.getParameter("academicYear"); 
		String totalAnnualFee = request.getParameter("totalAnnualFee"); 
		String remainingFee = request.getParameter("remainingFee"); 
		String expectedPaymentDate = request.getParameter("expectedPaymentDate");
		String rollno = request.getParameter("rollno");
		String firstInstallment = request.getParameter("firstInstallment"); 
		String secondInstallment = request.getParameter("secondInstallment"); 
//		String gatheringFees = request.getParameter("gatheringFees"); 
		String computerFees = request.getParameter("computerfees"); 
//		String activityFees = request.getParameter("activityFees"); 
		String examFees = request.getParameter("examfees"); 
		String admissionfees = request.getParameter("admissionfees");
		
		String tuitionfees = request.getParameter("tuitionfees");
		String medicalfees = request.getParameter("medicalfees");
		String gymnassiumfees = request.getParameter("gymnassiumfees");
		String laboratoryfees = request.getParameter("laboratoryfees");
		String stationaryfees = request.getParameter("stationaryfees");
		String competitivefees = request.getParameter("competitivefees");
		String hostelfees = request.getParameter("hostelfees");
		String messfees = request.getParameter("messfees");
		String uniformfees = request.getParameter("uniformfees");
		String raincoat = request.getParameter("raincoat");
		String undergarments = request.getParameter("undergarments");
		String otherfees = request.getParameter("otherfees");
		String lumpsumfees = request.getParameter("lumpsumfees");
		String feedue = request.getParameter("feedue");
		
		FeeStructureHiberenate fsh = new FeeStructureHiberenate();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date pDD = null;
		try {
			pDD = dateFormat.parse(expectedPaymentDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fsh.setExpectedPaymentDate(pDD);
		
		fsh.setFkClassId(Long.parseLong(fk_class_id));
		fsh.setFkDivisionId(Long.parseLong(fk_division_id));
		fsh.setClassName(className);
		fsh.setDivisionName(divisionName);
		fsh.setFirstName(firstName);
		fsh.setMiddleName(middleName);
		fsh.setLastName(lastName);
		fsh.setAcademicYear(academicYear);
		fsh.setRemainingFee(Double.parseDouble(remainingFee));
		fsh.setTotalAnnualFee(Double.parseDouble(totalAnnualFee));
		
		fsh.setFirstInstallment(Double.parseDouble(firstInstallment));
		fsh.setSecondInstallment(Double.parseDouble(secondInstallment));
//		fsh.setGatheringFees(Double.parseDouble(gatheringFees));
		fsh.setComputerFees(Double.parseDouble(computerFees));
//		fsh.setActivityFees(Double.parseDouble(activityFees));
		fsh.setExamFees(Double.parseDouble(examFees));
		fsh.setPaymentReceiptNumber(ReceiptNo);
		fsh.setAdmissionfees(Double.parseDouble(admissionfees));
		fsh.setTuitionfees(Double.parseDouble(tuitionfees));
		fsh.setMedicalfees(Double.parseDouble(medicalfees));
		fsh.setGymnassiumfees(Double.parseDouble(gymnassiumfees));
		fsh.setLaboratoryfees(Double.parseDouble(laboratoryfees));
		fsh.setStationaryfees(Double.parseDouble(stationaryfees));
		fsh.setCompetitivefees(Double.parseDouble(competitivefees));
		fsh.setHostelfees(Double.parseDouble(hostelfees));
		fsh.setMessfees(Double.parseDouble(messfees));
		fsh.setUniformfees(Double.parseDouble(uniformfees));
		fsh.setRaincoat(Double.parseDouble(raincoat));
		fsh.setOtherfees(Double.parseDouble(otherfees));
		fsh.setUndergarments(Double.parseDouble(undergarments));
		fsh.setLumpsumfees(Double.parseDouble(lumpsumfees));
		fsh.setFeedue(feedue);
		fsh.setRollno(Long.parseLong(rollno));
		System.out.println("in helper feedue - "+fsh.getFeedue());
		
		FeeStructureDao dao = new FeeStructureDao();
		dao.addFeeStructure(fsh);
		
	}

	//Student Fee Structure Reports
	
	//Student Fee Structure Reports Student Name Wise
	
	public List getReportStudentNameWise(HttpServletRequest request, HttpServletResponse response) {
		//String academicYear = request.getParameter("academicYear");
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		String studentName = request.getParameter("studentId");
		System.out.println("hi this is studentName =="+studentName);
		
         Map<Long,FeeStructureHiberenate> map = new HashMap<Long,FeeStructureHiberenate>();
 		
         FeeStructureDao dao = new FeeStructureDao();
 		List<FeeStructureHiberenate> expList = dao.getStudentWiseReport(fk_class_id,fk_division_id,studentName);
 		
 		return expList;
	}

	//Student Fee Structure Reports Student class Wise
		public List getReportStudentClassWise(HttpServletRequest request, HttpServletResponse response) {
			String fk_class_id = request.getParameter("fk_class_id");
			
	         Map<Long,FeeStructureHiberenate> map = new HashMap<Long,FeeStructureHiberenate>();
	 		
	         FeeStructureDao dao = new FeeStructureDao();
	 		List<FeeStructureHiberenate> expList = dao.getClassWiseReport(fk_class_id);
	 		
	 		return expList;
		}
		
		//Student Fee Structure Reports Day Wise
				public List getReportStudentDayWise(HttpServletRequest request, HttpServletResponse response) {
					String expectedPaymentDate = request.getParameter("expectedPaymentDate");
					
			         Map<Long,FeeStructureHiberenate> map = new HashMap<Long,FeeStructureHiberenate>();
			 		
			         FeeStructureDao dao = new FeeStructureDao();
			 		List<FeeStructureHiberenate> expList = dao.getDayWiseReport(expectedPaymentDate);
			 		
			 		return expList;
				}
				
				//Student Fee Structure Reports Month Wise
				public List getReportStudentMonthWise(HttpServletRequest request, HttpServletResponse response) {
					String expectedPaymentDate1 = request.getParameter("expectedPaymentDate1");
					System.out.println("*****Helper*******"+expectedPaymentDate1);
			         Map<Long,FeeStructureHiberenate> map = new HashMap<Long,FeeStructureHiberenate>();
			 		
			         FeeStructureDao dao = new FeeStructureDao();
			 		List<FeeStructureHiberenate> expList = dao.getMonthWiseReport(expectedPaymentDate1);
			 		
			 		return expList;
				}
	
	
}
