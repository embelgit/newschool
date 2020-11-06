package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.SportInfoHibernate1;
import com.srb.dao.ClassDivisionSubjectTeacherAssocDao;
import com.srb.hibernate.ClassDivisionSubjectTeacherAssocHibernate;

public class ClassDivisionSubjectTeacherAssocHelper {
	// for class_Div detail
				public void doClassDivisionSubjectTeacherAssoc(HttpServletRequest request,
						HttpServletResponse response) {
					// TODO Auto-generated method stub
	
	                    ClassDivisionSubjectTeacherAssocHibernate cdst=new ClassDivisionSubjectTeacherAssocHibernate();
	                    Integer count = Integer.parseInt(request.getParameter("count"));
	                    System.out.println(count);
	                    for(int i =0 ; i<count;i++)
	            		{
							
		                    String subjectName = request.getParameter("subject"+i);
		                    String fkTeacherId = request.getParameter("fkTeacherId"+i);
		                    String teacherName = request.getParameter("teacherName"+i);
		                    String fkSubId = request.getParameter("fkSubjectId"+i);
		                    String academicYear = request.getParameter("academicYear");	
		                    String classId = request.getParameter("classId");
						    String className = request.getParameter("className");
							String fkDivisionId = request.getParameter("division");
							String divisionName = request.getParameter("divisionName");
							
							cdst.setClassName(className);
							cdst.setFkClassId(Long.parseLong(classId));
							cdst.setFkSubjectId(Long.parseLong(fkSubId));
							cdst.setSubject(subjectName);
							cdst.setFkDivisionId(Long.parseLong(fkDivisionId));
							cdst.setDivision(divisionName);
							cdst.setFkTeacherId(Long.parseLong(fkTeacherId));
							cdst.setTeacherName(teacherName);
							cdst.setAcademicYear(academicYear);
	             
							 //to get todays month and year
							Date todayDate =new Date();
							SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-M-dd");
							String  strDate = formatter.format(todayDate);
							String []todaydate= strDate.split("-");
							String year=todaydate[0];
							String month=todaydate[1];
							String date=todaydate[2];
							
							
							
			            ClassDivisionSubjectTeacherAssocDao dao = new ClassDivisionSubjectTeacherAssocDao();
						dao.ClassDivisionSubjectTeacherAssocHibernate(cdst);
	            		}
	
				}
				
				// to get subject and teacher with ids in grid 
				public ClassDivisionSubjectTeacherAssocHibernate getSubjectAndTeacherDetail(String fkSubjectId, String subjectName, String teacherName,	String fkTeacherId) {
					
					ClassDivisionSubjectTeacherAssocHibernate bean = new ClassDivisionSubjectTeacherAssocHibernate();
						bean.setFkSubjectId(Long.parseLong(fkSubjectId));
						bean.setSubject(subjectName);
						bean.setFkTeacherId(Long.parseLong(fkTeacherId));
						System.out.println("hi this is kishor "+fkTeacherId);
						bean.setTeacherName(teacherName);
					return bean;
					
				}
				
	

				public ClassDivisionSubjectTeacherAssocHibernate getSubjectDetail(
						String fkSubjectId, String subjectName) {
					System.out.println("fkSubjectId = = = =  ="+fkSubjectId);
					ClassDivisionSubjectTeacherAssocHibernate bean = new ClassDivisionSubjectTeacherAssocHibernate();
						bean.setFkSubjectId(Long.parseLong(fkSubjectId));
						bean.setSubject(subjectName);
					return bean;
					
				
				}
				/*public ClassDivisionSubjectTeacherAssocHibernate getSubjectDetailEdit(
						String fkSubjectId, String subjectName) {
					System.out.println("fkSubjectId = = = =  ="+fkSubjectId);
					ClassDivisionSubjectTeacherAssocHibernate bean = new ClassDivisionSubjectTeacherAssocHibernate();
						bean.setFkSubjectId(Long.parseLong(fkSubjectId));
						bean.setSubject(subjectName);
					return bean;
					
				
				}*/
				
				public List getSubjectInGridOn(HttpServletRequest request, HttpServletResponse response) 
				{
				
					 String examName = request.getParameter("examName_id");
					 String fk_class_id = request.getParameter("fk_class_id");
					 String fk_division_id = request.getParameter("fk_division_id");
					 String AcademicYear = request.getParameter("AcademicYear");
					 String classname =  request.getParameter("classname") ;
					 String divname = request.getParameter("divname");
					 
					 
					 ClassDivisionSubjectTeacherAssocDao dao = new ClassDivisionSubjectTeacherAssocDao();
					 Map<Long,SportInfoHibernate1> map = new HashMap<Long,SportInfoHibernate1>();
					 List<SportInfoHibernate1> expL= dao.getSubjectonName(examName,classname,divname,AcademicYear);
					 return expL;
					
				}
				
				//delete class division subject teacher Association
				
				public void deletesClassDivsubTeacherAsso(HttpServletRequest request, HttpServletResponse response ) {
					
					String pkid = request.getParameter("pkid");
					   
					ClassDivisionSubjectTeacherAssocDao dao2 = new ClassDivisionSubjectTeacherAssocDao();
					dao2.deletclassDivSubTeachAsso(pkid);
						
					}
				
				
				
				
				
}