package com.srb.hibernate;

import java.util.Date;

public class HomeWorkTeacherDailyTaskEntryHibernate {

	private byte[] taskPic;
	private String teacherName;
	private String className;
	private String division;
	private String academicYear;
	private String subjectName;
	private String task;
	
	private Long fkTeacherId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long pkTeacherDailyTaskId;
	private Date insertDate;
	
	
	
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getPkTeacherDailyTaskId() {
		return pkTeacherDailyTaskId;
	}
	public void setPkTeacherDailyTaskId(Long pkTeacherDailyTaskId) {
		this.pkTeacherDailyTaskId = pkTeacherDailyTaskId;
	}
	public byte[] getTaskPic() {
		return taskPic;
	}
	public void setTaskPic(byte[] taskPic) {
		this.taskPic = taskPic;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
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
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
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
	

	
}
