package com.srb.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.KitchenInventoryBean;
import com.srb.bean.StudentCheckUpBean;
import com.srb.hibernate.ParentsComplaintHibernate;
import com.srb.hibernate.StudentCheckUpHibernate;
import com.srb.utility.HibernateUtility;

public class StudentCheckUpDao 
{
	
		public void addStudentCheckUpInfo(StudentCheckUpHibernate sch)
		{
			HibernateUtility hbu=null;
			Session session=null;
			Transaction transaction=null;
			
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
		
			
			session.save(sch);
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
	
	
		// get Grid For Student CheckUp
		public List<StudentCheckUpBean> getGridForStudentCheckUp(String fkClassId, String fkDivisionId) 
		{

			HibernateUtility hbu = null;
			Session session = null;
			List<StudentCheckUpBean> studList = null;
			
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				
				Query query2 = session.createSQLQuery("select first_name, last_name FROM student_master WHERE student_active='Y' AND fk_class_id='"+fkClassId+"' AND fk_division_id='"+fkDivisionId+"'");
				
				List<Object[]> list = query2.list();
				studList = new ArrayList<StudentCheckUpBean>(0);
	
				System.out.println("Size-------------------------******  ::  "+list.size());
				
				for (Object[] o : list) 
				{
	
					StudentCheckUpBean reports = new StudentCheckUpBean();
	
					reports.setfName(o[0].toString());
					System.out.println("  First Name == "+o[0]);
					reports.setlName(o[1].toString());
					System.out.println("  LAst Name == "+o[1]);
					studList.add(reports);
	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Size-----------------LAST--------******  ::  "+studList.size());

			return studList;
	
		}
//
		public List<StudentCheckUpBean> geteditGridForStudentCheckUp(String fkClassId, String fkDivisionId) 
		{

			HibernateUtility hbu = null;
			Session session = null;
			List<StudentCheckUpBean> studList = null;
			
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				
				Query query2 = session.createSQLQuery("SELECT pk_stud_checkup_Id,first_name,last_name,diagnosis,treatment,remark from student_checkup_details WHERE fk_class_Id = '"+fkClassId+"' AND fk_division_Id = '"+fkDivisionId+"'");
				
				List<Object[]> list = query2.list();
				studList = new ArrayList<StudentCheckUpBean>(0);
	
				System.out.println("Size-------------------------******  ::  "+list.size());
				
				for (Object[] o : list) 
				{
	
					StudentCheckUpBean reports = new StudentCheckUpBean();
					System.out.println("rr - "+Arrays.toString(o));
					reports.setPk_id(Long.parseLong(o[0].toString()));	
					reports.setfName(o[1].toString());
					System.out.println("  First Name == "+o[0]);
					reports.setlName(o[2].toString());
					System.out.println("  LAst Name == "+o[1]);
					reports.setDiagnosis(o[3].toString());
					reports.setTreatment(o[4].toString());
					reports.setRmk(o[5].toString());
					studList.add(reports);
	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Size-----------------LAST--------******  ::  "+studList.size());

			return studList;
	
		}
		
		// get Student CheckUp List
		public List getStudentCheckUpList()
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			List<StudentCheckUpBean> studList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT class_name, division_name, first_name, last_name, diagnosis, remark FROM student_checkup_details");
			List<Object[]> list = query.list();


			studList= new ArrayList<StudentCheckUpBean>(0);


		for (Object[] o : list) 
		{	
			StudentCheckUpBean reports = new StudentCheckUpBean();
			
			
			reports.setClassName(o[0].toString());
			reports.setDivisionName(o[1].toString());
			reports.setfName(o[2].toString());
			reports.setlName(o[3].toString());
			reports.setDiagnosis(o[4].toString());
			reports.setRmk(o[5].toString());
			
			
			studList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return studList;
		}
		//
		public List complaintpaList()
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			List<ParentsComplaintHibernate> studList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select pk_parents_complaint,class_name,division,first_name,middle_name,last_name,parent_name,task,academic_year,insert_date from parents_complaints");
			List<Object[]> list = query.list();


			studList= new ArrayList<ParentsComplaintHibernate>(0);


		for (Object[] o : list) 
		{	
			ParentsComplaintHibernate reports = new ParentsComplaintHibernate();
			
			
			reports.setPkParentsComplaintId(Long.parseLong(o[0].toString()));
			reports.setClassName((o[1].toString()));
			reports.setDivision(o[2].toString());
			reports.setFirstName(o[3].toString());
			reports.setMiddleName(o[4].toString());
			reports.setLastName(o[5].toString());
			reports.setParentName(o[6].toString());
			reports.setTask(o[7].toString());
			reports.setAcademicYear(o[8].toString());
			reports.setInsertDate((Date)o[9]);
			
			studList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return studList;
		}
		

		// student checkUp report by class and division
		public List checkupReportByClassAndDivision(String fkClassId, String fkDivisionId)
		{
			System.out.println("--------------ClasID ------------  :: "+fkClassId);
			System.out.println("--------------fkDivisionId ------------  :: "+fkDivisionId);
			
			
			HibernateUtility hbu=null;
			Session session=null;
			List<StudentCheckUpBean> studList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select first_name, last_name, diagnosis, remark FROM student_checkup_details WHERE fk_class_Id='"+fkClassId+"' AND fk_division_Id='"+fkDivisionId+"'");
			List<Object[]> list = query.list();


			studList= new ArrayList<StudentCheckUpBean>(0);
			
			System.out.println("------------------------- SIZE-----------------  :: "+list.size());


		for (Object[] o : list) 
		{	
			StudentCheckUpBean reports = new StudentCheckUpBean();
				System.out.println("reslt - "+Arrays.toString(o));
			reports.setfName(o[0].toString());
			reports.setlName(o[1].toString());
			reports.setDiagnosis(o[3].toString());
			reports.setRmk(o[3].toString());
			
			
			studList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return studList;
		}
		// get to delete student health checkup
		public List getStudentCheckUptoDelete()
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			List<StudentCheckUpBean> studList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT pk_stud_checkup_Id, first_name, last_name FROM student_checkup_details");
			List<Object[]> list = query.list();


			studList= new ArrayList<StudentCheckUpBean>(0);


		for (Object[] o : list) 
		{	
			StudentCheckUpBean reports = new StudentCheckUpBean();
			reports.setPk_id(Long.parseLong(o[0].toString()));
			reports.setfName(o[1].toString());
			reports.setlName(o[2].toString());
			
			
			studList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return studList;
		}

		
		// delete student health checkup
		public void deletcheckupList(String TransportId1) {
			Long pk_stud_checkup_Id = Long.parseLong(TransportId1);
			HibernateUtility hbu = null ;
			Transaction tx = null; 
			Session session = null;
			 List list  = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 tx = session.beginTransaction();
					Query query = session.createSQLQuery("DELETE FROM student_checkup_details WHERE pk_stud_checkup_Id =:pk_stud_checkup_Id");
					query.setParameter("pk_stud_checkup_Id",pk_stud_checkup_Id);
					int seletedRecords = query.executeUpdate();
					System.out.println("Number of credit Cusr deleted = = "+seletedRecords);
					//list = query.list();
					tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
				
			 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
			
		}

		
		
}
