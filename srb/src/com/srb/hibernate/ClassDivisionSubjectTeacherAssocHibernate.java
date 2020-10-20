package com.srb.hibernate;

public class ClassDivisionSubjectTeacherAssocHibernate {
	private Long pkClassDivisionSubjectTeacherAssociationId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long fkSubjectId;
	private Long fkTeacherId;
	private Long clas;
	private String className;
	private String division;
	private String subject;
	private String teacherName;
	private String academicYear;
	public ClassDivisionSubjectTeacherAssocHibernate(
			Long pkClassDivisionSubjectTeacherAssociationId, Long fkClassId,
			Long fkDivisionId, Long fkSubjectId, Long fkTeacherId, Long clas,
			String className, String division, String subject,
			String teacherName, String academicYear) {
		super();
		this.pkClassDivisionSubjectTeacherAssociationId = pkClassDivisionSubjectTeacherAssociationId;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.fkSubjectId = fkSubjectId;
		this.fkTeacherId = fkTeacherId;
		this.clas = clas;
		this.className = className;
		this.division = division;
		this.subject = subject;
		this.teacherName = teacherName;
		this.academicYear = academicYear;
	}
	public ClassDivisionSubjectTeacherAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkClassDivisionSubjectTeacherAssociationId() {
		return pkClassDivisionSubjectTeacherAssociationId;
	}
	public void setPkClassDivisionSubjectTeacherAssociationId(
			Long pkClassDivisionSubjectTeacherAssociationId) {
		this.pkClassDivisionSubjectTeacherAssociationId = pkClassDivisionSubjectTeacherAssociationId;
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
	public Long getFkTeacherId() {
		return fkTeacherId;
	}
	public void setFkTeacherId(Long fkTeacherId) {
		this.fkTeacherId = fkTeacherId;
	}
	public Long getClas() {
		return clas;
	}
	public void setClas(Long clas) {
		this.clas = clas;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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
