package com.srb.hibernate;

public class SubjectTeacherAssocHibernate {
	private Long pkSubjectTeacherAssociationId;
	private Long fkSubjectId;
	private Long fkTeacherId;
	private String subject;
	private String teacherName;
	private String academicYear;
	public SubjectTeacherAssocHibernate(Long pkSubjectTeacherAssociationId,
			Long fkSubjectId, Long fkTeacherId, String subject,
			String teacherName, String academicYear) {
		super();
		this.pkSubjectTeacherAssociationId = pkSubjectTeacherAssociationId;
		this.fkSubjectId = fkSubjectId;
		this.fkTeacherId = fkTeacherId;
		this.subject = subject;
		this.teacherName = teacherName;
		this.academicYear = academicYear;
	}
	public SubjectTeacherAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkSubjectTeacherAssociationId() {
		return pkSubjectTeacherAssociationId;
	}
	public void setPkSubjectTeacherAssociationId(Long pkSubjectTeacherAssociationId) {
		this.pkSubjectTeacherAssociationId = pkSubjectTeacherAssociationId;
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
