package com.srb.bean;

public class StudentCheckUpBean 
{
	private String fName;
	private String lName;
	private String diagnosis;
	private String rmk;
	private String className;
	private String divisionName;
	private String treatment;
	
	private long pk_id;
	
	
	
	
	public long getPk_id() {
		return pk_id;
	}
	public void setPk_id(long pk_id) {
		this.pk_id = pk_id;
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
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getRmk() {
		return rmk;
	}
	public void setRmk(String rmk) {
		this.rmk = rmk;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	
	
	

}
