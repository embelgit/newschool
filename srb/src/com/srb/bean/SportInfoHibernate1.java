package com.srb.bean;

public class SportInfoHibernate1 {
	
	private Long pkexamid;
	private Long fkSubjectId;
	private String subject;
	private Double totalMarks;
	private Double passingMarks;
	
	
	public Long getPkexamid() {
		return pkexamid;
	}
	public void setPkexamid(Long pkexamid) {
		this.pkexamid = pkexamid;
	}
	public Long getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Long fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Double getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(Double totalMarks) {
		this.totalMarks = totalMarks;
	}
	public Double getPassingMarks() {
		return passingMarks;
	}
	public void setPassingMarks(Double passingMarks) {
		this.passingMarks = passingMarks;
	}
}
