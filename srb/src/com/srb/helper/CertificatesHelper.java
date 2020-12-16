package com.srb.helper;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.itextpdf.text.log.SysoCounter;
import com.srb.bean.CertificateBean;
import com.srb.bean.NirgumCertificateBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.dao.CertificatesDao;
import com.srb.dao.StudentInfoDao;
import com.srb.hibernate.BonafideCertificateHibernate;
import com.srb.hibernate.LeavingCertificateHibernate;
import com.srb.hibernate.SportcertificateHibernate;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.utility.HibernateUtility;
import com.srb.hibernate.nirgumCertificateHibernate;;
public class CertificatesHelper {

	//for LC generator
	public void viewLC(HttpServletRequest request, HttpServletResponse response) 
	{
		String pkStudentId = request.getParameter("pkStudentId");
		String idMarks = request.getParameter("idMarks");
		String reason = request.getParameter("reason");
		String promotion = request.getParameter("promotion");
		String progress = request.getParameter("progress");
		String conduct = request.getParameter("conduct");
		String dateOfLeaving =request.getParameter("dateOfLeaving");
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		String attendance = request.getParameter("attendance");
		String workingday  = request.getParameter("workingday");
		System.out.println("attend. & working day - "+attendance+" , "+workingday);
		Long studentId = Long.parseLong(pkStudentId);
		Long lCNumber = null;

		//for pdf
		HttpSession sessionToViewTask = request.getSession();
		
		HibernateUtility hbu=null;
		Session session=null;
		List<Object[]> list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT pk_lc_id,fk_student_id from leaving_certificate ORDER BY pk_lc_id DESC LIMIT 1");

			 list = query.list();
			 int listSize = list.size();
			 if(listSize == 0){
				 lCNumber = 1l;
			 }
			 else{
			 for (Object[] object : list) {
				 lCNumber = Long.parseLong(object[0].toString());
				 lCNumber++;
			 }
			
			 }
			 
				//set student active status to n to cancel admission afetr generating LC
				Transaction transaction = session.beginTransaction();
				StudentInfoHibernate s = (StudentInfoHibernate) session.get(StudentInfoHibernate.class, new Long(pkStudentId));
				s.setIsStudentActive("N");
				session.saveOrUpdate(s);
				transaction.commit();
			 
			}catch(RuntimeException e){
				
			System.out.println("error in getStudentInfo()");
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
			
		sessionToViewTask.setAttribute("lcNumberForLC", lCNumber);
		sessionToViewTask.setAttribute("studentIdForLC", studentId);
		sessionToViewTask.setAttribute("idMarksForLC", idMarks);
		sessionToViewTask.setAttribute("reasonForLC", reason);
		sessionToViewTask.setAttribute("promotionForLC", promotion);
		sessionToViewTask.setAttribute("progressForLC", progress);
		sessionToViewTask.setAttribute("conductForLC", conduct);
		sessionToViewTask.setAttribute("dateOfLeavingForLC", dateOfLeaving);
		sessionToViewTask.setAttribute("attendance", attendance);
		sessionToViewTask.setAttribute("workingday", workingday);		
		
		//to add to table
		LeavingCertificateHibernate b = new LeavingCertificateHibernate();
		b.setConduct(conduct);
		b.setFkStudentMasterId(Long.parseLong(pkStudentId));
		b.setFk_class_id(Long.parseLong(fk_class_id));
		b.setFk_div_id(Long.parseLong(fk_div_id));
		b.setIdMarks(idMarks);
		b.setReason(reason);
		b.setProgress(progress);
		b.setPromotion(promotion);
		b.setAttendance(Long.parseLong(attendance));
		b.setWorkingday(Long.parseLong(workingday));
		System.out.println("attend. & working day - "+b.getAttendance()+" , "+b.getWorkingday());
		Date d = new Date();
		b.setInsertdate(d);
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date leaveDate = null;
		try{
			leaveDate = format1.parse(dateOfLeaving);
			b.setDateOfLeaving(leaveDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
			
		}
		
		
		CertificatesDao dao = new CertificatesDao();
		dao.addLCDetails(b);
		
	}
//nirgum
	public void viewnirgum(HttpServletRequest request, HttpServletResponse response) 
	{
		String pkStudentId = request.getParameter("pkStudentId");
		String idMarks = request.getParameter("idMarks");
		String reason = request.getParameter("reason");
		String promotion = request.getParameter("promotion");
		String progress = request.getParameter("progress");
		String conduct = request.getParameter("conduct");
		String dateOfLeaving =request.getParameter("dateOfLeaving");
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		String attendance = request.getParameter("attendance");
		String workingday  = request.getParameter("workingday");
		
		String addclass = request.getParameter("addclass");
		String officer = request.getParameter("officer");
		String nirgumclass = request.getParameter("nirgumclass");
		String nirgumdate = request.getParameter("nirgumdate");
		String place= request.getParameter("place");
		System.out.println("in helper - nirgumdate - "+nirgumdate);
		System.out.println("addclass - "+addclass+" officer - "+officer+" nirgumclass - "+nirgumclass+" nirgumdate - "+nirgumdate+" place - "+place);
		System.out.println("attend. & working day - "+attendance+" , "+workingday);
		Long studentId = Long.parseLong(pkStudentId);
		Long lCNumber = null;

		
/*		SimpleDateFormat format11 = new SimpleDateFormat("dd-MM-yyyy");
		Date ndate = null;
		String nrdate =null;
		try{
			ndate = format11.parse(nirgumdate);
			 nrdate  = format11.format(ndate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
			
		}*/
		/*
		 * DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); String nrdate =
		 * dateFormat.format(nirgumdate);
		 */
//			System.out.println("nrdate - "+nrdate);
		
		//for pdf
		HttpSession sessionToViewTask = request.getSession();
		
		HibernateUtility hbu=null;
		Session session=null;
		List<Object[]> list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT pk_lc_id,fk_student_id from nirgum_certificate ORDER BY pk_lc_id DESC LIMIT 1");

			 list = query.list();
			 int listSize = list.size();
			 
			 if(listSize == 0){
				 lCNumber = 1l;
			 }
			 else{
			 for (Object[] object : list) {
				 lCNumber = Long.parseLong(object[0].toString());
				 lCNumber++;
			 }
			
			 }
			 System.out.println("lCNumber - "+lCNumber);
			 
				//set student active status to n to cancel admission afetr generating LC
			/*
			 * Transaction transaction = session.beginTransaction(); StudentInfoHibernate s
			 * = (StudentInfoHibernate) session.get(StudentInfoHibernate.class, new
			 * Long(pkStudentId)); s.setIsStudentActive("N"); session.saveOrUpdate(s);
			 * transaction.commit();
			 */
			 
			}catch(RuntimeException e){
				
			System.out.println("error in getStudentInfo()");
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
			
		sessionToViewTask.setAttribute("lcNumberForLC", lCNumber);
		sessionToViewTask.setAttribute("studentIdForLC", studentId);
		sessionToViewTask.setAttribute("idMarksForLC", idMarks);
		sessionToViewTask.setAttribute("reasonForLC", reason);
		sessionToViewTask.setAttribute("promotionForLC", promotion);
		sessionToViewTask.setAttribute("progressForLC", progress);
		sessionToViewTask.setAttribute("conductForLC", conduct);
		sessionToViewTask.setAttribute("dateOfLeavingForLC", dateOfLeaving);
		sessionToViewTask.setAttribute("attendance", attendance);
		sessionToViewTask.setAttribute("workingday", workingday);		
		
		sessionToViewTask.setAttribute("addclass", addclass);
		sessionToViewTask.setAttribute("officer", officer);
		sessionToViewTask.setAttribute("nirgumclass", nirgumclass);
		sessionToViewTask.setAttribute("nirgumdate", nirgumdate);
//		sessionToViewTask.setAttribute("nirgumdate", nrdate);
		sessionToViewTask.setAttribute("place", place);
		
		//to add to table
	
		nirgumCertificateHibernate b = new nirgumCertificateHibernate();
		b.setConduct(conduct);
		b.setFkStudentMasterId(Long.parseLong(pkStudentId));
		b.setFk_class_id(Long.parseLong(fk_class_id));
		b.setFk_div_id(Long.parseLong(fk_div_id));
		b.setIdMarks(idMarks);
		b.setReason(reason);
		b.setProgress(progress);
		b.setPromotion(promotion);
		b.setAttendance(Long.parseLong(attendance));
		b.setWorkingday(Long.parseLong(workingday));
		System.out.println("attend. & working day in nirgum - "+b.getAttendance()+" , "+b.getWorkingday());
		Date d = new Date();
		b.setInsertdate(d);
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date leaveDate = null;
		try{
			leaveDate = format1.parse(dateOfLeaving);
			b.setDateOfLeaving(leaveDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
			
		}
		
		
		CertificatesDao dao = new CertificatesDao();
		dao.addnirgumDetails(b);
		
	}
	
	
	//
	public void viewBonafide(HttpServletRequest request,
			HttpServletResponse response) {

		String pkStudentId = request.getParameter("studentName");
		System.out.println(" hi this is pkStudentId====="+pkStudentId);
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		Long studentId = Long.parseLong(pkStudentId);
		//for pdf
		HttpSession sessionToViewTask = request.getSession();
		sessionToViewTask.setAttribute("studentIdForLC", studentId);

		
		//to add to table
		BonafideCertificateHibernate b = new BonafideCertificateHibernate();
		b.setFkStudentMasterId(Long.parseLong(pkStudentId));
		b.setFk_class_id(Long.parseLong(fk_class_id));
		b.setFk_div_id(Long.parseLong(fk_div_id));

		Date d = new Date();
		b.setInsertDate(d);
		

		
		CertificatesDao dao = new CertificatesDao();
		dao.addBonafideDetails(b);
	}

	//lc generated student list for report
	public List getLCGeneratedStudentInfoAsPerClassAndDiv(
			HttpServletRequest request, HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getLCGeneratedStudentInformationAsPerClassNdDiv(fkClassId,fkDivId);
 		
 		return expList;
	
	}
// range
	public List getLCGeneratedStudentInfoAsPerrangewise(HttpServletRequest request, HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String stdate = request.getParameter("stdate");
		String endate = request.getParameter("endate");
		
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		System.out.println("date st end - "+stdate+"  "+endate);
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getLCGeneratedStudentInformationAsPerrangewise(stdate,endate);
 		
 		return expList;
	
	}
	
	
	//bonafide generated student list for report
	public List getBonafideGeneratedStudentInfoAsPerClassAndDiv(
			HttpServletRequest request, HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getBonafideGeneratedStudentInformationAsPerClassNdDiv(fkClassId,fkDivId);
 		
 		return expList;
	
	
	}
	//
	public List getnirgumGeneratedStudentInfoAsPerClassAndDiv(
			HttpServletRequest request, HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getnirGeneratedStudentInformationAsPerClassNdDiv(fkClassId,fkDivId);
 		
 		return expList;
	
	
	}
	
	// range wise bonafide
	public List getBonafideGeneratedStudentInfoAsPerrangewise(HttpServletRequest request, HttpServletResponse response) {

		String stdatee = request.getParameter("stdatee");
		String endatee = request.getParameter("endatee");
		System.out.println("dates - "+stdatee+" & "+endatee);
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getBonafideGeneratedStudentInformationAsPerrangewise(stdatee,endatee);
 		
 		return expList;
	
	
	}
	//
	public List getnirgumGeneratedStudentInfoAsPerrangewise(HttpServletRequest request, HttpServletResponse response) {

		String stdatee = request.getParameter("stdateee");
		String endatee = request.getParameter("endateee");
		System.out.println("dates - "+stdatee+" & "+endatee);
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getnirgumGeneratedStudentInformationAsPerrangewise(stdatee,endatee);
 		
 		return expList;
	
	
	}
	
	//outward bill
	public void BonafideCOPY(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("studentNa");
		
		System.out.println("----------------Credit cust Bill No before session create::"+billNo);
		
		HttpSession session3 = request.getSession();
		
		/*Long billNo2 = Long.parseLong(billNo);*/
		
		/*String bill = billNo2.toString();*/
		
		session3.setAttribute("VendorBillNo", billNo);
		
		System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("VendorBillNo"));
		
	}

	public void LeavingCOPY(HttpServletRequest request, HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
		String billNo = request.getParameter("studentNa");
		String fk_student_id = request.getParameter("fk_student_id");
		
		System.out.println("----------------Credit cust Bill No before session create::"+billNo);
		
		HttpSession session3 = request.getSession();
		
		/*Long billNo2 = Long.parseLong(billNo);*/
		
		/*String bill = billNo2.toString();*/
		
		session3.setAttribute("fk_student_id", fk_student_id);
		
		System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("fk_student_id"));
	}

