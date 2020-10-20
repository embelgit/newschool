package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.ClasSubAssoBean;
import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.dao.ClassDivisionSubjectAssocDao;
import com.srb.dao.ClassSubjectAssocDao;
import com.srb.helper.ClassDivisionSubjectAssocHelper;
import com.srb.hibernate.ClassDivisionSubjectAssocHibernate;

public class ClassDivisionSubjectAssocHelper {
	
	// for class_Div detail
			public void doClassDivisionSubjectAssoc(HttpServletRequest request,
					HttpServletResponse response) {
				// TODO Auto-generated method stub
				
	 System.out.println("in classId=");
				
    String classId = request.getParameter("classId");
    String className = request.getParameter("className");
	String division = request.getParameter("division");
	String subject = request.getParameter("subject");
	String academicYear = request.getParameter("academicYear");

	ClassDivisionSubjectAssocHibernate cds=new ClassDivisionSubjectAssocHibernate();
	
			cds.setFkClassId(Long.parseLong(classId));
			cds.setFkDivisionId(Long.parseLong(division));
			cds.setFkSubjectId(Long.parseLong(subject));
			cds.setAcademicYear(academicYear);
			cds.setClassName(className);
		
			
			ClassDivisionSubjectAssocDao dao = new ClassDivisionSubjectAssocDao();
			dao.ClassDivisionSubjectAssocHibernate(cds);
	
			}
			public ClassDivisionSubjectAssocBean getDivSubInfo(
					HttpServletRequest request, HttpServletResponse response) {
				
				String classId =request.getParameter("fk_class_id");
				
				Map<Long,ClassDivisionSubjectAssocBean> map = new HashMap<Long,ClassDivisionSubjectAssocBean>();
				
				ClassDivisionSubjectAssocDao dao = new ClassDivisionSubjectAssocDao();
				List<ClassDivisionSubjectAssocBean> catList = dao.getDivSubInfo(classId);
				
				ClassDivisionSubjectAssocBean cs = null;
				if(catList!= null && catList.size() > 0 )
				{	
					cs = (ClassDivisionSubjectAssocBean)catList.get(0); 
				}
				return cs;
			
			
			}
		}
