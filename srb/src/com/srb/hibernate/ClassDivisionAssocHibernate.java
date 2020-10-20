package com.srb.hibernate;

public class ClassDivisionAssocHibernate {
	
	private Long pkClassDivisionAssociationId;
	private Long fkClassId;
	private Long fkDivisionId;
	private Long clas;
	private Long division;
	private String academicYear;
	public ClassDivisionAssocHibernate(Long pkClassDivisionAssociationId,
			Long fkClassId, Long fkDivisionId, Long clas, Long division,
			String academicYear) {
		super();
		this.pkClassDivisionAssociationId = pkClassDivisionAssociationId;
		this.fkClassId = fkClassId;
		this.fkDivisionId = fkDivisionId;
		this.clas = clas;
		this.division = division;
		this.academicYear = academicYear;
	}
	public ClassDivisionAssocHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkClassDivisionAssociationId() {
		return pkClassDivisionAssociationId;
	}
	public void setPkClassDivisionAssociationId(Long pkClassDivisionAssociationId) {
		this.pkClassDivisionAssociationId = pkClassDivisionAssociationId;
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
	public Long getClas() {
		return clas;
	}
	public void setClas(Long clas) {
		this.clas = clas;
	}
	public Long getDivision() {
		return division;
	}
	public void setDivision(Long division) {
		this.division = division;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	
	
}

