package com.srb.hibernate;

import java.util.Date;

public class DivisionInfoHibernate {
	private Long pkDivisionId;
	private String division;
	private String classRoom;
	private Long fkClassId;
	private Date insertDate;

	
	public DivisionInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DivisionInfoHibernate(Long pkDivisionId, String division,
			String classRoom, Long fkClassId, Date insertDate) {
		super();
		this.pkDivisionId = pkDivisionId;
		this.division = division;
		this.classRoom = classRoom;
		this.fkClassId = fkClassId;
		this.insertDate = insertDate;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getPkDivisionId() {
		return pkDivisionId;
	}
	public void setPkDivisionId(Long pkDivisionId) {
		this.pkDivisionId = pkDivisionId;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	

}
