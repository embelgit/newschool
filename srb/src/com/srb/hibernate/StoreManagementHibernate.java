package com.srb.hibernate;

import java.util.Date;

public class StoreManagementHibernate 
{
	private Long pkStoreManagementId;
	//private Long fkDivisionId;
	private String productName;
	private String supplierName;
	private Double buyPrice;
	private Double quantity;
	private Date insertDate;
	private Date storeDate;
	private Double total;
	private Double grossTotal;
	private Double billNo;
	private Long supplier1;
	private Double balanceAmount;
	private Double gst;
	private Double gstamt;
	
	
	
	
	
	public StoreManagementHibernate(Long pkStoreManagementId, String productName, String supplierName, Double buyPrice,
			Double quantity, Date insertDate, Date storeDate, Double total, Double grossTotal, Double billNo, Long supplier1, Double gst, Double gstamt) {
		super();
		this.pkStoreManagementId = pkStoreManagementId;
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
		this.gst = gst;
		this.gstamt = gstamt;
		
	}
	public StoreManagementHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	public Double getGstamt() {
		return gstamt;
	}
	public void setGstamt(Double gstamt) {
		this.gstamt = gstamt;
	}
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Long getPkStoreManagementId() {
		return pkStoreManagementId;
	}
	public void setPkStoreManagementId(Long pkStoreManagementId) {
		this.pkStoreManagementId = pkStoreManagementId;
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Date getStoreDate() {
		return storeDate;
	}
	public Long getSupplier1() {
		return supplier1;
	}
	public void setSupplier1(Long supplier1) {
		this.supplier1 = supplier1;
	}
	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
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
	
	
}
