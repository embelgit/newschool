package com.srb.hibernate;

import java.util.Date;

public class BonafideCertificateHibernate {
	private Long pkBonafiedCertificateId;
	private Long fkStudentMasterId; 
	private Long fk_class_id;
	private Long fk_div_id;
	private Date insertDate;

	public Long getPkBonafiedCertificateId() {
		return pkBonafiedCertificateId;
	}
	public void setPkBonafiedCertificateId(Long pkBonafiedCertificateId) {
		this.pkBonafiedCertificateId = pkBonafiedCertificateId;
	}
	public Long getFkStudentMasterId() {
		return fkStudentMasterId;
	}
	public void setFkStudentMasterId(Long fkStudentMasterId) {
		this.fkStudentMasterId = fkStudentMasterId;
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	
	
	
}
