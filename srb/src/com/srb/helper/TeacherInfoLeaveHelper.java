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

import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.SchoolInfoDao;
import com.srb.dao.TeacherInfoDao;
import com.srb.dao.TeacherInfoLeaveDao;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.hibernate.TeacherInfoLeaveHibernate;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;

public class TeacherInfoLeaveHelper {

	
	
	public void teacherInfoLeave(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String LeaveType = request.getParameter("type");
		String FkTeacherid = request.getParameter("fk_employee_id");
		System.out.println("hi this is FkTeacherid == "+FkTeacherid);
		String FirstDate = request.getParameter("leaveDateFrom");
		String LastDate = request.getParameter("leaveDateTo");
		String ApprovedBy = request.getParameter("approvedBy");
		String Description = request.getParameter("description");
		
		String empname = request.getParameter("empname");
		
		
		
		
		
		TeacherInfoLeaveHibernate tif = new TeacherInfoLeaveHibernate();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth = null;
		Date joiningDate = null;
		try{
			dateOfBirth = format.parse(FirstDate);
			tif.setFirstDate(dateOfBirth);
			joiningDate = format.parse(LastDate);
			tif.setLastDate(joiningDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		tif.setLeaveType(LeaveType);
		tif.setFkTeacherid(Long.parseLong(FkTeacherid));
		tif.setApprovedBy(ApprovedBy);
		tif.setDescription(Description);
		tif.setTeacher(empname);
		
		TeacherInfoLeaveDao dao = new TeacherInfoLeaveDao();
		dao.TeacherInfoLeaveHibernateDetails(tif);
	}
	//
	public void updateStudentInfoDetail(HttpServletRequest request,
			HttpServletResponse response)
	{
		
		String LeaveType = request.getParameter("type1");
		String FkTeacheridd = request.getParameter("fk_employee_id");

		String FirstDate = request.getParameter("leaveDateFrom1");
		String LastDate = request.getParameter("leaveDateTo1");
		String ApprovedBy = request.getParameter("approvedBy1");
		String Description = request.getParameter("description1");
		String newempid = request.getParameter("newempid");
		String empname = request.getParameter("empname");
		System.out.println("hi this is FkTeacherid == "+FkTeacheridd+" leave + "+LeaveType+" newempid - "+newempid);		
		
		
		
		
			
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long FkTeacherid =Long.parseLong(newempid);
		
		TeacherInfoLeaveHibernate d = (TeacherInfoLeaveHibernate) session.load(TeacherInfoLeaveHibernate.class, FkTeacherid);
		if(!"".equals(LeaveType)) {
		d.setLeaveType(LeaveType);
		}
//		d.setFkTeacherid(Long.parseLong(FkTeacherid));
		if(!"".equals(ApprovedBy)) {
		d.setApprovedBy(ApprovedBy);
		}
		if(!"".equals(Description)) {
		d.setDescription(Description);
		}
		if(!"".equals(empname)) {
		d.setTeacher(empname);
		}
		if(((FkTeacheridd).equals("")) || ((FkTeacheridd).equals(null))) {
			System.out.println(" in 		if(FkTeacheridd.equals(\"\") || FkTeacheridd.equals(null))  part");
		}
		else {
			d.setFkTeacherid(Long.parseLong(FkTeacheridd));
			System.out.println("in else part of tech id ");
		}
		
		
		if(!"".equals(FirstDate)) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
//		Date date2 = null;
		try{
			date1 = format.parse(FirstDate);
			d.setFirstDate(date1);
	//		date2 = format.parse(LastDate);
	//		d.setLastDate(date2);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		}

		
		if(!"".equals(LastDate)) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date date1 = null;
		Date date2 = null;
		try{
	//		date1 = format.parse(FirstDate);
	//		d.setFirstDate(date1);
			date2 = format.parse(LastDate);
			d.setLastDate(date2);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		}
		
	    session.saveOrUpdate(d);
		transaction.commit();
	
	}

	
	
//
	
	public Map geteemployeeForEdit(Long teachid) {

	 	System.out.println("into helper class");
	 	TeacherInfoLeaveDao dao1 = new TeacherInfoLeaveDao();
		List catList = dao1.getAllteacherForEdit(teachid);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			TeacherInfoLeaveHibernate b = new TeacherInfoLeaveHibernate();
			b.setPkTeacherLeaveId(Long.parseLong(o[5].toString()));
			b.setLeaveType(o[1].toString());
	//		b.setFkTeacherid(Long.parseLong(o[2].toString()));
			b.setFirstDate((Date)o[0]);
			b.setLastDate((Date)o[2]);
			b.setApprovedBy(o[4].toString());
			b.setDescription(o[3].toString());
//			b.setTeacher(o[7].toString());
			System.out.println("result  -  "+b.getLeaveType()+b.getFirstDate()+b.getLastDate()+b.getApprovedBy()+b.getDescription());
			map.put(b.getPkTeacherLeaveId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}
	
}
