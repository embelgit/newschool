package com.srb.bean;

public class Sportinfo {

	private Long PkSportid;
	private String firstName;
	private String middleName;
	private String LastName;
	private String win;
	private String Lose;
	private String Award;
	private String  SportParticipant;
	
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public String getLose() {
		return Lose;
	}
	public void setLose(String lose) {
		Lose = lose;
	}
	public String getAward() {
		return Award;
	}
	public void setAward(String award) {
		Award = award;
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
	public String getSportParticipant() {
		return SportParticipant;
	}
	public void setSportParticipant(String sportParticipant) {
		SportParticipant = sportParticipant;
	}
}
