package com.srb.hibernate;

import java.util.Date;

public class ExamNameEntryHibernate {
	private Long pkExamNameEntryId;
	private String examNameEntry;
	private Date insertDate;
	public Long getPkExamNameEntryId() {
		return pkExamNameEntryId;
	}
	public void setPkExamNameEntryId(Long pkExamNameEntryId) {
		this.pkExamNameEntryId = pkExamNameEntryId;
	}
	public String getExamNameEntry() {
		return examNameEntry;
	}
	public void setExamNameEntry(String examNameEntry) {
		this.examNameEntry = examNameEntry;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public ExamNameEntryHibernate(Long pkExamNameEntryId, String examNameEntry,
			Date insertDate) {
		super();
		this.pkExamNameEntryId = pkExamNameEntryId;
		this.examNameEntry = examNameEntry;
		this.insertDate = insertDate;
	}
	public ExamNameEntryHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


}
