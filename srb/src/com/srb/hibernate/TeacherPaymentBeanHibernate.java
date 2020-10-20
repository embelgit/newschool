package com.srb.hibernate;

import java.io.Serializable;
import java.util.Date;

public class TeacherPaymentBeanHibernate implements Serializable {

		private Date insertDate;
		private Long pkTeacherPaymentId;
		private Long txid;
		private String personName;
		private Double credit;
		private String teacherName;
		private String reason;
		private Long fkTeacherId;
		private String chequeNum;
		private Long cardNum;
		private Long accNum;
		private String paymentMode;
		private String nameOnCheck;
		private String bankName;
		private String paymentType;
		private Double balanceAmounte;
		private Double totalAmounte;
		
		public Long getTxid() {
			return txid;
		}
		public void setTxid(Long txid) {
			this.txid = txid;
		}
		public Double getBalanceAmounte() {
			return balanceAmounte;
		}
		public void setBalanceAmounte(Double balanceAmounte) {
			this.balanceAmounte = balanceAmounte;
		}
		public Double getTotalAmounte() {
			return totalAmounte;
		}
		public void setTotalAmounte(Double totalAmounte) {
			this.totalAmounte = totalAmounte;
		}
		public TeacherPaymentBeanHibernate(Date insertDate, Long pkTeacherPaymentId, Long txid, String personName, Double credit,
				String teacherName, String reason, Long fkTeacherId, String chequeNum, Long cardNum, Long accNum,
				String paymentMode, String nameOnCheck, String bankName, String paymentType, Double balanceAmounte, Double totalAmounte) {
			super();
			this.insertDate = insertDate;
			this.pkTeacherPaymentId = pkTeacherPaymentId;
			this.txid = txid;
			this.personName = personName;
			this.credit = credit;
			this.teacherName = teacherName;
			this.reason = reason;
			this.fkTeacherId = fkTeacherId;
			this.chequeNum = chequeNum;
			this.cardNum = cardNum;
			this.accNum = accNum;
			this.paymentMode = paymentMode;
			this.nameOnCheck = nameOnCheck;
			this.bankName = bankName;
			this.paymentType = paymentType;
			this.balanceAmounte = balanceAmounte;
			this.totalAmounte = totalAmounte;
		}
		public TeacherPaymentBeanHibernate() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Date getInsertDate() {
			return insertDate;
		}
		public void setInsertDate(Date insertDate) {
			this.insertDate = insertDate;
		}
		public Long getPkTeacherPaymentId() {
			return pkTeacherPaymentId;
		}
		public void setPkTeacherPaymentId(Long pkTeacherPaymentId) {
			this.pkTeacherPaymentId = pkTeacherPaymentId;
		}
		public String getPersonName() {
			return personName;
		}
		public void setPersonName(String personName) {
			this.personName = personName;
		}
		public Double getCredit() {
			return credit;
		}
		public void setCredit(Double credit) {
			this.credit = credit;
		}
		public String getTeacherName() {
			return teacherName;
		}
		public void setTeacherName(String teacherName) {
			this.teacherName = teacherName;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public Long getFkTeacherId() {
			return fkTeacherId;
		}
		public void setFkTeacherId(Long fkTeacherId) {
			this.fkTeacherId = fkTeacherId;
		}
		public String getChequeNum() {
			return chequeNum;
		}
		public void setChequeNum(String chequeNum) {
			this.chequeNum = chequeNum;
		}
		public Long getCardNum() {
			return cardNum;
		}
		public void setCardNum(Long cardNum) {
			this.cardNum = cardNum;
		}
		public Long getAccNum() {
			return accNum;
		}
		public void setAccNum(Long accNum) {
			this.accNum = accNum;
		}
		public String getPaymentMode() {
			return paymentMode;
		}
		public void setPaymentMode(String paymentMode) {
			this.paymentMode = paymentMode;
		}
		public String getNameOnCheck() {
			return nameOnCheck;
		}
		public void setNameOnCheck(String nameOnCheck) {
			this.nameOnCheck = nameOnCheck;
		}
		public String getBankName() {
			return bankName;
		}
		public void setBankName(String bankName) {
			this.bankName = bankName;
		}
		public String getPaymentType() {
			return paymentType;
		}
		public void setPaymentType(String paymentType) {
			this.paymentType = paymentType;
		}
		
}
