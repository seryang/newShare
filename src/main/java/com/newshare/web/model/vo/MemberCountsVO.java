package com.newshare.web.model.vo;

public class MemberCountsVO {
	private String email;
	private int politicsCnt;
	private int economyCnt;
	private int societyCnt;
	private int lifeCultureCnt;
	private int worldCnt;
	private int itScienceCnt;
	private int entertainmentCnt;
	private int sportsCnt;
	
	public MemberCountsVO(){}

	public MemberCountsVO(String email, int politicsCnt, int economyCnt,
			int societyCnt, int lifeCultureCnt, int worldCnt, int itScienceCnt,
			int entertainmentCnt, int sportsCnt) {
		super();
		this.email = email;
		this.politicsCnt = politicsCnt;
		this.economyCnt = economyCnt;
		this.societyCnt = societyCnt;
		this.lifeCultureCnt = lifeCultureCnt;
		this.worldCnt = worldCnt;
		this.itScienceCnt = itScienceCnt;
		this.entertainmentCnt = entertainmentCnt;
		this.sportsCnt = sportsCnt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoliticsCnt() {
		return politicsCnt;
	}

	public void setPoliticsCnt(int politicsCnt) {
		this.politicsCnt = politicsCnt;
	}

	public int getEconomyCnt() {
		return economyCnt;
	}

	public void setEconomyCnt(int economyCnt) {
		this.economyCnt = economyCnt;
	}

	public int getSocietyCnt() {
		return societyCnt;
	}

	public void setSocietyCnt(int societyCnt) {
		this.societyCnt = societyCnt;
	}

	public int getLifeCultureCnt() {
		return lifeCultureCnt;
	}

	public void setLifeCultureCnt(int lifeCultureCnt) {
		this.lifeCultureCnt = lifeCultureCnt;
	}

	public int getWorldCnt() {
		return worldCnt;
	}

	public void setWorldCnt(int worldCnt) {
		this.worldCnt = worldCnt;
	}

	public int getItScienceCnt() {
		return itScienceCnt;
	}

	public void setItScienceCnt(int itScienceCnt) {
		this.itScienceCnt = itScienceCnt;
	}

	public int getEntertainmentCnt() {
		return entertainmentCnt;
	}

	public void setEntertainmentCnt(int entertainmentCnt) {
		this.entertainmentCnt = entertainmentCnt;
	}

	public int getSportsCnt() {
		return sportsCnt;
	}

	public void setSportsCnt(int sportsCnt) {
		this.sportsCnt = sportsCnt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CountsVO [email=");
		builder.append(email);
		builder.append(", politicsCnt=");
		builder.append(politicsCnt);
		builder.append(", economyCnt=");
		builder.append(economyCnt);
		builder.append(", societyCnt=");
		builder.append(societyCnt);
		builder.append(", lifeCultureCnt=");
		builder.append(lifeCultureCnt);
		builder.append(", worldCnt=");
		builder.append(worldCnt);
		builder.append(", itScienceCnt=");
		builder.append(itScienceCnt);
		builder.append(", entertainmentCnt=");
		builder.append(entertainmentCnt);
		builder.append(", sportsCnt=");
		builder.append(sportsCnt);
		builder.append("]");
		return builder.toString();
	}
}