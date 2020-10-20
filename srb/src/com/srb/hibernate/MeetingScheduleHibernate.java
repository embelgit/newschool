package com.srb.hibernate;

import java.util.Date;

public class MeetingScheduleHibernate {

	private Long pkScheduleMeetingsId;
	private Long fkclassId;
	private Long fkDivId;
	private String message;
	private Date insertDate;
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
	
	
}
