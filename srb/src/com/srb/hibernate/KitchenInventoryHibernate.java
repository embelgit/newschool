package com.srb.hibernate;

import java.util.Date;

public class KitchenInventoryHibernate 
{
	
	private Long pkKitchenInvId;

	private Long fkSupplierId;
	
	private String billNo;
	private Date date;
	private String suppilerName;
	private String productName;
	
	private String unit;
	private Long Quantity;
	private Double buyPrice;
	private Double total;
	private Double grossTotal;
	
	private Double subTotal;
	private Long gst;
	private Double gstAmount;
	
	private Long fkProductId;
	private Double balanceAmount;
	
	
	
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Long getFkProductId() {
		return fkProductId;
	}
	public void setFkProductId(Long fkProductId) {
		this.fkProductId = fkProductId;
	}
	public Long getGst() {
		return gst;
	}
	public void setGst(Long gst) {
		this.gst = gst;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public Double getGstAmount() {
		return gstAmount;
	}
	public void setGstAmount(Double gstAmount) {
		this.gstAmount = gstAmount;
	}
	public Long getPkKitchenInvId() {
		return pkKitchenInvId;
	}
	public void setPkKitchenInvId(Long pkKitchenInvId) {
		this.pkKitchenInvId = pkKitchenInvId;
	}
	public Long getFkSupplierId() {
		return fkSupplierId;
	}
	public void setFkSupplierId(Long fkSupplierId) {
		this.fkSupplierId = fkSupplierId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSuppilerName() {
		return suppilerName;
	}
	public void setSuppilerName(String suppilerName) {
		this.suppilerName = suppilerName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Long getQuantity() {
		return Quantity;
	}
	public void setQuantity(Long quantity) {
		Quantity = quantity;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
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
	
	
	
}