	//generate Sport Certificate
	public void genrateSportCertificate(HttpServletRequest request, HttpServletResponse response) 
	{
		String pkStudentId = request.getParameter("pkStudentId");
		String grade = request.getParameter("grade");
		String sport = request.getParameter("sport");
		String dateOfLeaving =request.getParameter("dateOfLeaving");
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		System.out.println("classid------"+fk_class_id);
		System.out.println("grade------"+grade);
		System.out.println("sport------"+sport);
		System.out.println("fk_div_id------"+fk_div_id);
		System.out.println("dateOfLeaving------"+dateOfLeaving);
		System.out.println("pkStudentId------"+pkStudentId);
		HttpSession sessionToViewTask = request.getSession();
		HibernateUtility hbu=null;
		Transaction transaction = null;
		Session session=null;
		List<Object[]> list=null;
		try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

					 
			}catch(RuntimeException e){
				
			System.out.println("error in getStudentInfo()");
		}
		finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
		Long pkStudentId1=Long.parseLong(pkStudentId);
		Long divId=Long.parseLong(fk_div_id);
		sessionToViewTask.setAttribute("DateofSport", dateOfLeaving);
		sessionToViewTask.setAttribute("SportName", sport);
		sessionToViewTask.setAttribute("Grade", grade);
		sessionToViewTask.setAttribute("StudentIdforSport", pkStudentId1);
		sessionToViewTask.setAttribute("sportdivId", divId);
		
