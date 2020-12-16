package com.srb.helper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.BookEntryDetalBean;
import com.srb.bean.ClassAndDivisionBean;
import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.dao.ClassDivisionAssocDao;
import com.srb.dao.ClassDivisionSubjectTeacherAssocDao;
import com.srb.dao.DailyTimeTableDAO;
import com.srb.dao.DivisionInfoDao;
import com.srb.dao.StudentInfoDao;
import com.srb.hibernate.ClassDivisionSubjectTeacherAssocHibernate;
import com.srb.hibernate.DailyTimeTableHibernate;

public class DailyTimeTableHelper {

	//grid for daily time table
	public DailyTimeTableHibernate getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetail(
			String fkSubjectId, String subjectName, String teacherName,
			String fkTeacherId, String startTime, String endTime,String fk_class_id1,String fk_division_id,String academicYear) {

		DailyTimeTableHibernate bean = new DailyTimeTableHibernate();
			bean.setFkSubjectId(Long.parseLong(fkSubjectId));
			bean.setSubjetName(subjectName);
			bean.setFkTeacherId(Long.parseLong(fkTeacherId));
			bean.setTeacherName(teacherName);
			bean.setStartTime(startTime);
			bean.setEndTime(endTime);
			bean.setClassName(fk_class_id1);
			bean.setClassName(fk_division_id);
			bean.setClassName(fk_division_id);
			System.out.println("fkSubjectId "+fkSubjectId);
			System.out.println("subjectName "+subjectName);
			System.out.println("fkTeacherId "+fkTeacherId);
			System.out.println("teacherName "+teacherName);
			System.out.println("startTime "+startTime);
			System.out.println("endTime "+endTime);
			System.out.println("fk_class_id1 "+fk_class_id1);
			System.out.println("fk_division_id "+fk_division_id);
			System.out.println("academicYear "+academicYear);
			
			return bean;
	}
	
	// edit grid
	/*public DailyTimeTableHibernate getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(
			String fkSubjectId, String subjectName, String teacherName,
			String fkTeacherId, String startTime, String endTime,String fk_class_id1,String fk_division_id,String academicYear) {

		DailyTimeTableHibernate bean = new DailyTimeTableHibernate();
			bean.setFkSubjectId(Long.parseLong(fkSubjectId));
			bean.setSubjetName(subjectName);
			bean.setFkTeacherId(Long.parseLong(fkTeacherId));
			bean.setTeacherName(teacherName);
			bean.setStartTime(startTime);
			bean.setEndTime(endTime);
			bean.setClassName(fk_class_id1);
			bean.setClassName(fk_division_id);
			bean.setClassName(fk_division_id);
			System.out.println("fkSubjectId "+fkSubjectId);
			System.out.println("subjectName "+subjectName);
			System.out.println("fkTeacherId "+fkTeacherId);
			System.out.println("teacherName "+teacherName);
			System.out.println("startTime "+startTime);
			System.out.println("endTime "+endTime);
			System.out.println("fk_class_id1 "+fk_class_id1);
			System.out.println("fk_division_id "+fk_division_id);
			System.out.println("academicYear "+academicYear);
			
			return bean;*/
	public List getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(HttpServletRequest request, HttpServletResponse response) {
		//String Currentdate = BookReturneDateNew;
		String DateDifference;
		//Long oneDay = 0.0;
		
		/*SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy ");

		Date cldate=null;
		
		cldate = format.parse(BookReturneDateNew);*/
		
		String fkSubjectId = request.getParameter("fk_subject_id");
		System.out.println("fkSubjectId="+fkSubjectId);
		String subjectName = request.getParameter("subjectName");
		String teacherName = request.getParameter("teacherName");
		String fkTeacherId = request.getParameter("fk_teacher_id");
		System.out.println("fkTeacherId="+fkTeacherId);
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String fk_class_id1 = request.getParameter("fk_class_id1");
		System.out.println("in helper===fk_class_id1== "+fk_class_id1);
		String fk_division_id = request.getParameter("fk_division_id");
		String academicYear = request.getParameter("academicYear");
		
		
		DailyTimeTableDAO dao = new DailyTimeTableDAO();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<DailyTimeTableHibernate> expL= dao.getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(fkSubjectId,fkTeacherId,fk_class_id1,fk_division_id,academicYear);
		 return expL;
	}

