package com.srb.hibernate;

import java.util.Date;

public class AdmissionEnquiryHibernate {
	public Long pkAdmissionEnquiryId;
	public Long fkClassId;
	public Long contactNumber;
	public String studentName;
	public String className;
	public String parentName;
	public String email;
	public String city;
	public String address;
	public String preSchoolN;
	public Date insertDate;
	private String Status;
	private String comments;
	public Long alternateContactNumber;
	
	public AdmissionEnquiryHibernate(Long pkAdmissionEnquiryId, Long fkClassId, Long contactNumber, String studentName,
			String className, String parentName, String email, String city, String address, String preSchoolN,
			Date insertDate, String Status, String comments,Long alternateContactNumber) {
		
		super();
		this.pkAdmissionEnquiryId = pkAdmissionEnquiryId;
		this.fkClassId = fkClassId;
		this.contactNumber = contactNumber;
		this.studentName = studentName;
		this.className = className;
		this.parentName = parentName;
		this.email = email;
		this.city = city;
		this.address = address;
		this.preSchoolN = preSchoolN;
		this.insertDate = insertDate;
		this.Status = Status;
		this.comments = comments;
		this.alternateContactNumber = alternateContactNumber;
	}
	
	public AdmissionEnquiryHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Long getPkAdmissionEnquiryId() {
		return pkAdmissionEnquiryId;
	}
	public void setPkAdmissionEnquiryId(Long pkAdmissionEnquiryId) {
		this.pkAdmissionEnquiryId = pkAdmissionEnquiryId;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPreSchoolN() {
		return preSchoolN;
	}
	public void setPreSchoolN(String preSchoolN) {
		this.preSchoolN = preSchoolN;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getAlternateContactNumber() {
		return alternateContactNumber;
	}
	public void setAlternateContactNumber(Long alternateContactNumber) {
		this.alternateContactNumber = alternateContactNumber;
	}
	
}
