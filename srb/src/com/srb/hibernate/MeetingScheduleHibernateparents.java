package com.srb.hibernate;

import java.util.Date;

public class MeetingScheduleHibernateparents {

	
	private Long pkScheduleMeetingsId;
	private Long fkclassId;
	private Long fkDivId;
	private String message;
	private Date insertDate;
	private String startTime;
	private String endTime;
	
	public Long getPkScheduleMeetingsId() {
		return pkScheduleMeetingsId;
	}
	public void setPkScheduleMeetingsId(Long pkScheduleMeetingsId) {
		this.pkScheduleMeetingsId = pkScheduleMeetingsId;
	}
	public Long getFkclassId() {
		return fkclassId;
	}
	public void setFkclassId(Long fkclassId) {
		this.fkclassId = fkclassId;
	}
	public Long getFkDivId() {
		return fkDivId;
	}
	public void setFkDivId(Long fkDivId) {
		this.fkDivId = fkDivId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
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
	
	
}
