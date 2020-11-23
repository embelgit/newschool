package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.bean.StudentInformationForReport;
import com.srb.utility.HibernateUtility;

public class CashBankBookDAO {

	public List getNameOfStudent(String fk_class_id, String fk_division_id) {
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT pk_student_id, first_name, middle_name, last_name,roll_number FROM student_master WHERE student_active ='Y' AND fk_class_id ='"+fk_class_id+"' AND fk_division_id ="+fk_division_id);
 			/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	}
	///nirgum stu
	public List getNameOfStudentng(String fk_class_id, String fk_division_id) {
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT pk_student_id, first_name, middle_name, last_name,roll_number FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND fk_division_id ="+fk_division_id);
 			/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	}
	
	
	
	
	//parent by student
	public List getNameOfParent(String studentName) {
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT pk_student_id, father_name  FROM student_master WHERE student_active ='Y' AND pk_student_id ='"+studentName+"' ");
 			/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	}
	
	// Copy Of Leaving Certificate by kishor
	public List getNameOfStudentCopy(String fk_class_id, String fk_division_id) {
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT first_name, middle_name, last_name, pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND fk_division_id ="+fk_division_id);
 			/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	}

	public List getTotalAnnualFeeAsPerStudentNameStudentFee(String fk_class_id,
			String fk_division_id, String firstName, String middleName, String lastName) {

		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			//Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND last_name='"+lastName+"'  AND first_name ='"+firstName+"' AND middle_name ='"+middleName+"' AND fk_division_id ="+fk_division_id);
 			
 			Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id, studenttype, namankit_type,roll_number FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND first_name='"+firstName+"' and middle_name='"+middleName+"'   and last_name='"+lastName+"'   AND fk_division_id ="+fk_division_id);/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	
	}
	
	// Trasnportation payment For all Total 
	public List TrasnportionDetailsAllTotal(String fk_class_id,
			String fk_division_id, String fk_Student_id) {

		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			//Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND last_name='"+lastName+"'  AND first_name ='"+firstName+"' AND middle_name ='"+middleName+"' AND fk_division_id ="+fk_division_id);
 			
 			//Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND first_name='"+firstName+"' and middle_name='"+middleName+"'   and last_name='"+lastName+"'   AND fk_division_id ="+fk_division_id);/*query.setParameter("billNo",billNo);
    			Query query = session.createSQLQuery("select pk_Trasnpotation_Scholl_BusId, payement from trasnpotation_school_bus where studentID ='"+fk_Student_id+"' and  fk_class_id1 = '"+fk_class_id+"' and fk_division_id1 = '"+fk_division_id+"'");
    			/*query.setParameter("billNo",billNo);
    		 query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	
	}
	
	public List getTotalAnnualFeeAspErNameOfStudent(String fk_class_id,
			String fk_division_id, String fk_Student_id) {

		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			//Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND last_name='"+lastName+"'  AND first_name ='"+firstName+"' AND middle_name ='"+middleName+"' AND fk_division_id ="+fk_division_id);
 			
 			Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND pk_student_id='"+fk_Student_id+"'   AND fk_division_id ="+fk_division_id);/*query.setParameter("billNo",billNo);
 			query.setParameter("supplierId",supplierId);*/
 			list = query.list();
 			
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
			return list;
    	
	
	
	}

	public Double getTotalAnnualAmt(String fk_class_id, String fk_division_id,
			String firstName,String middleName,String lastName) {

		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List<Object[]> list  = null;
    	 Double totalAmt = null;
    	 List<StudentInformationForReport> itemlist = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT annual_fee,pk_student_id FROM student_master WHERE fk_class_id ='"+fk_class_id+"' AND first_name ='"+firstName+"' And middle_name = '"+middleName+"' AND last_name = '"+lastName+"' AND fk_division_id ='"+fk_division_id+"' ");

 			list = query.list();
 			 itemlist = new ArrayList<StudentInformationForReport>(0);
 			 
 			 for (Object[] objects : list) {
 				 
 				StudentInformationForReport bean = new StudentInformationForReport();
 					String newBal = (objects[0].toString());
 					totalAmt = Double.valueOf(newBal);
 				itemlist.add(bean);
 				}
 			
 			
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
			return totalAmt;
    	
	
	}
	
	// Trasnport Bus Details fees  
	
	public Double getTotalAnnualAmtTransport(String fk_class_id, String fk_division_id,
			String fk_Student_id) {

		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List<Object[]> list  = null;
    	 Double totalAmt = null;
    	 List<StudentInformationForReport> itemlist = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT payement,pk_Trasnpotation_Scholl_BusId FROM trasnpotation_school_bus WHERE fk_class_id1 ='"+fk_class_id+"' AND fk_division_id1 ='"+fk_division_id+"' and studentID = '"+fk_Student_id+"' ");

 			list = query.list();
 			 itemlist = new ArrayList<StudentInformationForReport>(0);
 			 
 			 for (Object[] objects : list) {
 				 
 				StudentInformationForReport bean = new StudentInformationForReport();
 					String newBal = (objects[0].toString());
 					totalAmt = Double.valueOf(newBal);
 				itemlist.add(bean);
 				}
 			
 			
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
			return totalAmt;
    	
	
	}
	
	
	

	public List getRemainingFeeAmount(String fk_class_id,
			String fk_division_id, String firstName,String middleName,String lastName) {

		
		
		//System.out.println(" hi this is Dao fk_Student_id = = "+fk_Student_id);
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
    		// Query query = session.createSQLQuery("SELECT pk_student_payment_id,remaining_fee FROM student_payment WHERE fk_class_id ='"+fk_class_id+"' AND fk_division_id ='"+fk_division_id+"' AND student_id ='"+fk_Student_id+"' ORDER BY pk_student_payment_id DESC LIMIT 1 ");
    		 Query query = session.createSQLQuery("SELECT pk_student_payment_id,remaining_fee FROM student_payment WHERE fk_class_id ='"+fk_class_id+"' AND fk_division_id ='"+fk_division_id+"' AND first_name ='"+firstName+"' AND middle_name ='"+middleName+"' AND last_name ='"+lastName+"' ORDER BY pk_student_payment_id DESC LIMIT 1 ");

 			list = query.list();
 			
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
			return list;
	
	}

	
	// Transportation fee Of ppayment 
	public List getRemainingFeeAmountTransport(String fk_class_id,
			String fk_division_id, String fk_Student_id) {

		
		
		//System.out.println(" hi this is Dao fk_Student_id = = "+fk_Student_id);
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
    		// Query query = session.createSQLQuery("SELECT pk_student_payment_id,remaining_fee FROM student_payment WHERE fk_class_id ='"+fk_class_id+"' AND fk_division_id ='"+fk_division_id+"' AND student_id ='"+fk_Student_id+"' ORDER BY pk_student_payment_id DESC LIMIT 1 ");
    		 //Query query = session.createSQLQuery("SELECT pkTranspayment_Id,balanceAmountT FROM trasnportdetails_payment WHERE fkclassId ='"+fk_class_id+"' AND fkdivisionId ='"+fk_division_id+"' and studentName = '"+fk_Student_id+"'ORDER BY pkTranspayment_Id DESC LIMIT 1 ");
    		 Query query = session.createSQLQuery("SELECT pkTranspayment_Id,balanceAmountT FROM trasnportdetails_payment WHERE fkclassId ='"+fk_class_id+"' AND fkdivisionId ='"+fk_division_id+"' and studentName = '"+fk_Student_id+"' ORDER BY pkTranspayment_Id DESC LIMIT 1 ");

 			list = query.list();
 			
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
			return list;
	
	}
}
