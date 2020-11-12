package com.srb.utility;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itextpdf.text.log.SysoCounter;
import com.srb.bean.gethostelmanagementdetailbean;
import com.srb.bean.ClasSubAssoBean;
import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.bean.GetLibraryManagementDetails;
import com.srb.bean.GetStoreManagementDetailBean;
import com.srb.bean.StudentCheckUpBean;
import com.srb.helper.AccessControlHelper;
import com.srb.helper.AdmissionEnquiryHelper;
import com.srb.helper.CashBankBookHelper;
import com.srb.helper.CertificatesHelper;
import com.srb.helper.ClassDivisionAssocHelper;
import com.srb.helper.ClassDivisionSubjectAssocHelper;
import com.srb.helper.ClassDivisionSubjectTeacherAssocHelper;
import com.srb.helper.ClassInfoHelper;
import com.srb.helper.ClassSubjectAssocHelper;
import com.srb.helper.ClassSubjectTeacherAssocHelper;
import com.srb.helper.DailyTimeTableHelper;
import com.srb.helper.DivisionInfoHelper;
import com.srb.helper.ExamInfoHelper;
import com.srb.helper.ExamNameEntryHelper;
import com.srb.helper.ExamTimeTableHelper;
import com.srb.helper.ExpenditureDetailsHelper;
import com.srb.helper.ExpenditurePaymentHelper;
import com.srb.helper.KitchenInventoryHelper;
import com.srb.helper.LibraryManagementHelper;
import com.srb.helper.LoginController;
import com.srb.helper.LogoutController;
import com.srb.helper.MeetingScheduleHelper;
import com.srb.helper.NoticeInfoHelper;
import com.srb.helper.ParentsComplaintHelper;
import com.srb.helper.ProductDetailsHelper;
import com.srb.helper.ResultHelper;
import com.srb.helper.SchoolInfoHelper;
import com.srb.helper.SportInfoHelper;
import com.srb.helper.StoreManagementHelper;
import com.srb.helper.StudentCheckUpHelper;
import com.srb.helper.StudentInfoHelper;
import com.srb.helper.StudentTransportationHelper;
import com.srb.helper.SubjectInfoHelper;
import com.srb.helper.SubjectTeacherAssocHelper;
import com.srb.helper.SupplierAccountBankHelper;
import com.srb.helper.SupplierCashBankHelper;
import com.srb.helper.SupplierDetailsHelper;
import com.srb.helper.TeacherDailyTaskEntryHelper;
import com.srb.helper.TeacherInfoHelper;
import com.srb.helper.TeacherInfoLeaveHelper;
import com.srb.helper.TeacherPaymentHelper;
import com.srb.helper.TransportationInfoHelper;
import com.srb.helper.UserDetailsHelper;
import com.srb.hibernate.ClassDivisionSubjectTeacherAssocHibernate;
import com.srb.hibernate.DailyTimeTableHibernate;

public class Controller 
{
	private String toJson(Object data)
    {
        Gson gson = new GsonBuilder().setPrettyPrinting ().disableHtmlEscaping ().create();
        return gson.toJson(data);
    }
	// add teacher info
	public String teacherInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		TeacherInfoHelper tif = new TeacherInfoHelper();
		tif.doTeacherInfo(request, response);
		return toJson("Employee Details Added Successfully");
	}
	//teacherInfoLeave 
	
	
	public String teacherInfoLeave(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller TeacherInfoLeaveHelper ");
		TeacherInfoLeaveHelper tif = new TeacherInfoLeaveHelper();
		tif.teacherInfoLeave(request, response);
		return toJson("Employee Details Added Successfully");
	}
	//update
	public String updateteacherInfoLeave(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller TeacherInfoLeaveHelper ");
		TeacherInfoLeaveHelper tif = new TeacherInfoLeaveHelper();
		tif.updateStudentInfoDetail(request, response);
		return toJson("Employee Details Added Successfully");
	}
	
	// Student TransPotation Details 
	public String TransportionDetailsOFStrudentsNew(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller TransportionDetailsOFStrudents ");
		StudentTransportationHelper stf = new StudentTransportationHelper();
		stf.TransportionDetailsOFStrudents(request, response);
		//return toJson("Transportation Details Added Successfully");
		String data="Transportation Details Added Successfully";
		return data;
	}
	
	// Delete ShopNAme 
	// Delete Product
		public String deleteSchool(HttpServletRequest request, HttpServletResponse response) {
			ProductDetailsHelper helper = new ProductDetailsHelper();
			helper.deleteSchool(request, response);
			/*
			 * Map<String, List> returnMap = new HashMap<String, List>();
			 * returnMap.put("list", categories);
			 * System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			 */
			String data = "School Deleted Sucessfully";
			return data;
		}
		//
		
		public String deleteparent(HttpServletRequest request, HttpServletResponse response) {
			ProductDetailsHelper helper = new ProductDetailsHelper();
			helper.deletecomp(request, response);
			System.out.println("In controller Updateemployee");
//			return toJson("Data Deleted Successfully");
		
			String data = "Complaint Deleted Sucessfully"; 
		  return data;
		 
		}
		
		//delete techer
		public String deleteTeacher(HttpServletRequest request, HttpServletResponse response) {
			TeacherInfoHelper helper = new TeacherInfoHelper();
			helper.deletetecher(request, response);
			/*
			 * Map<String, List> returnMap = new HashMap<String, List>();
			 * returnMap.put("list", categories);
			 * System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			 */
			String data = "Teacher Data Deleted Sucessfully";
			return data;
		
		}
		//
		public String deleteaddenq(HttpServletRequest request, HttpServletResponse response) {
			AdmissionEnquiryHelper helper = new AdmissionEnquiryHelper();
			helper.deleteaddd(request, response);
			/*
			 * Map<String, List> returnMap = new HashMap<String, List>();
			 * returnMap.put("list", categories);
			 * System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			 */
			String data = "Addmission Enquiry Data Deleted Sucessfully";
			return data;
		
		}
		
	//delete sub
		public String deleteSubject(HttpServletRequest request, HttpServletResponse response) {
			SubjectInfoHelper helper = new SubjectInfoHelper();
			helper.deleteSubject(request, response);
			String data = "Subject Deleted Sucessfully";
			return data;
		}
		public String deleteempleave(HttpServletRequest request, HttpServletResponse response) {
			TeacherInfoHelper helper = new TeacherInfoHelper();
			helper.deleteemp(request, response);
			String data = "Employee Leave Deleted Sucessfully";
			return data;
		}
		
		//del home work
		public String deletehomework(HttpServletRequest request, HttpServletResponse response) {
			TeacherDailyTaskEntryHelper helper = new TeacherDailyTaskEntryHelper();
			helper.deletehomewoork(request, response);
			String data = "Home-Work Deleted Sucessfully";
			return data;
		}
		/*//del syllabus
		public String deleteSyllabus(HttpServletRequest request, HttpServletResponse response) {
			SubjectInfoHelper helper = new SubjectInfoHelper();
			helper.deleteSyllabuus(request, response);
			String data = "syllabus Deleted Sucessfully";
			return data;
		}*/

		//add student
	public String StudentInfoo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StudentInfoHelper sif = new StudentInfoHelper();
		sif.doStudentInfo(request, response);
		return toJson("Student Details Added Successfully");
	}
	
	//Login
	
	// For login
		public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LoginController helper = new LoginController();
			System.out.println(" in Helper by Kishor***************");
			helper.loginUser(request, response);
			return toJson("Data Added Successsfully");
		}
		
		// Fetching Supplier Details To Edit
		public String getSupplierDetailsToEdit(HttpServletRequest request, HttpServletResponse response) {
			String supplierID = request.getParameter("SupplierId");
			Long supplierId = Long.parseLong(supplierID);
			System.out.println("in controller customerId : " + supplierID);
			SupplierDetailsHelper helper = new SupplierDetailsHelper();
			Map map = helper.getSupplierDetailsForEdit(supplierID);
			Map<String, List> returnMap = new HashMap<String, List>();
			String xyz = toJson(map);
			System.out.println(xyz);
			System.out.println("going out of controller");
			return xyz;
		}
		
		//Get List Of Employee Leave
				public String getAllEmployeeLeaveList(HttpServletRequest request, HttpServletResponse response) 
				{
					ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
					List categories = helper.getAllLeaveEmployee(request, response);
					Map<String, List> returnMap = new HashMap<String, List>();
					returnMap.put("list", categories);
					System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
					return toJson(returnMap);
				}
		
		// Delete supplier
		public String deletSupplier(HttpServletRequest request, HttpServletResponse response) {
			SupplierDetailsHelper helper = new SupplierDetailsHelper();
			helper.deleteSupplier(request, response);
			/*
			 * Map<String, List> returnMap = new HashMap<String, List>();
			 * returnMap.put("list", categories);
			 * System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			 */
			String data = "Supplier Deleted Sucessfully";
			return data;
		}
