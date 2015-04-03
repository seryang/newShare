package com.newshare.web.model.vo;

public class ArticlesVO {
	private String articleUrl; // 기사 url
	private String title; // 기사 제목
	private String description; // 기사 본문 요약
	private String image; // 이미지 
	private String content; // 기사 본문
	private String writingDate; // 기사 작성 시간
	private String press; // 언론사
	private String articleSection; // 기사 분야
	private int scrapCnt; // 기사 스크랩한 횟수
	
	public ArticlesVO(){}

	public ArticlesVO(String articleUrl, String title, String description,
			String image, String content, String writingDate, String press,
			String articleSection, int scrapCnt) {
		super();
		this.articleUrl = articleUrl;
		this.title = title;
		this.description = description;
		this.image = image;
		this.content = content;
		this.writingDate = writingDate;
		this.press = press;
		this.articleSection = articleSection;
		this.scrapCnt = scrapCnt;
	}
	
	public ArticlesVO(String articleUrl, String title){
		super();
		this.articleUrl = articleUrl;
		this.title = title;
	}

	public String getArticleUrl() {
		return articleUrl;
	}

	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritingDate() {
		return writingDate;
	}

	public void setWritingDate(String writingDate) {
		this.writingDate = writingDate;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getArticleSection() {
		return articleSection;
	}

	public void setArticleSection(String articleSection) {
		this.articleSection = articleSection;
	}

	public int getScrapCnt() {
		return scrapCnt;
	}

	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArticlesVO [articleUrl=");
		builder.append(articleUrl);
		builder.append(", title=");
		builder.append(title);
		builder.append(", description=");
		builder.append(description);
		builder.append(", image=");
		builder.append(image);
		builder.append(", content=");
		builder.append(content);
		builder.append(", writingDate=");
		builder.append(writingDate);
		builder.append(", press=");
		builder.append(press);
		builder.append(", articleSection=");
		builder.append(articleSection);
		builder.append(", scrapCnt=");
		builder.append(scrapCnt);
		builder.append("]");
		return builder.toString();
	}
}
