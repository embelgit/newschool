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
import com.srb.dao.TransportationInfoDao;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;

public class TransportationInfoHelper {
	//get school detail to edit
	public Map getTransportationForEdit(Long pkschoolId) {

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
	
public void deletesTransportationDetails(HttpServletRequest request, HttpServletResponse response ) {
		
		String TransportId = request.getParameter("TransportId");
		TransportationInfoDao dao2 = new TransportationInfoDao();
		dao2.deletTransport(TransportId);
			
		}
public void updateTransportationInfoDetail(HttpServletRequest request,
		HttpServletResponse response) {

	String studId = request.getParameter("studId1");
	System.out.println("studId"+studId);
	String leaveDateFrom = request.getParameter("leaveDateFrom");
	System.out.println("leaveDateFrom"+leaveDateFrom);
	String DriverName = request.getParameter("DriverName");
	System.out.println(" DriverName == "+DriverName);
	String leaveDateTo = request.getParameter("leaveDateTo");
	System.out.println("leaveDateTo"+leaveDateTo);
	String ContactNo = request.getParameter("ContactNo");
	System.out.println("ContactNo"+ContactNo);
	
	String Pincode = request.getParameter("Pincode");
	System.out.println("Pincode"+Pincode);
	String payement = request.getParameter("payement");
	System.out.println("payement"+payement);
	String Address = request.getParameter("Address");
	System.out.println("Address"+Address);
	//String fk_class_id1 = request.getParameter("fk_class_id1");
	//System.out.println("fk_class_id1"+fk_class_id1);
//	String fk_division_id = request.getParameter("fk_division_id");
//	System.out.println("fk_division_id"+fk_division_id);
	
	
	com.srb.utility.HibernateUtility hbu=null;
	Session session = null;
	Transaction transaction = null;
	
	 hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();

	//long customerId = Long.parseLong(customerId);
	//String schoolInfoId = studentName;
	 long pkTrasnpotationSchollBusId = Long.parseLong(studId);
	
	TrasnpotationSchollBus tsb = (TrasnpotationSchollBus) session.load(TrasnpotationSchollBus.class, pkTrasnpotationSchollBusId);
	tsb.setPkTrasnpotationSchollBusId(pkTrasnpotationSchollBusId);
	tsb.setDriverName(DriverName);
	tsb.setLeaveDateFrom(leaveDateFrom);
	tsb.setContactNo(Long.parseLong(ContactNo));
	tsb.setLeaveDateTo(leaveDateTo);
	tsb.setPincode(Long.parseLong(Pincode));
	tsb.setPayement(Double.parseDouble(payement));
	tsb.setAddress(Address);
	//tsb.setFkclassid(Long.parseLong(fk_class_id1));
	//tsb.setFkdivisionid(Long.parseLong(fk_division_id));
	
	System.out.println("update in transportation hibernate");
    session.saveOrUpdate(tsb);
	transaction.commit();
	
}
	
	
	
}
