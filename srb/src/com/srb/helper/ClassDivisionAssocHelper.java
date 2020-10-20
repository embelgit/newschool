package com.srb.helper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.ClassAndDivisionBean;
import com.srb.dao.ClassDivisionAssocDao;
import com.srb.hibernate.ClassDivisionAssocHibernate;
import com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate;

public class ClassDivisionAssocHelper {
	// for class_Div detail
		public void doClassDivisionAssoc(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			
			String clas = request.getParameter("fk_class_id");
			String division = request.getParameter("division");
			String academicYear = request.getParameter("academicYear");
			
			ClassDivisionAssocHibernate cda = new ClassDivisionAssocHibernate();
			
			cda.setClas(Long.parseLong(clas));
			cda.setDivision(Long.parseLong(division));;
			cda.setAcademicYear(academicYear);
			
			ClassDivisionAssocDao dao = new ClassDivisionAssocDao();
			dao.ClassDivisionAssocHibernate(cda);
			
}
		
		
		//Get Vendor Name fore DropDown
		public Map getDivisionNameByClassName(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String classId = request.getParameter("fkClassId");	
			String className = request.getParameter("className");	
			
			
			System.out.println("--------------classId---------  :: "+classId);
			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			ClassDivisionAssocDao dao=new ClassDivisionAssocDao();
			List list= dao.getDivisionNameByClassName(classId,className);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				ClassAndDivisionBean bean = new ClassAndDivisionBean();
				System.out.println("result - "+Arrays.toString(o));
				bean.setPkDivisionId(o[0].toString());
				bean.setDivisionName(o[1].toString());
				bean.setClassName(o[2].toString());
				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
				System.out.println("***************"+o[2]);
				
				
				map.put(bean.getPkDivisionId(),bean);
				count++;
			}
			return map;
		}
		//
		public Map gettaskedit(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String class1 = request.getParameter("class1");	
			String teacher = request.getParameter("teacher");	
			String division = request.getParameter("division");	
			String subject = request.getParameter("subject");	
			
			
			System.out.println("--------------classId---------  :: "+subject+class1+division+teacher);
//			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			ClassDivisionAssocDao dao=new ClassDivisionAssocDao();
			List list= dao.gettaskk(subject,class1,division,teacher);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				HomeWorkTeacherDailyTaskEntryHibernate bean = new HomeWorkTeacherDailyTaskEntryHibernate();
				System.out.println("result - "+Arrays.toString(o));
				bean.setPkTeacherDailyTaskId(Long.parseLong(o[0].toString()));
				bean.setTask(o[1].toString());

				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
	//			System.out.println("***************"+o[2]);
				
				
				map.put(bean.getPkTeacherDailyTaskId(),bean);
				count++;
			}
			return map;
		}
		
		//
		public Map getDivisionNameByClassName1(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String classId = request.getParameter("fkClassId");	
			String className = request.getParameter("className");	
			
			
			System.out.println("--------------classId---------  :: "+classId);
			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			ClassDivisionAssocDao dao=new ClassDivisionAssocDao();
			List list= dao.getDivisionNameByClassName1(classId,className);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				ClassAndDivisionBean bean = new ClassAndDivisionBean();
				System.out.println("result - "+Arrays.toString(o));
				bean.setPkDivisionId(o[0].toString());
				bean.setDivisionName(o[1].toString());
				bean.setClassName(o[2].toString());
				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
				System.out.println("***************"+o[2]);
				
				
				map.put(bean.getPkDivisionId(),bean);
				count++;
			}
			return map;
		}
		//del class
		public Map getDivisionNameByClassNamedel(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String classId = request.getParameter("fkClassId");	
			String className = request.getParameter("className");	
			
			
			System.out.println("--------------classId---------  :: "+classId);
			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			ClassDivisionAssocDao dao=new ClassDivisionAssocDao();
			List list= dao.getDivisionNameByClassNamedel(classId,className);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				ClassAndDivisionBean bean = new ClassAndDivisionBean();
				System.out.println("result - "+Arrays.toString(o));
				bean.setPkDivisionId(o[0].toString());
				bean.setDivisionName(o[1].toString());
			//	bean.setClassName(o[2].toString());
				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
			//	System.out.println("***************"+o[2]);
				
				
				map.put(bean.getPkDivisionId(),bean);
				count++;
			}
			return map;
		}
		
		
//nirgum classname
		public Map getDivisionNameByClassNameng(HttpServletRequest request,HttpServletResponse response) 
		{
			int count = 1;
			
			String classId = request.getParameter("fkClassId");	
			String className = request.getParameter("className");	
			
			
			System.out.println("--------------classId---------  :: "+classId);
			System.out.println("---------------className------------------  ::  "+className);
			
			
			
			ClassDivisionAssocDao dao=new ClassDivisionAssocDao();
			List list= dao.getDivisionNameByClassNameng(classId,className);

			System.out.println("---------------- List ----------------- ::  "+list.size());
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);

				ClassAndDivisionBean bean = new ClassAndDivisionBean();
				System.out.println("result - "+Arrays.toString(o));
				bean.setPkDivisionId(o[0].toString());
				bean.setDivisionName(o[1].toString());
				bean.setClassName(o[2].toString());
				
				System.out.println("***************"+o[0]);
				System.out.println("***************"+o[1]);
				System.out.println("***************"+o[2]);
				
				
				map.put(bean.getPkDivisionId(),bean);
				count++;
			}
			return map;
		}
		
}
