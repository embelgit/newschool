package com.srb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.FeeStructureReportBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.hibernate.FeeStructureHiberenate;
import com.srb.utility.HibernateUtility;

public class FeeStructureDao {
public void addFeeStructure(FeeStructureHiberenate fsh) {
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		System.out.println("before savig obj in dao ");
		session.save(fsh);
		transaction.commit();
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}finally{
		hbu.closeSession(session);
		}
	
	}
//method to get AutoRecipt no

public List getAutoReceipt(){	
	HibernateUtility hbu=null;
	Session session=null;
	List<FeeStructureHiberenate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT payment_receipt_number,pk_fee_structure_id FROM student_fee_structure ORDER BY payment_receipt_number DESC LIMIT 1");

		List<Object[]> list = query.list();
		saleList= new ArrayList<FeeStructureHiberenate>(0);
		for (Object[] object : list) {
			System.out.println("List size :::::::::"+list.size());
			FeeStructureHiberenate reports = new FeeStructureHiberenate();
			reports.setPaymentReceiptNumber(Long.parseLong(object[0].toString()));
			System.out.println("Bill no Object ::::::::::"+object[0]);
			saleList.add(reports);	 
		}}
	catch(RuntimeException e)
	{
		Log.error("Error in getCustomerBill()", e);	
	}finally
	{if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return saleList;
}

//Student Fee Structure Reports

