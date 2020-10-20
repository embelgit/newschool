package com.srb.bean;

import java.util.Date;

public class StockManagementBean {

	private String productName;
	private String supplierName;
	private Double buyPrice;
	private Double quantity;
	private String insertDate;
	private Double total;
	private Double grossTotal;
	private Double billNo;
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
	

}
