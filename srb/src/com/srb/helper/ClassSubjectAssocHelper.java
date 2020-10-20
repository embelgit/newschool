
package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.ClasSubAssoBean;
import com.srb.dao.ClassSubjectAssocDao;
import com.srb.helper.ClassSubjectAssocHelper;
import com.srb.hibernate.ClassSubjectAssocHibernate;

public class ClassSubjectAssocHelper {
	// for class_Div detail
	public void doClassSubjectAssoc(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
	
	String classId = request.getParameter("classId");
	String subject = request.getParameter("subject");
	String academicYear = request.getParameter("academicYear");
	String className = request.getParameter("className");
	
	ClassSubjectAssocHibernate csa=new ClassSubjectAssocHibernate();
	
	csa.setClassName(className);
	csa.setFkClassId(Long.parseLong(classId));
	csa.setFkSubjectId(Long.parseLong(subject));
	csa.setAcademicYear(academicYear);
			
	ClassSubjectAssocDao dao = new ClassSubjectAssocDao();
	dao.ClassSubjectAssocHibernate(csa);

}
	
	public ClasSubAssoBean getSubInfo(
			HttpServletRequest request, HttpServletResponse response) {
		
		String classId =request.getParameter("fk_class_id");
		
		Map<Long,ClasSubAssoBean> map = new HashMap<Long,ClasSubAssoBean>();
		
		ClassSubjectAssocDao dao = new ClassSubjectAssocDao();
		List<ClasSubAssoBean> catList = dao.getSubInfo(classId);
		
		ClasSubAssoBean cs = null;
		if(catList!= null && catList.size() > 0 )
		{	
			cs = (ClasSubAssoBean)catList.get(0); 
		}
		return cs;
	
	
	}
}
