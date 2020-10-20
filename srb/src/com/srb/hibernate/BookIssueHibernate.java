package com.srb.hibernate;

import java.util.Date;

public class BookIssueHibernate {

	private Long pkBookIssueId;
	private String bookName;
	private Long quantity;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private Long fkDivId;
	private Long fkCatId;
	private Long studentId;
	private Date dateOfBookIssue;
	private Date insertDate;
	private String isStudentActive;
	private  String BookissueDate;
	private String BookReturneDate;
	private Long TeacherIssueId;
	
	
	
	public Long getTeacherIssueId() {
		return TeacherIssueId;
	}
	public void setTeacherIssueId(Long teacherIssueId) {
		TeacherIssueId = teacherIssueId;
	}
	
	public String getBookissueDate() {
		return BookissueDate;
	}
	public void setBookissueDate(String bookissueDate) {
		BookissueDate = bookissueDate;
	}
	public String getBookReturneDate() {
		return BookReturneDate;
	}
	public void setBookReturneDate(String bookReturneDate) {
		BookReturneDate = bookReturneDate;
	}
	public String getIsStudentActive() {
		return isStudentActive;
	}
	public void setIsStudentActive(String isStudentActive) {
		this.isStudentActive = isStudentActive;
	}
	public Long getPkBookIssueId() {
		return pkBookIssueId;
	}
	public void setPkBookIssueId(Long pkBookIssueId) {
		this.pkBookIssueId = pkBookIssueId;
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
	public Date getDateOfBookIssue() {
		return dateOfBookIssue;
	}
	public void setDateOfBookIssue(Date dateOfBookIssue) {
		this.dateOfBookIssue = dateOfBookIssue;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	
}
