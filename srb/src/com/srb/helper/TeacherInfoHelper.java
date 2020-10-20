package com.srb.helper;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.FeeStructureReportBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.bean.GetTeacherDetailBean;
import com.srb.bean.GetTeacherDetailsSubjecctWiseBean;
import com.srb.dao.FeeStructureDao;
import com.srb.dao.ProductDetailsDao;
import com.srb.dao.SubjectInfoDao;
import com.srb.dao.TeacherInfoDao;
import com.srb.hibernate.DivisionInfoHibernate;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.utility.HibernateUtility;

public class TeacherInfoHelper {
	 // for teacher detail
		public void doTeacherInfo(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			String designation = request.getParameter("designation");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String lastName = request.getParameter("lastName");
			String dob = request.getParameter("dob");
			String hquqlification = request.getParameter("hquqlification");
			String jdate = request.getParameter("jdate");
			String specialization = request.getParameter("specialization");
			String percentage = request.getParameter("percentage");
			String mobnum = request.getParameter("mobnum");
			String landno = request.getParameter("landno");
			String perAddress = request.getParameter("perAddress");
			String preAddress = request.getParameter("preAddress");
			
			String accountNumber = request.getParameter("accountNumber");
			String bankName = request.getParameter("bankName");
			String ifsc = request.getParameter("ifsc");
			String aadharNumber = request.getParameter("aadharNumber");
			String panNumber = request.getParameter("panNumber");
			String epfNumber = request.getParameter("epfNumber");
			String ptNumber = request.getParameter("ptNumber");
			String Salary = request.getParameter("Salary");
			System.out.println("hi this is Salary"+Salary);
			
			TeacherInfoHibernate tif = new TeacherInfoHibernate();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date dateOfBirth = null;
			Date joiningDate = null;
			try{
				dateOfBirth = format.parse(dob);
				tif.setDob(dateOfBirth);
				joiningDate = format.parse(jdate);
				tif.setJdate(joiningDate);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			
			
			tif.setAadharNumber(aadharNumber);
			tif.setIfsc(ifsc);
			tif.setAccountNumber(accountNumber);
			tif.setBankName(bankName);
			tif.setFirstName(firstName);
			tif.setMiddleName(middleName);
			tif.setLastName(lastName);
			
			tif.setHquqlification(hquqlification);
			
			tif.setSpecialization(specialization);
			tif.setPercentage(Double.parseDouble(percentage));
			tif.setMobnum(Long.parseLong(mobnum));
			tif.setLandno(Long.parseLong(landno));
			tif.setPerAddress(perAddress);
			tif.setPreAddress(preAddress);
			tif.setPanNumber(panNumber);
			tif.setEpfNumber(epfNumber);
			tif.setPtNumber(ptNumber);
			tif.setDesignation(designation);
			tif.setSalary(Salary);
			
			TeacherInfoDao dao = new TeacherInfoDao();
			dao.TeacherInfoHibernate(tif);
		}

		//get teacher detail to edit
		public Map getTeacherDetailsForEdit(String  designation) {

		 	System.out.println("into helper class");
		 	TeacherInfoDao dao1 = new TeacherInfoDao();
			List catList = dao1.getAllTeacherDetailsForEdit(designation);
			
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
			
				GetTeacherDetailBean b = new GetTeacherDetailBean();
				b.setPkTeacherId(Long.parseLong(o[0].toString()));
				b.setDesignation(o[1].toString());
				b.setFirstName(o[2].toString());
				b.setMiddleName(o[3].toString());
				b.setLastName(o[4].toString());
				b.setDob(o[5].toString());
				b.setHquqlification(o[6].toString());
				b.setSpecialization(o[7].toString());
				b.setPercentage(Double.parseDouble(o[8].toString()));
				b.setJdate(o[9].toString());
				b.setMobnum(Long.parseLong(o[10].toString()));
				b.setLandno(Long.parseLong(o[11].toString()));
				b.setPreAddress(o[12].toString());
				b.setPerAddress(o[13].toString());
				
				b.setAadharNumber(o[14].toString());
				System.out.println("hi this Aadhar number *****************"+o[17].toString());
				
				b.setAccountNumber(o[15].toString());
				System.out.println("hi this is Account no ********"+o[14].toString());
				
				b.setBankName(o[16].toString());
				System.out.println("hi this is Bank NAme*******************"+o[15].toString());
				
				b.setIfsc(o[17].toString());
				System.out.println("hi this is IFSC **********************"+o[16].toString());
				
			
				
				b.setPanNumber(o[18].toString());
				System.out.println("hi this Pan Number ******************"+o[18].toString());
				
				b.setEpfNumber(o[19].toString());
				System.out.println("hi this is EpEf ***********************"+o[19].toString());
				
				b.setPtNumber(o[20].toString());
				System.out.println("hi this pt no ****************"+o[20].toString());
				
				b.setSalary(o[21].toString());
				System.out.println("Salary ****************"+o[21].toString());
				
				map.put(b.getPkTeacherId(),b);
			}
			System.out.println("out of helper return map : "+map);
			return map;
		
		
		}
		
		
		
		
		public Map getTeacherDetailsForEdit1(Long fkTeacherId) {

		 	System.out.println("into helper class");
		 	TeacherInfoDao dao1 = new TeacherInfoDao();
			List catList = dao1.getAllTeacherDetailsForEdit1(fkTeacherId);
			
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
			
				GetTeacherDetailBean b = new GetTeacherDetailBean();
				b.setPkTeacherId(Long.parseLong(o[0].toString()));
				b.setDesignation(o[1].toString());
				b.setFirstName(o[2].toString());
				b.setMiddleName(o[3].toString());
				b.setLastName(o[4].toString());
				b.setDob(o[5].toString());
				b.setHquqlification(o[6].toString());
				b.setSpecialization(o[7].toString());
				b.setPercentage(Double.parseDouble(o[8].toString()));
				b.setJdate(o[9].toString());
				b.setMobnum(Long.parseLong(o[10].toString()));
				b.setLandno(Long.parseLong(o[11].toString()));
				b.setPreAddress(o[12].toString());
				b.setPerAddress(o[13].toString());
				
				b.setAadharNumber(o[14].toString());
				System.out.println("hi this Aadhar number *****************"+o[17].toString());
				
				b.setAccountNumber(o[15].toString());
				System.out.println("hi this is Account no ********"+o[14].toString());
				
				b.setBankName(o[16].toString());
				System.out.println("hi this is Bank NAme*******************"+o[15].toString());
				
				b.setIfsc(o[17].toString());
				System.out.println("hi this is IFSC **********************"+o[16].toString());
				
			
				
				b.setPanNumber(o[18].toString());
				System.out.println("hi this Pan Number ******************"+o[18].toString());
				
				b.setEpfNumber(o[19].toString());
				System.out.println("hi this is EpEf ***********************"+o[19].toString());
				
				b.setPtNumber(o[20].toString());
				System.out.println("hi this pt no ****************"+o[20].toString());
				
				b.setSalary(o[21].toString());
				System.out.println("Salary ****************"+o[21].toString());
				
				map.put(b.getPkTeacherId(),b);
			}
			System.out.println("out of helper return map : "+map);
			return map;
		
		
		}
		
		
		// get teacher name designation 
		
		public Map getTeacherDetailswiseForEdit(String  designation) {

		 	System.out.println("into helper class");
		 	TeacherInfoDao dao1 = new TeacherInfoDao();
			List catList = dao1.getAllTeacherDetailswiseForEdit(designation);
			
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
			
				GetTeacherDetailBean b = new GetTeacherDetailBean();
				b.setPkTeacherId(Long.parseLong(o[0].toString()));
				
				b.setFirstName(o[1].toString());
				b.setMiddleName(o[2].toString());
				b.setLastName(o[3].toString());
			
				
				map.put(b.getPkTeacherId(),b);
			}
			System.out.println("out of helper return map : "+map);
			return map;
		
		
		}
		

		// update teacher detail
		public void updateTeacherInfoDetail(HttpServletRequest request,
				HttpServletResponse response) {
			String accountNumber = request.getParameter("accountNumber");
			String bankName = request.getParameter("bankName");
			String ifsc = request.getParameter("ifsc");
			String aadharNumber = request.getParameter("aadharNumber");
			String teacherId = request.getParameter("teacherId");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String lastName = request.getParameter("lastName");
			String hquqlification = request.getParameter("hquqlification");
			String specialization = request.getParameter("specialization");
			String percentage = request.getParameter("percentage");
			String mobnum = request.getParameter("mobnum");
			String landno = request.getParameter("landno");
			String perAddress = request.getParameter("perAddress");
			String preAddress = request.getParameter("preAddress");
			String jdate = request.getParameter("jdate");
			String dob = request.getParameter("dob");
			String designation = request.getParameter("designation");
			String old_designation = request.getParameter("old_designation");
			String panNumber = request.getParameter("panNumber");
			String epfNumber = request.getParameter("epfNumber");
			String ptNumber = request.getParameter("ptNumber");
			String Salary = request.getParameter("Salary");
			
			System.out.println("----------------------accountNumber-----------------------"+accountNumber);
			System.out.println("----------------------jdate-----------------------"+jdate);
			System.out.println("----------------------dob-----------------------"+dob);
			System.out.println("----------------------old_designation-----------------------"+old_designation);
			System.out.println("----------------------designation-----------------------"+designation);
			System.out.println("----------------------ptNumber-----------------------"+ptNumber);
			
			com.srb.utility.HibernateUtility hbu=null;
			Session session = null;
			Transaction transaction = null;
			
			 hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
		
			//long customerId = Long.parseLong(customerId);
			long pkTeacherId =Long.parseLong(teacherId);
			
			TeacherInfoHibernate det = (TeacherInfoHibernate) session.load(TeacherInfoHibernate.class, pkTeacherId);
			det.setAadharNumber(aadharNumber);
			det.setIfsc(ifsc);
			det.setAccountNumber(accountNumber);
			det.setBankName(bankName);
			det.setFirstName(firstName);
			det.setMiddleName(middleName);
			det.setLastName(lastName);
			
			det.setHquqlification(hquqlification);
			
			det.setSpecialization(specialization);
			det.setPercentage(Double.parseDouble(percentage));
			det.setMobnum(Long.parseLong(mobnum));
			det.setLandno(Long.parseLong(landno));
			det.setPerAddress(perAddress);
			det.setPreAddress(preAddress);
			det.setPanNumber(panNumber);
			det.setEpfNumber(epfNumber);
			det.setPtNumber(ptNumber);
			
			
			if(designation == null || designation == ""){

				det.setDesignation(old_designation);
			}
			else{
				det.setDesignation(designation);
			}
			
			det.setSalary(Salary);
			//det.setDesignation(designation);
			if(!"".equals(jdate)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(jdate);
				det.setJdate(joiningDate);
				System.out.println("det.getJdate() -   "+det.getJdate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
			if(!"".equals(dob)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dateOfBirth = null;
			//	Date joiningDate = null;
				try{
					dateOfBirth = format.parse(dob);
					det.setDob(dateOfBirth);
					System.out.println("det.getDob()  -   "+det.getDob());
			//		joiningDate = format.parse(jdate);
			//		det.setJdate(joiningDate);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				}
/*			else {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String dammyDate = "00-00-0000";
				Date adate = null;
				try {
					adate = format.parse(dammyDate);
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				det.setJdate(adate);
			}*/
	
		    session.saveOrUpdate(det);
			transaction.commit();
		
			
		}
		//Teacher Detail Reports Subject Wise
		public List getTeacherDetailsReport(HttpServletRequest request, HttpServletResponse response) 
		{
			String fkteacherid = request.getParameter("fkteacherid");
			/*String fk_class_id = request.getParameter("className");*/
			System.out.println("in teacher helper-------------ID-------------  ::  "+fkteacherid);
			
			
	         Map<Long,GetTeacherDetailsSubjecctWiseBean> map = new HashMap<Long,GetTeacherDetailsSubjecctWiseBean>();
	 		
	         TeacherInfoDao dao = new TeacherInfoDao();
	 		List<GetTeacherDetailsSubjecctWiseBean> expList = dao.getTeacherDetailReport(fkteacherid);
	 		
	 		return expList;
		}
		
		//
		public void deletetecher(HttpServletRequest request, HttpServletResponse response ) {
			
			String fktechid = request.getParameter("fktechid");
			System.out.println("hi this is fktechid ==  "+fktechid);
			   
			TeacherInfoDao dao2 = new TeacherInfoDao();
			dao2.deleteteachers(fktechid);
				
			}

		public void deleteemp(HttpServletRequest request, HttpServletResponse response ) {
			String empid = request.getParameter("empid");
			System.out.println("hi this is del helper empid - "+empid);
			TeacherInfoDao dao2 = new TeacherInfoDao();
			dao2.deleteemp(empid);
				
			}
		
}
		
		
		
		
