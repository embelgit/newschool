package com.srb.bean;

import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


public class MeetingScheduleBean  {
	private Long pkScheduleMeetingsId;
	private Long fkclassId;
	private Long fkDivId;
	private String message;
	private String insertDate;
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
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}


}
