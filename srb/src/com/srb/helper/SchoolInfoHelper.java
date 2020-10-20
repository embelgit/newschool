package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.SchoolInfoDao;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.utility.HibernateUtility;

public class SchoolInfoHelper {

	// for school detail
				public void doSchoolInfo(HttpServletRequest request,
						HttpServletResponse response) {
					// TODO Auto-generated method stub
					String schoolName = request.getParameter("schoolName");
					String city = request.getParameter("city");
					String tq = request.getParameter("tq");
					String district = request.getParameter("district");
					String state = request.getParameter("state");
					String pinCode = request.getParameter("pinCode");
					String instituteName = request.getParameter("instituteName");
					String contactP = request.getParameter("contactP");
					String address = request.getParameter("address");
					String sansthaName = request.getParameter("sansthaName");
					String schoolRegNumber = request.getParameter("schoolRegNumber");
					String schoolUdiseNumber = request.getParameter("schoolUdiseNumber");
					
					SchoolInfoHibernate scf = new SchoolInfoHibernate();
					
					scf.setSchoolName(schoolName);
					scf.setCity(city);
					scf.setTq(tq);
					scf.setDistrict(district);
					scf.setState(state);
					scf.setPinCode(Long.parseLong(pinCode));
					scf.setInstituteName(instituteName);
					scf.setContactP(Long.parseLong(contactP));
					scf.setAddress(address);
					scf.setSansthaName(sansthaName);
					scf.setSchoolRegNumber(schoolRegNumber);
					scf.setSchoolUdiseNumber(schoolUdiseNumber);
					
					SchoolInfoDao dao = new SchoolInfoDao();
					dao.SchoolInfoHibernate(scf);
					
				}

				
		//get school detail to edit
				public Map getSchoolDetailsForEdit(Long pkschoolId) {

				 	System.out.println("into helper class");
				 	SchoolInfoDao dao1 = new SchoolInfoDao();
					List catList = dao1.getAllSchoolDetailsForEdit(pkschoolId);
					
					Map  map =  new HashMap();
					for(int i=0;i<catList.size();i++)
					{
						Object[] o = (Object[])catList.get(i);
					
						GetSchoolDetailBean b = new GetSchoolDetailBean();
						b.setPkSchoolId(Long.parseLong(o[0].toString()));
						b.setSchoolName(o[1].toString());
						b.setCity(o[2].toString());
						b.setSansthaName(o[3].toString());
						b.setSchoolRegNumber(o[4].toString());
						b.setTq(o[5].toString());
						b.setDistrict(o[6].toString());
						b.setState(o[7].toString());
						b.setPinCode(Long.parseLong(o[8].toString()));
						b.setInstituteName(o[9].toString());
						b.setContactP(Long.parseLong(o[10].toString()));
						b.setSchoolUdiseNumber(o[11].toString());
						b.setAddress(o[12].toString());
						map.put(b.getPkSchoolId(),b);
					}
					System.out.println("out of helper return map : "+map);
					return map;
				
				}

                   //update school info
				public void updateSchoolInfoDetail(HttpServletRequest request,
						HttpServletResponse response) {

					String schoolId = request.getParameter("schoolId");
					
					String schoolName = request.getParameter("schoolName");
					String city = request.getParameter("city");
					String tq = request.getParameter("tq");
					String district = request.getParameter("district");
					
					String state = request.getParameter("state");
					String pinCode = request.getParameter("pinCode");
					String instituteName = request.getParameter("instituteName");
					
					String contactNo = request.getParameter("contactP");
					String address = request.getParameter("address");
					
					String sansthaName = request.getParameter("sansthaName");
					String schoolRegNumber = request.getParameter("schoolRegNumber");
					String schoolUdiseNumber = request.getParameter("schoolUdiseNumber");
					
					com.srb.utility.HibernateUtility hbu=null;
					Session session = null;
					Transaction transaction = null;
					
					 hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					 transaction = session.beginTransaction();
				
					//long customerId = Long.parseLong(customerId);
					long schoolInfoId =Long.parseLong(schoolId);
					
					SchoolInfoHibernate det = (SchoolInfoHibernate) session.load(SchoolInfoHibernate.class, schoolInfoId);
					
					det.setSchoolName(schoolName);
					det.setCity(city);
					det.setTq(tq);
					det.setDistrict(district);
					det.setState(state);
					det.setPinCode(Long.parseLong(pinCode));
					det.setInstituteName(instituteName);
					det.setContactP(Long.parseLong(contactNo));
					det.setAddress(address);
					det.setSansthaName(sansthaName);
					det.setSchoolRegNumber(schoolRegNumber);
					det.setSchoolUdiseNumber(schoolUdiseNumber);
					
				    session.saveOrUpdate(det);
					transaction.commit();
					
				}
}
					
