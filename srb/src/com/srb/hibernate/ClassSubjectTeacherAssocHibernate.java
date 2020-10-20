package com.srb.hibernate;

public class ClassSubjectTeacherAssocHibernate {
	private Long pkClassSubjectTeacherAssociationId;
	private Long fkClassDivisionAssociationId;
	private Long fkSubjectTeacherAssociationId;
	private Long clas;
	private String subject;
	private String teacherName;
	private String academicYear;
	public ClassSubjectTeacherAssocHibernate(
			Long pkClassSubjectTeacherAssociationId,
			Long fkClassDivisionAssociationId,
			Long fkSubjectTeacherAssociationId, Long clas, String subject,
			String teacherName, String academicYear) {
		super();
		this.pkClassSubjectTeacherAssociationId = pkClassSubjectTeacherAssociationId;
		this.fkClassDivisionAssociationId = fkClassDivisionAssociationId;
		this.fkSubjectTeacherAssociationId = fkSubjectTeacherAssociationId;
		this.clas = clas;
		this.subject = subject;
		this.teacherName = teacherName;
		this.academicYear = academicYear;
	}
	public ClassSubjectTeacherAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkClassSubjectTeacherAssociationId() {
		return pkClassSubjectTeacherAssociationId;
	}
	public void setPkClassSubjectTeacherAssociationId(
			Long pkClassSubjectTeacherAssociationId) {
		this.pkClassSubjectTeacherAssociationId = pkClassSubjectTeacherAssociationId;
	}
	public Long getFkClassDivisionAssociationId() {
		return fkClassDivisionAssociationId;
	}
	public void setFkClassDivisionAssociationId(Long fkClassDivisionAssociationId) {
		this.fkClassDivisionAssociationId = fkClassDivisionAssociationId;
	}
	public Long getFkSubjectTeacherAssociationId() {
		return fkSubjectTeacherAssociationId;
	}
	public void setFkSubjectTeacherAssociationId(Long fkSubjectTeacherAssociationId) {
		this.fkSubjectTeacherAssociationId = fkSubjectTeacherAssociationId;
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
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	

}
