package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.GetResultDetailBean;
import com.srb.dao.DailyTimeTableDAO;
import com.srb.dao.ResultDao;
import com.srb.hibernate.ResultHibernate;

public class ResultHelper {

	public void addMarksDetail(HttpServletRequest request,
			HttpServletResponse response) {
		ResultHibernate bean = new ResultHibernate();
		Integer count = Integer.parseInt(request.getParameter("count"));
        for(int i =0 ; i<count;i++)
		{
        	//Grid content
        	String fkStudentId = request.getParameter("fkStudentId"+i);
        	String firstName = request.getParameter("firstName"+i);
        	String middleName = request.getParameter("middleName"+i);
        	String lastName = request.getParameter("lastName"+i);
        	String obtainedMarks = request.getParameter("obtainedMarks"+i);
        	
        	bean.setFkStudentId(Long.parseLong(fkStudentId));
        	bean.setFirstName(firstName);
        	bean.setMiddleName(middleName);
        	bean.setLastName(lastName);
        	
        	bean.setObtainedMarks(Long.parseLong(obtainedMarks));
        	
        	//Out of Grid content
        	String fk_class_id = request.getParameter("fk_class_id");
        	String fk_division_id = request.getParameter("fk_division_id");
        	String fk_examName_id = request.getParameter("fk_examName_id");
           	String examName = request.getParameter("examName");
           	System.out.println("fk_examName_id - "+fk_examName_id+" , examName - "+examName);
       // 	String examName = request.getParameter("examName");
        	String className = request.getParameter("className");
        	String divisionName = request.getParameter("division");
        	String academicYear = request.getParameter("academicYear");
        	String fk_subject_id = request.getParameter("fk_subject_id");
        	String subjectName = request.getParameter("subjectName");
        	String passingMarks = request.getParameter("passingMarks");
        	String totalMarks = request.getParameter("totalMarks");
        	
        	bean.setTotalMarks(Long.parseLong(totalMarks));
        	bean.setFkClassId(Long.parseLong(fk_class_id));
        	bean.setFkDivId(Long.parseLong(fk_division_id));
        	bean.setFkExamId(Long.parseLong(fk_examName_id));
        	bean.setFkSubjectId(Long.parseLong(fk_subject_id));
        	bean.setAcademicYear(academicYear);
        	bean.setSubjectName(subjectName);
        	bean.setExamName(examName);
        	bean.setClassName(className);
        	bean.setDivisionName(divisionName);
        	bean.setPassingMarks(Long.parseLong(passingMarks));
        	
    		Date dateobj = new Date();
    		bean.setInsertDate(dateobj);
    		
    		ResultDao dao = new ResultDao();
    		dao.addResult(bean);
		}
		
	}

	//report- class wise report
	public List getClassWiseResultForReport(HttpServletRequest request,
			HttpServletResponse response) {


		String fkExamId = request.getParameter("fkExamId");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
         Map<Long,GetResultDetailBean> map = new HashMap<Long,GetResultDetailBean>();
 		
         ResultDao dao = new ResultDao();
 		List<GetResultDetailBean> expList = dao.getClassWiseResultInfo(fkExamId,fkClassId,fkDivId);
 		
 		return expList;
	
	
	
	
	}
//report - studentwise result
	public List getStudWiseResultForReport(HttpServletRequest request,
			HttpServletResponse response) {
		String fkExamId = request.getParameter("fkExamId");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		String studentName = request.getParameter("studentName");
		//String fk_Student_id = request.getParameter("fk_Student_id");
		
         Map<Long,GetResultDetailBean> map = new HashMap<Long,GetResultDetailBean>();
 		
         ResultDao dao = new ResultDao();
 		List<GetResultDetailBean> expList = dao.getStudentWiseResultInfo(fkExamId,fkClassId,fkDivId,studentName);
 		
 		return expList;
	
	
	
	
	
	}

}
