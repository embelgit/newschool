package com.srb.hibernate;

public class StudentCheckUpHibernate
{
	private Long pkStudCheckUpId;
	
	private Long fkClassId;
	private Long fkDivisionId;
	private String firstName;
	private String lastName;
	private String diagnosis;
	private String remark;
	private String treatment;
	private String className;
	private String divisionName;
	
	
	
	
	
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
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
	public Long getPkStudCheckUpId() {
		return pkStudCheckUpId;
	}
	public void setPkStudCheckUpId(Long pkStudCheckUpId) {
		this.pkStudCheckUpId = pkStudCheckUpId;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getFkDivisionId() {
		return fkDivisionId;
	}
	public void setFkDivisionId(Long fkDivisionId) {
		this.fkDivisionId = fkDivisionId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	

}
