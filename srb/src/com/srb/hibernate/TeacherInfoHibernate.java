package com.srb.hibernate;

import java.util.Date;

public class TeacherInfoHibernate {
	
	private Long pkTeacherId;
	private String designation;
	private String firstName;
	private String middleName;
	private String accountNumber;
	private String bankName;
	private String ifsc;
	private String aadharNumber;
	private String lastName;
	private Date dob;
	
	private String hquqlification;
	private Date jdate;
	
	private String specialization;
	private Double percentage;
	
	private Long mobnum;
	private Long landno;
	
    private String perAddress;
    private String preAddress;
    private String panNumber;
    private String epfNumber;
    private String ptNumber;
    private Date insertDate;
    private String Salary ;
	
    public TeacherInfoHibernate(Long pkTeacherId, String designation, String firstName, String middleName,
			String accountNumber, String bankName, String ifsc, String aadharNumber, String lastName, Date dob,
			String hquqlification, Date jdate, String specialization, Double percentage, Long mobnum, Long landno,
			String perAddress, String preAddress, String panNumber, String epfNumber, String ptNumber,
			Date insertDate, String Salary) {
		super();
		this.pkTeacherId = pkTeacherId;
		this.designation = designation;
		this.firstName = firstName;
		this.middleName = middleName;
		this.accountNumber = accountNumber;
		this.bankName = bankName;
		this.ifsc = ifsc;
		this.aadharNumber = aadharNumber;
		this.lastName = lastName;
		this.dob = dob;
		this.hquqlification = hquqlification;
		this.jdate = jdate;
		this.specialization = specialization;
		this.percentage = percentage;
		this.mobnum = mobnum;
		this.landno = landno;
		this.perAddress = perAddress;
		this.preAddress = preAddress;
		this.panNumber = panNumber;
		this.epfNumber = epfNumber;
		this.ptNumber = ptNumber;
		this.insertDate = insertDate;
		this.Salary =Salary;
	}
	public String getSalary() {
		return Salary;
	}
	public void setSalary(String salary) {
		Salary = salary;
	}
	public TeacherInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkTeacherId() {
		return pkTeacherId;
	}
	public void setPkTeacherId(Long pkTeacherId) {
		this.pkTeacherId = pkTeacherId;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public String getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getHquqlification() {
		return hquqlification;
	}
	public void setHquqlification(String hquqlification) {
		this.hquqlification = hquqlification;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public Double getPercentage() {
		return percentage;
	}
	public void setPercentage(Double percentage) {
		this.percentage = percentage;
	}
	public Long getMobnum() {
		return mobnum;
	}
	public void setMobnum(Long mobnum) {
		this.mobnum = mobnum;
	}
	public Long getLandno() {
		return landno;
	}
	public void setLandno(Long landno) {
		this.landno = landno;
	}
	public String getPerAddress() {
		return perAddress;
	}
	public void setPerAddress(String perAddress) {
		this.perAddress = perAddress;
	}
	public String getPreAddress() {
		return preAddress;
	}
	public void setPreAddress(String preAddress) {
		this.preAddress = preAddress;
	}
	public String getPanNumber() {
		return panNumber;
	}
	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}
	public String getEpfNumber() {
		return epfNumber;
	}
	public void setEpfNumber(String epfNumber) {
		this.epfNumber = epfNumber;
	}
	public String getPtNumber() {
		return ptNumber;
	}
	public void setPtNumber(String ptNumber) {
		this.ptNumber = ptNumber;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
    
}
