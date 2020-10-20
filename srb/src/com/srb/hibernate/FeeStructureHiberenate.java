package com.srb.hibernate;

import java.util.Date;

public class FeeStructureHiberenate {
	
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
	private Long rollno;
	private Double firstInstallment;
	private Double secondInstallment;
	private Double gatheringFees;
	private Double computerFees;
	private Double activityFees;
	private Double examFees;
	
	private Date expectedPaymentDate;
	private Date insertDate;
	
	private Double admissionfees ;	
	private Double tuitionfees ;
	private Double medicalfees ;
	private Double gymnassiumfees;
	private Double laboratoryfees;
	private Double stationaryfees;
	private Double competitivefees;
	private Double hostelfees;
	private Double messfees;
	private Double uniformfees;
	private Double raincoat;
	private Double undergarments ;
	private Double otherfees ;
	private Double lumpsumfees;
	private String feedue;
	
	public FeeStructureHiberenate(Long pkFeeStructureId, Long fkClassId, Long fkDivisionId, Long paymentReceiptNumber,
			String className, String divisionName, String firstName, String middleName, String lastName,
			String academicYear, Double totalAnnualFee, Double remainingFee, Double firstInstallment,
			Double secondInstallment, Double gatheringFees, Double computerFees, Double activityFees, Double examFees,
			Date expectedPaymentDate, Date insertDate, Double admissionfees, Double tuitionfees, Double medicalfees,
			Double gymnassiumfees, Double laboratoryfees, Double stationaryfees, Double competitivefees,
			Double hostelfees, Double messfees, Double uniformfees, Double raincoat, Double undergarments,Long rollno,
			Double otherfees, Double lumpsumfees, String feedue) {
		super();
		this.pkFeeStructureId = pkFeeStructureId;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.paymentReceiptNumber = paymentReceiptNumber;
		this.className = className;
		this.divisionName = divisionName;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.academicYear = academicYear;
		this.totalAnnualFee = totalAnnualFee;
		this.remainingFee = remainingFee;
		this.firstInstallment = firstInstallment;
		this.secondInstallment = secondInstallment;
		this.gatheringFees = gatheringFees;
		this.computerFees = computerFees;
		this.activityFees = activityFees;
		this.examFees = examFees;
		this.expectedPaymentDate = expectedPaymentDate;
		this.insertDate = insertDate;
		this.admissionfees = admissionfees;
		this.tuitionfees = tuitionfees;
		this.medicalfees = medicalfees;
		this.gymnassiumfees = gymnassiumfees;
		this.laboratoryfees = laboratoryfees;
		this.stationaryfees = stationaryfees;
		this.competitivefees = competitivefees;
		this.hostelfees = hostelfees;
		this.messfees = messfees;
		this.uniformfees = uniformfees;
		this.raincoat = raincoat;
		this.undergarments = undergarments;
		this.otherfees = otherfees;
		this.lumpsumfees = lumpsumfees;
		this.feedue = feedue;
		this.rollno = rollno;
	}



	public Long getRollno() {
		return rollno;
	}



	public void setRollno(Long rollno) {
		this.rollno = rollno;
	}



	public String getFeedue() {
		return feedue;
	}



	public void setFeedue(String feedue) {
		this.feedue = feedue;
	}



	public Double getAdmissionfees() {
		return admissionfees;
	}



	public void setAdmissionfees(Double admissionfees) {
		this.admissionfees = admissionfees;
	}



	public Double getTuitionfees() {
		return tuitionfees;
	}



	public void setTuitionfees(Double tuitionfees) {
		this.tuitionfees = tuitionfees;
	}



	public Double getMedicalfees() {
		return medicalfees;
	}



	public void setMedicalfees(Double medicalfees) {
		this.medicalfees = medicalfees;
	}



	public Double getGymnassiumfees() {
		return gymnassiumfees;
	}



	public void setGymnassiumfees(Double gymnassiumfees) {
		this.gymnassiumfees = gymnassiumfees;
	}



	public Double getLaboratoryfees() {
		return laboratoryfees;
	}



	public void setLaboratoryfees(Double laboratoryfees) {
		this.laboratoryfees = laboratoryfees;
	}



	public Double getStationaryfees() {
		return stationaryfees;
	}



	public void setStationaryfees(Double stationaryfees) {
		this.stationaryfees = stationaryfees;
	}



	public Double getCompetitivefees() {
		return competitivefees;
	}



	public void setCompetitivefees(Double competitivefees) {
		this.competitivefees = competitivefees;
	}



	public Double getHostelfees() {
		return hostelfees;
	}



	public void setHostelfees(Double hostelfees) {
		this.hostelfees = hostelfees;
	}



	public Double getMessfees() {
		return messfees;
	}



	public void setMessfees(Double messfees) {
		this.messfees = messfees;
	}



	public Double getUniformfees() {
		return uniformfees;
	}



	public void setUniformfees(Double uniformfees) {
		this.uniformfees = uniformfees;
	}



	public Double getRaincoat() {
		return raincoat;
	}



	public void setRaincoat(Double raincoat) {
		this.raincoat = raincoat;
	}



	public Double getUndergarments() {
		return undergarments;
	}



	public void setUndergarments(Double undergarments) {
		this.undergarments = undergarments;
	}



	public Double getOtherfees() {
		return otherfees;
	}



	public void setOtherfees(Double otherfees) {
		this.otherfees = otherfees;
	}



	public Double getLumpsumfees() {
		return lumpsumfees;
	}



	public void setLumpsumfees(Double lumpsumfees) {
		this.lumpsumfees = lumpsumfees;
	}



	public FeeStructureHiberenate() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	public Date getExpectedPaymentDate() {
		return expectedPaymentDate;
	}
	public void setExpectedPaymentDate(Date expectedPaymentDate) {
		this.expectedPaymentDate = expectedPaymentDate;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	

}
