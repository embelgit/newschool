package com.srb.hibernate;

import java.util.Date;

public class StudentInfoHibernate {
	
	private Long pkStudentId;
	private String aadharNumber;
	private String rollNumber;
	private Long studentSerialNumber;
	private String generalRegNumber;
	private String firstName;
	private String middleName;
	private String birthPlace;
	private String cast;
	private String subCast;
	private String city;
	private String district;
	private String taluka;
	private String lastName;
	private Date dob;
	private String mothertongue;
	private Date doa;
	private String gender;
	private String religion;
	private Long clas;
	private String division;
//	private Long division;
	private String studentstatus;
	private Long studentstatusid;
	private Long ex_class;
	private Long ex_leaving;
	
	private String country;
	private String state;
	
    private Long pinCode;
    private String preSchoolN;
    
    private String preSchoolUdias;
    private String area;
    
    private Long contactNo;
	private String siblings;
	
	private Long annualFee;
	private String perAddress;
	
	private String preAddress;
	private String isStudentActive;
	
	private String birthtal;
	private String birthdist;
	private String birthcountry;
	
	private String attendanceNumber;
	private byte[] studentPhoto;
	private String studenttype;
	private String namankit;
	private String fatherName;
    private String motherName;
    private String studId;
    private Long EmergencyContact;
    
