package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.helper.DivisionInfoHelper;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.ClassInfoDao;
import com.srb.dao.DivisionInfoDao;
import com.srb.dao.SchoolInfoDao;
import com.srb.hibernate.DivisionInfoHibernate;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.utility.HibernateUtility;

public class DivisionInfoHelper {
	
	// for division detail
			public void doDivisionInfo(HttpServletRequest request,
					HttpServletResponse response) {
				// TODO Auto-generated method stub
				String division = request.getParameter("division");
				String classRoom = request.getParameter("classRoom");
				String fkClassId = request.getParameter("fk_class_id");
				DivisionInfoHibernate dif = new DivisionInfoHibernate();
				
				SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dateobj = new Date();
				System.out.println(dateFormat1.format(dateobj));
				dif.setInsertDate(dateobj);
				
				dif.setDivision(division);
				dif.setClassRoom(classRoom);
				dif.setFkClassId(Long.parseLong(fkClassId));
				
				DivisionInfoDao dao = new DivisionInfoDao();
				dao.DivisionInfoHibernate(dif);
				
				
			}

			public Map getDivDetailsForEdit(Long fkclassId, String divisionId) {


			 	System.out.println("into helper class");
			 	DivisionInfoDao dao1 = new DivisionInfoDao();
				List catList = dao1.getAllDivDetailsForEdit(fkclassId,divisionId);
				
				Map  map =  new HashMap();
				for(int i=0;i<catList.size();i++)
				{
					Object[] o = (Object[])catList.get(i);
				
					DivisionInfoHibernate b = new DivisionInfoHibernate();
					b.setClassRoom(o[1].toString());
					map.put(b.getPkDivisionId(),b);
				}
				System.out.println("out of helper return map : "+map);
				return map;
			
			
			}

			public void updateDivisionInfoDetail(HttpServletRequest request,
					HttpServletResponse response) {

				String fk_class_id = request.getParameter("fk_class_id");
				String divId = request.getParameter("divId");
				
				String divisionName = request.getParameter("division");
				String classRoom = request.getParameter("classRoom");
				
				com.srb.utility.HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
			
				//long customerId = Long.parseLong(customerId);
				long pkDivId =Long.parseLong(divId);
				
				DivisionInfoHibernate det = (DivisionInfoHibernate) session.load(DivisionInfoHibernate.class, pkDivId);
				
				det.setDivision(divisionName);
				det.setClassRoom(classRoom);
				det.setFkClassId(Long.parseLong(fk_class_id));

			    session.saveOrUpdate(det);
				transaction.commit();
				
			
				
			}
			
			//del div
			public void deletedivNameInfoDetail(HttpServletRequest request,
					HttpServletResponse response) {

				String fk_class_id = request.getParameter("fk_class_id");
				String division = request.getParameter("division");
				
				
//				ClassInfoDao dao = new ClassInfoDao(); 	
				DivisionInfoDao dao = new DivisionInfoDao();
				dao.deletediv(fk_class_id,division);	
			
				
			}
}
