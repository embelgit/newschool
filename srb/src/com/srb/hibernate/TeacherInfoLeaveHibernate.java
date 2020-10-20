package com.srb.hibernate;

import java.util.Date;

public class TeacherInfoLeaveHibernate {

	private Long pkTeacherLeaveId;
	private String LeaveType;
	private Long FkTeacherid;
	private Date  FirstDate;
	private Date LastDate;
	private String ApprovedBy;
	private String Description;
	private String teacher;
	
	
    public TeacherInfoLeaveHibernate(Long pkTeacherLeaveId, String LeaveType,  Date FirstDate, Date LastDate, String ApprovedBy, String Description, Long FkTeacherid, String teacher ) {
		super();
		this.pkTeacherLeaveId = pkTeacherLeaveId;
		this.LeaveType = LeaveType;
		this.FkTeacherid = FkTeacherid;
		this.FirstDate = FirstDate;
		this.LastDate = LastDate;
		this.ApprovedBy = ApprovedBy;
		this.Description = Description;
		this.teacher = teacher;
		
		
	}
	
    
    
	public String getTeacher() {
		return teacher;
	}



	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}



	public Long getFkTeacherid() {
		return FkTeacherid;
	}

	public void setFkTeacherid(Long fkTeacherid) {
		FkTeacherid = fkTeacherid;
	}

	public TeacherInfoLeaveHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getPkTeacherLeaveId() {
		return pkTeacherLeaveId;
	}

	public void setPkTeacherLeaveId(Long pkTeacherLeaveId) {
		this.pkTeacherLeaveId = pkTeacherLeaveId;
	}

	public String getLeaveType() {
		return LeaveType;
	}

	public void setLeaveType(String leaveType) {
		LeaveType = leaveType;
	}

	

	public Date getFirstDate() {
		return FirstDate;
	}

	public void setFirstDate(Date firstDate) {
		FirstDate = firstDate;
	}

	public Date getLastDate() {
		return LastDate;
	}

	public void setLastDate(Date lastDate) {
		LastDate = lastDate;
	}

	public String getApprovedBy() {
		return ApprovedBy;
	}

	public void setApprovedBy(String approvedBy) {
		ApprovedBy = approvedBy;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}


	
    
}
