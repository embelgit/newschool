package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.SchoolInfoDao;

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
}
