package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetStudentDetailsBean;
import com.srb.bean.Sportinfo;
import com.srb.dao.SchoolInfoDao;
import com.srb.dao.SportInfoDao;
import com.srb.dao.StudentInfoDao;
import com.srb.hibernate.ClassDivisionSubjectTeacherAssocHibernate;
import com.srb.hibernate.DivisionInfoHibernate;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.hibernate.SportInfoHibernate;
import com.srb.utility.HibernateUtility;

public class SportInfoHelper {

	

	private String pkSportId;

	// for school detail
	public void doSportInfo(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("in helper jav by kishor");
		
		
		String Createactivity = request.getParameter("Createactivity");
		String Activitydetails = request.getParameter("Activitydetails");
		String Organizeby = request.getParameter("Organizeby");
		String otherdetails = request.getParameter("otherdetails");
		
		
		SportInfoHibernate scf = new SportInfoHibernate();
		
		scf.setCreateactivity(Createactivity);
		scf.setActivitydetails(Activitydetails);
		scf.setOrganizeby(Organizeby);
		scf.setOtherdetails(otherdetails);
		
		
		SportInfoDao dao = new SportInfoDao();
		dao.SportInfoHibernate(scf);
		
	}
	
	//get Student detail for edit
	public Map getSportDetailsForEdit(String  pkSportId) {
	 	System.out.println("into helper class");
	 	SportInfoDao dao1 = new SportInfoDao();
		List catList = dao1.getAllSportDetailsForEdit(pkSportId);
		System.out.println("hi this kishor in list"+catList);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			SportInfoHibernate b = new SportInfoHibernate();
			b.setPkSportId(Long.parseLong(o[0].toString()));
			System.out.println("hi this kishor activity"+(o[0].toString()));
			b.setCreateactivity(o[1].toString());
			System.out.println("hi this kishor activity"+(o[1].toString()));
			b.setActivitydetails(o[2].toString());
			System.out.println("hi this kishor activity"+(o[2].toString()));
			b.setOrganizeby(o[3].toString());
			System.out.println("hi this kishor activity"+(o[3].toString()));
			b.setOtherdetails(o[4].toString());
			System.out.println("hi this kishor activity"+(o[4].toString()));
			
	
			map.put(b.getPkSportId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}
	// get all sport details
	//
	/*public ClassDivisionSubjectTeacherAssocHibernate getSportDetail(String fkSubjectId, String subjectName, String teacherName,	String fkTeacherId) {
		
		ClassDivisionSubjectTeacherAssocHibernate bean = new ClassDivisionSubjectTeacherAssocHibernate();
			bean.setFkSubjectId(Long.parseLong(fkSubjectId));
			bean.setSubject(subjectName);
			bean.setFkTeacherId(Long.parseLong(fkTeacherId));
			System.out.println("hi this is kishor "+fkTeacherId);
			bean.setTeacherName(teacherName);
		return bean;
		
	}*/
	
	// Update Sport  Deatail by kishor
	public void UpdateSportInfoDetails(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		String sportId = request.getParameter("sportId");
		String Createactivity = request.getParameter("Createactivity");
		System.out.println("Createactivity"+Createactivity);
		String Activitydetails = request.getParameter("Activitydetails");
		
		String Organizeby = request.getParameter("Organizeby");
		String otherdetails = request.getParameter("otherdetails");
		
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		
		
		long pk_sport_id =Long.parseLong(sportId);
		
		SportInfoHibernate det = (SportInfoHibernate) session.load(SportInfoHibernate.class, pk_sport_id);
		
		det.setCreateactivity(Createactivity);
		det.setActivitydetails(Activitydetails);
		det.setOrganizeby(Organizeby);
		det.setOtherdetails(otherdetails);

	    session.saveOrUpdate(det);
		transaction.commit();
		
	
		
	}

	public List getSportDetail(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//return null;
		
		//String fk_Student_id = request.getParameter("fk_Student_id");
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		System.out.println("fk_class_id"+fk_class_id);
		System.out.println("fk_division_id"+fk_division_id);
		
		SportInfoDao dao = new SportInfoDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<Sportinfo> expL= dao.getSportDetail(fk_class_id,fk_division_id);
		 return expL;
	}
	
	
}
