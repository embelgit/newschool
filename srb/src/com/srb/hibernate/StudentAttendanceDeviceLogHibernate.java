package com.srb.hibernate;

import java.util.Date;

public class StudentAttendanceDeviceLogHibernate {
	public Long pkStudentAttendanceDeviceLogId;
	public String downloadDate;
	public String deviceId;
	public String userId;
	public String logDate;
	public String direction;
	public String AlternateDirection;
	
	public String AlternateAttDirection;
	public String statusCode;
	public String workCode;
	public String duration;
	public String smsFlag;
	public String isApproved;
	
	public String remark;
	public String verificationMode;
	public String logRecordLocation;
	public String managerRemark;
	
	public String attMarkAndroidIMEINo;
	public String lattitude;
	public String longitude;
	public Date insertDate;
	public String pkDeviceLogId;
	
	public String getPkDeviceLogId() {
		return pkDeviceLogId;
	}
	public void setPkDeviceLogId(String pkDeviceLogId) {
		this.pkDeviceLogId = pkDeviceLogId;
	}
	public Long getPkStudentAttendanceDeviceLogId() {
		return pkStudentAttendanceDeviceLogId;
	}
	public void setPkStudentAttendanceDeviceLogId(
			Long pkStudentAttendanceDeviceLogId) {
		this.pkStudentAttendanceDeviceLogId = pkStudentAttendanceDeviceLogId;
	}
	public String getDownloadDate() {
		return downloadDate;
	}
	public void setDownloadDate(String downloadDate) {
		this.downloadDate = downloadDate;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLogDate() {
		return logDate;
	}
	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getAlternateDirection() {
		return AlternateDirection;
	}
	public void setAlternateDirection(String alternateDirection) {
		AlternateDirection = alternateDirection;
	}
	public String getAlternateAttDirection() {
		return AlternateAttDirection;
	}
	public void setAlternateAttDirection(String alternateAttDirection) {
		AlternateAttDirection = alternateAttDirection;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getWorkCode() {
		return workCode;
	}
	public void setWorkCode(String workCode) {
		this.workCode = workCode;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getSmsFlag() {
		return smsFlag;
	}
	public void setSmsFlag(String smsFlag) {
		this.smsFlag = smsFlag;
	}
	public String getIsApproved() {
		return isApproved;
	}
	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getVerificationMode() {
		return verificationMode;
	}
	public void setVerificationMode(String verificationMode) {
		this.verificationMode = verificationMode;
	}
	public String getLogRecordLocation() {
		return logRecordLocation;
	}
	public void setLogRecordLocation(String logRecordLocation) {
		this.logRecordLocation = logRecordLocation;
	}
	public String getManagerRemark() {
		return managerRemark;
	}
	public void setManagerRemark(String managerRemark) {
		this.managerRemark = managerRemark;
	}
	public String getAttMarkAndroidIMEINo() {
		return attMarkAndroidIMEINo;
	}
	public void setAttMarkAndroidIMEINo(String attMarkAndroidIMEINo) {
		this.attMarkAndroidIMEINo = attMarkAndroidIMEINo;
	}
	public String getLattitude() {
		return lattitude;
	}
	public void setLattitude(String lattitude) {
		this.lattitude = lattitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	
}
