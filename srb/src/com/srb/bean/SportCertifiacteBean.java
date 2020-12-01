package com.srb.bean;

import java.sql.Date;

public class SportCertifiacteBean {
	private Long pkSportId;
	private Long fkdivId;
	private Long fkclassId;
	private Long fkstudid;
	private String insertDate;
	private String sportName;
	private String grade;
	public Long getPkSportId() {
		return pkSportId;
	}
	public void setPkSportId(Long pkSportId) {
		this.pkSportId = pkSportId;
	}
	public Long getFkdivId() {
		return fkdivId;
	}
	public void setFkdivId(Long fkdivId) {
		this.fkdivId = fkdivId;
	}
	public Long getFkclassId() {
		return fkclassId;
	}
	public void setFkclassId(Long fkclassId) {
		this.fkclassId = fkclassId;
	}
	public Long getFkstudid() {
		return fkstudid;
	}
	public void setFkstudid(Long fkstudid) {
		this.fkstudid = fkstudid;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getSportName() {
		return sportName;
	}
	public void setSportName(String sportName) {
		this.sportName = sportName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}

}
