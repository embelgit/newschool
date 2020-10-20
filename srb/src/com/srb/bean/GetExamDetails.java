package com.srb.bean;

import java.math.BigInteger;

public class GetExamDetails {
 private BigInteger passingMarks;
 private BigInteger totalMarks;
 
 

public BigInteger getTotalMarks() {
	return totalMarks;
}

public void setTotalMarks(BigInteger totalMarks) {
	this.totalMarks = totalMarks;
}

public BigInteger getPassingMarks() {
	return passingMarks;
}

public void setPassingMarks(BigInteger passingMarks) {
	this.passingMarks = passingMarks;
}


 
}