//pro del
		public String deletproducts(HttpServletRequest request, HttpServletResponse response) {
			ProductDetailsHelper helper = new ProductDetailsHelper();
			helper.deleteproduct(request, response);
			
			String data = "Product Deleted Sucessfully";
			return data;
		}
		//del str pro
		public String deletstoreproducts(HttpServletRequest request, HttpServletResponse response) {
			StoreManagementHelper helper = new StoreManagementHelper();
			helper.deletestrproduct(request, response);
			
			String data = "Product Deleted Sucessfully";
			return data;
		}
		//kit cel
		public String deletkitchenproducts(HttpServletRequest request, HttpServletResponse response) {
			KitchenInventoryHelper helper = new KitchenInventoryHelper();
			helper.deletekitchenproduct(request, response);
			
			String data = "Product Deleted Sucessfully";
			return data;
		}
		//
		public String delethostelproducts(HttpServletRequest request, HttpServletResponse response) {
			KitchenInventoryHelper helper = new KitchenInventoryHelper();
			helper.deletehosproduct(request, response);
			
			String data = "Product Deleted Sucessfully";
			return data;
		}
		// update Supplier details
		public String updateSupplierDetails(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("In controller update Supplier Details");
			SupplierDetailsHelper helper = new SupplierDetailsHelper();
			helper.editSupplierDetail(request, response);
			System.out.println("In controller Updateemployee");
			return toJson("Data Updated Successfully");

		}

		// Register Supplier Details
		public String supplierDetails(HttpServletRequest request, HttpServletResponse response) 
		{
			System.out.println("IN CONTROLLER");
			SupplierDetailsHelper sdh = new SupplierDetailsHelper();
			sdh.supplierDetails(request, response);
			return toJson("Supplier Details  Added Successfully");
		}
		

	public String SchoolInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		SchoolInfoHelper scf = new SchoolInfoHelper();
		scf.doSchoolInfo(request, response);
		return toJson("School Details Added Successfully");
	}
	// sport details form 
	
	public String SportInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller java by kishor");
		SportInfoHelper scf = new SportInfoHelper();
		scf.doSportInfo(request, response);
		return toJson("Sport Activity Added Successfully ");
	}
	
	public String ClassInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassInfoHelper cif = new ClassInfoHelper();
		cif.doClassInfo(request, response);
		return toJson("Class Name Added Successfully");
	}
	
	public String DivisionInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		DivisionInfoHelper dif = new DivisionInfoHelper();
		dif.doDivisionInfo(request, response);
		return toJson("Division Name Added Successfully");
	}
	
	public String SubjectInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		SubjectInfoHelper suf = new SubjectInfoHelper();
		suf.doSubjectInfo(request, response);
		return toJson("Subject Name Added Successfully");
	}
	
	public String ClassDivisionAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassDivisionAssocHelper cda = new ClassDivisionAssocHelper();
		cda.doClassDivisionAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	public String ClassSubjectAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassSubjectAssocHelper csa = new ClassSubjectAssocHelper();
		csa.doClassSubjectAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	public String ClassDivisionSubjectAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassDivisionSubjectAssocHelper cds = new ClassDivisionSubjectAssocHelper();
		cds.doClassDivisionSubjectAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	// add classSubjectTeacherDivision
	public String ClassDivisionSubjectTeacherAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassDivisionSubjectTeacherAssocHelper cdst = new ClassDivisionSubjectTeacherAssocHelper();
		cdst.doClassDivisionSubjectTeacherAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	// delete class subject teacher division
	
	public String deletclassdivSubTeacher(HttpServletRequest request, HttpServletResponse response) {
		ClassDivisionSubjectTeacherAssocHelper helper = new ClassDivisionSubjectTeacherAssocHelper();
		helper.deletesClassDivsubTeacherAsso(request, response);
		
		String data = "Class Deleted Sucessfully";
		return data;
	}

	
	
	
	
	
	
	
	/*// for logout
	public String LogOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LoginController helper = new LoginController();
		helper.logoutUser(request, response);
		System.out.println("hi this is vikas++++++++++++++");
		return toJson("Data Added Successsfully");
	}*/
	// for logout
		public String LogOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LogoutController helper = new LogoutController();
			helper.logoutUser(request, response);
			System.out.println("hi this is vikas++++++++++++++");
			return toJson("Data Added Successsfully");
		}

		// Fetching Product Details To Edit
		public String getUserDetailsToAccessControl(HttpServletRequest request,
				HttpServletResponse response) {
			
			AccessControlHelper helper =new AccessControlHelper();
			Map map = helper.getUserDetailsForAccessControl(request,response);
			String xyz = toJson(map);
			System.out.println(xyz);
			System.out.println("going out of controller");
			return xyz;
		}
		
		
		//Add Access Control Details
		public String AddAccessControl(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			AccessControlHelper helper=new AccessControlHelper();
			helper.AccessControlDetails(request, response);
			return toJson("Data Added Successfully");
		}
		
		// Register User Details
		public String regUserDetails(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			UserDetailsHelper udh = new UserDetailsHelper();
			udh.userDetails(request, response);
			return toJson("Data Added Successfully");
		}
		
	
	public String SubjectTeacherAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		SubjectTeacherAssocHelper sta = new SubjectTeacherAssocHelper();
		sta.doSubjectTeacherAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	public String ClassSubjectTeacherAssoc(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ClassSubjectTeacherAssocHelper cst = new ClassSubjectTeacherAssocHelper();
		cst.doClassSubjectTeacherAssoc(request, response);
		return toJson("Data Added Successfully");
	}
	
	public String getSubInfo(HttpServletRequest request,HttpServletResponse response)
	{
		ClassSubjectAssocHelper helper = new ClassSubjectAssocHelper();
		ClasSubAssoBean customer = helper.getSubInfo(request,
				response);
		Map<String, ClasSubAssoBean> returnMap = new HashMap<String, ClasSubAssoBean>();
		returnMap.put("offer", customer);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	public String getDivSubInfo(HttpServletRequest request,HttpServletResponse response)
	{
		ClassDivisionSubjectAssocHelper helper = new ClassDivisionSubjectAssocHelper();
		ClassDivisionSubjectAssocBean customer = helper.getDivSubInfo(request,
				response);
		Map<String, ClassDivisionSubjectAssocBean> returnMap = new HashMap<String, ClassDivisionSubjectAssocBean>();
		returnMap.put("offer", customer);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//to get subject and teacher name into grid in Class_Division_Subject_Teacher.jsp on 22-9-2017 by Sonal
	public String getSubjectTeacherNameIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSubjectId = request.getParameter("fkSubjectId");
		String subjectName = request.getParameter("subjectName");
		String teacherName = request.getParameter("teacherName");
		String fkTeacherId = request.getParameter("fkTeacherId");
		System.out.println("hi kishor in helper");
		ClassDivisionSubjectTeacherAssocHelper helper = new ClassDivisionSubjectTeacherAssocHelper();
		ClassDivisionSubjectTeacherAssocHibernate subject = helper.getSubjectAndTeacherDetail(fkSubjectId, subjectName,
				teacherName,fkTeacherId);
		
		Map<String, ClassDivisionSubjectTeacherAssocHibernate> items = new HashMap<String, ClassDivisionSubjectTeacherAssocHibernate>();
		items.put("offer", subject);
		return toJson(items);
	}
	// get sport name into grid 
	public String getSportNameIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
		/*String fk_Student_id = request.getParameter("fk_Student_id");*/
		/*String subjectName = request.getParameter("subjectName");
		String teacherName = request.getParameter("teacherName");
		String fkTeacherId = request.getParameter("fkTeacherId");*/
		System.out.println("hi kishor in helper");
		/*SportInfoHelper helper = new SportInfoHelper();
		ClassDivisionSubjectTeacherAssocHibernate subject = helper.getSportDetail(fk_Student_id, fk_Student_id, fk_Student_id, fk_Student_id);
		
		Map<String, ClassDivisionSubjectTeacherAssocHibernate> items = new HashMap<String, ClassDivisionSubjectTeacherAssocHibernate>();
		items.put("offer", subject);
		return toJson(items);*/
		
		
		SportInfoHelper helper = new SportInfoHelper();

		List product = helper.getSportDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", product);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//to get subject for exam details
	public String getSubjectIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSubjectId = request.getParameter("fkSubjectId");
		String subjectName = request.getParameter("subjectName");
	
		ClassDivisionSubjectTeacherAssocHelper helper = new ClassDivisionSubjectTeacherAssocHelper();
		ClassDivisionSubjectTeacherAssocHibernate subject = helper.getSubjectDetail(fkSubjectId, subjectName);
		
		Map<String, ClassDivisionSubjectTeacherAssocHibernate> items = new HashMap<String, ClassDivisionSubjectTeacherAssocHibernate>();
		items.put("offer", subject);
		return toJson(items);
	}
	
	
	// get Exam Edit by Kishor  
	
	/*public String getSubjectIntoGridEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSubjectId = request.getParameter("fkSubjectId");
		String subjectName = request.getParameter("subjectName");
		String subjectName = request.getParameter("examName_id");
	
		ClassDivisionSubjectTeacherAssocHelper helper = new ClassDivisionSubjectTeacherAssocHelper();
		ClassDivisionSubjectTeacherAssocHibernate subject = helper.getSubjectDetailEdit(fkSubjectId, subjectName);
		
		Map<String, ClassDivisionSubjectTeacherAssocHibernate> items = new HashMap<String, ClassDivisionSubjectTeacherAssocHibernate>();
		items.put("offer", subject);
		return toJson(items);
	}*/
	// 
	public String getSubjectIntoGridEdit(HttpServletRequest request, HttpServletResponse response) {
		ClassDivisionSubjectTeacherAssocHelper helper = new ClassDivisionSubjectTeacherAssocHelper();

		List product = helper.getSubjectInGridOn(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", product);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
		
	}
	
	//to get subject for exam details
	public String getStudentDetailsIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		
		StudentInfoHelper helper = new StudentInfoHelper();
		Map items = helper.getStudentdetails(fk_class_id, fk_division_id);
		String xyz = toJson(items);
		System.out.println(xyz);
		return xyz;
	
	}
	
	// Get book Entry Reports
	public String getBookEntryDetails(
			HttpServletRequest request, HttpServletResponse response) {
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		List categories = helper.getBookEntryDetails(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	// get Book issue Student Details Reports
	
		public String getBookIssueDetailsReports(
				HttpServletRequest request, HttpServletResponse response) {
			DailyTimeTableHelper helper = new DailyTimeTableHelper();
			List categories = helper.getBookIssueDetailsReports(
					request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		// Get Book return Student Details Reports getBookReturnDetailsReports
		public String getBookReturnDetailsReports(
				HttpServletRequest request, HttpServletResponse response) {
			DailyTimeTableHelper helper = new DailyTimeTableHelper();
			List categories = helper.getBookReturnDetailsReports(
					request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		// get all Employee Book Issue getEmployeeBookEntryDetails
		public String getEmployeeBookEntryDetails(
				HttpServletRequest request, HttpServletResponse response) {
			DailyTimeTableHelper helper = new DailyTimeTableHelper();
			List categories = helper.getEmployeeBookEntryDetails(
					request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		//get all Employee Book Return Details 
		public String getEmployeeBookReturnDetails(
				HttpServletRequest request, HttpServletResponse response) {
			DailyTimeTableHelper helper = new DailyTimeTableHelper();
			List categories = helper.getEmployeeBookReturnDetails(
					request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
	
	//Adding of exam details
	public String getExamInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ExamInfoHelper ex = new ExamInfoHelper();
		ex.doExamInfo(request, response);
		return toJson("Exam Details Added Sucessfully");
	}
	// Adding of exam name 
	public String getExamNameEntryInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ExamNameEntryHelper suf = new ExamNameEntryHelper();
		suf.doExamNameEntry(request, response);
		return toJson("Exam Name Added Sucessfully");
	}
	
	//Adding of Result details
	public String addResult(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ResultHelper ex = new ResultHelper();
		ex.addMarksDetail(request, response);
		return toJson("Data Added Successfully");
	}
	
	// Student list for report as per class and division
	public String getStudentListAsPerClassAndDivision(
			HttpServletRequest request, HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List categories = helper.getStudentInfoAsPerClassAndDiv(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// stock report between two date
	public String getStockdetailBetweenTwoDate(
			HttpServletRequest request, HttpServletResponse response) {
		StoreManagementHelper helper = new StoreManagementHelper();
		List categories = helper.getStockdetailBetweenTwoDateForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	//
	public String getStockdetailrp(HttpServletRequest request, HttpServletResponse response) {
		StoreManagementHelper helper = new StoreManagementHelper();
		List categories = helper.getStockdetailReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//
	public String gettransportdetailBetweenTwoDate(HttpServletRequest request, HttpServletResponse response) {
		StoreManagementHelper helper = new StoreManagementHelper();
		List categories = helper.gettransportBetweenTwoDateForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	//
	public String getempleavedetailBetweenTwoDate(HttpServletRequest request, HttpServletResponse response) {
		StoreManagementHelper helper = new StoreManagementHelper();
		List categories = helper.getempBetweenTwoDateForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// hostel report
	public String gethosteldetailBetweenTwoDate(HttpServletRequest request, HttpServletResponse response) {
		StoreManagementHelper helper = new StoreManagementHelper();
		List categories = helper.gethostelStockdetailBetweenTwoDateForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$ - " + returnMap);
		return toJson(returnMap);
	}
	
	
	// admission enquiry report as per class and division
	public String getAdmissionEnquiryAsPerClassAndDivision(
			HttpServletRequest request, HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List categories = helper.getAdmissionEnquiryInfoAsPerClassAndDiv(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	
	// Student Balnce for report as per class and division
		public String studentBalanceAsPerClassNdDiv(
				HttpServletRequest request, HttpServletResponse response) {
			StudentInfoHelper helper = new StudentInfoHelper();
			List categories = helper.studentBalanceAsPerClassNdDiv(
					request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
	
	//Lc generated Student list for report as per class and division
	public String getLCGeneratedStudentList(
			HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getLCGeneratedStudentInfoAsPerClassAndDiv(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	//
	public String getLCGeneratedStudentListrangewise(HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getLCGeneratedStudentInfoAsPerrangewise(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$   -   " + returnMap);
		return toJson(returnMap);
	}
	
	//Bonafide generated Student list for report as per class and division
	public String getBonafideGeneratedStudentList(
			HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getBonafideGeneratedStudentInfoAsPerClassAndDiv(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	//
	public String getnirgumGeneratedStudentList(HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getnirgumGeneratedStudentInfoAsPerClassAndDiv(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//bonafide range wise
	public String getBonafideGeneratedStudentListrangewise(HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getBonafideGeneratedStudentInfoAsPerrangewise(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	//
	public String getnirgumGeneratedStudentListrangewise(HttpServletRequest request, HttpServletResponse response) {
		CertificatesHelper helper = new CertificatesHelper();
		List categories = helper.getnirgumGeneratedStudentInfoAsPerrangewise(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//Adding of Teacher Daily Task
	public String addTeacherDailyTask(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		TeacherDailyTaskEntryHelper scf = new TeacherDailyTaskEntryHelper();
		scf.addTeacherTask(request, response);
		return toJson("Teacher Task Added Sucessfully");
	}
	// adding of Home Work
	public String addHomeWorkTeacherDailyTask(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		TeacherDailyTaskEntryHelper scf = new TeacherDailyTaskEntryHelper();
		scf.addHomeWorkTeacherDailyTask(request, response);
		return toJson("Home Work Added Sucessfully");
	}
//
	public String editHomeWorkTeacherDailyTask(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		TeacherDailyTaskEntryHelper scf = new TeacherDailyTaskEntryHelper();
		scf.editHomeWorkTeacherDailyTask(request, response);
		return toJson("Home Work Updated Sucessfully");
	}
	// Teacher Details Report Subject Wise
	public String getTeacherDetailSubjectWise(HttpServletRequest request, HttpServletResponse response) {
		TeacherInfoHelper helper = new TeacherInfoHelper();
		List categories = helper.getTeacherDetailsReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//view of Teacher Daily Task
	public String viewTeacherDailyTask(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		TeacherDailyTaskEntryHelper scf = new TeacherDailyTaskEntryHelper();
		scf.showTeacherTask(request, response);
		return toJson("Teacher Task Added Successfully");
	}
	
	//Parents Complaint
		public String addParentsComplaint(HttpServletRequest request,HttpServletResponse response)
		{
			System.out.println("In controller");
			ParentsComplaintHelper scf = new ParentsComplaintHelper();
			scf.showParentsComplaint(request, response);
			return toJson("Parents Complaint Data Added Successfully");
		}
	
	//Adding of Subject wise Syllabus
	public String addSubjectWiseSyllabus(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		SubjectInfoHelper scf = new SubjectInfoHelper();
		scf.addSubjectWiseSyllabi(request, response);
		return toJson("Data Added Successfully");
	}

	//Adding of Student scan docs
	public String addStudentScannedDocuments(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StudentInfoHelper scf = new StudentInfoHelper();
		scf.addStudentScanDocuments(request, response);
		return toJson("Data Added Successfully");
	}
	
	//view of subject wise syllabus file
	public String viewSubjectWiseSyllabus(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		SubjectInfoHelper scf = new SubjectInfoHelper();
		List categories = scf.showSyllabusFile(request, response);
		

		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
		
//		return toJson("Data Added Successfully");
	}
	
	// copy of bonafide 
		public String BonafideCopyMethod(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			System.out.println("Start In regProfarmaDetail Controller");
			
			CertificatesHelper helper = new 	CertificatesHelper();
			helper.BonafideCOPY(request, response);
			
			System.out.println("Start In regProfarmaDetail Controller");
			return toJson("Data Added Successsfully");
		}
		// copy Of Leaving Certificate 
		public String LeavingCopyMethod(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			System.out.println("Start In regProfarmaDetail Controller");
			
			CertificatesHelper helper = new CertificatesHelper();
			helper.LeavingCOPY(request, response);
			
			System.out.println("Start In regProfarmaDetail Controller");
			return toJson("Data Added Successsfully");
		}	
		
	//view of subject wise syllabus file
	public String viewLeavingCertificate(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		CertificatesHelper scf = new CertificatesHelper();
		scf.viewLC(request, response);
		return toJson("Data Added Successfully");
	}
	//nirgum cer
	public String viewnirgumCertificate(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		CertificatesHelper scf = new CertificatesHelper();
		System.out.println("in controller nirgum");
		scf.viewnirgum(request, response);
		return toJson("Data Added Successfully");
	}
	
	
	//generate Bonafide certificate
	public String viewBonafideCertificate(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		CertificatesHelper scf = new CertificatesHelper();
		scf.viewBonafide(request, response);
		return toJson("Data Added Successfully");
	}
	//to get passing marks
	public String getPassingMarks(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		String fk_examName_id = request.getParameter("fk_examName_id");
		String academicYear = request.getParameter("academicYear");
		String fk_subject_id = request.getParameter("fk_subject_id");
		String subjectName = request.getParameter("subjectName");
		
		ExamInfoHelper helper = new ExamInfoHelper();
		Map map = helper.getPassingMArksAsPerSelectedSubject(fk_class_id, fk_division_id,fk_examName_id,academicYear,fk_subject_id,subjectName);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	//get student name as per class and divivsion
	public String getStudentNameAsPerClassAndDiv(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getStudentName(fk_class_id, fk_division_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	//nirgum studnt
	public String getStudentNameAsPerClassAndDivng(HttpServletRequest request,HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getStudentNameng(fk_class_id, fk_division_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	
	//get parent by student 
	//get student name as per class and divivsion
		public String getParentNameAsPerStudent(HttpServletRequest request,
				HttpServletResponse response) {
			String studentName = request.getParameter("studentName");
			//String fk_division_id = request.getParameter("fk_division_id");
			CashBankBookHelper helper = new CashBankBookHelper();
			Map map = helper.getParentName(studentName);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
	
	// Copy Of Leaving CertiFiccate by kishor
	public String getStudentNameAsPerClassAndDivCopy(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getStudentNameCopy(fk_class_id, fk_division_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	//get total annual fee as per selected student name,class and divivsion
	public String getTotalAnnualFeeOfStudent(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		String fk_Student_id = request.getParameter("fk_Student_id");
		//String firstName = request.getParameter("firstName");
		//String middleName = request.getParameter("middleName");
		//String lastName = request.getParameter("lastName");
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getTotalAnnualFeeAsPerStudentName(fk_class_id, fk_division_id,fk_Student_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	public String StudentFeegetTotalAnnualFee(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		//String fk_Student_id = request.getParameter("fk_Student_id");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getTotalAnnualFeeAsPerStudentNameStudentFee(fk_class_id, fk_division_id,firstName,middleName,lastName);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	// to get All transport All total 
	public String TrasnportionDetailsAllTotal(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		String fk_Student_id = request.getParameter("studentName");
		/*String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");*/
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.TrasnportionDetailsAllTotal(fk_class_id, fk_division_id,fk_Student_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	//get remaining annual fee as per selected student name,class and divivsion
	public String getRemainingAnnualFeeOfStudent(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		//String fk_Student_id =request.getParameter("fk_Student_id");
		//System.out.println("hit this is fk_Student_id== "+fk_Student_id);
		
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.getBalanceOfAnnualFeeAsPerStudentName(fk_class_id, fk_division_id,firstName,middleName,lastName);
		/*Map map = helper.getBalanceOfAnnualFeeAsPerStudentName(fk_class_id, fk_division_id,fk_Student_id);*/
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	// get all remaning  Transpotrtaion Fee 
	
	public String TransportionBusRemainingFeesList(HttpServletRequest request,
			HttpServletResponse response) {
		String fk_class_id = request.getParameter("fk_class_id");
		String fk_division_id = request.getParameter("fk_division_id");
		/*String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");*/
		String fk_Student_id =request.getParameter("studentName");
		//System.out.println("hit this is fk_Student_id== "+fk_Student_id);
		
		CashBankBookHelper helper = new CashBankBookHelper();
		Map map = helper.TransportionBusRemainingFeesList(fk_class_id, fk_division_id,fk_Student_id);
		/*Map map = helper.getBalanceOfAnnualFeeAsPerStudentName(fk_class_id, fk_division_id,fk_Student_id);*/
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	//Adding of Student Payment
	public String doStudentPayment(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		CashBankBookHelper scf = new CashBankBookHelper();
		scf.addStudentPayment(request, response);
		return toJson("Data Added Successfully");
	}
	
	// Fetching school Details To Edit
	public String getSchoolDetailsToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String schoolId = request.getParameter("schoolId");
		Long pkschoolId = Long.parseLong(schoolId);
		System.out.println("in controller schoolId : " + pkschoolId);
		SchoolInfoHelper helper = new SchoolInfoHelper();
		Map map = helper.getSchoolDetailsForEdit(pkschoolId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	//admm edit
	public String getadmisiionToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String stuId1 = request.getParameter("stuId");
		Long stuId = Long.parseLong(stuId1);
		System.out.println("in controller schoolId : " + stuId);
		AdmissionEnquiryHelper helper = new AdmissionEnquiryHelper();
		Map map = helper.getStudentForEdit(stuId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	//
	public String getnoticeToEdit(HttpServletRequest request, HttpServletResponse response) {
		String classname = request.getParameter("classname");
		String divname = request.getParameter("divname");
//		Long class1 = Long.parseLong(classname);
		System.out.println("in controller clss : " + classname+divname);
		AdmissionEnquiryHelper helper = new AdmissionEnquiryHelper();
		Map map = helper.getnoticeForEdit(classname,divname);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	// delete Notice Details
	public String deletNotice(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("In Controller");
		NoticeInfoHelper helper = new NoticeInfoHelper();
		helper.deletesNoticeDetails(request, response);
		
		String data = "Notice Details Deleted Sucessfully";
		return data;
	}
	
	
	
	//employee
	public String getemployeeToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String teacherid = request.getParameter("teacherid");
		
		
		Long teachid = Long.parseLong(teacherid);
		System.out.println("in controller schoolId : " + teachid);
		TeacherInfoLeaveHelper helper = new TeacherInfoLeaveHelper();
		Map map = helper.geteemployeeForEdit(teachid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	
	// Fetching Transportation Details To Edit
		public String getTransportationDetailsToEdit(HttpServletRequest request,
				HttpServletResponse response) {
			String studentId = request.getParameter("studentId");
			Long pkTrasnpotationSchollBusId = Long.parseLong(studentId);
			System.out.println("in controller schoolId : " + studentId);
			StudentTransportationHelper helper = new StudentTransportationHelper();
			Map map = helper.getTransportationForEdit(pkTrasnpotationSchollBusId);
			Map<String, List> returnMap = new HashMap<String, List>();
			String xyz = toJson(map);
			System.out.println(xyz);
			System.out.println("going out of controller");
			return xyz;
		}
	
	
	// update school info details
	public String updateSchoolDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		SchoolInfoHelper helper = new SchoolInfoHelper();
		helper.updateSchoolInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	//update admisiom
	public String updateaddenqDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		AdmissionEnquiryHelper helper = new AdmissionEnquiryHelper();
		helper.updatestuInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	
	
	// update transportation info details
		public String updateTransportationDetails(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println("In controller update Transportation Details");
			TransportationInfoHelper helper = new TransportationInfoHelper();
			helper.updateTransportationInfoDetail(request, response);
			System.out.println("In controller Updateemployee");
			return toJson("Data Updated Successfully");

		}
		// delete transportation details
		public String deletTransportation(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("In Controller");
			TransportationInfoHelper helper = new TransportationInfoHelper();
			helper.deletesTransportationDetails(request, response);
			
			String data = "Transportation Deleted Sucessfully";
			return data;
		}

	
	// Fetching Division Details To Edit
	public String getDivisionDetailToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String classId = request.getParameter("classId");
		Long fkclassId = Long.parseLong(classId);
		String divisionId = request.getParameter("divisionId");
		//Long fkdivisionId = Long.parseLong(classId);
		DivisionInfoHelper helper = new DivisionInfoHelper();
		Map map = helper.getDivDetailsForEdit(fkclassId,divisionId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	// update division info details
	public String updateDivisionDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		DivisionInfoHelper helper = new DivisionInfoHelper();
		helper.updateDivisionInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	
	// delete division info details
	public String deleteDivisionDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		DivisionInfoHelper helper = new DivisionInfoHelper();
		helper.deletedivNameInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Deleted Successfully");

	}
	//
	public String deletetimetableDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		helper.deletetimeDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Deleted Successfully");

	}
	
	// update Class Name 
	public String updateClassName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		ClassInfoHelper helper = new ClassInfoHelper();
		helper.updateClassNameInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	//
	public String updateexpendt(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		ClassInfoHelper helper = new ClassInfoHelper();
		helper.updateexpenditure(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	//upodate sub
	public String updatesubject(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		SubjectInfoHelper helper = new SubjectInfoHelper();
		helper.updatesubjectInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	
	//delete clss
	public String deleteClassName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		ClassInfoHelper helper = new ClassInfoHelper();
		helper.deleteClassNameInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Deleted Successfully");

	}
	// Update Sport Details
	
	public String UpdateSportInfo(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		SportInfoHelper helper = new SportInfoHelper();
		helper.UpdateSportInfoDetails(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");

	}
	
	// Fetching teacher Details To Edit
	public String getTeacherDetailToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		/*String teacherId = request.getParameter("teacherId");
		Long fkTeacherId = Long.parseLong(teacherId);
		*/
		String designation = request.getParameter("designation");
		TeacherInfoHelper helper = new TeacherInfoHelper();
		Map map = helper.getTeacherDetailsForEdit(designation);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	
	public String getTeacherDetailToEdit1(HttpServletRequest request,
			HttpServletResponse response) {
		String teacherId = request.getParameter("teacherId");
		Long fkTeacherId = Long.parseLong(teacherId);
		System.out.println("teacherId"+teacherId);
		//String designation = request.getParameter("designation");
		//System.out.println("designation"+designation);
		TeacherInfoHelper helper = new TeacherInfoHelper();
		Map map = helper.getTeacherDetailsForEdit1(fkTeacherId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	//get store inventory details to edit
	public String getstoreDetailToEdit1(HttpServletRequest request,
			HttpServletResponse response) {
		String teacherId = request.getParameter("fkstoreId");
		Long storeId1=Long.parseLong(teacherId);
		System.out.println("teacherId"+teacherId);
		//String designation = request.getParameter("designation");
		//System.out.println("designation"+designation);
		StoreManagementHelper helper = new StoreManagementHelper();
		Map map = helper.getstoreDetailsForEdit1(storeId1);
		Map<Long, List> returnMap = new HashMap<Long, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	


// update store inventory
public String updateStoreInventoryDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		StoreManagementHelper helper = new StoreManagementHelper();
		helper.updatestoreInventoryInfoDetail(request, response);
		System.out.println("In controller updateInventory");
		return toJson("Data Updated Successfully");
	}
	

// kitchenInventory Details to edit
	public String getKitchenDetailToEdit1(HttpServletRequest request,
		HttpServletResponse response) {
		System.out.println("In controller");
		String teacherId = request.getParameter("fkstoreId1");
		//Long storeId1=Long.parseLong(teacherId);
	System.out.println("teacherId"+teacherId);
	//String designation = request.getParameter("designation");
	//System.out.println("designation"+designation);
	KitchenInventoryHelper helper = new KitchenInventoryHelper();
	Map map = helper.getkitchenDetailsForEdit1(teacherId);
	Map<String, List> returnMap = new HashMap<String, List>();
	String xyz = toJson(map);
	System.out.println(xyz);
	System.out.println("going out of controller");
	return xyz;
}	
	// update kitchen inventory
	public String updateKitchenInventoryDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		KitchenInventoryHelper helper = new KitchenInventoryHelper();
		helper.updatKitchenInventoryInfoDetail(request, response);
		System.out.println("In controller updateInventory");
		return toJson("Data Updated Successfully");
	}	
	// grid for edit hostel iventory
	
	public String gethostelDetailToEdit1(HttpServletRequest request,
			HttpServletResponse response) {
			System.out.println("In controller");
			String fkhostelreId = request.getParameter("fkhostelreId");
			//Long storeId1=Long.parseLong(teacherId);
		System.out.println("teacherId"+fkhostelreId);
		//String designation = request.getParameter("designation");
		//System.out.println("designation"+designation);
		StoreManagementHelper helper = new StoreManagementHelper();
		Map map = helper.getHostelDetailsForEdit1(fkhostelreId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	//update hostelInventory
	public String updateHostelInventoryDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		StoreManagementHelper helper = new StoreManagementHelper();
		helper.updatehostelInventoryInfoDetail(request, response);
		System.out.println("In controller updateInventory");
		return toJson("Data Updated Successfully");
	}		

	
	
	
	
// get Teacher Name Edit wise 
	public String getTeacherDetailWiseToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		/*String teacherId = request.getParameter("teacherId");
		Long fkTeacherId = Long.parseLong(teacherId);
		*/
		
		String designation = request.getParameter("designation");
		System.out.println("designation="+designation);
		TeacherInfoHelper helper = new TeacherInfoHelper();
		Map map = helper.getTeacherDetailswiseForEdit(designation);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	// update Teacher info details
	public String updateTeacherDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		TeacherInfoHelper helper = new TeacherInfoHelper();
		helper.updateTeacherInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");
	}
	
	// Fetching Student Details To Edit
	public String getStudentDetailToEdit(HttpServletRequest request,HttpServletResponse response) {
		String studentId = request.getParameter("studentId");
		Long fkStudentId = Long.parseLong(studentId);
		
		StudentInfoHelper helper = new StudentInfoHelper();
		Map map = helper.getStudentDetailsForEdit(fkStudentId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	// edit sport details 
	public String getSportDetailToEdit(HttpServletRequest request,
			HttpServletResponse response) {
	//	String Createactivity = request.getParameter("Createactivity");
		//Long fkStudentId = Long.parseLong(studentId);
		String PkSportId = request.getParameter("PkSportId");
		System.out.println("hi this is kishor 555*******0"+PkSportId);
		/*Long fkStudentId =Long.parseLong(PkSportId);
*/		SportInfoHelper helper = new SportInfoHelper();
		Map map = helper.getSportDetailsForEdit(PkSportId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	// feteching exam details by kishor 
	public String getExamdetailstoEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String examName_id = request.getParameter("examName_id");
		//Long fkStudentId = Long.parseLong(studentId);
		
		ExamInfoHelper helper = new ExamInfoHelper();
		Map map = helper.getExamEdit(examName_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	
	
	
	
	
	
	
	
	//student result for graph
	public String studentResultForGraph(HttpServletRequest request,
			HttpServletResponse response) {
		String fkClassId = request.getParameter("fk_class_id");
		StudentInfoHelper helper = new StudentInfoHelper();
		List dayrecord = helper.getStudentResultForGraph(fkClassId);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", dayrecord);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@" + returnMap);
		return toJson(returnMap);
	}
	
	// Fetching Student Count for dashboard
	public String getStudentCountForDashboard(HttpServletRequest request,
			HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		Map map = helper.getStudentCountForDashBoard();
		Map<String, List> returnMap = new HashMap<String, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	
	// Fetching Student Count for Graph
	public String gerAllStudentCountForGraph(HttpServletRequest request,
			HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List dayrecord = helper.getStudentCountForGraph();
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", dayrecord);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@" + returnMap);
		return toJson(returnMap);
	}
	
	
	// update Teacher info details
	public String updateStudentDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		StudentInfoHelper helper = new StudentInfoHelper();
		helper.updateStudentInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");
	}
// Update  Exam Details
	public String updateExamDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		ExamInfoHelper helper = new ExamInfoHelper();
		helper.updateExamInfoDetail(request, response);
		System.out.println("In controller Updateemployee");
		return toJson("Data Updated Successfully");
	}
	

	/*
	 * fetching Bill number as per vendor Name in Supplier Payment from vendor
	 * Account details
	 */
	public String getAllBillByVendorNames(HttpServletRequest request, HttpServletResponse response) 
	{
		String fk_supplier_id = request.getParameter("supplier");

		SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
		Map map = helper.getAllVendorBillNo(fk_supplier_id);
		String xyz = toJson(map);
		System.out.println(xyz);
		return xyz;
	}
	
	// Getting Total amount as per Bill number in Supplier Payment from goods
		// receive table
		public String getTotalAmtByBillNo(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String supplierId = request.getParameter("supplier");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getTotalAmtByBillNo( supplierId);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		
		// Library total amount
		public String getLibraryTotalAmtByBillNo(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String supplierId = request.getParameter("supplier");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getLibraryTotalAmtByBillNo( supplierId);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		
		//Library Balance Amount
		public String getLibraryBalanceAmtBySupplierWise(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String supplierId = request.getParameter("supplier");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getLibraryBalanceAmtBySupplierWise( supplierId);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		
		//  Getting Balance amount as per Bill number in Supplier Payment from goods
		
		public String getBalanceAmtBySupplierWise(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String supplierId = request.getParameter("supplier");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getBalanceAmtBySupplierWise( supplierId);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		
		public String getRemainingAllBillsforemployee(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String supplierId = request.getParameter("fk_teacher_id");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getRemainingAllBillsforemployee( supplierId);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		//get Employee Payment by all Employee
		public String getTotalAmtByBillNoEmployee(HttpServletRequest request, HttpServletResponse response) 
		{
			//String billNo = request.getParameter("billNo");
			String fk_teacher_id = request.getParameter("fk_teacher_id");
			
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getTotalAmtByBillNoEmployee(fk_teacher_id);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}
		
		// Getting Remaining balance amount as per Bill number in Supplier Payment
		// from Supplier Payment details table
		/*public String getBalanceAmtByBillNo(HttpServletRequest request, HttpServletResponse response) {
			String billNo = request.getParameter("billNo");
			String fk_supplier_id = request.getParameter("supplier");
			String totalAmount = request.getParameter("totalAmount");
			SupplierAccountBankHelper helper = new SupplierAccountBankHelper();
			Map map = helper.getRemainingAmtByBillNo(billNo, fk_supplier_id, totalAmount);
			String xyz = toJson(map);
			System.out.println(xyz);
			return xyz;
		}*/
		

		// Registering Supplier Payment
		public String regSupCashBook(HttpServletRequest request, HttpServletResponse response) 
		{
			System.out.println("In controller");

			SupplierCashBankHelper helper = new SupplierCashBankHelper();
			helper.regSupplierCashBank(request, response);
			return toJson("Data Added Successfully");
		}
		
		
		// Registering Library Payment
				public String regLibCashBook(HttpServletRequest request, HttpServletResponse response) 
				{
					System.out.println("In controller");

					SupplierCashBankHelper helper = new SupplierCashBankHelper();
					helper.regLibraryCashBank(request, response);
					return toJson("Data Added Successfully");
				}
				
		
		// Trasnportation Details 
		
		public String TransportationDetails(HttpServletRequest request, HttpServletResponse response) 
		{
			System.out.println("In controller");

			StudentTransportationHelper helper = new StudentTransportationHelper();
			helper.TransportationDetails(request, response);
			return toJson("Data Added Successfully");
		}
		
	
	//cancellation of student admission
	public String cancelStudentAdmission(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StudentInfoHelper sif = new StudentInfoHelper();
		sif.cancelStudentAdmission(request, response);
		return toJson("Cancellation of Admission is Successful");
	}
	
	//to get subject and teacher name, start time and end time  into grid in daily time table
	public String getDailyTimeTableIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSubjectId = request.getParameter("fk_subject_id");
		String subjectName = request.getParameter("subjectName");
		String teacherName = request.getParameter("teacherName");
		String fkTeacherId = request.getParameter("fk_teacher_id");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String fk_class_id1 = request.getParameter("fk_class_id1");
		System.out.println("in helper===fk_class_id1== "+fk_class_id1);
		String fk_division_id = request.getParameter("fk_division_id");
		String academicYear = request.getParameter("academicYear");
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		DailyTimeTableHibernate timeTable = helper.getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetail(fkSubjectId, subjectName,
				teacherName,fkTeacherId,startTime,endTime,fk_class_id1,fk_division_id,academicYear);
		
		Map<String, DailyTimeTableHibernate> items = new HashMap<String, DailyTimeTableHibernate>();
		items.put("offer", timeTable);
		return toJson(items);
	}
	
	// edit Grid Data getEditDailyTimeTableIntoGrid
	public String getEditDailyTimeTableIntoGrid(HttpServletRequest request,
			HttpServletResponse response) {
	/*	String fkSubjectId = request.getParameter("fk_subject_id");
		String subjectName = request.getParameter("subjectName");
		String teacherName = request.getParameter("teacherName");
		String fkTeacherId = request.getParameter("fk_teacher_id");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String fk_class_id1 = request.getParameter("fk_class_id1");
		System.out.println("in helper===fk_class_id1== "+fk_class_id1);
		String fk_division_id = request.getParameter("fk_division_id");
		String academicYear = request.getParameter("academicYear");
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		DailyTimeTableHibernate timeTable = helper.getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(fkSubjectId, subjectName,
				teacherName,fkTeacherId,startTime,endTime,fk_class_id1,fk_division_id,academicYear);
		
		Map<String, DailyTimeTableHibernate> items = new HashMap<String, DailyTimeTableHibernate>();
		items.put("offer", timeTable);ss
		return toJson(items);*/
		
		DailyTimeTableHelper helper = new DailyTimeTableHelper();

		List timeTable = helper.getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", timeTable);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// add daily time table 
	public String addDailyTimeTable(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		DailyTimeTableHelper cdst = new DailyTimeTableHelper();
		cdst.addingDailyTimeTable(request, response);
		return toJson("Data Added Successfully");
	}
	
	//to get subjet,day,date, start time and end time  into grid in exam time table
	public String getGridForExamTimeTable(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSubjectId = request.getParameter("fk_subject_id");
		System.out.println("In Controller fkSubjectId== "+fkSubjectId);
		String subjectName = request.getParameter("subjectName");
		System.out.println("In Controller subjectName =="+subjectName);
		String day = request.getParameter("day");
		String examDate = request.getParameter("examDate");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		
		ExamTimeTableHelper helper = new ExamTimeTableHelper();
		GetExamTimeTableDetail timeTable = helper.getGridForExamTimeTable(fkSubjectId, subjectName,
				day,examDate,startTime,endTime);
		
		Map<String, GetExamTimeTableDetail> items = new HashMap<String, GetExamTimeTableDetail>();
		items.put("offer", timeTable);
		return toJson(items);
	}
	//
	
	public String getGridForExamTimeTableedit(HttpServletRequest request,
			HttpServletResponse response) {
		String examname = request.getParameter("examname");
		System.out.println("In Controller examname == "+examname);
		String clss = request.getParameter("clss");
		System.out.println("In Controller subjectName =="+clss);
		String divv = request.getParameter("divv");
		String examDate = request.getParameter("examDate");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		
		ExamTimeTableHelper helper = new ExamTimeTableHelper();
		List timeTable = helper.getGridForExamTimeTableedit(examname, clss,divv);
		
		Map<String, List> items = new HashMap<String, List>();
		items.put("offer", timeTable);
		System.out.println("$$$$$$$$$$$$$$$$" + items);
		return toJson(items);
		
		
		/*
		 * List product = helper.getSubjectInGridOn(request, response); Map<String,
		 * List> returnMap = new HashMap<String, List>(); returnMap.put("offer",
		 * product); System.out.println("$$$$$$$$$$$$$$$$" + returnMap); return
		 * toJson(returnMap);
		 */
		
		
	}
	
	// add Exam time table 
	public String addExamTimeTable(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ExamTimeTableHelper cdst = new ExamTimeTableHelper();
		cdst.addingExamTimeTable(request, response);
		return toJson("Data Added Successfully");
	}
	//
	public String addExamTimeTableedit(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		ExamTimeTableHelper cdst = new ExamTimeTableHelper();
		cdst.addingExamTimeTableedit(request, response);
		return toJson("Data Updated Successfully");
	}
	// report- daily time table
	public String getDailyTimeTable(
			HttpServletRequest request, HttpServletResponse response) {
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		List categories = helper.getDailyTimeTableForReport(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	
	// report- daily time table day wise
	public String getDayWiseDailyTimeTable(
			HttpServletRequest request, HttpServletResponse response) {
		DailyTimeTableHelper helper = new DailyTimeTableHelper();
		List categories = helper.getDayWiseDailyTimeTableForReport(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// report- daily time table
	public String getExamTimeTable(
			HttpServletRequest request, HttpServletResponse response) {
		ExamTimeTableHelper helper = new ExamTimeTableHelper();
		List categories = helper.getExamTimeTableForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// report- classwise result
	public String getClassWiseResult(
			HttpServletRequest request, HttpServletResponse response) {
		ResultHelper helper = new ResultHelper();
		List categories = helper.getClassWiseResultForReport(
				request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// report- student result
	public String getStudentWiseResult(HttpServletRequest request, HttpServletResponse response) {
		ResultHelper helper = new ResultHelper();
		List categories = helper.getStudWiseResultForReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("processed data in controller" + returnMap);
		return toJson(returnMap);
	}
	
	//to get product name into grid of store Management
	public String gridForStoreManagement(HttpServletRequest request,HttpServletResponse response) {
		String productName = request.getParameter("productName");
		
		StoreManagementHelper helper = new StoreManagementHelper();
		GetStoreManagementDetailBean timeTable = helper.getGridForStoreManagement(productName);
		
		Map<String, GetStoreManagementDetailBean> items = new HashMap<String, GetStoreManagementDetailBean>();
		items.put("offer", timeTable);
		return toJson(items);
	}

	// get hostel grid
	public String gridForhostelManagement(HttpServletRequest request,HttpServletResponse response) {
		String productName = request.getParameter("productName");
		System.out.println("in controller productName - "+productName);
		StoreManagementHelper helper = new StoreManagementHelper();
		gethostelmanagementdetailbean timeTable = helper.getGridForhostelManagement(productName);
		
		Map<String, gethostelmanagementdetailbean> items = new HashMap<String, gethostelmanagementdetailbean>();
		items.put("offer", timeTable);
		return toJson(items);
	}
	
	
	//to get book name into grid of library Management
	public String gridForBookEnrtyInLibraryManagement(HttpServletRequest request,
			HttpServletResponse response) {
		String bookName = request.getParameter("bookName");
		
		LibraryManagementHelper helper = new LibraryManagementHelper();
		GetLibraryManagementDetails timeTable = helper.getGridForLibraryManagement(bookName);
		
		Map<String, GetLibraryManagementDetails> items = new HashMap<String, GetLibraryManagementDetails>();
		items.put("offer", timeTable);
		return toJson(items);
	}
	
	//to get book detail into grid of book issue
	public String getBookDetailForIssue(HttpServletRequest request,
			HttpServletResponse response) {
		String bookNameId = request.getParameter("bookNameId");
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getBookDetailForIssueGrid(bookNameId);
		String xyz = toJson(items);
		System.out.println(xyz);
		return xyz;
	}
	
	
	//to get book detail into grid of book return
	/*public String getBookDetailForReturn(HttpServletRequest request,
			HttpServletResponse response) {
		String bookNameId = request.getParameter("bookNameId");
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getBookDetailForReturnGrid(bookNameId);
		String xyz = toJson(items);
		System.out.println(xyz);
		return xyz;
	}*/
	
	public String getBookDetailForReturn(HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		/*String StudentNameId = request.getParameter("studName_return");
		String BookReturneDateNew = request.getParameter("BookReturneDateNew");
		
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getBookDetailForReturnGrid(StudentNameId,BookReturneDateNew);
		String xyz = toJson(items);
		System.out.println(xyz);
		return xyz;*/
		
		LibraryManagementHelper helper = new LibraryManagementHelper();

		List product = helper.getBookDetailForReturnGrid(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", product);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);

	}
	
	// add store Management 
	public String addStoreManagementDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StoreManagementHelper cdst = new StoreManagementHelper();
		cdst.addingStoreManagement(request, response);
		return toJson("Store Inventory Added Successfully");
	}
	//save hostel
	public String addhostelManagementDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StoreManagementHelper cdst = new StoreManagementHelper();
		cdst.addinghostelManagement(request, response);
		return toJson("Hostel Inventory Added Successfully");
	}
	
	
	// adding Sport Participiant Details addStoreManagementParticipantDetails\
	public String addStoreManagementParticipantDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		StoreManagementHelper cdst = new StoreManagementHelper();
		cdst.addStoreManagementParticipantDetails(request, response);
		return toJson("Store Inventory Added Successfully");
	}
	// delete Participant
	
	public String deletParticipant(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("In Controller");
		String id=request.getParameter("delparticipantId");
		System.out.println("Dlete Id"+id);
		SportInfoHelper helper = new SportInfoHelper();
		helper.deleteParticipantDetails(request, response);
		
		String data = "Participant Deleted Sucessfully";
		return data;
	}
	// delete sport List
	public String deletSportList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("In Controller");
		String id=request.getParameter("delSportId");
		System.out.println("Dlete Id"+id);
		SportInfoHelper helper = new SportInfoHelper();
		helper.deleteSportDetails(request, response);
		
		String data = "Sport Details Deleted Sucessfully";
		return data;
	}
	
	
	
	// add book details
	public String addBookEntryManagementDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		LibraryManagementHelper cdst = new LibraryManagementHelper();
		cdst.addingBookDetails(request, response);
		return toJson("Data Added Successfully");
	}
	
	// add teacher Book Issue return Deatils
		public String TeacheraddBookIssueDetailsReturn(HttpServletRequest request,HttpServletResponse response)
		{
			System.out.println("In controller");
			LibraryManagementHelper cdst = new LibraryManagementHelper();
			cdst.TeacheraddBookIssueDetailsReturn(request, response);
			return toJson("Data Added Successfully");
		}
		//get all Teacher Book Name Return WIse 
		
		public String getAllBookNameForDropdownForReturnTeacherBook(
				HttpServletRequest request, HttpServletResponse response) {
			String studentId = request.getParameter("fk_teacher_idReturn");
			System.out.println(" hi this is fk_teacher_id== "+studentId);
			LibraryManagementHelper helper = new LibraryManagementHelper();
			Map items = helper.getAllBookNameForDropdownForReturnTeacherBook(studentId);
			String xyz = toJson(items);
			return xyz;
		}
	
	// Employee Book Return For Empployee 
		public String getBookDetailForEmployeeReturn(HttpServletRequest request,
				HttpServletResponse response) {
			//String StudentNameId = request.getParameter("employeebookNameForReturnEMployee");
			
			LibraryManagementHelper helper = new LibraryManagementHelper();

			List product = helper.getBookDetailForEmployeeReturnGrid(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("offer", product);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
			
			
			
			/*String fk_teacher_idReturn = request.getParameter("fk_teacher_idReturn");
			
			LibraryManagementHelper helper = new LibraryManagementHelper();
			Map items = helper.getBookDetailForEmployeeReturnGrid(fk_teacher_idReturn);
			String xyz = toJson(items);
			System.out.println(xyz);
			return xyz;*/
		}
	
	// get Book ISsue for Teacher Book ISssue
	public String getBookDetailForReturnForTeacher(HttpServletRequest request,
			HttpServletResponse response) {
		String bookNameId = request.getParameter("bookNameId");
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getBookDetailForReturnGridTeacher(bookNameId);
		String xyz = toJson(items);
		System.out.println(xyz);
		return xyz;
		
		/*LibraryManagementHelper helper = new LibraryManagementHelper();
		List product = helper.getBookDetailForReturnGridTeacher(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", product);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);*/
		
	}
	
	// get all Teacher  book details for dropdown for return from book issue table
	
		public String getAllBookNameForDropdownForReturnTeacher(
				HttpServletRequest request, HttpServletResponse response) {
			String studentId = request.getParameter("fk_teacher_id");
			System.out.println(" hi this is fk_teacher_id== "+studentId);
			LibraryManagementHelper helper = new LibraryManagementHelper();
			Map items = helper.getAllBookNameForDropdownForReturnTeacher(studentId);
			String xyz = toJson(items);
			return xyz;
		}
	
	// add Employee Book ENtry 
	
	public String TeacheraddBookIssueDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		LibraryManagementHelper cdst = new LibraryManagementHelper();
		cdst.TeacheraddBookIssueDetails(request, response);
		return toJson("Data Added Successfully");
	}
	
	// add book issue details
	public String addBookIssueDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		LibraryManagementHelper cdst = new LibraryManagementHelper();
		cdst.addingBookIssueDetails(request, response);
		return toJson("Data Added Successfully");
	}
	
	// add book return details
	public String addBookReturnDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		LibraryManagementHelper cdst = new LibraryManagementHelper();
		cdst.addingBookReturnDetails(request, response);
		return toJson("Data Added Successfully");
	}
	
	// get book name for dropdown
	public String getAllBookNameForDropdown(
			HttpServletRequest request, HttpServletResponse response) {
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getAllBookNameForDropdown();
		String xyz = toJson(items);
		//System.out.println("in book dropdown"+xyz);
		return xyz;
	}
	
	
	//book details for dropdown for return from book issue table
	public String getAllBookNameForDropdownForReturn(
			HttpServletRequest request, HttpServletResponse response) {
		String studentId = request.getParameter("studentId");
		LibraryManagementHelper helper = new LibraryManagementHelper();
		Map items = helper.getAllBookNameForDropdownForReturn(studentId);
		String xyz = toJson(items);
		return xyz;
	}
	
	//add admission enquiry
	public String addAdmissionEnquiryInfo(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		AdmissionEnquiryHelper scf = new AdmissionEnquiryHelper();
		scf.doAdmissionEnquiryInfo(request, response);
		return toJson("Data Added Successfully");
	}
	
	//view Student result pdf
	public String getStudentWiseResultPDF(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		String fk_class_id = request.getParameter("fk_class_id");
		System.out.println("hi this is fk_class_id== "+fk_class_id);
		
		String fk_division_id = request.getParameter("fk_division_id");
		System.out.println("hi this is fk_division_id== "+fk_division_id);
		
		String fkExamId = request.getParameter("fkExamId");
		System.out.println("hi this is fkExamId== "+fkExamId);
		
		String fkStudentId = request.getParameter("fk_Student_id");
		System.out.println("hi this is fkStudentId== "+fkStudentId);
		
		HttpSession pdfResultSession = request.getSession();
		pdfResultSession.setAttribute("fkClassId", fk_class_id);
		pdfResultSession.setAttribute("fkDivisionId", fk_division_id);
		pdfResultSession.setAttribute("fkExamId", fkExamId);
		pdfResultSession.setAttribute("fkStudentId", fkStudentId);
		return toJson("Data Added Successfully");
	}
	// get class Wise Attendance Report between two date
	public String classWiseStudentAttendanceReportBetweenTwoDate(HttpServletRequest request,
			HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List categories = helper.classWiseStudentAttendanceReportBetweenTwoDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// get Student Wise Attendance Report
	public String studentAttendanceReportForSingleDate(HttpServletRequest request,
			HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List categories = helper.studentAttendanceReportForSingleDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	// get class Wise Attendance Report
	public String classWiseStudentAttendanceReport(HttpServletRequest request,
			HttpServletResponse response) {
		StudentInfoHelper helper = new StudentInfoHelper();
		List categories = helper.classWiseStudentAttendanceReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
		return toJson(returnMap);
	}
	
	//add meeting schedule and send message to parent
	public String scheduleMeetingAndSendMessage(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		MeetingScheduleHelper sif = new MeetingScheduleHelper();
		sif.scheduleMeetingAndSendMessage(request, response);
		return toJson("Schedule Meetings Added Successfully");
	}
	//edit schedule Meeting
	public String getScheduleMeetigToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In Controller");
		String teacherId = request.getParameter("meetingId1");
		Long fkteacherID=Long.parseLong(teacherId);
		System.out.println("teacherId"+teacherId);
		//String designation = request.getParameter("designation");
		//System.out.println("designation"+designation);
		MeetingScheduleHelper helper = new MeetingScheduleHelper();
		Map map = helper.getScheduleMeetingToEdit(fkteacherID);
		Map<Long, List> returnMap = new HashMap<Long, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	//update schedule Meeting
	public String updateScheduleMeetingDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		MeetingScheduleHelper helper = new MeetingScheduleHelper();
		helper.updatescheduleMeetingDetail(request, response);
		System.out.println("In controller updateInventory");
		return toJson("Data Updated Successfully");
	}
	
	
	
	
	//delete Schedule Meeting
	public String deletScheduleMeeting(HttpServletRequest request,HttpServletResponse response)
	{
	System.out.println("In Controller");
	MeetingScheduleHelper helper = new MeetingScheduleHelper();
	helper.deleteScheduleMeeting(request,response);		
	String data = "Schedule Meeting Deleted Sucessfully";
	return data;
	}
	
	//Add meeting parents For message To PArents 
	public String scheduleMeetingAndSendMessageParents(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In controller");
		MeetingScheduleHelper sif = new MeetingScheduleHelper();
		sif.scheduleMeetingAndSendMessageParents(request, response);
		return toJson("Parents Meetings Added Successfully");
	}
	// edit meeting parents
	
	public String getparentMeetigToEdit(HttpServletRequest request,
			HttpServletResponse response) {
		String teacherId = request.getParameter("meetingId1");
		Long fkteacherID=Long.parseLong(teacherId);
		System.out.println("teacherId"+teacherId);
		//String designation = request.getParameter("designation");
		//System.out.println("designation"+designation);
		MeetingScheduleHelper helper = new MeetingScheduleHelper();
		Map map = helper.getParentMeetingEdit(fkteacherID);
		Map<Long, List> returnMap = new HashMap<Long, List>();
		String xyz = toJson(map);
		System.out.println(xyz);
		System.out.println("going out of controller");
		return xyz;
	}
	// update Parents Meeting
	public String updateParentsMeetingDetails(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In controller update Supplier Details");
		MeetingScheduleHelper helper = new MeetingScheduleHelper();
		helper.updateParentMeetingDetail(request, response);
		System.out.println("In controller updateInventory");
		return toJson("Data Updated Successfully");
	}

	//delete parents Meeting
	public String deletParentsMeeting(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("In Controller");
		MeetingScheduleHelper helper = new MeetingScheduleHelper();
		helper.deletesParentMeeting(request, response);
		
		String data = "Parents Meeting Deleted Sucessfully";
		return data;
	}
	
	//add notice Entry Details
		public String addNoticeEntry(HttpServletRequest request,HttpServletResponse response)
		{
			System.out.println("In controller");
			NoticeInfoHelper nif = new NoticeInfoHelper();
			nif.doNoticeInfoHelper(request, response);
			return toJson("Notice Details Added Successfully");
		}
		//
		public String editNoticeEntry(HttpServletRequest request,HttpServletResponse response)
		{
			System.out.println("In controller edit");
			NoticeInfoHelper nif = new NoticeInfoHelper();
			nif.editNotice(request, response);
			return toJson("Notice Details Updated Successfully");
		}
		//add student Fee Structure Details
    	public String doFeeStructure(HttpServletRequest request,HttpServletResponse response)
		 {
			System.out.println("In controller");
			CashBankBookHelper cbb = new CashBankBookHelper();
			cbb.doFeeStrucHelper(request, response);
			return toJson("Fee Details Added Successfully");
		}
				
		//Cashbook
		// Registering Teacher Payment
		public String regEmpCashBook(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			TeacherPaymentHelper helper = new TeacherPaymentHelper();
			helper.regTeacherPayment(request, response);
			return toJson("Data Added Successfully");
		}
		
		// Registering Expenditure Payment
		public String regExpenseCashBook(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
			helper.regExpensePayment(request, response);
			return toJson("Data Added Successfully");
		}
		
		// Register Expense Details
		public String addExpenseDetails(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ExpenditureDetailsHelper exdh = new ExpenditureDetailsHelper();
			exdh.expenseDetails(request, response);
			return toJson("Expenditure Added Successfully");
		}
		
		
		// Delete Expenditure
					public String deleteExp(HttpServletRequest request, HttpServletResponse response) {
						
						System.out.println("in controller.java by kishor ");
						ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
						helper.deleteExpenditure(request, response);
						/*
						 * Map<String, List> returnMap = new HashMap<String, List>();
						 * returnMap.put("list", categories);
						 * System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
						 */
						String data = "Expenditure Deleted Sucessfully";
						return data;
					}
		
		// Teacher payment report between two days
		public String getTeacherPaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
			TeacherPaymentHelper helper = new TeacherPaymentHelper();
			List categories = helper.getTeacherPaymentByTwoDate(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		//
		public String getTransportTwoDates(HttpServletRequest request, HttpServletResponse response) {
			TeacherPaymentHelper helper = new TeacherPaymentHelper();
			List categories = helper.getTransportTwoDate(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		//
		public String getlibrartreportDates(HttpServletRequest request, HttpServletResponse response) {
			TeacherPaymentHelper helper = new TeacherPaymentHelper();
			List categories = helper.getlibraryTwoDate(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		// Expenditure payment report between two days
		public String getExpenditurePaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
			ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
			List categories = helper.getExpensePaymentDetailByTwoDate(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		// Parents Complaint Report
		public String getParentsComplaintReport(HttpServletRequest request, HttpServletResponse response) {
			ParentsComplaintHelper helper = new ParentsComplaintHelper();
			List categories = helper.getParentsCompRep(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		
		//************Student Fee structure Reports******************
		// Student Fee Report Name Wise
		public String getStudentNameWiseReport(HttpServletRequest request, HttpServletResponse response) {
			CashBankBookHelper helper = new CashBankBookHelper();
			List categories = helper.getReportStudentNameWise(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
			return toJson(returnMap);
		}
		
		// Student Fee Report Class Wise
			public String getClassWiseReport(HttpServletRequest request, HttpServletResponse response) {
				CashBankBookHelper helper = new CashBankBookHelper();
				List categories = helper.getReportStudentClassWise(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
		// Student Fee Report Class Wise
			public String getDayWiseReport(HttpServletRequest request, HttpServletResponse response) {
				CashBankBookHelper helper = new CashBankBookHelper();
				List categories = helper.getReportStudentDayWise(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
			// Student Fee Report Class Wise
			public String getMonthWiseReport(HttpServletRequest request, HttpServletResponse response) {
				CashBankBookHelper helper = new CashBankBookHelper();
				List categories = helper.getReportStudentMonthWise(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
			
			//Get List Of Stock List
			public String getAllStockList(HttpServletRequest request, HttpServletResponse response) 
			{
				LibraryManagementHelper helper = new LibraryManagementHelper();
				List categories = helper.getAllStockDetails(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
			
			//to get product name into grid of kitchen Inventory
			public String gridForKitchenInventory(HttpServletRequest request,HttpServletResponse response) 
			{
		
				String productName = request.getParameter("productName");
				String fkProductId = request.getParameter("fkProductId");
				KitchenInventoryHelper helper = new KitchenInventoryHelper();
				List timeTable = helper.getGridForKitchenInventory(productName, fkProductId);
				Map<String, List> items = new HashMap<String, List>();
				
				items.put("offer", timeTable);
				return toJson(items);
			}
			
			
			
			// Add Kitchen Inventory
			public String addKitchenInventory(HttpServletRequest request, HttpServletResponse response)
			{
				KitchenInventoryHelper helper = new KitchenInventoryHelper();
				helper.addKitchenInventory(request, response);
				return toJson("Kitchen Inventory Added Successfully");
			}
			
			
			
			// Add Product Details
			public String addProductDetails(HttpServletRequest request, HttpServletResponse response)
			{
				ProductDetailsHelper helper = new ProductDetailsHelper();
				helper.addProductDetails(request, response);
				return toJson("Data Added Successfully");
			}
			
			//Get Total quantity for Alert
			public String getTotalQuantityForAlert(HttpServletRequest request, HttpServletResponse response) 
			{
				System.out.println("in Controller");
				
				String fkProductId = request.getParameter("fkProductId");
				String productName = request.getParameter("productName");
				
				ProductDetailsHelper helper = new ProductDetailsHelper();
				
				List map =  helper.getProductQuantity(fkProductId,productName);
				Map<String,List> returnMap = new HashMap<String, List>();
				
				String name = toJson(map);
				return name;
			}
			
			//Get Product Details for edit
			public String getProductDetails(HttpServletRequest request, HttpServletResponse response) 
			{
				
				
				String fkProductId2 = request.getParameter("fkProductId");
				Long fkProductId = Long.parseLong(fkProductId2);
				
				ProductDetailsHelper helper = new ProductDetailsHelper();
				List map =  helper.getProductDetails(fkProductId);
				Map<String,List> returnMap = new HashMap<String, List>();
				String name = toJson(map);
				return name;
			}
			
			
			// Update Product Details
			public String updateProductDetails(HttpServletRequest request, HttpServletResponse response)
			{
				ProductDetailsHelper helper = new ProductDetailsHelper();
				helper.updateProductDetails(request, response);
				return toJson("Data Update Successfully");
			}
			
			
			
			//get Division Name By Class Name 
			public String getDivisionNameByClassName(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ClassDivisionAssocHelper helper=new ClassDivisionAssocHelper();
				Map divisionName = helper.getDivisionNameByClassName(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			//
			public String gettaskedit(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ClassDivisionAssocHelper helper=new ClassDivisionAssocHelper();
				Map divisionName = helper.gettaskedit(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			// Teacher task to edit
			public String getTeacherDailyTaskToEdit(HttpServletRequest request,
					HttpServletResponse response) {
				String teacherId = request.getParameter("fkteacherID");
				Long fkteacherID=Long.parseLong(teacherId);
				System.out.println("teacherId"+teacherId);
				//String designation = request.getParameter("designation");
				//System.out.println("designation"+designation);
				TeacherDailyTaskEntryHelper helper = new TeacherDailyTaskEntryHelper();
				Map map = helper.getDailyTasktoEdit(fkteacherID);
				Map<Long, List> returnMap = new HashMap<Long, List>();
				String xyz = toJson(map);
				System.out.println(xyz);
				System.out.println("going out of controller");
				return xyz;
			}
			//update teacher task 
			public String updateTeacherTaskDetails(HttpServletRequest request,
					HttpServletResponse response) {
				System.out.println("In controller update Supplier Details");
				TeacherDailyTaskEntryHelper helper = new TeacherDailyTaskEntryHelper();
				helper.updateTeacherTaskDetail(request, response);
				System.out.println("In controller updateInventory");
				return toJson("Data Updated Successfully");
			}

			//delete Teacher Daily Task
			public String deletTeacherdailyTask(HttpServletRequest request, HttpServletResponse response) {
				TeacherDailyTaskEntryHelper helper = new TeacherDailyTaskEntryHelper();
				helper.deleteTeacherdailyTask(request, response);
				
				String data = "Product Deleted Sucessfully";
				return data;
			}
			
			
			
			
			public String getDivisionNameByClassName1(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ClassDivisionAssocHelper helper=new ClassDivisionAssocHelper();
				Map divisionName = helper.getDivisionNameByClassName1(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			
			//get Division Name By Class Name delete
			public String getDivisionNameByClassNamedelete(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ClassDivisionAssocHelper helper=new ClassDivisionAssocHelper();
				Map divisionName = helper.getDivisionNameByClassNamedel(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			//
			public String getDivisionNameClass(HttpServletRequest request, HttpServletResponse response) 
			{
			
				DailyTimeTableHelper helper=new DailyTimeTableHelper();
				Map divisionName = helper.getDivisionNameByClassNamedel(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			
			//nirgum
			public String getDivisionNameByClassNameng(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ClassDivisionAssocHelper helper=new ClassDivisionAssocHelper();
				Map divisionName = helper.getDivisionNameByClassNameng(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  =" + xyz);
				return xyz;
			}
			//toexam
			public String getdivtoEditexam(HttpServletRequest request, HttpServletResponse response) 
			{
			
				ExamInfoHelper helper=new ExamInfoHelper();
				Map divisionName = helper.getDivisiontoeditexam(request,response);
				String xyz = toJson(divisionName);
				System.out.println("In controller == =  = " + xyz);
				return xyz;
			}
			
			// get Grid Student CheckUp
			public String getGridForStudentCheckUp(HttpServletRequest request, HttpServletResponse response)
			{
				String fkClassId = request.getParameter("fkClassId");
				String fkDivisionId = request.getParameter("fkDivisionId");
				StudentCheckUpHelper helper = new StudentCheckUpHelper();
					
				List map =  helper.getGridForStudentCheckUp(fkClassId,fkDivisionId);
				Map<String,List> returnMap = new HashMap<String, List>();
			
				
				returnMap.put("offer", map);
				return toJson(returnMap);
				
			}
			//
			public String geteditGridForStudentCheckUp(HttpServletRequest request, HttpServletResponse response)
			{
				String fkClassId = request.getParameter("fkClassId");
				String fkDivisionId = request.getParameter("fkDivisionId");
				StudentCheckUpHelper helper = new StudentCheckUpHelper();
					
				List map =  helper.geteditGridForStudentCheckUp(fkClassId,fkDivisionId);
				Map<String,List> returnMap = new HashMap<String, List>();
			
				
				returnMap.put("offer", map);
				return toJson(returnMap);
				
			}
			
			
			// Add Student CheckUp Info
			public String addStudentCheckUpInfo(HttpServletRequest request, HttpServletResponse response)
			{
				StudentCheckUpHelper helper = new StudentCheckUpHelper();
				helper.addStudentCheckUpInfo(request, response);
				return toJson("Data Update Successfully");
			
			}
		//
			public String editStudentCheckUpInfo(HttpServletRequest request, HttpServletResponse response)
			{
				StudentCheckUpHelper helper = new StudentCheckUpHelper();
				helper.editStudentCheckUpInfo(request, response);
				return toJson("Data Update Successfully");
			
			}
			
			
			// student CleanUp Report by Class And Division
			public String checkupReportByClassAndDivision(HttpServletRequest request, HttpServletResponse response) 
			{
				StudentCheckUpHelper helper = new StudentCheckUpHelper();
				List categories = helper.checkupReportByClassAndDivision(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
			
			// kitchen Invebtory report between two date
			public String getkitchenInventoryDetailsBetweenTwoDate(HttpServletRequest request, HttpServletResponse response) 
			{
				KitchenInventoryHelper helper = new KitchenInventoryHelper();
				List categories = helper.getkitchenInventoryDetailsBetweenTwoDate(request, response);
				Map<String, List> returnMap = new HashMap<String, List>();
				returnMap.put("list", categories);
				System.out.println("$$$$$$$$$$$$$$$$" + returnMap);
				return toJson(returnMap);
			}
			
			
}


