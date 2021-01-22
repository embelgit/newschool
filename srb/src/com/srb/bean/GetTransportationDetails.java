package com.srb.bean;

import java.util.Date;

public class GetTransportationDetails {
	//private String pkleaveId;
	private Long pkTranspaymentId;
	private String studentName;
	private Long fkclassId;
	private Long fkdivisionId;
	private String firstName;
	private String MiddleName;
	private String LastName;
	private String className;
	private String divisionName;
	private int ChargesPerKm;
	
	public Long getPkTranspaymentId() {
		return pkTranspaymentId;
	}
	public void setPkTranspaymentId(Long pkTranspaymentId) {
		this.pkTranspaymentId = pkTranspaymentId;
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
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	private String division;
	private String Leavetype;
	private String firstDate;
	private String LastDate;
	private String Approvedby;
	public Long getFkclassId() {
		return fkclassId;
	}
	public void setFkclassId(Long fkclassId) {
		this.fkclassId = fkclassId;
	}
	public Long getFkdivisionId() {
		return fkdivisionId;
	}
	public void setFkdivisionId(Long fkdivisionId) {
		this.fkdivisionId = fkdivisionId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return MiddleName;
	}
	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getLeavetype() {
		return Leavetype;
	}
	public void setLeavetype(String leavetype) {
		Leavetype = leavetype;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getLastDate() {
		return LastDate;
	}
	public void setLastDate(String lastDate) {
		LastDate = lastDate;
	}
	public String getApprovedby() {
		return Approvedby;
	}
	public void setApprovedby(String approvedby) {
		Approvedby = approvedby;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	public String getDriverName() {
		return DriverName;
	}
	public void setDriverName(String driverName) {
		DriverName = driverName;
	}
	
	public String getLeaveDateTo() {
		return leaveDateTo;
	}
	public void setLeaveDateTo(String leaveDateTo) {
		this.leaveDateTo = leaveDateTo;
	}
	public Long getContactNo() {
		return ContactNo;
	}
	public void setContactNo(Long contactNo) {
		ContactNo = contactNo;
	}
	public Long getPincode() {
		return Pincode;
	}
	public void setPincode(Long pincode) {
		Pincode = pincode;
	}
	public Double getPayement() {
		return payement;
	}
	public void setPayement(Double payement) {
		this.payement = payement;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	private String Description;
	private String leaveDateFrom;
	public String getLeaveDateFrom() {
		return leaveDateFrom;
	}
	public void setLeaveDateFrom(String leaveDateFrom) {
		this.leaveDateFrom = leaveDateFrom;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getChargesPerKm() {
		return ChargesPerKm;
	}
	public void setChargesPerKm(int chargesPerKm) {
		ChargesPerKm = chargesPerKm;
	}
	private String DriverName;
	private  String leaveDateTo;
	private Long ContactNo;
	private Long Pincode;
	private Double payement;
	private String Address;
}