	public void addingDailyTimeTable(HttpServletRequest request,
			HttpServletResponse response) {

		// TODO Auto-generated method stub

			DailyTimeTableHibernate cdst=new DailyTimeTableHibernate();
            Integer count = Integer.parseInt(request.getParameter("count"));
            System.out.println(count);
            for(int i =0 ; i<count;i++)
    		{
				
                String subjectName = request.getParameter("subjetName"+i);
                String fkTeacherId = request.getParameter("fkTeacherId"+i);
                String teacherName = request.getParameter("teacherName"+i);
                String fkSubId = request.getParameter("fkSubjectId"+i);
                String endTime = request.getParameter("endTime"+i);
                String startTime = request.getParameter("startTime"+i);
                String academicYear = request.getParameter("academicYear");	
                String classId = request.getParameter("classId");
			    String className = request.getParameter("className");
				String fkDivisionId = request.getParameter("division");
				String divisionName = request.getParameter("divisionName");
				String day = request.getParameter("day");
		
				/*
				 	
				System.out.println("fkTeacherId "+fkTeacherId);
				System.out.println("fkSubId "+fkSubId);
				System.out.println("classId "+classId);
				System.out.println("startTime "+startTime);
				System.out.println("endTime "+endTime);
				System.out.println("subjectName "+subjectName);
				System.out.println("teacherName "+teacherName);
				System.out.println("academicYear "+academicYear);
				System.out.println("className "+className);
				System.out.println("divisionName "+divisionName);
				System.out.println("day "+day);
*/				
				cdst.setClassName(className);
				cdst.setFkClassId(Long.parseLong(classId));
				cdst.setFkSubjectId(Long.parseLong(fkSubId));
				cdst.setSubjetName(subjectName);
				cdst.setFkDivisionId(Long.parseLong(fkDivisionId));
				cdst.setDivisionName(divisionName);
				cdst.setFkTeacherId(Long.parseLong(fkTeacherId));
				cdst.setTeacherName(teacherName);
				cdst.setAcademicYear(academicYear);
				cdst.setStartTime(startTime);
				cdst.setEndTime(endTime);
				cdst.setWeekDay(day);
     
				DailyTimeTableDAO dao = new DailyTimeTableDAO();
				dao.dailyTimeTableDetails(cdst);
	
    		}

	
		
	}

	//report- daily time table
	public List getDailyTimeTableForReport(HttpServletRequest request,
			HttpServletResponse response) {

		//String academicYear = request.getParameter("academicYear");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,GetDailyTimeTableBean> map = new HashMap<Long,GetDailyTimeTableBean>();
 		
         DailyTimeTableDAO dao = new DailyTimeTableDAO();
 		List<GetDailyTimeTableBean> expList = dao.getDailyTimeTableInfo(fkClassId,fkDivId);
 		
 		return expList;
	
	
	
	}

	public List getDayWiseDailyTimeTableForReport(HttpServletRequest request,
			HttpServletResponse response) {

		String day = request.getParameter("day");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,GetDailyTimeTableBean> map = new HashMap<Long,GetDailyTimeTableBean>();
 		
         DailyTimeTableDAO dao = new DailyTimeTableDAO();
 		List<GetDailyTimeTableBean> expList = dao.getDayWiseDailyTimeTableInfo(fkClassId,fkDivId,day);
 		
 		return expList;
	
	
	
	
	}
	
	// Get Book Entry Details Reports 
	
	
		public List getBookEntryDetails(HttpServletRequest request,
				HttpServletResponse response) {

			//String academicYear = request.getParameter("academicYear");
			String fkSupplierId = request.getParameter("fk_Supplier_id");
			//String fkDivId = request.getParameter("fk_division_id");
			//String  fk_Student_id = request.getParameter("fk_Student_id");
			
	         Map<Long,BookEntryDetalBean> map = new HashMap<Long,BookEntryDetalBean>();
	 		
	         DailyTimeTableDAO dao = new DailyTimeTableDAO();
	 		List<BookEntryDetalBean> expList = dao.getBookEntryDetailsReports(fkSupplierId);
	 		
	 		return expList;
		
		
		
		}
		// Get Book Issue Student Deails Report
		public List getBookIssueDetailsReports(HttpServletRequest request,
				HttpServletResponse response) {

			//String academicYear = request.getParameter("academicYear");
			//String fkClassId = request.getParameter("fk_class_id");
			//String fkDivId = request.getParameter("fk_division_id");
			String  fk_Student_id = request.getParameter("fk_Student_id");
			
	         Map<Long,GetDailyTimeTableBean> map = new HashMap<Long,GetDailyTimeTableBean>();
	 		
	         DailyTimeTableDAO dao = new DailyTimeTableDAO();
	 		List<GetDailyTimeTableBean> expList = dao.getBookIssueDetailsReportsForStudents(fk_Student_id);
	 		
	 		return expList;
		
		
		
		}
		// get book Return Student Details Reports getBookReturnDetailsReports
		
