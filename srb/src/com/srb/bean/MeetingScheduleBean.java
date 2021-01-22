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
	private String className;
	private String divisionName;
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
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
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
