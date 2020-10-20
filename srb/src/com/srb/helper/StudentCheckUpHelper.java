package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.StockManagementBean;
import com.srb.bean.StudentCheckUpBean;
import com.srb.dao.StoreManagementDAO;
import com.srb.dao.StudentCheckUpDao;
import com.srb.hibernate.StudentCheckUpHibernate;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.utility.HibernateUtility;

public class StudentCheckUpHelper 
{
		// get Grid for Student CheckUp	
			public List getGridForStudentCheckUp(String fkClassId, String fkDivisionId)
			{
		
				Map<String, StudentCheckUpBean> map = new HashMap<String, StudentCheckUpBean>();
				StudentCheckUpDao dao = new StudentCheckUpDao();
				
				List<StudentCheckUpBean> exp1List = dao.getGridForStudentCheckUp(fkClassId,fkDivisionId);

				return exp1List;
				
			}
			//
			public List geteditGridForStudentCheckUp(String fkClassId, String fkDivisionId)
			{
		
				Map<String, StudentCheckUpBean> map = new HashMap<String, StudentCheckUpBean>();
				StudentCheckUpDao dao = new StudentCheckUpDao();
				
				List<StudentCheckUpBean> exp1List = dao.geteditGridForStudentCheckUp(fkClassId,fkDivisionId);

				return exp1List;
				
			}
			
			// Add Student CheckUp Info
			public void addStudentCheckUpInfo(HttpServletRequest request, HttpServletResponse response) 
			{
				String cunt = request.getParameter("count");
				
				Integer count = Integer.parseInt(cunt);
				
				for(int i=0;i<count;i++)
				{
					String fkClassId = request.getParameter("fkClassId");
					String fkDivisionId = request.getParameter("fkDivisionId");
					String fName = request.getParameter("fName"+i);
					String lName = request.getParameter("lName"+i);
					String diagnosis = request.getParameter("diagnosis"+i);
					String treatment = request.getParameter("treatment"+i);
					String remark = request.getParameter("remark"+i);
					String className = request.getParameter("className");
					String divisionName = request.getParameter("divisionName");
					
					System.out.println("-------------className-----------  :: "+className);
					System.out.println("-----------divisionName-------------  :: "+divisionName);
					
					StudentCheckUpHibernate sch = new StudentCheckUpHibernate();
					
					sch.setFkClassId(Long.parseLong(fkClassId));
					sch.setFkDivisionId(Long.parseLong(fkDivisionId));
					sch.setFirstName(fName);
					sch.setLastName(lName);
					sch.setDiagnosis(diagnosis);
					sch.setRemark(remark);
					sch.setTreatment(treatment);
					sch.setClassName(className);
					sch.setDivisionName(divisionName);
					
				
					StudentCheckUpDao dao = new StudentCheckUpDao();
					dao.addStudentCheckUpInfo(sch);
				
				
				}
		
			}
	//edit
			
			public void editStudentCheckUpInfo(HttpServletRequest request, HttpServletResponse response) 
			{
				String cunt = request.getParameter("count");
				
				Integer count = Integer.parseInt(cunt);
				
				for(int i=0;i<count;i++)
				{
					String fkClassId = request.getParameter("fkClassId");
					String fkDivisionId = request.getParameter("fkDivisionId");
					String fName = request.getParameter("fName"+i);
					String lName = request.getParameter("lName"+i);
					String diagnosis = request.getParameter("diagnosis"+i);
					String treatment = request.getParameter("treatment"+i);
					String remark = request.getParameter("remark"+i);
					
					String pkid = request.getParameter("pkid"+i);
					
					String className = request.getParameter("className");
					String divisionName = request.getParameter("divisionName");
					
					System.out.println("-------------className-----------  :: "+className);
					System.out.println("-----------divisionName-------------  :: "+divisionName);
					
					
					com.srb.utility.HibernateUtility hbu=null;
					Session session = null;
					Transaction transaction = null;
					
					 hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					 transaction = session.beginTransaction();
				
					//long customerId = Long.parseLong(customerId);
					long pkStudentId =Long.parseLong(pkid);
					System.out.println("id - "+pkStudentId);
					StudentCheckUpHibernate sch = (StudentCheckUpHibernate) session.load(StudentCheckUpHibernate.class, pkStudentId);
					
//					StudentCheckUpHibernate sch = new StudentCheckUpHibernate();
					
					sch.setFkClassId(Long.parseLong(fkClassId));
					sch.setFkDivisionId(Long.parseLong(fkDivisionId));
					sch.setFirstName(fName);
					sch.setLastName(lName);
					sch.setDiagnosis(diagnosis);
					sch.setRemark(remark);
					sch.setTreatment(treatment);
					sch.setClassName(className);
					sch.setDivisionName(divisionName);
					
				
				    session.saveOrUpdate(sch);
					transaction.commit();
				
				
				}
		
			}
			//stock report between to date
			public List checkupReportByClassAndDivision(HttpServletRequest request, HttpServletResponse response) 
			{
				String fkClassId = request.getParameter("fkClassId");
				String fkDivisionId = request.getParameter("fkDivisionId");
				
		         Map<Long,StudentCheckUpBean> map = new HashMap<Long,StudentCheckUpBean>();
		 		
		         StudentCheckUpDao dao = new StudentCheckUpDao();
		 		 List<StudentCheckUpBean> expList = dao.checkupReportByClassAndDivision(fkClassId,fkDivisionId);
		 		
		 		return expList;
			
			}

}