	public StudentInfoHibernate(Long pkStudentId, String aadharNumber, String rollNumber, Long studentSerialNumber,
			String generalRegNumber, String firstName, String middleName, String birthPlace, String cast,
			String subCast, String city, String district, String taluka, String lastName, Date dob, Date doa,
			String gender, Long clas, String division, String country, String state, Long pinCode, String preSchoolN,String birthtal,String birthdist,String birthcountry,
			String preSchoolUdias, String area, Long contactNo, String siblings, Long annualFee, String perAddress,String mothertongue, String studentstatus, Long studentstatusid, Long ex_class, Long ex_leaving,
			String preAddress, String isStudentActive, String attendanceNumber, byte[] studentPhoto, String fatherName, String religion,String studenttype,String namankit,
			String motherName, String studId, Long EmergencyContact) {
		super();
		this.pkStudentId = pkStudentId;
		this.aadharNumber = aadharNumber;
		this.rollNumber = rollNumber;
		this.studentSerialNumber = studentSerialNumber;
		this.generalRegNumber = generalRegNumber;
		this.firstName = firstName;
		this.middleName = middleName;
		this.birthPlace = birthPlace;
		this.birthtal = birthtal;
		this.birthdist = birthdist;
		this.birthcountry = birthcountry;
		this.religion = religion;
		this.cast = cast;
		this.subCast = subCast;
		this.studenttype = studenttype;
		this.namankit = namankit;
		this.city = city;
		this.district = district;
		this.taluka = taluka;
		this.lastName = lastName;
		this.dob = dob;
		this.doa = doa;
		this.gender = gender;
		this.clas = clas;
		this.division = division;
		this.country = country;
		this.state = state;
		this.pinCode = pinCode;
		this.preSchoolN = preSchoolN;
		this.preSchoolUdias = preSchoolUdias;
		this.area = area;
		this.contactNo = contactNo;
		this.siblings = siblings;
		this.annualFee = annualFee;
		this.perAddress = perAddress;
		this.preAddress = preAddress;
		this.isStudentActive = isStudentActive;
		this.attendanceNumber = attendanceNumber;
		this.studentPhoto = studentPhoto;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.studId = studId;
		this.EmergencyContact = EmergencyContact;
		this.mothertongue = mothertongue;
	}
	public StudentInfoHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public String getStudentstatus() {
		return studentstatus;
	}
	public void setStudentstatus(String studentstatus) {
		this.studentstatus = studentstatus;
	}
	public Long getStudentstatusid() {
		return studentstatusid;
	}
	public void setStudentstatusid(Long studentstatusid) {
		this.studentstatusid = studentstatusid;
	}
	public Long getEx_class() {
		return ex_class;
	}
	public void setEx_class(Long ex_class) {
		this.ex_class = ex_class;
	}
	public Long getEx_leaving() {
		return ex_leaving;
	}
	public void setEx_leaving(Long ex_leaving) {
		this.ex_leaving = ex_leaving;
	}
	public String getBirthtal() {
		return birthtal;
	}
	public void setBirthtal(String birthtal) {
		this.birthtal = birthtal;
	}
	public String getBirthdist() {
		return birthdist;
	}
	public void setBirthdist(String birthdist) {
		this.birthdist = birthdist;
	}
	public String getBirthcountry() {
		return birthcountry;
	}
	public void setBirthcountry(String birthcountry) {
		this.birthcountry = birthcountry;
	}
	public String getMothertongue() {
		return mothertongue;
	}
	public void setMothertongue(String mothertongue) {
		this.mothertongue = mothertongue;
	}
	public String getNamankit() {
		return namankit;
	}
	public void setNamankit(String namankit) {
		this.namankit = namankit;
	}
	public String getStudenttype() {
		return studenttype;
	}
	public void setStudenttype(String studenttype) {
		this.studenttype = studenttype;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public Long getEmergencyContact() {
		return EmergencyContact;
	}
	public void setEmergencyContact(Long emergencyContact) {
		EmergencyContact = emergencyContact;
	}
	public Long getPkStudentId() {
		return pkStudentId;
	}
	public void setPkStudentId(Long pkStudentId) {
		this.pkStudentId = pkStudentId;
	}
	public String getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getRollNumber() {
		return rollNumber;
	}
	public void setRollNumber(String rollNumber) {
		this.rollNumber = rollNumber;
	}
	public Long getStudentSerialNumber() {
		return studentSerialNumber;
	}
	public void setStudentSerialNumber(Long studentSerialNumber) {
		this.studentSerialNumber = studentSerialNumber;
	}
	public String getGeneralRegNumber() {
		return generalRegNumber;
	}
	public void setGeneralRegNumber(String generalRegNumber) {
		this.generalRegNumber = generalRegNumber;
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
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getSubCast() {
		return subCast;
	}
	public void setSubCast(String subCast) {
		this.subCast = subCast;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getTaluka() {
		return taluka;
	}
	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getDoa() {
		return doa;
	}
	public void setDoa(Date doa) {
		this.doa = doa;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Long getClas() {
		return clas;
	}
	public void setClas(Long clas) {
		this.clas = clas;
	}
	
	
	
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	/*
	 * public Long getDivision() { return division; } public void setDivision(Long
	 * division) { this.division = division; }
	 */
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Long getPinCode() {
		return pinCode;
	}
	public void setPinCode(Long pinCode) {
		this.pinCode = pinCode;
	}
	public String getPreSchoolN() {
		return preSchoolN;
	}
	public void setPreSchoolN(String preSchoolN) {
		this.preSchoolN = preSchoolN;
	}
	public String getPreSchoolUdias() {
		return preSchoolUdias;
	}
	public void setPreSchoolUdias(String preSchoolUdias) {
		this.preSchoolUdias = preSchoolUdias;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Long getContactNo() {
		return contactNo;
	}
	public void setContactNo(Long contactNo) {
		this.contactNo = contactNo;
	}
	public String getSiblings() {
		return siblings;
	}
	public void setSiblings(String siblings) {
		this.siblings = siblings;
	}
	public Long getAnnualFee() {
		return annualFee;
	}
	public void setAnnualFee(Long annualFee) {
		this.annualFee = annualFee;
	}
	public String getPerAddress() {
		return perAddress;
	}
	public void setPerAddress(String perAddress) {
		this.perAddress = perAddress;
	}
	public String getPreAddress() {
		return preAddress;
	}
	public void setPreAddress(String preAddress) {
		this.preAddress = preAddress;
	}
	public String getIsStudentActive() {
		return isStudentActive;
	}
	public void setIsStudentActive(String isStudentActive) {
		this.isStudentActive = isStudentActive;
	}
	public String getAttendanceNumber() {
		return attendanceNumber;
	}
	public void setAttendanceNumber(String attendanceNumber) {
		this.attendanceNumber = attendanceNumber;
	}
	public byte[] getStudentPhoto() {
		return studentPhoto;
	}
	public void setStudentPhoto(byte[] studentPhoto) {
		this.studentPhoto = studentPhoto;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getStudId() {
		return studId;
	}
	public void setStudId(String studId) {
		this.studId = studId;
	}
    
	
}
	