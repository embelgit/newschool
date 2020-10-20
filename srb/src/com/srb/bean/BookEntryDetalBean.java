package com.srb.bean;
import java.util.Date;
public class BookEntryDetalBean {

	
	public Long pkBookEntryManagementId;
	private String bookName;
	private String supplierName;
	private String authorName;
	private String publisherName;
	private Double buyPrice;
	private Long quantity;
	private Double grossTotal;
	private String insertDate;
	private Double totalAmount;
	private String firstName;
	private String MiddleName;
	private String LastName;
	private String BookIssueDate;
	private String BookRetutndate;
	
	private Long fkSupplierId;
	private Long billNo; 
	private Double Total;
	private Double balanceamount;
	
	private int srNo;
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
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
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
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
	public String getBookIssueDate() {
		return BookIssueDate;
	}
	public void setBookIssueDate(String bookIssueDate) {
		BookIssueDate = bookIssueDate;
	}
	public String getBookRetutndate() {
		return BookRetutndate;
	}
	public void setBookRetutndate(String bookRetutndate) {
		BookRetutndate = bookRetutndate;
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
}
