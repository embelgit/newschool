package com.srb.helper;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.srb.bean.ExpenditurePaymentDetail;
import com.srb.bean.GetParemtsComplaintRepoprtBean;
import com.srb.dao.ExpenditurePaymentDao;
import com.srb.dao.NoticeInfoDao;
import com.srb.dao.ParentsComplaintDao;
import com.srb.hibernate.NoticeInfoHibernate;
import com.srb.hibernate.ParentsComplaintHibernate;

public class ParentsComplaintHelper {

	//view teacher task
		public void showParentsComplaint(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println("in showTeacherTask helper");
			
			String fk_division_id = request.getParameter("fk_division_id");
			String fk_class_id = request.getParameter("fk_class_id");
			String className = request.getParameter("className"); 
			String division = request.getParameter("divisionName");
			String firstName = request.getParameter("firstName"); 
			String middleName = request.getParameter("middleName"); 
			String lastName = request.getParameter("lastName"); 
			String parentName = request.getParameter("parentName"); 
			String academicYear = request.getParameter("academicYear");
			String task = request.getParameter("task");
			String taskImage = request.getParameter("taskImage");
			
			ParentsComplaintHibernate pc = new ParentsComplaintHibernate();
			
			File file = new File(taskImage);
			byte[] imageData = new byte[(int) file.length()];

			try {
			    FileInputStream fileInputStream = new FileInputStream(file);
			    fileInputStream.read(imageData);
			    fileInputStream.close();
			} catch (Exception e) {
			    e.printStackTrace();
			}
			
			pc.setClassName(className);
			pc.setDivision(division);
			pc.setAcademicYear(academicYear);
			pc.setParentName(parentName);
			pc.setFirstName(firstName);
			pc.setMiddleName(middleName);
			pc.setLastName(lastName);
			pc.setTask(task);
			pc.setFkClassId(Long.parseLong(fk_class_id));
			pc.setFkDivisionId(Long.parseLong(fk_division_id));
			pc.setTaskPic(imageData);
			Date date = new Date();
			pc.setInsertDate(date);
			
			ParentsComplaintDao dao = new ParentsComplaintDao();
			dao.addResult(pc);
			
		}
		
		//parents Comp Report
		public List getParentsCompRep(HttpServletRequest request, HttpServletResponse response) {

			Map<Long, GetParemtsComplaintRepoprtBean> map = new HashMap<Long, GetParemtsComplaintRepoprtBean>();

			ParentsComplaintDao dao = new ParentsComplaintDao();
			List<GetParemtsComplaintRepoprtBean> exp1List = dao.getParentComp();

			return exp1List;

		}
	}
