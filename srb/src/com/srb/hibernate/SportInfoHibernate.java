package com.srb.hibernate;

public class SportInfoHibernate {

	
	private Long pkSportId;
	private String Createactivity;
	private String Activitydetails;
	
	private String Organizeby;
	
	private String otherdetails;

	public String getCreateactivity() {
		return Createactivity;
	}

	public void setCreateactivity(String createactivity) {
		Createactivity = createactivity;
	}

	public String getActivitydetails() {
		return Activitydetails;
	}

	public void setActivitydetails(String activitydetails) {
		Activitydetails = activitydetails;
	}

	public String getOrganizeby() {
		return Organizeby;
	}

	public void setOrganizeby(String organizeby) {
		Organizeby = organizeby;
	}
	
	
	

	public Long getPkSportId() {
		return pkSportId;
	}

	public void setPkSportId(Long pkSportId) {
		this.pkSportId = pkSportId;
	}

	public SportInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SportInfoHibernate(String Createactivity, String Activitydetails, String Organizeby, String otherdetails, Long pkSportId) {
		super();
		this.Createactivity = Createactivity;
		this.Activitydetails = Activitydetails;
		this.Organizeby = Organizeby;
		this.otherdetails = otherdetails;
		this.pkSportId = pkSportId;
	}

	public String getOtherdetails() {
		return otherdetails;
	}

	public void setOtherdetails(String otherdetails) {
		this.otherdetails = otherdetails;
	}
	
	
	
}
