package com.srb.bean;

public class TeacherLeavebean {

	private String pkleaveId;
	private String firstName;
	private String MiddleName;
	private String LastName;
	private String Leavetype;
	private String firstDate;
	private String LastDate;
	private String Approvedby;
	private String Description;
	private Long ContactNo;
	private Long Pincode;
	private Double payement;
	private String Address;
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
	public String getPkleaveId() {
		return pkleaveId;
	}
	public void setPkleaveId(String pkleaveId) {
		this.pkleaveId = pkleaveId;
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
	
}
