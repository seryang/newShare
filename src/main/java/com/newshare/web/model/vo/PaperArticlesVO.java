package com.newshare.web.model.vo;

public class PaperArticlesVO {
	private int paperArticleNum;
	private String articleUrl;
	private int paperNum;
	
	public PaperArticlesVO(){}
	
	public PaperArticlesVO(int paperArticleNum, String articleUrl, int paperNum) {
		super();
		this.paperArticleNum = paperArticleNum;
		this.articleUrl = articleUrl;
		this.paperNum = paperNum;
	}
	
	public int getPaperArticleNum() {
		return paperArticleNum;
	}
	
	public void setPaperArticleNum(int paperArticleNum) {
		this.paperArticleNum = paperArticleNum;
	}
	
	public String getArticleUrl() {
		return articleUrl;
	}
	
	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}
	
	public int getPaperNum() {
		return paperNum;
	}
	
	public void setPaperNum(int paperNum) {
		this.paperNum = paperNum;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PaperArticlesVO [paperArticleNum=")
				.append(paperArticleNum).append(", articleUrl=")
				.append(articleUrl).append(", paperNum=").append(paperNum)
				.append("]");
		return builder.toString();
	}
}
