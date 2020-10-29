package com.srb.bean;

public class gethostelmanagementdetailbean {

	private Long pkhostelid;
	private String productName;
	private String supplierName;
	private String billNo;
	private String buyPrice;
	private String quantity;
	private String insertDate;
	private Long gst;
	private Long gstamt;
	private Double total;
	private Double grossTotal;
	
	
	public Long getPkhostelid() {
		return pkhostelid;
	}
	public void setPkhostelid(Long pkhostelid) {
		this.pkhostelid = pkhostelid;
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
	public gethostelmanagementdetailbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public gethostelmanagementdetailbean(Long pkhostelid, String productName, String supplierName, String billNo,
			String buyPrice, String quantity, String insertDate, Long gst, Long gstamt,Double total,Double grossTotal) {
		super();
		this.pkhostelid = pkhostelid;
		this.productName = productName;
		this.supplierName = supplierName;
		this.billNo = billNo;
		this.buyPrice = buyPrice;
		this.quantity = quantity;
		this.insertDate = insertDate;
		this.gst = gst;
		this.gstamt = gstamt;
		this.total=total;
		this.grossTotal=grossTotal;
	}
	
	
}
