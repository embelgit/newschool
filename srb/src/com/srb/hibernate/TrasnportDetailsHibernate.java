package com.srb.hibernate;

import java.util.Date;

public class TrasnportDetailsHibernate {

	
	private Long pkTranspaymentId;
	private Long txid;
	private Double totalAnnualFee;
	private String personnameT;
	private Double balanceAmountT;
	private String paymentMode3;
	private String paymentTypeT;
	private Double paidAmountT;
	private String chequeNum;
	private String nameOnCheck;
	private String bankName;
	private String cardNum;
	private String accNum;
	private String studentName;
	private Long fkclassId;
	private Long fkdivisionId;
	private Date insertDate;
	
	
	
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getTxid() {
		return txid;
	}
	public void setTxid(Long txid) {
		this.txid = txid;
	}
	public Long getPkTranspaymentId() {
		return pkTranspaymentId;
	}
	public void setPkTranspaymentId(Long pkTranspaymentId) {
		this.pkTranspaymentId = pkTranspaymentId;
	}
	public Double getTotalAnnualFee() {
		return totalAnnualFee;
	}
	public void setTotalAnnualFee(Double totalAnnualFee) {
		this.totalAnnualFee = totalAnnualFee;
	}
	public String getPersonnameT() {
		return personnameT;
	}
	public void setPersonnameT(String personnameT) {
		this.personnameT = personnameT;
	}
	public Double getBalanceAmountT() {
		return balanceAmountT;
	}
	public void setBalanceAmountT(Double balanceAmountT) {
		this.balanceAmountT = balanceAmountT;
	}
	public String getPaymentMode3() {
		return paymentMode3;
	}
	public void setPaymentMode3(String paymentMode3) {
		this.paymentMode3 = paymentMode3;
	}
	public String getPaymentTypeT() {
		return paymentTypeT;
	}
	public void setPaymentTypeT(String paymentTypeT) {
		this.paymentTypeT = paymentTypeT;
	}
	public Double getPaidAmountT() {
		return paidAmountT;
	}
	public void setPaidAmountT(Double paidAmountT) {
		this.paidAmountT = paidAmountT;
	}
	public String getChequeNum() {
		return chequeNum;
	}
	public void setChequeNum(String chequeNum) {
		this.chequeNum = chequeNum;
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
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Long getFkclassId() {
		return fkclassId;
	}
	public void setFkclassId(Long fkclassId) {
		this.fkclassId = fkclassId;
	}
	public Long getFkdivisionId() {
		return fkdivisionId;
	}
	public void setFkdivisionId(Long fkdivisionId) {
		this.fkdivisionId = fkdivisionId;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
