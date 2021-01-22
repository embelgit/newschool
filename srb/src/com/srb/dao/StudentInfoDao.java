package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.AdmissionEnquiryBean;
import com.srb.bean.GetStudentDetailsBean;
import com.srb.bean.GetTeacherDetailBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.bean.StudentResultForGraph;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.utility.HibernateUtility;

public class StudentInfoDao {
	
public void StudentInfoHibernate(StudentInfoHibernate sif){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(sif);
		transaction.commit();
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}
		finally{
		hbu.closeSession(session);
		}
	}


public List getAllStudent()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<StudentInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from StudentInfoHibernate");
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
		
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}

public List getStudentInfo(String fk_class_id, String fk_division_id) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT first_name, middle_name, last_name, pk_student_id, roll_number FROM student_master WHERE student_active='Y' AND fk_class_id ='"+fk_class_id+"' AND fk_division_id ="+fk_division_id);

		 list = query.list();
		 
		System.out.println(list.size()+"===List size");
		}catch(RuntimeException e){
			
		System.out.println("error in getStudentInfo()");
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;



}

public List<StudentInformationForReport> getStudentInformationAsPerClassNdDiv( String fkClassId, String fkDivId) {

	Double totalWithGST = 0.0;
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInformationForReport> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
//		Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,s.gender,c.class_name,d.division_name,s.date_of_birth,s.date_of_admission,s.mother_name,s.contact_number,s.cast,s.sub_cast,s.general_reg_number,s.aadhar_number,s.student_serial_number,s.previous_school_name,s.pre_school_udias_number FROM student_master s LEFT JOIN class_master c ON s.fk_class_id = c.pk_class_id LEFT JOIN division_master d on s.fk_division_id = d.pk_division_id WHERE s.student_active = 'Y' AND s.fk_class_id ='"+fkClassId+"' AND s.fk_division_id ="+fkDivId);
	//	Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,s.mother_name,s.student_serial_number,s.date_of_birth,s.previous_school_name,s.pre_school_udias_number FROM student_master s LEFT JOIN class_master c ON s.fk_class_id = c.pk_class_id LEFT JOIN division_master d on s.fk_division_id = d.pk_division_id WHERE s.student_active = 'Y' AND s.fk_class_id ='"+fkClassId+"' AND s.fk_division_id ="+fkDivId);		
		Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,s.mother_name,s.gender,c.class_name,d.division_name,s.date_of_birth,s.date_of_admission,s.contact_number,s.cast,s.sub_cast,s.general_reg_number,s.aadhar_number,s.student_serial_number,s.roll_number,s.studenttype, s.namankit_type, s.birth_place,s.annual_fee FROM student_master s LEFT JOIN class_master c ON s.fk_class_id = c.pk_class_id LEFT JOIN division_master d on s.fk_division_id = d.pk_division_id WHERE s.student_active = 'Y' AND s.fk_class_id ='"+fkClassId+"' AND s.fk_division_id ='"+fkDivId+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<StudentInformationForReport>(0);
		
			int i=0;
		for (Object[] object : list) {
		i++;
			StudentInformationForReport s = new StudentInformationForReport();
			System.out.println("result - "+Arrays.toString(object));
			s.setSr(i);
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setMotherName(object[3].toString());
			s.setGender(object[4].toString());
			s.setClassName(object[5].toString());
			s.setDivisionName(object[6].toString());
			s.setDob(object[7].toString());
			s.setDateOfJoining(object[8].toString());			
			s.setContactNo(object[9].toString());
			s.setCast(object[10].toString());
			s.setSubCast(object[11].toString());
			s.setGeneralRegNumber(object[12].toString());
			s.setAadharNumber(object[13].toString());
			s.setStudentSerialNumber(object[14].toString());						
			s.setRollno(Long.parseLong(object[15].toString()));
			s.setStudenttype(object[16].toString());
			s.setNamankittype(object[17].toString());
			s.setBirthPlace(object[18].toString());
			s.setTotalAnnualFee(Double.parseDouble(object[19].toString()));
			
	/*		

			s.setMotherName(object[8].toString());

*/
			
			System.out.println("result - "+s.getStudentSerialNumber()+s.getPreSchoolN()+s.getPreSchoolUdias());
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}


public List<StudentInformationForReport> studentBalanceAsPerClassNdDiv( String fkClassId, String fkDivId) {

	Double totalWithGST = 0.0;
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInformationForReport> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,s.total_annual_fee,s.remaining_fee,s.paying_amount FROM student_payment s WHERE s.fk_class_id ='"+fkClassId+"' AND s.fk_division_id ="+fkDivId);
		Query query = session.createSQLQuery("SELECT sm.first_name,sm.middle_name,sm.last_name,s.class_name,s.division,s.total_annual_fee,s.remaining_fee,s.paying_amount FROM student_payment s join student_master sm on s.student_id = sm.pk_student_id WHERE s.fk_class_id ='"+fkClassId+"' AND s.fk_division_id ="+fkDivId);

		List<Object[]> list = query.list();
		 saleList= new ArrayList<StudentInformationForReport>(0);
		
		
		for (Object[] object : list) {
			System.out.println("result - "+Arrays.toString(object));
			StudentInformationForReport s = new StudentInformationForReport();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setClassName(object[3].toString());
			s.setDivisionName(object[4].toString());
			s.setTotalAnnualFee(Double.parseDouble(object[5].toString()));
			s.setPaidFee(Double.parseDouble(object[6].toString()));
			s.setBalanceFee(Double.parseDouble(object[7].toString()));
			
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}




// get all student for edit
public List getAllMainStudent()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from StudentInfoHibernate where student_active ='Y'");
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
		
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}
//transsssss
public List getAllMainStudentfromtrans()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
//		 query = session.createQuery("from TrasnpotationSchollBus where student_active ='Y'");
		 query = session.createQuery("from TrasnpotationSchollBus");
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
		
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}

