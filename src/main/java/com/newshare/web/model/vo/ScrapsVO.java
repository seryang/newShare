package com.newshare.web.model.vo;

public class ScrapsVO {
	private int scrapNum;
	private String email;
	private String articleUrl;
	private String scrapDate;
	
	public ScrapsVO(){}
	
	public ScrapsVO(int scrapNum,String email, String articleUrl, String scrapDate) {
		super();
		this.scrapNum = scrapNum;
		this.email = email;
		this.articleUrl = articleUrl;
		this.scrapDate = scrapDate;
	}

	public ScrapsVO(String email, String articleUrl) {
		super();
		this.email = email;
		this.articleUrl = articleUrl;
	}

	public int getScrapNum() {
		return scrapNum;
	}

	public void setScrapNum(int scrapNum) {
		this.scrapNum = scrapNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getArticleUrl() {
		return articleUrl;
	}

	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}

	public String getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(String scrapDate) {
		this.scrapDate = scrapDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ScrapsVO [scrapNum=");
		builder.append(scrapNum);
		builder.append(", email=");
		builder.append(email);
		builder.append(", articleUrl=");
		builder.append(articleUrl);
		builder.append(", scrapDate=");
		builder.append(scrapDate);
		builder.append("]");
		return builder.toString();
	}
}
