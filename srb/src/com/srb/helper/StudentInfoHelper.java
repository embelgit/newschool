package com.srb.helper;

/*import java.text.ParseException;*/
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.AdmissionEnquiryBean;
import com.srb.bean.GetStudentDetailsBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.dao.StudentInfoDao;
import com.srb.dao.StudentScannedDocumentDao;
import com.srb.dao.SubjectWiseSyllabusEntryDAO;
import com.srb.hibernate.StudentInfoHibernate;
import com.srb.hibernate.StudentScannedDocumentUploadHibernate;
import com.srb.hibernate.SubjectWiseSyllabusEntryHibernate;
import com.srb.utility.HibernateUtility;

public class StudentInfoHelper {
	// for student detail
			public void doStudentInfo(HttpServletRequest request,
					HttpServletResponse response) 
			{
				String firstName = request.getParameter("firstName");
				String middleName = request.getParameter("middleName");
				String lastName = request.getParameter("lastName");
				String dob = request.getParameter("dob");
				String doa = request.getParameter("doa");
				String gender = request.getParameter("gender");
				String clas = request.getParameter("fk_class_id");
				String division = request.getParameter("division");
				System.out.println("clas - "+clas+" - div - "+division);
				String country = request.getParameter("country");
				String state = request.getParameter("state");
				String pinCode = request.getParameter("pinCode");
				String preSchoolN = request.getParameter("preSchoolN");
				String fatherName = request.getParameter("fatherName");
				String motherName = request.getParameter("motherName");
				String contactNo = request.getParameter("contactNo");
				String siblings = request.getParameter("siblings");
				String perAddress = request.getParameter("perAddress");
				String preAddress = request.getParameter("preAddress");
				String annualFee = request.getParameter("annualFee");
				String aadharNumber = request.getParameter("aadharNumber");
				String rollNumber = request.getParameter("rollNumber");
				String studentSerialNumber = request.getParameter("studentSerialNumber");
				String generalRegNumber = request.getParameter("generalRegNumber");
				String attendanceNumber = request.getParameter("attendanceNumber");
				String district = request.getParameter("district");
				String taluka = request.getParameter("taluka");
				String religion = request.getParameter("religion");
				String mothertongue = request.getParameter("mothertongue");
				
				String studentstatus = request.getParameter("studentstatus");
				String ex_class = request.getParameter("ex_class");
				String ex_leaving = request.getParameter("ex_leaving");
				System.out.println("studentstatus - "+studentstatus+" ex_class - "+ex_class+" ex_leaving - "+ex_leaving);
				
				
				String cast = request.getParameter("cast");
				String subCast = request.getParameter("subCast");
				String studenttype = request.getParameter("studenttype");
				String namankit = request.getParameter("namankit");
				String city = request.getParameter("city");
				String birthPlace  = request.getParameter("birthPlace");
		
				String birthtal  = request.getParameter("birthtal");
				String birthdist  = request.getParameter("birthdist");
				String birthcountry  = request.getParameter("birthcountry");
				System.out.println("tal - dist - count. - "+birthtal+" "+birthdist+" "+birthcountry);
				
				String studentPhoto  = request.getParameter("studentPhoto");
				String preSchoolUdias  = request.getParameter("preSchoolUdias");
				String area  = request.getParameter("area");
				String studId  = request.getParameter("studId");
				String EmergencyContact = request.getParameter("EmergencyContact");
				System.out.println("EmergencyContact=="+EmergencyContact);
				
				
				StudentInfoHibernate sif = new StudentInfoHibernate();
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				Date dateOfBirth = null;
				Date DateOfAdmission = null;
				try{
					dateOfBirth = format1.parse(dob);
					sif.setDob(dateOfBirth);
					DateOfAdmission = format1.parse(doa);
					sif.setDoa(DateOfAdmission);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				if(studentstatus.contentEquals("present")) {
					sif.setStudentstatusid(1l);
				}
				else {
					sif.setStudentstatusid(2l);
				}
				
				sif.setDistrict(district);
				sif.setTaluka(taluka);
				sif.setAadharNumber(aadharNumber);
				sif.setRollNumber(rollNumber);
				sif.setGeneralRegNumber(generalRegNumber);
				sif.setStudentSerialNumber(Long.parseLong(studentSerialNumber));
				sif.setFirstName(firstName);
				sif.setMiddleName(middleName);
				sif.setLastName(lastName);
				sif.setGender(gender);
				
				if(clas == null) {
					sif.setClas(0l);
				System.out.println("in if clas");
				}
				else {
					System.out.println("in else  clas");
					sif.setClas(Long.parseLong(clas));
				}
				if(division==null) {
				sif.setDivision("0");
				System.out.println("in if div");
				}
				else {
					System.out.println("in else div");
					sif.setDivision((division));
				}
//				System.out.println("clas - "+sif.getClas()+" - divv - "+sif.getDivision());
				sif.setCountry(country);
				sif.setState(state);
				sif.setPinCode(Long.parseLong(pinCode));
				sif.setPreSchoolN(preSchoolN);
				sif.setFatherName(fatherName);
				sif.setMotherName(motherName);
				sif.setContactNo(Long.parseLong(contactNo));
				sif.setSiblings(siblings);
				sif.setPerAddress(perAddress);
				sif.setPreAddress(preAddress);
				sif.setAnnualFee(Long.parseLong(annualFee));
				sif.setAttendanceNumber(attendanceNumber);
				sif.setReligion(religion);
				sif.setMothertongue(mothertongue);
				sif.setCast(cast);
				sif.setSubCast(subCast);
				sif.setStudenttype(studenttype);
				sif.setNamankit(namankit);
				sif.setCity(city);
				sif.setBirthPlace(birthPlace);
				sif.setBirthtal(birthtal);
				sif.setBirthdist(birthdist);
				sif.setBirthcountry(birthcountry);
				sif.setPreSchoolUdias(preSchoolUdias);
				sif.setArea(area);
				sif.setStudId(studId);
				sif.setEmergencyContact(Long.parseLong(EmergencyContact));
				sif.setIsStudentActive("Y");
				sif.setStudentstatus(studentstatus);
				
				if(!"".equals(ex_class)) {
				sif.setEx_class(Long.parseLong(ex_class));
				}
				else {
					sif.setEx_class(0l);
					}
				if(!"".equals(ex_leaving)) {
				sif.setEx_leaving(Long.parseLong(ex_leaving));
				}
				else {
					sif.setEx_leaving((0l));
				}
				
				System.out.println("stu type & namankit - "+sif.getStudenttype()+"  "+sif.getNamankit()+"mother tongue - "+sif.getMothertongue());
				System.out.println("ex class & year - "+sif.getEx_class()+" & "+sif.getEx_leaving());
				
				File file = new File(studentPhoto);
				byte[] imageData = new byte[(int) file.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(file);
				    fileInputStream.read(imageData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				sif.setStudentPhoto(imageData);
				StudentInfoDao dao = new StudentInfoDao();
				dao.StudentInfoHibernate(sif);
				
			}

			//String img=object[0].tostring();
			
			public Map getStudentdetails(String fk_class_id,
					String fk_division_id) {

				StudentInfoDao dao = new StudentInfoDao();
				List list = dao.getStudentInfo(fk_class_id,fk_division_id);
				System.out.println(list.size());
				Map  map1 =  new HashMap();
				
				for(int i=0;i<list.size();i++)
				{
					Object[] o = (Object[])list.get(i);
					StudentInfoHibernate bean = new StudentInfoHibernate();
					
					bean.setFirstName(o[0].toString());
					bean.setMiddleName(o[1].toString());
					bean.setLastName(o[2].toString());
					bean.setPkStudentId(Long.parseLong(o[3].toString()));
					bean.setRollNumber(o[4].toString());
					map1.put(bean.getFirstName(),bean);
				}
				return map1;
				


				

			}

			public List getStudentInfoAsPerClassAndDiv(
					HttpServletRequest request, HttpServletResponse response) {
				//String academicYear = request.getParameter("academicYear");
				String fkClassId = request.getParameter("fk_class_id");
				String fkDivId = request.getParameter("fk_division_id");
				
		         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
		 		
		         StudentInfoDao dao = new StudentInfoDao();
		 		List<StudentInformationForReport> expList = dao.getStudentInformationAsPerClassNdDiv(fkClassId,fkDivId);
		 		
		 		return expList;
			}
			
			public List studentBalanceAsPerClassNdDiv(
					HttpServletRequest request, HttpServletResponse response) {
				//String academicYear = request.getParameter("academicYear");
				String fkClassId = request.getParameter("fk_class_id");
				String fkDivId = request.getParameter("fk_division_id");
				
		         Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
		 		
		         StudentInfoDao dao = new StudentInfoDao();
		 		List<StudentInformationForReport> expList = dao.studentBalanceAsPerClassNdDiv(fkClassId,fkDivId);
		 		
		 		return expList;
			}
			
		

			//get Student detail for edit
			public Map getStudentDetailsForEdit(Long fkStudentId) {
			 	System.out.println("into helper class");
			 	StudentInfoDao dao1 = new StudentInfoDao();
				List catList = dao1.getAllStudentDetailsForEdit(fkStudentId);
			//	int sr;
				Map  map =  new HashMap();
				for(int i=0;i<catList.size();i++)
				{
					Object[] o = (Object[])catList.get(i);
					int sr =0;
					GetStudentDetailsBean b = new GetStudentDetailsBean();
					b.setPkStudentId(o[0].toString());
					b.setFirstName(o[1].toString());
					b.setMiddleName(o[2].toString());
					b.setLastName(o[3].toString());
					b.setContactNo(o[4].toString());
					b.setGender(o[5].toString());
					b.setDob(o[6].toString());
					b.setDoa(o[7].toString());
					b.setCountry(o[8].toString());
					b.setState(o[9].toString());
					b.setPinCode(o[10].toString());
					b.setPreSchoolN(o[11].toString());
					b.setFatherName(o[12].toString());
					b.setMotherName(o[13].toString());
					b.setSiblings(o[14].toString());
					b.setPerAddress(o[15].toString());
					b.setPreAddress(o[16].toString());
					b.setAnnualFee(o[17].toString());
					b.setClas(o[18].toString());
					b.setDivision(o[19].toString());
					b.setGeneralRegNumber(o[20].toString());
					b.setAadharNumber(o[21].toString());
					b.setStudentSerialNumber(o[22].toString());
					b.setRollNumber(o[23].toString());
					b.setPreSchoolUdias(o[24].toString());
					b.setArea(o[25].toString());
					b.setStudId(o[26].toString()); 
					System.out.println(" hi this is kishor 1234**********************  "+o[26].toString());
					map.put(b.getPkStudentId(),b);
					sr++;
				}
				System.out.println("out of helper return map : "+map);
				return map;
			
			}

			//update student info
			public void updateStudentInfoDetail(HttpServletRequest request,
					HttpServletResponse response)
			{
				String aadharNumber = request.getParameter("aadharNumber");
				String rollNumber = request.getParameter("rollNumber");
				String studentSerialNumber = request.getParameter("studentSerialNumber");
				String generalRegNumber = request.getParameter("generalRegNumber");
				
				String firstName = request.getParameter("firstName");
				String middleName = request.getParameter("middleName");
				String lastName = request.getParameter("lastName");
				String dob = request.getParameter("dob");
				String doa = request.getParameter("doa");
				String gender = request.getParameter("gender");
				String clas = request.getParameter("fkClassId");
				String division = request.getParameter("fkDivId");
				String country = request.getParameter("country");
				String state = request.getParameter("state");
				String pinCode = request.getParameter("pinCode");
				String preSchoolN = request.getParameter("preSchoolN");
				String fatherName = request.getParameter("fatherName");
				String motherName = request.getParameter("motherName");
				String contactNo = request.getParameter("contactNo");
				String siblings = request.getParameter("siblings");
				String permanentAddress = request.getParameter("permanentAddress");
				String previousAddress = request.getParameter("previousAddress");
				String annualFee = request.getParameter("annualFee");
				String studId = request.getParameter("studId");
				String studentId  = request.getParameter("studentId");
				String preSchoolUdias  = request.getParameter("preSchoolUdias");
				String area  = request.getParameter("area");
				
				System.out.println("----------------------aadharNumber-----------------------"+aadharNumber);
				System.out.println("--------------------------rollNumber-------------------"+rollNumber);
				System.out.println("-------------------------studentSerialNumber--------------------"+studentSerialNumber);
				System.out.println("------------------------generalRegNumber---------------------"+generalRegNumber);
				System.out.println("------------------------firstName---------------------"+firstName);
				System.out.println("------------------------middleName---------------------"+middleName);
				System.out.println("----------------------lastName-----------------------"+lastName);
				System.out.println("---------------------dob------------------------"+dob);
				System.out.println("---------------------doa------------------------"+doa);
				System.out.println("--------------------gender-------------------------"+gender);
				System.out.println("----------------------clas-----------------------"+clas);
				System.out.println("---------------------division------------------------"+division);
				System.out.println("------------------------country---------------------"+country);
				System.out.println("-------------------------state--------------------"+state);
				System.out.println("-------------------------pinCode--------------------"+pinCode);
				System.out.println("--------------------------preSchoolN-------------------"+preSchoolN);
				System.out.println("-----------------------fatherName----------------------"+fatherName);
				System.out.println("--------------------------motherName-------------------"+motherName);
				System.out.println("---------------------------contactNo------------------"+contactNo);
				System.out.println("--------------------------siblings-------------------"+siblings);
				System.out.println("-------------------------permanentAddress--------------------"+permanentAddress);
				System.out.println("------------------------previousAddress---------------------"+previousAddress);
				System.out.println("---------------------------annualFee------------------"+annualFee);
				System.out.println("---------------------studId------------------------"+studId);
				System.out.println("-----------------------studentId----------------------"+studentId);
				System.out.println("-----------------------preSchoolUdias----------------------"+preSchoolUdias);
				System.out.println("-------------------------area--------------------"+area);
				
				
				
				
				com.srb.utility.HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
			
				//long customerId = Long.parseLong(customerId);
				long pkStudentId =Long.parseLong(studentId);
				
				StudentInfoHibernate det = (StudentInfoHibernate) session.load(StudentInfoHibernate.class, pkStudentId);
//				det.setStudentPhoto(studentPhoto);
				det.setAadharNumber(aadharNumber);
				det.setRollNumber(rollNumber);
				det.setGeneralRegNumber(generalRegNumber);
				det.setStudentSerialNumber(Long.parseLong(studentSerialNumber));
				det.setFirstName(firstName);
				det.setMiddleName(middleName);
				det.setLastName(lastName);
				det.setGender(gender);
				det.setClas(Long.parseLong(clas));
				det.setDivision((division));
				det.setCountry(country);
				det.setState(state);
				det.setStudId(studId);
				det.setPinCode(Long.parseLong(pinCode));
				det.setPreSchoolN(preSchoolN);
				det.setFatherName(fatherName);
				det.setMotherName(motherName);
				det.setContactNo(Long.parseLong(contactNo));
				det.setSiblings(siblings);
				det.setPerAddress(permanentAddress);
				det.setPreAddress(previousAddress);
				det.setAnnualFee(Long.parseLong(annualFee));
				det.setPreSchoolUdias(preSchoolUdias);
				det.setArea(area);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dateOfBirth = null;
				Date DateOfAdmission = null;
				try{
					dateOfBirth = format.parse(dob);
					det.setDob(dateOfBirth);
					DateOfAdmission = format.parse(doa);
					det.setDoa(DateOfAdmission);
					
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				

			    session.saveOrUpdate(det);
				transaction.commit();
			
			}

			//cancellation of student admission
			public void cancelStudentAdmission(HttpServletRequest request,
					HttpServletResponse response) {
				
				String StudentId = request.getParameter("studentName");
				System.out.println("hi this is StudentId=="+StudentId);

				long pkStudentId =Long.parseLong(StudentId);
				com.srb.utility.HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
				
				StudentInfoHibernate det = (StudentInfoHibernate) session.load(StudentInfoHibernate.class, pkStudentId);
				det.setIsStudentActive("N");
			    session.saveOrUpdate(det);
				transaction.commit();
			
				
			}
			
			//classwise attendance between two date
			public List classWiseStudentAttendanceReportBetweenTwoDate(
					HttpServletRequest request, HttpServletResponse response) {
				
				String fk_class_id = request.getParameter("fk_class_id");
			 	String fisdate = request.getParameter("fisdate");
			 	String secondDate = request.getParameter("secondDate");
				
			 	String []todaydate= fisdate.split("-");
				String year=todaydate[0];
				String month=todaydate[1];
				String date=todaydate[2];
				
			 	String []secDate= secondDate.split("-");
				String secYear=secDate[0];
				String secMonth=secDate[1];
				String secDay =secDate[2];
				
			 Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
				
			 StudentInfoDao dao = new StudentInfoDao();
				List<StudentInformationForReport> exp1List = dao.classwiseStudentAttendanceReportForTwoDate(fk_class_id,fisdate,secondDate);
				return exp1List;
		
		
			}
			
			public List classWiseStudentAttendanceReport(
					HttpServletRequest request, HttpServletResponse response) {

				 	String fk_class_id = request.getParameter("fk_class_id");
				 	String fisdate = request.getParameter("fisdate");
					String []todaydate= fisdate.split("-");
					String year=todaydate[0];
					String month=todaydate[1];
					String date=todaydate[2];
					
				 Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
					
				 StudentInfoDao dao = new StudentInfoDao();
					List<StudentInformationForReport> exp1List = dao.classwiseStudentAttendanceReportForSingleDate(fk_class_id,year,month,date);
					return exp1List;
			
			}
			public List studentAttendanceReportForSingleDate(HttpServletRequest request,
					HttpServletResponse response) {
				 String studentAttendanceId = request.getParameter("studentAttendanceId");
				 	String fisdate = request.getParameter("fisdate");
					String []todaydate= fisdate.split("-");
					String year=todaydate[0];
					String month=todaydate[1];
					String date=todaydate[2];
					
				 Map<Long,StudentInformationForReport> map = new HashMap<Long,StudentInformationForReport>();
					
				 StudentInfoDao dao = new StudentInfoDao();
					List<StudentInformationForReport> exp1List = dao.studentAttendanceReportForSingleDate(studentAttendanceId,year,month,date);
					
					
					return exp1List;
				
			}

			//admission enquiry report
			public List getAdmissionEnquiryInfoAsPerClassAndDiv(
					HttpServletRequest request, HttpServletResponse response) {
				//String academicYear = request.getParameter("academicYear");
				String fkClassId = request.getParameter("fk_class_id");
				//String fkDivId = request.getParameter("fk_division_id");
				
		         Map<Long,AdmissionEnquiryBean> map = new HashMap<Long,AdmissionEnquiryBean>();
		 		
		         StudentInfoDao dao = new StudentInfoDao();
		 		List<AdmissionEnquiryBean> expList = dao.getAdmissionEnquiryInformationAsPerClassNdDiv(fkClassId);
		 		
		 		return expList;
			
			}

			//get student cound for dashboard
			public Map getStudentCountForDashBoard() {
			 	System.out.println("into helper class");
			 	String studentCount ="studCount";
			 	Map  map =  new HashMap();
			 	try{
			 	StudentInfoDao dao1 = new StudentInfoDao();
				List catList = dao1.getAllStudentContForDashboard();
				
				
				for(int i=0;i<catList.size();i++)
				{
					Object[] o = (Object[])catList.get(i);
				
					GetStudentDetailsBean b = new GetStudentDetailsBean();
					b.setStudentCount(o[0].toString());
					map.put(studentCount,b);
				}
				System.out.println("out of helper return map : "+map);
				
			 	}
			 	catch(Exception e){
			 		e.printStackTrace();
			 	}
			 	return map;
			}

			//student result for graph
			public List getStudentResultForGraph(String fkClassId) {
				StudentInfoDao dao =  new StudentInfoDao();
				return dao.getStudentResultForDashboard(fkClassId);
				
			
			}

			//add student scan documents
			public void addStudentScanDocuments(HttpServletRequest request,
					HttpServletResponse response) {
/*				String className = request.getParameter("className");
				String division = request.getParameter("division");
				String subject = request.getParameter("subject");
				String teacherName = request.getParameter("teacherName");*/
				
				String aadhar = request.getParameter("aadhar");
				String cast = request.getParameter("cast");
				String lc = request.getParameter("lc");
				String studentPhoto = request.getParameter("studentPhoto");
				String fkDivisionId = request.getParameter("fkDivisionId");
				String extraDoc = request.getParameter("extraDoc");
				String fkClassId = request.getParameter("fkClassId");
				String studentNameId = request.getParameter("fk_Student_id");
				System.out.println("hi this is fk_Student_id=="+studentNameId);
				//for aadhar card
				System.out.println("************************aadhar - "+aadhar);
				File file = new File(aadhar);
				byte[] aadharData = new byte[(int) file.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(file);
				    fileInputStream.read(aadharData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				//for cast certificate 
				File castfile = new File(cast);
				byte[] castData = new byte[(int) castfile.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(castfile);
				    fileInputStream.read(castData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				//for LC
				File lCfile = new File(lc);
				byte[] lCData = new byte[(int) lCfile.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(lCfile);
				    fileInputStream.read(lCData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				//for LC
				File studentPhotoFile = new File(studentPhoto);
				byte[] photoData = new byte[(int) studentPhotoFile.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(studentPhotoFile);
				    fileInputStream.read(photoData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				//for extra document
				File extraDocFile = new File(extraDoc);
				byte[] extraDocData = new byte[(int) extraDocFile.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(extraDocFile);
				    fileInputStream.read(extraDocData);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				StudentScannedDocumentUploadHibernate b = new StudentScannedDocumentUploadHibernate();
				b.setAadharFile(aadharData);
				b.setCastFile(castData);
				b.setlCFile(lCData);
				b.setStudentPhoto(photoData);
				b.setExtraDoc(extraDocData);
				b.setFkClassId(Long.parseLong(fkClassId));
				b.setFkDivisionId(Long.parseLong(fkDivisionId));
				b.setFkStudentId(Long.parseLong(studentNameId));
			
				Date date = new Date();
				b.setInsertDate(date);
				
				StudentScannedDocumentDao dao = new StudentScannedDocumentDao();
				dao.addStudentScanDocuments(b);
				
			
				
			}

			//getStudent count for graph
			public List getStudentCountForGraph() {

	/*			Date todayDate =new Date();
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-M-dd");
				String  strDate = formatter.format(todayDate);
				String[]todaydate= strDate.split("-");
				String year=todaydate[0];
				String month=todaydate[1];
				String date=todaydate[2];
				System.out.println("year ======"+year);
				System.out.println("month ======"+month);
				System.out.println("date ======"+date);
				
				if(month.equals("6"))
				{
					
				}*/
				
				StudentInfoDao dao =  new StudentInfoDao();
				return dao.fetchStudentCountForGraph();
			
			}
			
			
			
			
}
