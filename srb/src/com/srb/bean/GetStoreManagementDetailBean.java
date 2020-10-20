package com.srb.bean;

public class GetStoreManagementDetailBean {

	private Long pkStoreManagementId;
	//private Long fkDivisionId;
	private String productName;
	private String supplierName;
	private String billNo;
	private String buyPrice;
	private String quantity;
	private String insertDate;
	private Long gst;
	private Long gstamt;
	
	
	public Long getGst() {
		return gst;
	}
	public void setGst(Long gst) {
		this.gst = gst;
	}
	public Long getGstamt() {
		return gstamt;
	}
	public void setGstamt(Long gstamt) {
		this.gstamt = gstamt;
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
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
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
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	
	
}
