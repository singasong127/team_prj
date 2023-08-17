package com.team.app.infra.index;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentDt {
	Date date = new Date();
	SimpleDateFormat formatDt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String nowDt = formatDt.format(date);
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public SimpleDateFormat getFormatDt() {
		return formatDt;
	}
	public void setFormatDt(SimpleDateFormat formatDt) {
		this.formatDt = formatDt;
	}
	public String getNowDt() {
		return nowDt;
	}
	public void setNowDt(String nowDt) {
		this.nowDt = nowDt;
	}
	
	
}
