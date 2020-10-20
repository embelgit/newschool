package com.srb.helper;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassAndDivisionBean;
import com.srb.bean.GetExamDetails;
import com.srb.bean.GetStudentDetailsBean;
import com.srb.dao.ClassDivisionAssocDao;
import com.srb.dao.ExamInfoDao;
import com.srb.dao.StudentInfoDao;
import com.srb.hibernate.ExamInfoHibernate;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.utility.HibernateUtility;

public class ExamInfoHelper {
	
	// for exam detail
	public void doExamInfo(HttpServletRequest request,
			HttpServletResponse response) {
		ExamInfoHibernate ex=new ExamInfoHibernate();
		Integer count = Integer.parseInt(request.getParameter("count"));
        System.out.println(count);
        
        for(int i =0 ; i<count;i++)
		{
        String academicYear = request.getParameter("academicYear");	
        String classId = request.getParameter("fk_class_id");
		String fkDivisionId = request.getParameter("fk_division_id");
		String examName = request.getParameter("examName_id");
		String className = request.getParameter("className");
		String divisionName = request.getParameter("division");
		//String fkExamNameId = request.getParameter("fk_examName_id");
		
		System.out.println("---------------------academicYear----------------  ::  "+academicYear);
		System.out.println("---------------------classId----------------  ::  "+classId);
		System.out.println("---------------------fkDivisionId----------------  ::  "+fkDivisionId);
		System.out.println("---------------------examName----------------  ::  "+examName);
		System.out.println("---------------------className----------------  ::  "+className);
		System.out.println("---------------------divisionName----------------  ::  "+divisionName);
		
		
		//ex.setFkExamNameId(Long.parseLong(fkExamNameId));
		ex.setDivision(divisionName);
		ex.setClassName(className);
		ex.setFkClassId(Long.parseLong(classId));
		ex.setFkDivisionId(Long.parseLong(fkDivisionId));
		ex.setAcademicYear(academicYear);
		ex.setExamName(examName);
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		ex.setInsertDate(dateobj);
		
		//GRID content
		 String fkSubId = request.getParameter("fkSubjectId"+i);
	     String  subjectName= request.getParameter("subject"+i);	
	     String totalMarks = request.getParameter("totalMarks"+i);
	     String passingMarks = request.getParameter("passingMarks"+i);
		System.out.println("fkSubId "+fkSubId+"  subjectName  "+subjectName+"  totalMarks  "+totalMarks+"  passingMarks  "+passingMarks);
		ex.setFkSubjectId(Long.parseLong(fkSubId));
		ex.setSubjectName(subjectName);
		ex.setTotalMarks(Long.parseLong(totalMarks));
		ex.setPassingMarks(Long.parseLong(passingMarks));
		
		ExamInfoDao dao = new ExamInfoDao();
	    dao.ExamInfoHibernate(ex);
	}
	}
	
	
	
	

