package com.newshare.web.model.vo;

public class PapersVO {
	private int paperNum;
	private String email;
	private String title;
	private String info;
	private String makingDate;
	private int recommendNum;
	private int subscriptionChk;
	private int followerCount;
	private String articles;
	private String dayOfWeek;
	
	public PapersVO() {}
	
	public PapersVO(int paperNum, String email, String title,
			String makingDate, int recommendNum, int subscriptionChk) {
		super();
		this.paperNum = paperNum;
		this.email = email;
		this.title = title;
		this.makingDate = makingDate;
		this.recommendNum = recommendNum;
		this.subscriptionChk = subscriptionChk;
	}
	
	public PapersVO(int paperNum, String email, String title, String info,
			String makingDate, int recommendNum, int subscriptionChk) {
		super();
		this.paperNum = paperNum;
		this.email = email;
		this.title = title;
		this.info = info;
		this.makingDate = makingDate;
		this.recommendNum = recommendNum;
		this.subscriptionChk = subscriptionChk;
	}
	
	public PapersVO(int paperNum, String email, String title,
			String makingDate, int recommendNum, int subscriptionChk , int followerCount) {
		super();
		this.paperNum = paperNum;
		this.email = email;
		this.title = title;
		this.makingDate = makingDate;
		this.recommendNum = recommendNum;
		this.subscriptionChk = subscriptionChk;
		this.followerCount = followerCount;
	}
	
	public PapersVO(int paperNum, String email, String title,
			String info, String makingDate, int recommendNum, 
			int subscriptionChk, String articles, String dayOfWeek){
		super();
		this.paperNum = paperNum;
		this.email = email;
		this.title = title;
		this.info = info;
		this.makingDate = makingDate;
		this.recommendNum = recommendNum;
		this.subscriptionChk = subscriptionChk;
		this.articles = articles;
		this.dayOfWeek = dayOfWeek;
	}

	public PapersVO(String email, String title) {
		super();
		this.email = email;
		this.title = title;
	}
	
	public PapersVO(int paperNum, String email){
		super();
		this.paperNum = paperNum;
		this.email = email;
	}

	public int getPaperNum() {
		return paperNum;
	}

	public void setPaperNum(int paperNum) {
		this.paperNum = paperNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMakingDate() {
		return makingDate;
	}

	public void setMakingDate(String makingDate) {
		this.makingDate = makingDate;
	}

	public int getRecommendNum() {
		return recommendNum;
	}

	public void setRecommendNum(int recommendNum) {
		this.recommendNum = recommendNum;
	}

	public int getSubscriptionChk() {
		return subscriptionChk;
	}

	public void setSubscriptionChk(int subscriptionChk) {
		this.subscriptionChk = subscriptionChk;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}
	
	public String getArticles(){
		return articles;
	}
	
	public void setArticles(String articles){
		this.articles = articles;
	}
	
	public String getDayOfWeek(){
		return dayOfWeek;
	}
	
	public void setDayOfWeek(String dayOfWeek){
		this.dayOfWeek = dayOfWeek;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PapersVO [paperNum=");
		builder.append(paperNum);
		builder.append(", email=");
		builder.append(email);
		builder.append(", title=");
		builder.append(title);
		builder.append(", info=");
		builder.append(info);
		builder.append(", makingDate=");
		builder.append(makingDate);
		builder.append(", recommendNum=");
		builder.append(recommendNum);
		builder.append(", subscriptionChk=");
		builder.append(subscriptionChk);
		builder.append(", followerCount=");
		builder.append(followerCount);
		builder.append(", articles=");
		builder.append(articles);
		builder.append(", dayOfWeek=");
		builder.append(dayOfWeek);
		builder.append("]");
		return builder.toString();
	}
}
