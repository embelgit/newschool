package com.srb.hibernate;

import java.util.Date;

public class BookReturnHibernate {
	private Long pkBookReturnId;
	private String bookName;
	private Long quantity;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private Long fkDivId;
	private Long fkCatId;
	private Long studentId;
	private Date insertDate;
	private String BookissueDateReturn;
	private String BookReturneDateReturn;
	private String LateCharges;
	private Date BookReturneDateNew;
	private Long TeacherIssueReturnId;
	private String Status;
	private Long pkBookIssueId;
	
	
	
	
	
	
	public Long getPkBookIssueId() {
		return pkBookIssueId;
	}
	public void setPkBookIssueId(Long pkBookIssueId) {
		this.pkBookIssueId = pkBookIssueId;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Long getTeacherIssueReturnId() {
		return TeacherIssueReturnId;
	}
	public void setTeacherIssueReturnId(Long teacherIssueReturnId) {
		TeacherIssueReturnId = teacherIssueReturnId;
	}
	public String getLateCharges() {
		return LateCharges;
	}
	public void setLateCharges(String lateCharges) {
		LateCharges = lateCharges;
	}
	public Date getBookReturneDateNew() {
		return BookReturneDateNew;
	}
	public void setBookReturneDateNew(Date bookReturneDateNew) {
		BookReturneDateNew = bookReturneDateNew;
	}
	public String getBookReturneDateReturn() {
		return BookReturneDateReturn;
	}
	public void setBookReturneDateReturn(String bookReturneDateReturn) {
		BookReturneDateReturn = bookReturneDateReturn;
	}
	public String getBookissueDateReturn() {
		return BookissueDateReturn;
	}
	public void setBookissueDateReturn(String bookissueDateReturn) {
		BookissueDateReturn = bookissueDateReturn;
	}
	public Long getPkBookReturnId() {
		return pkBookReturnId;
	}
	public void setPkBookReturnId(Long pkBookReturnId) {
		this.pkBookReturnId = pkBookReturnId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getPublisherName() {
		return publisherName;
	}
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	public Long getFkDivId() {
		return fkDivId;
	}
	public void setFkDivId(Long fkDivId) {
		this.fkDivId = fkDivId;
	}
	public Long getFkCatId() {
		return fkCatId;
	}
	public void setFkCatId(Long fkCatId) {
		this.fkCatId = fkCatId;
	}
	public Long getStudentId() {
		return studentId;
	}
	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	
}
