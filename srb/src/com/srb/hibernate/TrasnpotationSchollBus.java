package com.srb.hibernate;

import java.util.Date;

public class TrasnpotationSchollBus {

	
	private Long pkTrasnpotationSchollBusId;
	private String leaveDateFrom;
	//private Date leaveDateFrom;
	private String DriverName;
	//private  Date leaveDateTo;
	private  String leaveDateTo;
	private Long ContactNo;
	private Long Pincode;
	private Double payement;
	private String Address;
	private Long fkclassid;
	private Long fkdivisionid;
	private Long studentid;
	private String studentName;
	
	
	public Long getStudentid() {
		return studentid;
	}
	public void setStudentid(Long studentid) {
		this.studentid = studentid;
	}
	public String getLeaveDateFrom() {
		return leaveDateFrom;
	}
	public void setLeaveDateFrom(String leaveDateFrom) {
		this.leaveDateFrom = leaveDateFrom;
	}
	public String getLeaveDateTo() {
		return leaveDateTo;
	}
	public void setLeaveDateTo(String leaveDateTo) {
		this.leaveDateTo = leaveDateTo;
	}
	public Long getPkTrasnpotationSchollBusId() {
		return pkTrasnpotationSchollBusId;
	}
	public void setPkTrasnpotationSchollBusId(Long pkTrasnpotationSchollBusId) {
		this.pkTrasnpotationSchollBusId = pkTrasnpotationSchollBusId;
	}
	
	public String getDriverName() {
		return DriverName;
	}
	public void setDriverName(String driverName) {
		DriverName = driverName;
	}
	
	/*
	 * public Date getLeaveDateFrom() { return leaveDateFrom; } public void
	 * setLeaveDateFrom(Date dateOf) { this.leaveDateFrom = dateOf; } public Date
	 * getLeaveDateTo() { return leaveDateTo; } public void setLeaveDateTo(Date
	 * joining) { this.leaveDateTo = joining; }
	 */
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
	public Long getFkclassid() {
		return fkclassid;
	}
	public void setFkclassid(Long fkclassid) {
		this.fkclassid = fkclassid;
	}
	public Long getFkdivisionid() {
		return fkdivisionid;
	}
	public void setFkdivisionid(Long fkdivisionid) {
		this.fkdivisionid = fkdivisionid;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	

	
	
	
	
	
}
