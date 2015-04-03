package com.newshare.web.model.vo;

public class EmailVO {
	private String subject;
	private String content;
	private String regdate;
	private String reciver;

	public EmailVO() {}
	
	public EmailVO(String subject, String content, String regdate,
			String reciver) {
		super();
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.reciver = reciver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
}