public List getAllMainStudent_new(HttpServletRequest request)
{
	HttpSession userSession = request.getSession(true);
	String clas = (String)userSession.getAttribute("clas");
	String division = (String)userSession.getAttribute("division");
	System.out.println("clas"+clas);
	System.out.println("division"+division);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from StudentInfoHibernate where clas='"+clas+"' and division='"+division+"'");
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
		
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}


//get all student all details to edit
public List getAllStudentDetailsForEdit(Long fkStudentId) {
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT pk_student_id,first_name,middle_name,last_name,contact_number,gender,date_of_birth,date_of_admission,country,state,pin_code,previous_school_name,father_name,mother_name,siblings,permanent_address,present_address,annual_fee,c.class_name,d.division_name,general_reg_number,aadhar_number,student_serial_number,roll_number,pre_school_udias_number,area,stud_serial_id_number FROM student_master LEFT JOIN class_master c ON student_master.fk_class_id = c.pk_class_id LEFT JOIN division_master d on student_master.fk_division_id = d.pk_division_id WHERE student_master.pk_student_id = "+fkStudentId);
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;

}

//get All student detail for list
public List getAllStudentDetailForList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetStudentDetailsBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	String abc ="Y";
	Query query=session.createSQLQuery("SELECT pk_student_id,first_name,middle_name,last_name,contact_number,gender,date_of_birth,date_of_admission,country,state,pin_code,previous_school_name,father_name,mother_name,siblings,permanent_address,present_address,annual_fee,pre_school_udias_number,area,c.class_name,d.division_name,roll_number FROM student_master LEFT JOIN class_master c ON student_master.fk_class_id = c.pk_class_id LEFT JOIN division_master d on student_master.fk_division_id = d.pk_division_id where student_master.student_active=:abc ");
	//Query query = session.createQuery("from PurchaseBill2");
	query.setParameter("abc", abc);
	List<Object[]> list = query.list();


	custList= new ArrayList<GetStudentDetailsBean>(0);


