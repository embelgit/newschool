package com.srb.hibernate;

import java.sql.Date;

public class LibraryPaymentBean {
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
	
	private String insertDate1;
	
	private Date insertDate;
	private Double payment;
	private String remainAmt;
	
	private Double paidAmount;
	private String billNo1;
	
	
	

	public String getInsertDate1() {
		return insertDate1;
	}
	public void setInsertDate1(String insertDate1) {
		this.insertDate1 = insertDate1;
	}
	public Long getPkSupPaymentId() {
		return pkSupPaymentId;
	}
	public void setPkSupPaymentId(Long pkSupPaymentId) {
		this.pkSupPaymentId = pkSupPaymentId;
	}
	public Long getTxId() {
		return txId;
	}
	public void setTxId(Long txId) {
		this.txId = txId;
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
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Double getPayment() {
		return payment;
	}
	public void setPayment(Double payment) {
		this.payment = payment;
	}
	public String getRemainAmt() {
		return remainAmt;
	}
	public void setRemainAmt(String remainAmt) {
		this.remainAmt = remainAmt;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getBillNo1() {
		return billNo1;
	}
	public void setBillNo1(String billNo1) {
		this.billNo1 = billNo1;
	}
	public LibraryPaymentBean(Long pkSupPaymentId, Long txId, String supplier, Long supplier1, Double billNo,
			String chequeNum, Long cardNum, Long accNum, Long regNumber, String paymentMode, String nameOnCheck,
			String bankName, String personname, Double totalAmount, Double balance, Double credit, String paymentType,
			String debitAmount, String tdsdetails, String insertDate1,Date insertDate, Double payment, String remainAmt, Double paidAmount,
			String billNo1) {
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
		this.bankName = bankName;
		this.personname = personname;
		this.totalAmount = totalAmount;
		this.balance = balance;
		this.credit = credit;
		this.paymentType = paymentType;
		this.debitAmount = debitAmount;
		this.tdsdetails = tdsdetails;
		this.insertDate1 = insertDate1;
		this.insertDate = insertDate;
		this.payment = payment;
		this.remainAmt = remainAmt;
		this.paidAmount = paidAmount;
		this.billNo1 = billNo1;
	}
	public LibraryPaymentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setInsertDate(java.util.Date dateobj) {
		// TODO Auto-generated method stub
		
	}

	
}
