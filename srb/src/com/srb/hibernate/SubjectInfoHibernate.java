package com.srb.hibernate;

public class SubjectInfoHibernate {
	private Long pkSubjectId;
	private String subject;
	public SubjectInfoHibernate(Long pkSubjectId, String subject) {
		super();
		this.pkSubjectId = pkSubjectId;
		this.subject = subject;
	}
	public SubjectInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkSubjectId() {
		return pkSubjectId;
	}
	public void setPkSubjectId(Long pkSubjectId) {
		this.pkSubjectId = pkSubjectId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}