for (Object[] object : list) 
{	
	
	GetStudentDetailsBean reports = new GetStudentDetailsBean();
	
	reports.setPkStudentId(object[0].toString());
	
	
	
	
	
	reports.setFirstName(object[1].toString());
	reports.setMiddleName(object[2].toString());
	reports.setLastName(object[3].toString());
	reports.setContactNo(object[4].toString());
	reports.setGender(object[5].toString());
	reports.setDob(object[6].toString());
	reports.setDoa(object[7].toString());
	reports.setCountry(object[8].toString());
	reports.setState(object[9].toString());
	reports.setPinCode(object[10].toString());
	reports.setPreSchoolN(object[11].toString());
	reports.setFatherName(object[12].toString());
	reports.setMotherName(object[13].toString());
	reports.setSiblings(object[14].toString());
	reports.setPerAddress(object[15].toString());
	reports.setPreAddress(object[16].toString());
	reports.setAnnualFee(object[17].toString());
	reports.setClas(object[18].toString());
	reports.setDivision(object[19].toString());
	reports.setPreSchoolUdias(object[20].toString());
	reports.setArea(object[21].toString());
	reports.setRollNumber(object[22].toString());
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}
// Cancel LIst Student Reports By Kishor 

public List getAllStudentDetailForCancelList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetStudentDetailsBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	String abc ="N";
	Query query=session.createSQLQuery("SELECT pk_student_id,first_name,middle_name,last_name,contact_number,gender,date_of_birth,date_of_admission,country,state,pin_code,previous_school_name,father_name,mother_name,siblings,permanent_address,present_address,annual_fee,pre_school_udias_number,area,c.class_name,d.division_name,roll_number FROM student_master LEFT JOIN class_master c ON student_master.fk_class_id = c.pk_class_id LEFT JOIN division_master d on student_master.fk_division_id = d.pk_division_id where student_master.student_active=:abc ");
	//Query query = session.createQuery("from PurchaseBill2");
	query.setParameter("abc", abc);
	List<Object[]> list = query.list();


	custList= new ArrayList<GetStudentDetailsBean>(0);