	public Map getPassingMArksAsPerSelectedSubject(String fk_class_id,
			String fk_division_id, String fk_examName_id, String academicYear,
			String fk_subject_id, String subjectName)
	{
		
		ExamInfoDao dao = new ExamInfoDao();
		List list = dao.getPassingMArksAsPerSelectedSubject(fk_class_id, fk_division_id, fk_examName_id,  academicYear,fk_subject_id, subjectName);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetExamDetails bean = new GetExamDetails();
			bean.setPassingMarks((BigInteger)o[0]);
			bean.setTotalMarks((BigInteger)o[2]);
			System.out.println("***************"+o[0]);
			map.put(bean.getPassingMarks(),bean);
		}
		return map;
	
	}
	
	// get Exam details edit by kishor
	
	//get Student detail for edit
	public Map getExamEdit(String examName_id) {
	 	System.out.println("into helper class getExamEdit() examName_id - "+examName_id);
	 	ExamInfoDao dao1 = new ExamInfoDao();
		List catList = dao1.getExamForEdit(examName_id);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			ExamInfoHibernate b = new ExamInfoHibernate();
			b.setPkExamId(Long.parseLong(o[0].toString()));
			b.setAcademicYear(o[1].toString());
			b.setClassName(o[2].toString());
			b.setDivision(o[3].toString());
			b.setSubjectName(o[4].toString());
			b.setTotalMarks(Long.parseLong((o[5].toString())));
			b.setPassingMarks(Long.parseLong(o[6].toString()));
			map.put(b.getPkExamId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}

	//Update Details  Exam by kishor 
	public void updateExamInfoDetail(HttpServletRequest request,
			HttpServletResponse response) {
		//ExamInfoHibernate ex=new ExamInfoHibernate();
		Integer count = Integer.parseInt(request.getParameter("count"));
        System.out.println(count);
        for(int i =0 ; i<count;i++)
		{
		 String academicYear = request.getParameter("AcademicYear");
		 System.out.println(" hi this ");
		 
	      //  String classId = request.getParameter("fk_class_id");
			String fkDivisionId = request.getParameter("fk_division_id");
		
			String examName = request.getParameter("examName_id");
			
			String fk_class_id = request.getParameter("fk_class_id");
			System.out.println(" hi this is Class Name ==="+fk_class_id);
			
		/*	String divisionName = request.getParameter("fk_division_id");	 */
			
		
			
		/*	String SubjectName = request.getParameter("SubjectName");
			String Passingmarks = request.getParameter("Passingmarks");*/
			
			//GRID content
			 String fkSubId = request.getParameter("pkexamid"+i);
			 System.out.println(" hi this kis id  id +++++++ ==="+fkSubId);
		     String  subjectName= request.getParameter("subject"+i);
		     System.out.println(" hi this kis ==="+subjectName);
		     String totalMarks = request.getParameter("totalMarks"+i);
		     
		     String passingMarks = request.getParameter("passingMarks"+i);
		   
			
			
			
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long examName_id = Long.parseLong(fkSubId);
		
		ExamInfoHibernate det = (ExamInfoHibernate) session.load(ExamInfoHibernate.class, examName_id);
		
		
		det.setFkSubjectId(Long.parseLong(fkSubId));
		det.setSubjectName(subjectName);
		det.setTotalMarks(Long.parseLong(totalMarks));
		det.setPassingMarks(Long.parseLong(passingMarks));
		
		det.setExamName(examName);
		det.setFkDivisionId(Long.parseLong(fkDivisionId));
		det.setAcademicYear(academicYear);
		det.setFkClassId(Long.parseLong((fk_class_id)));
		
		/*det.setFkSubjectId(Long.parseLong(fkSubId));
		det.setSubjectName(subjectName);
		det.setTotalMarks(Long.parseLong(totalMarks));
		det.setPassingMarks(Long.parseLong(passingMarks));
		*///det.setFkClassId(Long.parseLong(fkClassId));
		
		
		/*SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth1 = null;
		Date DateOfAdmission1 = null;
		try{
			dateOfBirth1 = format1.parse(dob1);
			det.setDob(dateOfBirth1);
			DateOfAdmission1 = format1.parse(doa);
			det.setDob1(DateOfAdmission1);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}*/
		
		/*SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		det.setInsertDate(dateobj);
		*/
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		det.setInsertDate(dateobj);
	

	    session.saveOrUpdate(det);
		transaction.commit();
	
	}

	}
	
	
	public Map getDivisiontoeditexam(HttpServletRequest request,HttpServletResponse response) 
	{
		int count = 1;
		
		String examid = request.getParameter("examid");	
		String classid = request.getParameter("classid");	
				
		System.out.println("--------------exam---------  :: "+examid);
		System.out.println("---------------classid------------------  ::  "+classid);

		ExamInfoDao dao=new ExamInfoDao();
		List list= dao.getDivisiontoeditexam(examid,classid);

		System.out.println("---------------- List ----------------- ::  "+list.size());
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			
			ExamInfoHibernate bean = new ExamInfoHibernate();
			System.out.println("result - "+Arrays.toString(o));
			bean.setFkDivisionId(Long.parseLong(o[0].toString()));
			bean.setDivision(o[1].toString());
			
			
			map.put(count,bean);
			count++;
		}
		return map;
	}
}
