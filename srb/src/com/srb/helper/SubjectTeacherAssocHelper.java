package com.srb.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.srb.dao.SubjectTeacherAssoDao;
import com.srb.helper.SubjectTeacherAssocHelper;
import com.srb.hibernate.SubjectTeacherAssocHibernate;

public class SubjectTeacherAssocHelper {
	// for class_Div detail
	public void doSubjectTeacherAssoc(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub


String subject = request.getParameter("subject");
String teacherName = request.getParameter("teacherName");
String academicYear = request.getParameter("academicYear");

SubjectTeacherAssocHibernate sta=new SubjectTeacherAssocHibernate();

			sta.setSubject(subject);
			sta.setTeacherName(teacherName);
			sta.setAcademicYear(academicYear);
			
			SubjectTeacherAssoDao dao = new SubjectTeacherAssoDao();
			dao.SubjectTeacherAssocHibernate(sta);

		

}
}
