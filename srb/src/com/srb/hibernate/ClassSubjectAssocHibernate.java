package com.srb.hibernate;

public class ClassSubjectAssocHibernate {
	private Long pkClassSubjectAssociationId;
	private Long fkClassId;
	private Long fkSubjectId;
	private Long clas;
	private String subject;
	private String className;
	private String academicYear;
	
	
	public ClassSubjectAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassSubjectAssocHibernate(Long pkClassSubjectAssociationId,
			Long fkClassId, Long fkSubjectId, Long clas, String subject,
			String className, String academicYear) {
		super();
		this.pkClassSubjectAssociationId = pkClassSubjectAssociationId;
		this.fkClassId = fkClassId;
		this.fkSubjectId = fkSubjectId;
		this.clas = clas;
		this.subject = subject;
		this.className = className;
		this.academicYear = academicYear;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Long getPkClassSubjectAssociationId() {
		return pkClassSubjectAssociationId;
	}
	public void setPkClassSubjectAssociationId(Long pkClassSubjectAssociationId) {
		this.pkClassSubjectAssociationId = pkClassSubjectAssociationId;
	}
	public Long getFkClassId() {
		return fkClassId;
	}
	public void setFkClassId(Long fkClassId) {
		this.fkClassId = fkClassId;
	}
	public Long getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Long fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public Long getClas() {
		return clas;
	}
	public void setClas(Long clas) {
		this.clas = clas;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	
}
