package com.srb.hibernate;

public class BookStockHibernate {

	private Long pkBookStockId;
	private String bookName;
	private Long quantity;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private String Status;
	
	
	
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Long getPkBookStockId() {
		return pkBookStockId;
	}
	public void setPkBookStockId(Long pkBookStockId) {
		this.pkBookStockId = pkBookStockId;
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
	
	
	
}
