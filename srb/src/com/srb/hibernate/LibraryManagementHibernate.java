package com.srb.hibernate;

import java.util.Date;

public class LibraryManagementHibernate {

	public Long pkBookEntryManagementId;
	private String bookName;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private Double buyPrice;
	private Long quantity;
	private Double grossTotal;
	private Date insertDate;
	private Double totalAmount;
	
	private Long fkSupplierId;
	private Long billNo; 
	private Double Total;
	private Double balanceamount;
	
	
	
	
	public Double getTotal() {
		return Total;
	}
	public void setTotal(Double total) {
		Total = total;
	}
	public Double getBalanceamount() {
		return balanceamount;
	}
	public void setBalanceamount(Double balanceamount) {
		this.balanceamount = balanceamount;
	}
	public Long getFkSupplierId() {
		return fkSupplierId;
	}
	public void setFkSupplierId(Long fkSupplierId) {
		this.fkSupplierId = fkSupplierId;
	}
	public Long getBillNo() {
		return billNo;
	}
	public void setBillNo(Long billNo) {
		this.billNo = billNo;
	}

	public Long getPkBookEntryManagementId() {
		return pkBookEntryManagementId;
	}
	public void setPkBookEntryManagementId(Long pkBookEntryManagementId) {
		this.pkBookEntryManagementId = pkBookEntryManagementId;
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
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	
}
