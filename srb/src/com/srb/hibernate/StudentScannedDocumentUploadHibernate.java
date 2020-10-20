package com.srb.hibernate;

import java.util.Date;

public class StudentScannedDocumentUploadHibernate {
	private Long pkStudentScanDocId;
/*	private String className;
	private String division;
	private String academicYear;
	private String subjectName;
	private String syllabus;*/
	
	private byte[] aadharFile;
	private byte[] castFile;
	private byte[] lCFile;
	private byte[] studentPhoto;
	private byte[] extraDoc;
	private Long fkStudentId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Date insertDate;
	public Long getPkStudentScanDocId() {
		return pkStudentScanDocId;
	}
	public void setPkStudentScanDocId(Long pkStudentScanDocId) {
		this.pkStudentScanDocId = pkStudentScanDocId;
	}
	public byte[] getAadharFile() {
		return aadharFile;
	}
	public void setAadharFile(byte[] aadharFile) {
		this.aadharFile = aadharFile;
	}
	public byte[] getCastFile() {
		return castFile;
	}
	public void setCastFile(byte[] castFile) {
		this.castFile = castFile;
	}
	public byte[] getlCFile() {
		return lCFile;
	}
	public void setlCFile(byte[] lCFile) {
		this.lCFile = lCFile;
	}
	public byte[] getStudentPhoto() {
		return studentPhoto;
	}
	public void setStudentPhoto(byte[] studentPhoto) {
		this.studentPhoto = studentPhoto;
	}
	public byte[] getExtraDoc() {
		return extraDoc;
	}
	public void setExtraDoc(byte[] extraDoc) {
		this.extraDoc = extraDoc;
	}
	public Long getFkStudentId() {
		return fkStudentId;
	}
	public void setFkStudentId(Long fkStudentId) {
		this.fkStudentId = fkStudentId;
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
}
