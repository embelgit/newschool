package com.srb.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.dao.ClassSubjectTeacherAssocDao;
import com.srb.helper.ClassSubjectTeacherAssocHelper;
import com.srb.hibernate.ClassSubjectTeacherAssocHibernate;

public class ClassSubjectTeacherAssocHelper {
	// for class_Div detail
	public void doClassSubjectTeacherAssoc(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub


String clas = request.getParameter("fk_class_id");
String subject = request.getParameter("subject");
String teacherName = request.getParameter("teacherName");
String academicYear = request.getParameter("academicYear");

ClassSubjectTeacherAssocHibernate cst=new ClassSubjectTeacherAssocHibernate();

		cst.setClas(Long.parseLong(clas));
		cst.setSubject(subject);
		cst.setTeacherName(teacherName);
		cst.setAcademicYear(academicYear);
		
		ClassSubjectTeacherAssocDao dao = new ClassSubjectTeacherAssocDao();
		dao.ClassSubjectTeacherAssocHibernate(cst);

}
}
