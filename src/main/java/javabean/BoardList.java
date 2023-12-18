package javabean;

import java.sql.Date;

public class BoardList {
	private Date regDate;
	private int noticeNum;
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	
	public int getNoticeNum() {
		return noticeNum;
	}
}