package com.srb.hibernate;

import java.util.Date;

public class ExamTimeTableHibernate {
	private Long pkExamTimeTableId;
	private Long fkSubjectId;
	private Long fkTeacherId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long fkExamNameId;
	private String teacherName;
	private String subjetName;
	private String startTime;
	private String examName;
	private String endTime;
	private String className;
	private String divisionName;
	private String academicYear;
	private String weekDay;
	private Date examDate;
	public Long getPkExamTimeTableId() {
		return pkExamTimeTableId;
	}
	public void setPkExamTimeTableId(Long pkExamTimeTableId) {
		this.pkExamTimeTableId = pkExamTimeTableId;
	}
	public Long getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Long fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public Long getFkTeacherId() {
		return fkTeacherId;
	}
	public void setFkTeacherId(Long fkTeacherId) {
		this.fkTeacherId = fkTeacherId;
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
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getSubjetName() {
		return subjetName;
	}
	public void setSubjetName(String subjetName) {
		this.subjetName = subjetName;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public String getWeekDay() {
		return weekDay;
	}
	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public Long getFkExamNameId() {
		return fkExamNameId;
	}
	public void setFkExamNameId(Long fkExamNameId) {
		this.fkExamNameId = fkExamNameId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	
	
}
