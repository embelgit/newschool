package com.srb.bean;

public class FeeStructureReportBean {
	
	private Long pkFeeStructureId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long paymentReceiptNumber;
	private String className;
	private String divisionName;
	private String firstName;
	private String middleName;
	private String lastName;
	private String academicYear;
	private Double totalAnnualFee;
	private Double remainingFee;
	
	private Double firstInstallment;
	private Double secondInstallment;
	private Double gatheringFees;
	private Double computerFees;
	private Double activityFees;
	private Double examFees;
	
	private String expectedPaymentDate;

	public Long getPkFeeStructureId() {
		return pkFeeStructureId;
	}

	public void setPkFeeStructureId(Long pkFeeStructureId) {
		this.pkFeeStructureId = pkFeeStructureId;
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

	public Long getPaymentReceiptNumber() {
		return paymentReceiptNumber;
	}

	public void setPaymentReceiptNumber(Long paymentReceiptNumber) {
		this.paymentReceiptNumber = paymentReceiptNumber;
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

	public Double getFirstInstallment() {
		return firstInstallment;
	}

	public void setFirstInstallment(Double firstInstallment) {
		this.firstInstallment = firstInstallment;
	}

	public Double getSecondInstallment() {
		return secondInstallment;
	}

	public void setSecondInstallment(Double secondInstallment) {
		this.secondInstallment = secondInstallment;
	}

	public Double getGatheringFees() {
		return gatheringFees;
	}

	public void setGatheringFees(Double gatheringFees) {
		this.gatheringFees = gatheringFees;
	}

	public Double getComputerFees() {
		return computerFees;
	}

	public void setComputerFees(Double computerFees) {
		this.computerFees = computerFees;
	}

	public Double getActivityFees() {
		return activityFees;
	}

	public void setActivityFees(Double activityFees) {
		this.activityFees = activityFees;
	}

	public Double getExamFees() {
		return examFees;
	}

	public void setExamFees(Double examFees) {
		this.examFees = examFees;
	}

	public String getExpectedPaymentDate() {
		return expectedPaymentDate;
	}

	public void setExpectedPaymentDate(String expectedPaymentDate) {
		this.expectedPaymentDate = expectedPaymentDate;
	}
	
	

}
