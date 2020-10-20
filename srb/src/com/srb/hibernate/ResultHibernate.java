package com.srb.hibernate;

import java.util.Date;

public class ResultHibernate {

	private Long pkResultId;
	private Long fkClassId;
	private Long fkDivId;
	private Long fkExamId;
	private Long fkStudentId;
	private Long fkSubjectId;
	private Long passingMarks;
	private Long obtainedMarks;
	private Long totalMarks;
	private String firstName;
	private String middleName;
	private String lastName;
	private String academicYear;
	private String subjectName;
	private String examName;
	private String className;
	private String divisionName;
	private Date insertDate;
	public Long getPkResultId() {
		return pkResultId;
	}
	public void setPkResultId(Long pkResultId) {
		this.pkResultId = pkResultId;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getFkDivId() {
		return fkDivId;
	}
	public void setFkDivId(Long fkDivId) {
		this.fkDivId = fkDivId;
	}
	public Long getFkExamId() {
		return fkExamId;
	}
	public void setFkExamId(Long fkExamId) {
		this.fkExamId = fkExamId;
	}
	public Long getFkStudentId() {
		return fkStudentId;
	}
	public void setFkStudentId(Long fkStudentId) {
		this.fkStudentId = fkStudentId;
	}
	public Long getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Long fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public Long getPassingMarks() {
		return passingMarks;
	}
	public void setPassingMarks(Long passingMarks) {
		this.passingMarks = passingMarks;
	}
	
	public Long getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(Long totalMarks) {
		this.totalMarks = totalMarks;
	}
	public Long getObtainedMarks() {
		return obtainedMarks;
	}
	public void setObtainedMarks(Long obtainedMarks) {
		this.obtainedMarks = obtainedMarks;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDivisionName() {
		return divisionName;
	}
	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}
	
	
	
}
