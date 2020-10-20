package com.srb.hibernate;

import java.util.Date;

public class StudentCashBankBookHibernate {

	private Long pkStudentCashBankBookHibernateId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long fkStudentId;
	private Long paymentReceiptNumber;
	
	private String firstName;
	private String middleName;
	private String lastName;
	private String accountantName;
	private String academicYear;
	private String className;
	private String divisionName;
	
	private Double totalAnnualFee;
	private Double remainingFee;
	private Double payingFee;
	
	private String paymentMode;
	private String chequeNum;
	private String nameOnCheck;
	private String cardNum;
	private String accNum;
	private String bankName;
	
	private String namankit;
	private String studenttype;
	
	private Date expectedPaymentDate;
	private Date insertDate;
	

	

	public String getNamankit() {
		return namankit;
	}

	public void setNamankit(String namankit) {
		this.namankit = namankit;
	}

	public String getStudenttype() {
		return studenttype;
	}

	public void setStudenttype(String studenttype) {
		this.studenttype = studenttype;
	}

	public Long getPkStudentCashBankBookHibernateId() {
		return pkStudentCashBankBookHibernateId;
	}

	public void setPkStudentCashBankBookHibernateId(
			Long pkStudentCashBankBookHibernateId) {
		this.pkStudentCashBankBookHibernateId = pkStudentCashBankBookHibernateId;
	}

	public Long getFkClassId() {
		return fkClassId;
	}

	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}

	public Long getFkDivisionId() {
		return fkDivisionId;
	}

	public void setFkDivisionId(Long fkDivisionId) {
		this.fkDivisionId = fkDivisionId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAccountantName() {
		return accountantName;
	}

	public void setAccountantName(String accountantName) {
		this.accountantName = accountantName;
	}

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public Double getTotalAnnualFee() {
		return totalAnnualFee;
	}

	public void setTotalAnnualFee(Double totalAnnualFee) {
		this.totalAnnualFee = totalAnnualFee;
	}

	public Double getRemainingFee() {
		return remainingFee;
	}

	public void setRemainingFee(Double remainingFee) {
		this.remainingFee = remainingFee;
	}

	public Double getPayingFee() {
		return payingFee;
	}

	public void setPayingFee(Double payingFee) {
		this.payingFee = payingFee;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDivisionName() {
		return divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	public Long getPaymentReceiptNumber() {
		return paymentReceiptNumber;
	}

	public void setPaymentReceiptNumber(Long paymentReceiptNumber) {
		this.paymentReceiptNumber = paymentReceiptNumber;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
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

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Date getExpectedPaymentDate() {
		return expectedPaymentDate;
	}

	public void setExpectedPaymentDate(Date expectedPaymentDate) {
		this.expectedPaymentDate = expectedPaymentDate;
	}

	public Long getFkStudentId() {
		return fkStudentId;
	}

	public void setFkStudentId(Long fkStudentId) {
		this.fkStudentId = fkStudentId;
	}
	
	
}
