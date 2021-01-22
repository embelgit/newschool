package com.srb.hibernate;

import java.sql.Date;

public class SupplierPaymentBean {

	
	private Long pkSupPaymentId;
	private Long txId;
	private String supplier;
	
	private Long supplier1;
	
	private Double billNo;
	private String chequeNum;
	private Long cardNum;
	private Long accNum;
	private Long regNumber;
	
	private String paymentMode;
	private String nameOnCheck;
	private String bankName;
	private String personname;
	
	private Double totalAmount;
	private Double balance;
	private Double credit;
	private String paymentType;
	
	private String debitAmount;
	private String tdsdetails;
	
	private Date insertDate;
	private Double payment;
	private String remainAmt;
	
	private Double paidAmount;
	private String billNo1;
	
	
	private String paymentinventory;
	private String paymentDescription;
	
	
	public String getPaymentinventory() {
		return paymentinventory;
	}
	public void setPaymentinventory(String paymentinventory) {
		this.paymentinventory = paymentinventory;
	}
	public Long getTxId() {
		return txId;
	}
	public void setTxId(Long txId) {
		this.txId = txId;
	}
	public String getBillNo1() {
		return billNo1;
	}
	public void setBillNo1(String billNo1) {
		this.billNo1 = billNo1;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getRemainAmt() {
		return remainAmt;
	}
	public void setRemainAmt(String remainAmt) {
		this.remainAmt = remainAmt;
	}
	
	public String getDebitAmount() {
		return debitAmount;
	}
	public void setDebitAmount(String debitAmount) {
		this.debitAmount = debitAmount;
	}
	public String getTdsdetails() {
		return tdsdetails;
	}
	public void setTdsdetails(String tdsdetails) {
		this.tdsdetails = tdsdetails;
	}
	public Double getPayment() {
		return payment;
	}
	public void setPayment(Double payment) {
		this.payment = payment;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getPkSupPaymentId() {
		return pkSupPaymentId;
	}
	public void setPkSupPaymentId(Long pkSupPaymentId) {
		this.pkSupPaymentId = pkSupPaymentId;
	}
	
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	
	public Long getSupplier1() {
		return supplier1;
	}
	public void setSupplier1(Long supplier1) {
		this.supplier1 = supplier1;
	}
	public Double getBillNo() {
		return billNo;
	}
	public void setBillNo(Double billNo) {
		this.billNo = billNo;
	}
	
	public String getChequeNum() {
		return chequeNum;
	}
	public void setChequeNum(String chequeNum) {
		this.chequeNum = chequeNum;
	}
	public Long getCardNum() {
		return cardNum;
	}
	public void setCardNum(Long cardNum) {
		this.cardNum = cardNum;
	}
	public Long getAccNum() {
		return accNum;
	}
	public void setAccNum(Long accNum) {
		this.accNum = accNum;
	}
	public Long getRegNumber() {
		return regNumber;
	}
	public void setRegNumber(Long regNumber) {
		this.regNumber = regNumber;
	}

	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getPersonname() {
		return personname;
	}
	public void setPersonname(String personname) {
		this.personname = personname;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}

	
	public String getNameOnCheck() {
		return nameOnCheck;
	}
	public void setNameOnCheck(String nameOnCheck) {
		this.nameOnCheck = nameOnCheck;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public SupplierPaymentBean(Long pkSupPaymentId,  Long txId, String supplier,Long supplier1,
			Double billNo, String chequeNum, Long cardNum, Long accNum,
			Long regNumber, String paymentMode, String nameOnCheck,
			String bankName, String personname, Double totalAmount,
			Double balance, Double credit, Date insertDate,String paymentType, Double payment, String debitAmount, String tdsdetails) {
		super();
		this.pkSupPaymentId = pkSupPaymentId;
		this.txId = txId;
		this.supplier = supplier;
		this.supplier1 = supplier1;
		this.billNo = billNo;
		this.chequeNum = chequeNum;
		this.cardNum = cardNum;
		this.accNum = accNum;
		this.regNumber = regNumber;
		this.paymentMode = paymentMode;
		this.nameOnCheck = nameOnCheck;
		this.debitAmount = debitAmount;
		this.tdsdetails =tdsdetails;
		this.bankName = bankName;
		this.personname = personname;
		this.totalAmount = totalAmount;
		this.balance = balance;
		this.credit = credit;
		this.insertDate = insertDate;
		this.payment =payment;
		this.setPaymentType(paymentType);
	}
	public SupplierPaymentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public void setInsertDate(java.util.Date dateobj) {
		// TODO Auto-generated method stub
		
	}
	public String getPaymentDescription() {
		return paymentDescription;
	}
	public void setPaymentDescription(String paymentDescription) {
		this.paymentDescription = paymentDescription;
	}
	
	
}
