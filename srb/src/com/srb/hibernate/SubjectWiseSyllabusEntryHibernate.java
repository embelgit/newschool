package com.srb.hibernate;

import java.util.Date;

public class SubjectWiseSyllabusEntryHibernate {
	
	private String teacherName;
	private String className;
	private String division;
	private String academicYear;
	private String subjectName;
	private String syllabus;
	private byte[] syllabusFile;
	private Long fkTeacherId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long pkSubjectWiseSyllabusEntryId;
	private Date insertDate;
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
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
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public Long getFkTeacherId() {
		return fkTeacherId;
	}
	public void setFkTeacherId(Long fkTeacherId) {
		this.fkTeacherId = fkTeacherId;
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
	public Long getPkSubjectWiseSyllabusEntryId() {
		return pkSubjectWiseSyllabusEntryId;
	}
	public void setPkSubjectWiseSyllabusEntryId(Long pkSubjectWiseSyllabusEntryId) {
		this.pkSubjectWiseSyllabusEntryId = pkSubjectWiseSyllabusEntryId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public byte[] getSyllabusFile() {
		return syllabusFile;
	}
	public void setSyllabusFile(byte[] syllabusFile) {
		this.syllabusFile = syllabusFile;
	}
	
	
}
