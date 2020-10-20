package com.srb.hibernate;

import java.util.Date;

public class SportParticipantDetails {

	private Long PkSportParticipant;
	private Long PkSportid;
	private String firstName;
	private String middleName;
	private String LastName;
	private String Lose;
	private String win;
	private String Award;
	private String  SportParticipant;
	private Long PkSportGridid;
	private Date Insertdate;
	private Date startdate;
	private Date enddate;
	private Long fk_division_id;
	private Long fk_class_id;
	
	
	public Date getInsertdate() {
		return Insertdate;
	}
	public void setInsertdate(Date insertdate) {
		Insertdate = insertdate;
	}
	public Long getPkSportGridid() {
		return PkSportGridid;
	}
	public void setPkSportGridid(Long pkSportGridid) {
		PkSportGridid = pkSportGridid;
	}
	
	
	public Long getPkSportParticipant() {
		return PkSportParticipant;
	}
	public void setPkSportParticipant(Long pkSportParticipant) {
		PkSportParticipant = pkSportParticipant;
	}
	public Long getPkSportid() {
		return PkSportid;
	}
	public void setPkSportid(Long pkSportid) {
		PkSportid = pkSportid;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getLose() {
		return Lose;
	}
	public void setLose(String lose) {
		Lose = lose;
	}
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public String getAward() {
		return Award;
	}
	public void setAward(String award) {
		Award = award;
	}
	public String getSportParticipant() {
		return SportParticipant;
	}
	public void setSportParticipant(String sportParticipant) {
		SportParticipant = sportParticipant;
	}
	/*public Long getPkSportId() {
		return PkSportId;
	}
	public void setPkSportId(Long pkSportId) {
		PkSportId = pkSportId;
	}*/
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Long getFk_division_id() {
		return fk_division_id;
	}
	public void setFk_division_id(Long fk_division_id) {
		this.fk_division_id = fk_division_id;
	}
	public Long getFk_class_id() {
		return fk_class_id;
	}
	public void setFk_class_id(Long fk_class_id) {
		this.fk_class_id = fk_class_id;
	}
	
	
}
