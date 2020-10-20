package com.srb.hibernate;

public class ClassInfoHibernate {
	
	private Long pkClassId;
	private String clas;
	private String classRoom;
	
	public ClassInfoHibernate(Long pkClassId, String clas, String classRoom) {
		super();
		this.pkClassId = pkClassId;
		this.clas = clas;
		this.classRoom = classRoom;
	}
	public ClassInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkClassId() {
		return pkClassId;
	}
	public void setPkClassId(Long pkClassId) {
		this.pkClassId = pkClassId;
	}
	public String getClas() {
		return clas;
	}
	public void setClas(String clas) {
		this.clas = clas;
	}
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	
	
}
