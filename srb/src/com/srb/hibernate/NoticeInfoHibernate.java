package com.srb.hibernate;

import java.util.Date;

public class NoticeInfoHibernate {
	private String className;
	private String division;
	private String academicYear;
	private String task;
	
	private Long fkClassId;
	private Long fkDivisionId;
	private Long pkNoticeId;
	private Date noticeDate;
	public NoticeInfoHibernate(String className, String division, String academicYear, String task, Long fkClassId,
			Long fkDivisionId, Long pkNoticeId, Date noticeDate) {
		super();
		this.className = className;
		this.division = division;
		this.academicYear = academicYear;
		this.task = task;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.pkNoticeId = pkNoticeId;
		this.noticeDate = noticeDate;
	}
	public NoticeInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
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
	public Long getPkNoticeId() {
		return pkNoticeId;
	}
	public void setPkNoticeId(Long pkNoticeId) {
		this.pkNoticeId = pkNoticeId;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	

}