//Student Fee Structure Reports Student Name Wise
public List<FeeStructureHiberenate> getStudentWiseReport(String fkClassId, String fkDivId, String studentName) {

	System.out.println("in helper+++++++++++++"+studentName);
	HibernateUtility hbu=null;
	Session session=null;
	List<FeeStructureHiberenate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
//		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,first_installment,second_installment,gathering_fees,computer_fees,activity_fees,exam_Fees,academic_year,expected_payment_date FROM student_fee_structure WHERE concat (first_name,' ',middle_name,' ',last_name) ='"+studentName+"'");
		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,computer_fees,exam_Fees,tuitionfees,admissionfees,medicalfees,gymnassiumfees,laboratoryfees,stationaryfees,competitivefees,hostelfees,messfees,uniformfees,raincoat,undergarments,otherfees,lumpsumfees ,academic_year,expected_payment_date FROM student_fee_structure WHERE concat (first_name,' ',middle_name,' ',last_name) ='"+studentName+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<FeeStructureHiberenate>(0);
		
		
		for (Object[] object : list) {
			
//			FeeStructureReportBean s = new FeeStructureReportBean();
			FeeStructureHiberenate s = new FeeStructureHiberenate();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setClassName(object[3].toString());
			s.setDivisionName(object[4].toString());
			s.setComputerFees(Double.parseDouble(object[5].toString()));
			s.setExamFees(Double.parseDouble(object[6].toString()));
			s.setTuitionfees(Double.parseDouble(object[7].toString()));
			s.setAdmissionfees(Double.parseDouble(object[8].toString()));
			s.setMedicalfees(Double.parseDouble(object[9].toString()));
			s.setGymnassiumfees(Double.parseDouble(object[10].toString()));
			s.setLaboratoryfees(Double.parseDouble(object[11].toString()));
			s.setStationaryfees(Double.parseDouble(object[12].toString()));
			s.setCompetitivefees(Double.parseDouble(object[13].toString()));
			s.setHostelfees(Double.parseDouble(object[14].toString()));
			s.setMessfees(Double.parseDouble(object[15].toString()));
			s.setUniformfees(Double.parseDouble(object[16].toString()));
			s.setRaincoat(Double.parseDouble(object[17].toString()));
			s.setUndergarments(Double.parseDouble(object[18].toString()));
			s.setOtherfees(Double.parseDouble(object[19].toString()));
			s.setLumpsumfees(Double.parseDouble(object[20].toString()));
			s.setAcademicYear(object[21].toString());
			s.setExpectedPaymentDate((Date)object[22]);
			
				
				 /* s.setFirstInstallment(Double.parseDouble(object[5].toString()));
				 * s.setSecondInstallment(Double.parseDouble(object[6].toString()));
				 * s.setGatheringFees(Double.parseDouble(object[7].toString()));
				 * s.setComputerFees(Double.parseDouble(object[8].toString()));
				 * s.setActivityFees(Double.parseDouble(object[9].toString()));
				 * s.setExamFees(Double.parseDouble(object[10].toString()));
				 * s.setAcademicYear(object[11].toString());
				 * s.setExpectedPaymentDate(object[12].toString());
				 */
			
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

//Student Fee Structure Reports Student Class Wise
public List<FeeStructureHiberenate> getClassWiseReport(String fkClassId) {

	HibernateUtility hbu=null;
	Session session=null;
	List<FeeStructureHiberenate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
//		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,first_installment,second_installment,gathering_fees,computer_fees,activity_fees,exam_Fees,academic_year,expected_payment_date FROM student_fee_structure WHERE class_name='"+fkClassId+"'");
		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,computer_fees,exam_Fees,tuitionfees,admissionfees,medicalfees,gymnassiumfees,laboratoryfees,stationaryfees,competitivefees,hostelfees,messfees,uniformfees,raincoat,undergarments,otherfees,lumpsumfees ,academic_year,expected_payment_date FROM student_fee_structure WHERE class_name='"+fkClassId+"'");		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<FeeStructureHiberenate>(0);
		
		
		for (Object[] object : list) {
			
//			FeeStructureReportBean s = new FeeStructureReportBean();
			FeeStructureHiberenate s = new FeeStructureHiberenate();
			
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setClassName(object[3].toString());
			s.setDivisionName(object[4].toString());
			s.setComputerFees(Double.parseDouble(object[5].toString()));
			s.setExamFees(Double.parseDouble(object[6].toString()));
			s.setTuitionfees(Double.parseDouble(object[7].toString()));
			s.setAdmissionfees(Double.parseDouble(object[8].toString()));
			s.setMedicalfees(Double.parseDouble(object[9].toString()));
			s.setGymnassiumfees(Double.parseDouble(object[10].toString()));
			s.setLaboratoryfees(Double.parseDouble(object[11].toString()));
			s.setStationaryfees(Double.parseDouble(object[12].toString()));
			s.setCompetitivefees(Double.parseDouble(object[13].toString()));
			s.setHostelfees(Double.parseDouble(object[14].toString()));
			s.setMessfees(Double.parseDouble(object[15].toString()));
			s.setUniformfees(Double.parseDouble(object[16].toString()));
			s.setRaincoat(Double.parseDouble(object[17].toString()));
			s.setUndergarments(Double.parseDouble(object[18].toString()));
			s.setOtherfees(Double.parseDouble(object[19].toString()));
			s.setLumpsumfees(Double.parseDouble(object[20].toString()));
			s.setAcademicYear(object[21].toString());
			s.setExpectedPaymentDate((Date)object[22]);
			
			
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

//Student Fee Structure Reports Student Day Wise
public List<FeeStructureHiberenate> getDayWiseReport(String expectedPaymentDate) {

	HibernateUtility hbu=null;
	Session session=null;
	List<FeeStructureHiberenate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
//		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,first_installment,second_installment,gathering_fees,computer_fees,activity_fees,exam_Fees,academic_year,expected_payment_date FROM student_fee_structure WHERE expected_payment_date ='"+expectedPaymentDate+"'");
		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,computer_fees,exam_Fees,tuitionfees,admissionfees,medicalfees,gymnassiumfees,laboratoryfees,stationaryfees,competitivefees,hostelfees,messfees,uniformfees,raincoat,undergarments,otherfees,lumpsumfees ,academic_year,expected_payment_date FROM student_fee_structure WHERE expected_payment_date ='"+expectedPaymentDate+"'");		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<FeeStructureHiberenate>(0);
		
		
		for (Object[] object : list) {
			
			FeeStructureHiberenate s = new FeeStructureHiberenate();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setClassName(object[3].toString());
			s.setDivisionName(object[4].toString());
			s.setComputerFees(Double.parseDouble(object[5].toString()));
			s.setExamFees(Double.parseDouble(object[6].toString()));
			s.setTuitionfees(Double.parseDouble(object[7].toString()));
			s.setAdmissionfees(Double.parseDouble(object[8].toString()));
			s.setMedicalfees(Double.parseDouble(object[9].toString()));
			s.setGymnassiumfees(Double.parseDouble(object[10].toString()));
			s.setLaboratoryfees(Double.parseDouble(object[11].toString()));
			s.setStationaryfees(Double.parseDouble(object[12].toString()));
			s.setCompetitivefees(Double.parseDouble(object[13].toString()));
			s.setHostelfees(Double.parseDouble(object[14].toString()));
			s.setMessfees(Double.parseDouble(object[15].toString()));
			s.setUniformfees(Double.parseDouble(object[16].toString()));
			s.setRaincoat(Double.parseDouble(object[17].toString()));
			s.setUndergarments(Double.parseDouble(object[18].toString()));
			s.setOtherfees(Double.parseDouble(object[19].toString()));
			s.setLumpsumfees(Double.parseDouble(object[20].toString()));
			s.setAcademicYear(object[21].toString());
			s.setExpectedPaymentDate((Date)object[22]);
			
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

//Student Fee Structure Reports Student Month Wise
public List<FeeStructureHiberenate> getMonthWiseReport(String expectedPaymentDate1) {
	System.out.println("******DAO******"+expectedPaymentDate1);
	HibernateUtility hbu=null;
	Session session=null;
	List<FeeStructureHiberenate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
//		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,first_installment,second_installment,gathering_fees,computer_fees,activity_fees,exam_Fees,academic_year,expected_payment_date FROM student_fee_structure WHERE EXTRACT(MONTH FROM '"+expectedPaymentDate1 +"')");
		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,class_name,division,computer_fees,exam_Fees,tuitionfees,admissionfees,medicalfees,gymnassiumfees,laboratoryfees,stationaryfees,competitivefees,hostelfees,messfees,uniformfees,raincoat,undergarments,otherfees,lumpsumfees ,academic_year,expected_payment_date FROM student_fee_structure WHERE EXTRACT(MONTH FROM '"+expectedPaymentDate1+"')");				
		List<Object[]> list = query.list();
		 saleList= new ArrayList<FeeStructureHiberenate>(0);
		
		
		for (Object[] object : list) {
			
			FeeStructureHiberenate s = new FeeStructureHiberenate();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setClassName(object[3].toString());
			s.setDivisionName(object[4].toString());
			s.setComputerFees(Double.parseDouble(object[5].toString()));
			s.setExamFees(Double.parseDouble(object[6].toString()));
			s.setTuitionfees(Double.parseDouble(object[7].toString()));
			s.setAdmissionfees(Double.parseDouble(object[8].toString()));
			s.setMedicalfees(Double.parseDouble(object[9].toString()));
			s.setGymnassiumfees(Double.parseDouble(object[10].toString()));
			s.setLaboratoryfees(Double.parseDouble(object[11].toString()));
			s.setStationaryfees(Double.parseDouble(object[12].toString()));
			s.setCompetitivefees(Double.parseDouble(object[13].toString()));
			s.setHostelfees(Double.parseDouble(object[14].toString()));
			s.setMessfees(Double.parseDouble(object[15].toString()));
			s.setUniformfees(Double.parseDouble(object[16].toString()));
			s.setRaincoat(Double.parseDouble(object[17].toString()));
			s.setUndergarments(Double.parseDouble(object[18].toString()));
			s.setOtherfees(Double.parseDouble(object[19].toString()));
			s.setLumpsumfees(Double.parseDouble(object[20].toString()));
			s.setAcademicYear(object[21].toString());
			s.setExpectedPaymentDate((Date)object[22]);
			
			
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

}
