package com.srb.bean;

import java.math.BigInteger;

public class GetSupplierDetails {
	private String insertDate;
	private String billNo;
	private String IdNo;
	private Double totalAmt;
	private Double balanceAmtFromSp;
	private Double balance;
	
	private String dealerName;
	private String address;
	private String city;
	private String personName;
	private String email;
	private String tin;
	private BigInteger contactNo;
	private BigInteger landline;
	private String productName;
	private Double quantity;
	private long supId;
	
	public BigInteger getLandline() {
		return landline;
	}
	public void setLandline(BigInteger landline) {
		this.landline = landline;
	}
	public long getSupId() {
		return supId;
	}
	public void setSupId(long supId) {
		this.supId = supId;
	}
	

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public String getDealerName() {
		return dealerName;
	}
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTin() {
		return tin;
	}
	public void setTin(String tin) {
		this.tin = tin;
	}
	public BigInteger getContactNo() {
		return contactNo;
	}
	public void setContactNo(BigInteger contactNo) {
		this.contactNo = contactNo;
	}
	/*public BigInteger getLandline() {
		return landline;
	}
	public void setLandline(BigInteger landline) {
		this.landline = landline;
	}*/
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Double getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(Double totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Double getBalanceAmtFromSp() {
		return balanceAmtFromSp;
	}
	public void setBalanceAmtFromSp(Double balanceAmtFromSp) {
		this.balanceAmtFromSp = balanceAmtFromSp;
	}
	public String getIdNo() {
		return IdNo;
	}
	public void setIdNo(String idNo) {
		IdNo = idNo;
	}

	
	
}
