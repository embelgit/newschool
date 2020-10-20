package com.srb.hibernate;

import java.util.Date;

public class ParentsComplaintHibernate {
	private byte[] taskPic;
	private String className;
	private String division;
	private String academicYear;
	private String firstName;
	private String middleName;
	private String lastName;
	private String parentName;
	private String task;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long pkParentsComplaintId;
	private Date insertDate;
	public ParentsComplaintHibernate(byte[] taskPic, String className, String division, String academicYear,
			String firstName, String middleName, String lastName, String parentName, String task, Long fkClassId,
			Long fkDivisionId, Long pkParentsComplaintId, Date insertDate) {
		super();
		this.taskPic = taskPic;
		this.className = className;
		this.division = division;
		this.academicYear = academicYear;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.parentName = parentName;
		this.task = task;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.pkParentsComplaintId = pkParentsComplaintId;
		this.insertDate = insertDate;
	}
	public ParentsComplaintHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public byte[] getTaskPic() {
		return taskPic;
	}
	public void setTaskPic(byte[] taskPic) {
		this.taskPic = taskPic;
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
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
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
	public Long getPkParentsComplaintId() {
		return pkParentsComplaintId;
	}
	public void setPkParentsComplaintId(Long pkParentsComplaintId) {
		this.pkParentsComplaintId = pkParentsComplaintId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	

}
