package com.srb.hibernate;

import java.util.Date;

public class LeavingCertificateHibernate 
{

	private Long pkLcId;
	private Long fkStudentMasterId; 
	private Long fk_class_id;
	private Long fk_div_id;
	private String idMarks;
	private String reason;
	private String promotion;
	private String progress;
	private String conduct;
	private Date dateOfLeaving; 
	private Date insertdate;
	private Long workingday;
	private Long attendance;
	
	
	



	public Long getWorkingday() {
		return workingday;
	}

	public void setWorkingday(Long workingday) {
		this.workingday = workingday;
	}

	public Long getAttendance() {
		return attendance;
	}

	public void setAttendance(Long attendance) {
		this.attendance = attendance;
	}

	public Long getPkLcId() {
		return pkLcId;
	}
	
	public Long getFk_class_id() {
		return fk_class_id;
	}

	public void setFk_class_id(Long fk_class_id) {
		this.fk_class_id = fk_class_id;
	}

	public Long getFk_div_id() {
		return fk_div_id;
	}

	public void setFk_div_id(Long fk_div_id) {
		this.fk_div_id = fk_div_id;
	}

	public void setPkLcId(Long pkLcId) {
		this.pkLcId = pkLcId;
	}
	public Long getFkStudentMasterId() {
		return fkStudentMasterId;
	}
	public void setFkStudentMasterId(Long fkStudentMasterId) {
		this.fkStudentMasterId = fkStudentMasterId;
	}
	public String getIdMarks() {
		return idMarks;
	}
	public void setIdMarks(String idMarks) {
		this.idMarks = idMarks;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getConduct() {
		return conduct;
	}
	public void setConduct(String conduct) {
		this.conduct = conduct;
	}
	public Date getDateOfLeaving() {
		return dateOfLeaving;
	}
	public void setDateOfLeaving(Date dateOfLeaving) {
		this.dateOfLeaving = dateOfLeaving;
	}
	public Date getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(Date insertdate) {
		this.insertdate = insertdate;
	} 
	
	
}
