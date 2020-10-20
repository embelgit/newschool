package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassDivisionSubjectTeacherAssocBean;
import com.srb.bean.SportInfoHibernate1;
import com.srb.bean.StudentCheckUpBean;
import com.srb.hibernate.ClassDivisionSubjectTeacherAssocHibernate;
import com.srb.utility.HibernateUtility;

public class ClassDivisionSubjectTeacherAssocDao {

public void ClassDivisionSubjectTeacherAssocHibernate(ClassDivisionSubjectTeacherAssocHibernate cdst){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cdst);
		transaction.commit();
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}finally{
		hbu.closeSession(session);
		}
	}	
		
		public List<SportInfoHibernate1> getSubjectonName(String examName,String classname,String divname,String AcademicYear)
		{
		
			System.out.println("in dao examName - "+examName+" , classname - "+classname+" , divname - "+divname+" , AcademicYear - "+AcademicYear);
			HibernateUtility hbu = null;
			Session session = null;
			List<SportInfoHibernate1> list = null;
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
			/*	Query query = session.createSQLQuery("select f.product_name,f.buy_price,f.hsn from product_details f where f.product_name='" + itemName+ "'");*/
			
				Query query = session.createSQLQuery("select subject_name,total_marks,passing_marks,pk_exam_id from exam_master where  exam_name='" + examName+ "' and class_name ='"+classname+"' and division_name='"+divname+"'and academic_year='"+AcademicYear+"' ");
				
				List<Object[]> list1 = query.list();
				list = new ArrayList<SportInfoHibernate1>(0);
				for (Object[] object : list1) 
				{
					System.out.println("?///////////" + object[2].toString());
					SportInfoHibernate1 poJqgrid = new SportInfoHibernate1();
					System.out.println("result - "+Arrays.toString(object));
					poJqgrid.setSubject((object[0].toString()));
					poJqgrid.setTotalMarks((Double.parseDouble(object[1].toString())));
					poJqgrid.setPassingMarks(Double.parseDouble((object[2].toString())));
		
					poJqgrid.setPkexamid((Long.parseLong((object[3].toString()))));
					System.out.println(" hi thisn is kishor pk exm id"+(object[3].toString()));
					list.add(poJqgrid);
				}
		
			} catch (Exception e) 
			{
				e.printStackTrace(); 
				// TODO: handle exception
			}
		
			finally {
				if (session != null) {
					hbu.closeSession(session);
				}
			}
			return list;
		
		}
		
		
		// get Class Details List
			public List getClassDetails()
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<ClassDivisionSubjectTeacherAssocBean> classDetlsList=null;
			try{	
	
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
	
				Query query=session.createSQLQuery("SELECT class_name, division_name, subject_name, teacher_name, academic_year FROM class_division_subject_teacher_association");
				List<Object[]> list = query.list();
	
	
				classDetlsList= new ArrayList<ClassDivisionSubjectTeacherAssocBean>(0);
	
	
			for (Object[] o : list) 
			{	
				ClassDivisionSubjectTeacherAssocBean reports = new ClassDivisionSubjectTeacherAssocBean();
				
				reports.setClassName(o[0].toString());
				reports.setDivision_name(o[1].toString());
				reports.setSubject_name(o[2].toString());
				reports.setTeacher_name(o[3].toString());
				reports.setAcademic_year(o[4].toString());
				
				
				classDetlsList.add(reports);
	
			}}catch(RuntimeException e){	
	
			}
			finally{
	
			hbu.closeSession(session);	
			}
			
			return classDetlsList;
			}
		

}