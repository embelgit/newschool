package com.srb.hibernate;

import java.util.Date;

public class SportcertificateHibernate {
	private Long pkSportId;
	private Long fkdivId;
	private Long fkclassId;
	private Long fkstudid;
	private Date insertDate;
	private String sportName;
	private String gradename;
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getSportName() {
		return sportName;
	}
	public void setSportName(String sportName) {
		this.sportName = sportName;
	}
	
	

}
