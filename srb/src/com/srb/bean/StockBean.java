package com.srb.bean;

public class StockBean 
{
	private String bookName;
	private Long Quantity;
	private String authorName;
	private String publisherName;
	private int srNo;
	
	
	
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Long getQuantity() {
		return Quantity;
	}
	public void setQuantity(Long quantity) {
		Quantity = quantity;
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
