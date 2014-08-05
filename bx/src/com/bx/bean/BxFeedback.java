package com.bx.bean;

import java.util.Date;

public class BxFeedback {
	private String feedId;
	private String fixId;
	private Date fix_Start_Date;
	private String worker_Name;
	private String fixEval;
	private Date evalDate;
	public Date getFix_Start_Date() {
		return fix_Start_Date;
	}
	public void setFix_Start_Date(Date fix_Start_Date) {
		this.fix_Start_Date = fix_Start_Date;
	}
	public String getWorker_Name() {
		return worker_Name;
	}
	public void setWorker_Name(String worker_Name) {
		this.worker_Name = worker_Name;
	}
	public String getFeedId() {
		return feedId;
	}
	public void setFeedId(String feedId) {
		this.feedId = feedId;
	}
	public String getFixId() {
		return fixId;
	}
	public void setFixId(String fixId) {
		this.fixId = fixId;
	}
	public String getFixEval() {
		return fixEval;
	}
	public void setFixEval(String fixEval) {
		this.fixEval = fixEval;
	}
	public Date getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(Date evalDate) {
		this.evalDate = evalDate;
	}
	
	
	
}