		public List getBookReturnDetailsReports(HttpServletRequest request,
				HttpServletResponse response) {

			//String academicYear = request.getParameter("academicYear");
			//String fkClassId = request.getParameter("fk_class_id");
			//String fkDivId = request.getParameter("fk_division_id");
			String  fk_Student_id = request.getParameter("fk_Student_id");
			
	         Map<Long,GetDailyTimeTableBean> map = new HashMap<Long,GetDailyTimeTableBean>();
	 		
	         DailyTimeTableDAO dao = new DailyTimeTableDAO();
	 		List<GetDailyTimeTableBean> expList = dao.getBookReturnDetailsReports(fk_Student_id);
	 		
	 		return expList;
		
		
		
		}
		// Get all Employee Book Issue
		public List getEmployeeBookEntryDetails(HttpServletRequest request,
				HttpServletResponse response) {

			//String academicYear = request.getParameter("academicYear");
			String fkSupplierId = request.getParameter("fk_teacher_id");
			//String fkDivId = request.getParameter("fk_division_id");
			//String  fk_Student_id = request.getParameter("fk_Student_id");
			
	         Map<Long,BookEntryDetalBean> map = new HashMap<Long,BookEntryDetalBean>();
	 		
	         DailyTimeTableDAO dao = new DailyTimeTableDAO();
	 		List<BookEntryDetalBean> expList = dao.getEmployeeBookEntryDetails(fkSupplierId);
	 		
	 		return expList;
		
		
		
		}
		// get all Employee Book return Detials getEmployeeBookReturnDetails
		
		public List getEmployeeBookReturnDetails(HttpServletRequest request,
				HttpServletResponse response) {

			//String academicYear = request.getParameter("academicYear");
			String fkSupplierId = request.getParameter("fk_teacher_id");
			//String fkDivId = request.getParameter("fk_division_id");
			//String  fk_Student_id = request.getParameter("fk_Student_id");
			
	         Map<Long,BookEntryDetalBean> map = new HashMap<Long,BookEntryDetalBean>();
	 		
	         DailyTimeTableDAO dao = new DailyTimeTableDAO();
	 		List<BookEntryDetalBean> expList = dao.getEmployeeBookReturnDetails(fkSupplierId);
	 		
	 		return expList;
		
		
		
		}
//
		
		public Map getDivisionNameByClassNamedel(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String classId = request.getParameter("fkClassId");	
			String className = request.getParameter("className");	
			
			
			System.out.println("--------------classId---------  :: "+classId);
			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			DailyTimeTableDAO dao=new DailyTimeTableDAO();
			List list= dao.getDivisionNameByClassNamedel(classId,className);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				DailyTimeTableHibernate bean = new DailyTimeTableHibernate();
				System.out.println("result - "+Arrays.toString(o));
				bean.setFkDivisionId(Long.parseLong(o[0].toString()));
				bean.setDivisionName(o[1].toString());
			//	bean.setClassName(o[2].toString());
				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
			//	System.out.println("***************"+o[2]);
				
				
				map.put(bean.getFkDivisionId(),bean);
				count++;
			}
			return map;
		}
		
		//
		
		
		public void deletetimeDetail(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println("IN DAILy Time Table Helper");
			String fk_class_id = request.getParameter("fkClassId");
			String division = request.getParameter("fkdivid");
			String examid = request.getParameter("examid");
			
			System.out.println("classid-------"+fk_class_id);
			System.out.println("division-------"+division);
			System.out.println("examid-------"+examid);
//			ClassInfoDao dao = new ClassInfoDao(); 	
			DailyTimeTableDAO dao = new DailyTimeTableDAO();
			dao.deletediv(fk_class_id,division,examid);	
		
			
		}
}
