package com.srb.helper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.helper. ClassInfoHelper;
import com.srb.dao.ClassInfoDao;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.hibernate.DivisionInfoHibernate;
import com.srb.hibernate.ExpenditureDetailsBean;
import com.srb.utility.HibernateUtility;

    public class ClassInfoHelper {
    	// for student detail
    				public void doClassInfo(HttpServletRequest request,
    						HttpServletResponse response) {
    					// TODO Auto-generated method stub
					
    					String clas = request.getParameter("clas");
    					String classRoom = request.getParameter("classRoom");
    					
    					ClassInfoHibernate cif = new ClassInfoHibernate();
    					
    					cif.setClas(clas);
    					cif.setClassRoom(classRoom);
    					System.out.println("clas - "+clas+"  "+classRoom);
    					ClassInfoDao dao = new ClassInfoDao();
    					dao.ClassInfoHibernate(cif);
    					
    					
		}
    				
    				// update class name 
    				public void updateClassNameInfoDetail(HttpServletRequest request,
    						HttpServletResponse response) {

    					String fk_class_id = request.getParameter("fk_class_id");
    					String className = request.getParameter("className");
    					
    					
    					com.srb.utility.HibernateUtility hbu=null;
    					Session session = null;
    					Transaction transaction = null;
    					
    					 hbu = HibernateUtility.getInstance();
    					session = hbu.getHibernateSession();
    					 transaction = session.beginTransaction();
    				
    					//long customerId = Long.parseLong(customerId);
    					long classId =Long.parseLong(fk_class_id);
    					
    					ClassInfoHibernate det = (ClassInfoHibernate) session.load(ClassInfoHibernate.class, classId);
    					
    					det.setClas(className);
    					
    				    session.saveOrUpdate(det);
    					transaction.commit();
    					
    				
    					
    				}
//
    				public void updateexpenditure(HttpServletRequest request,HttpServletResponse response) {

    					String fk_class_id = request.getParameter("fk_class_id");
    					String expname = request.getParameter("expname");
    					
    					System.out.println("exp id - "+fk_class_id+" exp name - "+expname);
    					
    					com.srb.utility.HibernateUtility hbu=null;
    					Session session = null;
    					Transaction transaction = null;
    					
    					 hbu = HibernateUtility.getInstance();
    					session = hbu.getHibernateSession();
    					 transaction = session.beginTransaction();
    				
    					//long customerId = Long.parseLong(customerId);
    					long classId =Long.parseLong(fk_class_id);
    					
    					ExpenditureDetailsBean det = (ExpenditureDetailsBean) session.load(ExpenditureDetailsBean.class, classId);
    					
    					det.setExpenseName(expname);
    					
    				    session.saveOrUpdate(det);
    					transaction.commit();
    					
    				
    					
    				}
    				//del 
    				public void deleteClassNameInfoDetail(HttpServletRequest request,
    						HttpServletResponse response) {

    					String fk_class_id = request.getParameter("fk_class_id");
    					String className = request.getParameter("className");
    					
    					
    					ClassInfoDao dao = new ClassInfoDao(); 	
    					dao.deleteclass(fk_class_id,className);	
    				
    					
    				}
	}



