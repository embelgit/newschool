package com.srb.bean;

import java.util.Date;

public class GetBookDetails {

	private Long  pkbookissueid ;
	private String bookName;
	private String pkBookId;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private String buyPrice;
	private String quantity;
	private String grossTotal;
	private Date insertDate;
	private String totalAmount;
	private Long quantityInGrid;
	private String BookIssuedate;
	private String BookReturnDate;
	private Long DateDifference;
	private String Status;
	private String employeeName;
	private String employeename;
	
	
	
	
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public Long getPkbookissueid() {
		return pkbookissueid;
	}
	public void setPkbookissueid(Long pkbookissueid) {
		this.pkbookissueid = pkbookissueid;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Long getDateDifference() {
		return DateDifference;
	}
	public void setDateDifference(Long dateDifference) {
		DateDifference = dateDifference;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public String getBookIssuedate() {
		return BookIssuedate;
	}
	public void setBookIssuedate(String bookIssuedate) {
		BookIssuedate = bookIssuedate;
	}
	public String getBookReturnDate() {
		return BookReturnDate;
	}
	public void setBookReturnDate(String bookReturnDate) {
		BookReturnDate = bookReturnDate;
	}
	public Long getQuantityInGrid() {
		return quantityInGrid;
	}
	public void setQuantityInGrid(Long quantityInGrid) {
		this.quantityInGrid = quantityInGrid;
	}
	public String getPkBookId() {
		return pkBookId;
	}
	public void setPkBookId(String pkBookId) {
		this.pkBookId = pkBookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public String getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(String buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(String grossTotal) {
		this.grossTotal = grossTotal;
	}
	
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public void setInsertDate(Date d) {
		// TODO Auto-generated method stub
		
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	
	
}