		//to add to table
		//Transaction transaction = session.beginTransaction();
			 SportcertificateHibernate b = new SportcertificateHibernate();
			 //b.setPkSportId(Long.parseLong(pkStudentId));
			 b.setFkstudid(Long.parseLong(pkStudentId));
			 b.setFkclassId(Long.parseLong(fk_class_id));
			 b.setFkdivId(Long.parseLong(fk_div_id));
			 SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				Date leaveDate = null;
				try{
					leaveDate = format1.parse(dateOfLeaving);
					b.setInsertDate(leaveDate);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
					
				}
		/*if(!"".equals(dateOfLeaving)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(dateOfLeaving);
				b.setInsertDate(joiningDate);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}*/
		b.setSportName(sport);
		 b.setGradename(grade);
		System.out.println("updated Sport Certificate hibernate  bean");
		// session.saveOrUpdate(b);
		//transaction.commit();
		CertificatesDao dao=new CertificatesDao();
		dao.addSportCertificateDetails(b);
		
		
	}
	
	// to get cpy of sport certificate
	public void viewCpyofSportcertificate(HttpServletRequest request,
			HttpServletResponse response) {

		String pkStudentId = request.getParameter("studentName");
		System.out.println(" hi this is pkStudentId====="+pkStudentId);
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		Long studentId = Long.parseLong(pkStudentId);
		//for pdf
		System.out.println("Student Id after Long"+studentId);
		HttpSession sessionToViewTask = request.getSession();
		sessionToViewTask.setAttribute("StudentIdforSport2", studentId);

		}
	
	//cpy of nirgum certificate
	public void viewCpyNirgumCertificate(HttpServletRequest request,
			HttpServletResponse response) {
		
		String pkStudentId1 = request.getParameter("studentName1");
		String idMarks = request.getParameter("idMarks");
		String reason = request.getParameter("reason");
		String promotion = request.getParameter("promotion");
		String progress = request.getParameter("progress");
		String conduct = request.getParameter("conduct");
		String dateOfLeaving =request.getParameter("dateOfLeaving");
		String fk_class_id =request.getParameter("fk_class_id");
		String fk_div_id =request.getParameter("fk_div_id");
		String attendance1 = request.getParameter("attendance");
		String workingday1  = request.getParameter("workingday");
		
		String addclass1 = request.getParameter("addclass");
		String officer1 = request.getParameter("officer");
		String nirgumclass1 = request.getParameter("nirgumclass");
		String nirgumdate1 = request.getParameter("nirgumdate");
		String place1= request.getParameter("place");
		System.out.println("StudentID--------------"+pkStudentId1);
		System.out.println("idMarks--------------"+idMarks);
		System.out.println("reason--------------"+reason);
		System.out.println("promotion--------------"+promotion);
		System.out.println("progress--------------"+progress);
		System.out.println("conduct--------------"+conduct);
		System.out.println("dateOfLeaving--------------"+dateOfLeaving);
		System.out.println("fk_class_id--------------"+fk_class_id);
		System.out.println("fk_div_id--------------"+fk_div_id);
		System.out.println("attendance--------------"+attendance1);
		System.out.println("workingday--------------"+workingday1);
		System.out.println("addclass1--------------"+addclass1);
		System.out.println("officer1--------------"+officer1);
		System.out.println("nirgumclass1--------------"+nirgumclass1);
		System.out.println("nirgumdate1--------------"+nirgumdate1);
		System.out.println("place1--------------"+place1);
		Long studentId1 = Long.parseLong(pkStudentId1);
		System.out.println("AFter convert into Long Database");
		System.out.println(studentId1);
		
		HttpSession sessionToViewTask12 = request.getSession();
		sessionToViewTask12.setAttribute("StudentIdforNc1", studentId1);
		sessionToViewTask12.setAttribute("idMarksForNc", idMarks);
		sessionToViewTask12.setAttribute("reasonForNC", reason);
		sessionToViewTask12.setAttribute("promotionForNC", promotion);
		sessionToViewTask12.setAttribute("progressForNC", progress);
		sessionToViewTask12.setAttribute("conductForNC", conduct);
		sessionToViewTask12.setAttribute("dateOfLeavingForNC", dateOfLeaving);
		sessionToViewTask12.setAttribute("addclass1", addclass1);
		sessionToViewTask12.setAttribute("officer1", officer1);
		sessionToViewTask12.setAttribute("nirgumclass1", nirgumclass1);
		sessionToViewTask12.setAttribute("place1", place1);
		sessionToViewTask12.setAttribute("attendance1", attendance1);
		sessionToViewTask12.setAttribute("workingday1", workingday1);
		sessionToViewTask12.setAttribute("nirgumdate1", nirgumdate1);
		
	}
	//get details of nirgum certificate to print copy
	public Map getcopyofNirgumDetails(Long fkTeacherId) {

	 	System.out.println("into helper class");
	 	System.out.println(fkTeacherId);
	 	CertificatesDao dao1 = new CertificatesDao();
		List catList = dao1.getnirgumcertificateDetail(fkTeacherId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			NirgumCertificateBean b = new NirgumCertificateBean();
			b.setPkLcId(Long.parseLong(o[0].toString()));
			b.setReason(o[1].toString());
			b.setPromotion(o[2].toString());
			b.setProgress(o[3].toString());
			b.setConduct(o[4].toString());
			b.setDateOfLeaving(o[5].toString());
			b.setAttendance(Long.parseLong(o[6].toString()));
			b.setWorkingday(Long.parseLong(o[7].toString()));
			b.setIdMarks(o[8].toString());
			b.setInsertdate(o[9].toString());
			/*String d = o[5].toString();
			String dt[] = d.split("-");
			String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
			b.setDateOfLeaving(insertDate);
			String i1 = o[9].toString();
			String it[] = i1.split("-");
			String insertDate1 = it[2]+"-"+it[1]+"-"+it[0];
			b.setInsertdate(insertDate1);*/
			map.put(b.getPkLcId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
	}
		
	//sport certificate range wise
	public List getSportGeneratedStudentInfoAsPerClassAndDiv(
			HttpServletRequest request, HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getSportGeneratedStudentInformationAsPerClassNdDiv(fkClassId,fkDivId);
 		
 		return expList;
	
	
	}

	//sport certificate date wise range
	public List getSportcertificateInfoAsPerDAte(HttpServletRequest request, HttpServletResponse response) {

		String stdatee = request.getParameter("stdatee");
		String endatee = request.getParameter("endatee");
		System.out.println("dates - "+stdatee+" & "+endatee);
         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
 		
         CertificatesDao dao = new CertificatesDao();
 		List<CertificateBean> expList = dao.getSportCertificateInformationAsPerrangewise(stdatee,endatee);
 		
 		return expList;
	
	
	}
	
	
	
	

}
