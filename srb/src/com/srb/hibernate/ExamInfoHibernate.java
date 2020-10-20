package com.srb.hibernate;

import java.util.Date;

public class ExamInfoHibernate {

	private Long pkExamId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long fkSubjectId;
	private Long clas;
	private String className;
	private String division;
	private String subject;
	private String academicYear;
	private String subjectName;
	private Long totalMarks;
	private Long passingMarks;
	private String examName;
	private Date insertDate;
	private Long fkExamNameId;


	public ExamInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamInfoHibernate(Long pkExamId, Long fkClassId, Long fkDivisionId,
			Long fkSubjectId, Long clas, String className, String division,
			String subject, String academicYear, String subjectName,
			Long totalMarks, Long passingMarks, String examName,
			Date insertDate, Long fkExamNameId) {
		super();
		this.pkExamId = pkExamId;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.fkSubjectId = fkSubjectId;
		this.clas = clas;
		this.className = className;
		this.division = division;
		this.subject = subject;
		this.academicYear = academicYear;
		this.subjectName = subjectName;
		this.totalMarks = totalMarks;
		this.passingMarks = passingMarks;
		this.examName = examName;
		this.insertDate = insertDate;
		this.fkExamNameId = fkExamNameId;
	}
	public Long getFkExamNameId() {
		return fkExamNameId;
	}
	public void setFkExamNameId(Long fkExamNameId) {
		this.fkExamNameId = fkExamNameId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public Long getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(Long totalMarks) {
		this.totalMarks = totalMarks;
	}
	public Long getPassingMarks() {
		return passingMarks;
	}
	public void setPassingMarks(Long passingMarks) {
		this.passingMarks = passingMarks;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Long getPkExamId() {
		return pkExamId;
	}
	public void setPkExamId(Long pkExamId) {
		this.pkExamId = pkExamId;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getFkDivisionId() {
		return fkDivisionId;
	}
	public void setFkDivisionId(Long fkDivisionId) {
		this.fkDivisionId = fkDivisionId;
	}
	public Long getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Long fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public Long getClas() {
		return clas;
	}
	public void setClas(Long clas) {
		this.clas = clas;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public void setDob1(Date dateOfBirth) {
		// TODO Auto-generated method stub
		
	}
	public void setDob(Date dateOfAdmission) {
		// TODO Auto-generated method stub
		
	}
	
	
}