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

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.helper.SubjectInfoHelper;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.dao.ExamTimeTableDAO;
import com.srb.dao.ProductDetailsDao;
import com.srb.dao.SubjectInfoDao;
import com.srb.dao.SubjectWiseSyllabusEntryDAO;
import com.srb.dao.TeacherDailyTaskEntryDao;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.hibernate.SubjectWiseSyllabusEntryHibernate;
import com.srb.hibernate.TeacherDailyTaskEntryHibernate;
import com.srb.utility.HibernateUtility;

public class SubjectInfoHelper {
	// for subject detail
				public void doSubjectInfo(HttpServletRequest request,
						HttpServletResponse response) {
					String subject = request.getParameter("subject");
					
					SubjectInfoHibernate suf = new SubjectInfoHibernate();
					
					suf.setSubject(subject);
					

					SubjectInfoDao dao = new SubjectInfoDao();
					dao.SubjectInfoHibernate(suf);
					
				}

				//update
				public void updatesubjectInfoDetail(HttpServletRequest request,
						HttpServletResponse response) {

					String subid = request.getParameter("subid");
					String subname = request.getParameter("subname");
					

					com.srb.utility.HibernateUtility hbu=null;
					Session session = null;
					Transaction transaction = null;
					
					 hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					 transaction = session.beginTransaction();
				
					//long customerId = Long.parseLong(customerId);
					long classId =Long.parseLong(subid);
					
					SubjectInfoHibernate det = (SubjectInfoHibernate) session.load(SubjectInfoHibernate.class, classId);
					
					det.setSubject(subname);
					
				    session.saveOrUpdate(det);
					System.out.println("obj save - "+subname);
				    transaction.commit();
					
				
					
				}
				
				
	//for Subject wise syllabus entry			
				public void addSubjectWiseSyllabi(HttpServletRequest request,
						HttpServletResponse response) {
					
					String className = request.getParameter("className");
					String division = request.getParameter("division");
					String subject = request.getParameter("subject");
					String teacherName = request.getParameter("teacherName");
					String academicYear = request.getParameter("academicYear");
					String syllabus = request.getParameter("syllabus");
					String syllabusFile = request.getParameter("syllabusFile");
					String fkDivisionId = request.getParameter("fkDivisionId");
					String fkteacherid = request.getParameter("fkteacherid");
					String fkClassId = request.getParameter("fkClassId");

					File file = new File(syllabusFile);
					byte[] imageData = new byte[(int) file.length()];

					try {
					    FileInputStream fileInputStream = new FileInputStream(file);
					    fileInputStream.read(imageData);
					    fileInputStream.close();
					} catch (Exception e) {
					    e.printStackTrace();
					}
					
					
					SubjectWiseSyllabusEntryHibernate b = new SubjectWiseSyllabusEntryHibernate();
					b.setSyllabusFile(imageData);
					b.setClassName(className);
					b.setDivision(division);
					b.setAcademicYear(academicYear);
					b.setSubjectName(subject);
					b.setTeacherName(teacherName);
					b.setSyllabus(syllabus);
					b.setFkClassId(Long.parseLong(fkClassId));
					b.setFkDivisionId(Long.parseLong(fkDivisionId));
					b.setFkTeacherId(Long.parseLong(fkteacherid));
					Date date = new Date();
					b.setInsertDate(date);
					
					SubjectWiseSyllabusEntryDAO dao = new SubjectWiseSyllabusEntryDAO();
					dao.addSubjectWiseSyllabus(b);
					
				}
				
                   //view subject wise syllabus
				public List showSyllabusFile(HttpServletRequest request,
						HttpServletResponse response) {

					System.out.println("in showTeacherTask helper");
					
					String fkClassId = request.getParameter("classId");
					String fkDivisionId = request.getParameter("divId");
					String subject = request.getParameter("subjectName");
					String fkteacherid = request.getParameter("teacherId");
					String academicYear = request.getParameter("academicYear");
					
//					Long teacherId = Long.parseLong(fkteacherid);
//					Long divId = Long.parseLong(fkDivisionId);
//					Long classId = Long.parseLong(fkClassId);
					
/*					HttpSession sessionToViewTask = request.getSession();
					
					sessionToViewTask.setAttribute("fkClassIdToViewSyllabus", classId);
					sessionToViewTask.setAttribute("fkDivisionIdToViewSyllabus", divId);
					sessionToViewTask.setAttribute("subjectToViewSyllabus", subject);
					sessionToViewTask.setAttribute("fkteacheridToViewSyllabus", teacherId);
					sessionToViewTask.setAttribute("academicYearToViewSyllabus", academicYear);*/
					
	//		         Map<Long,SubjectWiseSyllabusEntryHibernate> map = new HashMap<Long,SubjectWiseSyllabusEntryHibernate>();
			  		
			         SubjectInfoDao dao = new SubjectInfoDao();        
			 		List<SubjectWiseSyllabusEntryHibernate> expList = dao.getsubjectwiseInfo(fkClassId,fkDivisionId,subject,fkteacherid);
			 		return expList;
					
				}
				//del sub
				public void deleteSubject(HttpServletRequest request, HttpServletResponse response ) {
					String fk_subject_id = request.getParameter("fk_subject_id");
					System.out.println("hi this is del helper fk_subject_id - "+fk_subject_id);
					SubjectInfoDao dao2 = new SubjectInfoDao();
					dao2.deletesubject(fk_subject_id);
						
					}
}
