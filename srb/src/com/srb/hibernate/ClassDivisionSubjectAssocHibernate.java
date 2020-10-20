package com.srb.hibernate;

public class ClassDivisionSubjectAssocHibernate {
	private Long pkClassDivisionSubjectAssociationId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long fkSubjectId;
	private Long clas;
	private String className;
	private String division;
	private String subject;
	private String academicYear;
	
	public ClassDivisionSubjectAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassDivisionSubjectAssocHibernate(
			Long pkClassDivisionSubjectAssociationId, Long fkClassId,
			Long fkDivisionId, Long fkSubjectId, Long clas, String className,
			String division, String subject, String academicYear) {
		super();
		this.pkClassDivisionSubjectAssociationId = pkClassDivisionSubjectAssociationId;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.fkSubjectId = fkSubjectId;
		this.clas = clas;
		this.className = className;
		this.division = division;
		this.subject = subject;
		this.academicYear = academicYear;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Long getPkClassDivisionSubjectAssociationId() {
		return pkClassDivisionSubjectAssociationId;
	}
	public void setPkClassDivisionSubjectAssociationId(
			Long pkClassDivisionSubjectAssociationId) {
		this.pkClassDivisionSubjectAssociationId = pkClassDivisionSubjectAssociationId;
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
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
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
