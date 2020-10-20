package com.srb.bean;

import java.util.Date;

public class hostelmanagementbean {

	private Long pkhostelid;
	private String productName;
	private String supplierName;
	private Double buyPrice;
	private Double quantity;
	private String insertDate;
	private Date storeDate;
	private Double total;
	private Double grossTotal;
	private Double billNo;
	private Long supplier1;
	private Double balanceAmount;
	
	
	
	
	
	
	
	public Long getPkhostelid() {
		return pkhostelid;
	}
	public void setPkhostelid(Long pkhostelid) {
		this.pkhostelid = pkhostelid;
	}
	public Date getStoreDate() {
		return storeDate;
	}
	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}
	public Long getSupplier1() {
		return supplier1;
	}
	public void setSupplier1(Long supplier1) {
		this.supplier1 = supplier1;
	}
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public Double getBillNo() {
		return billNo;
	}
	public void setBillNo(Double billNo) {
		this.billNo = billNo;
	}
	public hostelmanagementbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public hostelmanagementbean(Long pkhostelid, String productName, String supplierName, Double buyPrice,
			Double quantity, String insertDate, Date storeDate, Double total, Double grossTotal, Double billNo,
			Long supplier1, Double balanceAmount) {
		super();
		this.pkhostelid = pkhostelid;
		this.productName = productName;
		this.supplierName = supplierName;
		this.buyPrice = buyPrice;
		this.quantity = quantity;
		this.insertDate = insertDate;
		this.storeDate = storeDate;
		this.total = total;
		this.grossTotal = grossTotal;
		this.billNo = billNo;
		this.supplier1 = supplier1;
		this.balanceAmount = balanceAmount;
	}
	
	
	
}