for (Object[] object : list) 
{	
	
	GetStudentDetailsBean reports = new GetStudentDetailsBean();
	
	reports.setPkStudentId(object[0].toString());
	
	
	
	
	
	reports.setFirstName(object[1].toString());
	reports.setMiddleName(object[2].toString());
	reports.setLastName(object[3].toString());
	reports.setContactNo(object[4].toString());
	reports.setGender(object[5].toString());
	reports.setDob(object[6].toString());
	reports.setDoa(object[7].toString());
	reports.setCountry(object[8].toString());
	reports.setState(object[9].toString());
	reports.setPinCode(object[10].toString());
	reports.setPreSchoolN(object[11].toString());
	reports.setFatherName(object[12].toString());
	reports.setMotherName(object[13].toString());
	reports.setSiblings(object[14].toString());
	reports.setPerAddress(object[15].toString());
	reports.setPreAddress(object[16].toString());
	reports.setAnnualFee(object[17].toString());
	reports.setClas(object[18].toString());
	reports.setDivision(object[19].toString());
	reports.setPreSchoolUdias(object[20].toString());
	reports.setArea(object[21].toString());
	reports.setRollNumber(object[22].toString());
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}
public List<StudentInformationForReport> classwiseStudentAttendanceReportForTwoDate(
		String fk_class_id, String fisDate, String secDate) {


	// TODO Auto-generated method stub
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInformationForReport> expenseList=null;
	System.out.println("in attendance report dao");
	try
	{   
		
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query2 = session.createSQLQuery("select pk_student_id,attendance_Id from student_master where fk_class_id ="+fk_class_id);
	 List<Object[]> list = query2.list();
        expenseList= new ArrayList<StudentInformationForReport>(0);
        System.out.println("attendance list size   =  " +list.size());	
		
		for (Object[] object : list) {
			String attendanceId = object[1].toString();
			//Query query3 = session.createSQLQuery("SELECT a.pk_student_attendance_device_log_id,a.UserId,a.LogDate,a.DownloadDate,s.first_name,s.middle_name,s.last_name From student_attendance_device_log a LEFT JOIN student_master s on a.UserId = s.attendance_Id WHERE UserId ='"+attendanceId+"' AND DownloadDate between (YEAR(DownloadDate) ="+year+" AND MONTH(DownloadDate) ="+month+" AND DAY(DownloadDate) ="+date+") and (YEAR(DownloadDate) ="+secYear+" AND MONTH(DownloadDate) ="+secMonth+" AND DAY(DownloadDate) ="+secDay+")");
			Query query3 = session.createSQLQuery("SELECT a.pk_student_attendance_device_log_id,a.UserId,a.LogDate,a.DownloadDate,s.first_name,s.middle_name,s.last_name From student_attendance_device_log a LEFT JOIN student_master s on a.UserId = s.attendance_Id WHERE UserId ='"+attendanceId+"' AND DownloadDate between '"+fisDate+"' AND'"+secDate+"'");
			List<Object[]> list1 = query3.list();
			 for (Object[] o : list1) {
				 StudentInformationForReport reports = new StudentInformationForReport();
					reports.setAttendanceId(o[1].toString());
					reports.setAttendanceDateAndTime(o[2].toString());
					reports.setFirstName(o[4].toString());
					reports.setMiddleName(o[5].toString());
					reports.setLastName(o[6].toString());
					expenseList.add(reports); 
			 }
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return expenseList;
}

//class wise student attendance report
public List<StudentInformationForReport> classwiseStudentAttendanceReportForSingleDate(
		String fk_class_id, String year, String month, String date) {

	// TODO Auto-generated method stub
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInformationForReport> expenseList=null;
	System.out.println("in attendance report dao");
	try
	{   
		
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query2 = session.createSQLQuery("select pk_student_id,attendance_Id from student_master where fk_class_id ="+fk_class_id);
	 List<Object[]> list = query2.list();
      expenseList= new ArrayList<StudentInformationForReport>(0);
      System.out.println("attendance list size   =  " +list.size());	
		
		for (Object[] object : list) {
			String attendanceId = object[1].toString();
			Query query3 = session.createSQLQuery("SELECT a.pk_student_attendance_device_log_id,a.UserId,a.LogDate,a.DownloadDate,s.first_name,s.middle_name,s.last_name From student_attendance_device_log a LEFT JOIN student_master s on a.UserId = s.attendance_Id WHERE UserId ='"+attendanceId+"' AND (YEAR(DownloadDate) ="+year+" AND MONTH(DownloadDate) ="+month+" AND DAY(DownloadDate) ="+date+")");
			 List<Object[]> list1 = query3.list();
			 for (Object[] o : list1) {
				 StudentInformationForReport reports = new StudentInformationForReport();
					reports.setAttendanceId(o[1].toString());
					reports.setAttendanceDateAndTime(o[2].toString());
					reports.setFirstName(o[4].toString());
					reports.setMiddleName(o[5].toString());
					reports.setLastName(o[6].toString());
					expenseList.add(reports); 
			 }
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return expenseList;
}


//student name wise attendance report
public List<StudentInformationForReport> studentAttendanceReportForSingleDate(String studentAttendanceId,String year, String month, String date) {
	// TODO Auto-generated method stub
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInformationForReport> expenseList=null;
	System.out.println("in attendance report dao");
	try
	{   
		
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query2 = session.createSQLQuery("SELECT pk_student_attendance_device_log_id,UserId,LogDate,DownloadDate From student_attendance_device_log WHERE UserId ='"+studentAttendanceId+"' AND (YEAR(DownloadDate) ="+year+" AND MONTH(DownloadDate) ="+month+" AND DAY(DownloadDate) ="+date+")");
	
	 List<Object[]> list = query2.list();
      expenseList= new ArrayList<StudentInformationForReport>(0);
      System.out.println("attendance list size   =  " +list.size());	
		
		for (Object[] object : list) {
			System.out.println("hello   =  " + Arrays.toString(object));	
			StudentInformationForReport reports = new StudentInformationForReport();
			reports.setAttendanceId(object[1].toString());
			reports.setAttendanceDateAndTime(object[2].toString());
			
			expenseList.add(reports); 
	
		}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return expenseList;
}

//admission enquiry report
public List<AdmissionEnquiryBean> getAdmissionEnquiryInformationAsPerClassNdDiv(
		String fkClassId) {
	HibernateUtility hbu=null;
	Session session=null;
	List<AdmissionEnquiryBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT student_name,parent_name,city,address,previous_school_name,email,contact_number,insert_date FROM admission_enquiry WHERE fk_class_d ="+fkClassId);
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<AdmissionEnquiryBean>(0);
		
		for (Object[] object : list) {
			
			AdmissionEnquiryBean s = new AdmissionEnquiryBean();
			s.setStudentName(object[0].toString());
			s.setParentName(object[1].toString());
			s.setCity(object[2].toString());
			s.setAddress(object[3].toString());
			s.setPreSchoolN(object[4].toString());
			s.setEmail(object[5].toString());
			s.setContactNumber(Long.parseLong(object[6].toString()));
			s.setInsertDate(object[7].toString());
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	
}

//get student count for dashboard 
public List getAllStudentContForDashboard() {
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT COUNT(pk_student_id)as number_of_student,pk_student_id  FROM student_master WHERE student_active ='Y'");
		 list = query.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
}

//student result for graph
public List getStudentResultForDashboard(String fkClassId) {
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentResultForGraph> weekSaleBeans=null;
	try{
	hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	Query query = session.createSQLQuery("SELECT pk_result_entry_id,c.class_name FROM result_entry LEFT JOIN class_master c on fk_class_id = c.pk_class_id WHERE obtained_marks>='35'");
	List<Object[]>  list=query.list();
	 weekSaleBeans=new ArrayList<StudentResultForGraph>(0);
	
	for (Object[] object : list) {
		 System.out.println(Arrays.toString(object));
		 StudentResultForGraph bean=new StudentResultForGraph();
	/*	 weekBean.setPrice(Double.parseDouble(object[0].toString()));
		 weekBean.setWeekDays(object[1].toString());*/
		 weekSaleBeans.add(bean);
	}}catch(RuntimeException e){
		
	//Log.error("Error in getDay",e);
}
	finally{
		hbu.closeSession(session);	
	}
	
	return weekSaleBeans;

}

//fetch student count for graph
public List fetchStudentCountForGraph(HttpServletRequest request) {
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentResultForGraph> weekSaleBeans=null;
	try{
	hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	Query query = session.createSQLQuery("SELECT  COUNT(pk_student_id) as student_count,c.class_name from student_master LEFT JOIN class_master c on fk_class_id= c.pk_class_id GROUP BY fk_class_id");
	List<Object[]>  list=query.list();
	 weekSaleBeans=new ArrayList<StudentResultForGraph>(0);
	
	for (Object[] object : list) {
		 System.out.println(Arrays.toString(object));
		 StudentResultForGraph bean=new StudentResultForGraph();
		 bean.setStudentCount(object[0].toString());
		 bean.setClassName(object[1].toString());
		 weekSaleBeans.add(bean);
	}}catch(RuntimeException e){
		
	//Log.error("Error in getDay",e);
}
	finally{
		hbu.closeSession(session);	
	}
	
	return weekSaleBeans;


}




//auto generated serial number
public List getAutoSerialNumber(){	
	HibernateUtility hbu=null;
	Session session=null;
	List<StudentInfoHibernate> sList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT student_serial_number,pk_student_id FROM student_master ORDER BY student_serial_number DESC LIMIT 1");

		List<Object[]> list = query.list();
		sList= new ArrayList<StudentInfoHibernate>(0);
		for (Object[] object : list) {
			System.out.println("List size :::::::::"+list.size());
			StudentInfoHibernate reports = new StudentInfoHibernate();
			reports.setStudentSerialNumber(Long.parseLong(object[0].toString()));
			System.out.println("Bill no Object ::::::::::"+object[0]);
			sList.add(reports);	 
		}}
	catch(RuntimeException e)
	{
		Log.error("Error in getCustomerBill()", e);	
	}finally
	{if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return sList;
}

 public List getNoOfStudent() {
	 {
			HibernateUtility hbu = null;
			Session session =  null;
			Query query = null;
			 List<GetStudentDetailsBean> list1 = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 query = session.createQuery("SELECT * FROM student_master");
				 List<Object[]>  list=query.list();
				 list1=new ArrayList<GetStudentDetailsBean>(0);
				
				for (Object[] object : list) {
					GetStudentDetailsBean gdv = new GetStudentDetailsBean();
					//gdv.setCount(Integer.parseInt(object[0].toString()));
				    int count = list.size();
				    gdv.setCount(count);
					list1.add(gdv);
				}
				 
			} catch (RuntimeException e) {
				e.printStackTrace();
				
			}
			 
			 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
					return list1;
			
		}
	 

	 
 }
}
