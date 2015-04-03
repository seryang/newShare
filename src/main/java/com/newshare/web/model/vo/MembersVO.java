package com.newshare.web.model.vo;

public class MembersVO {
	private String email;
	private String password;
	private String name;
	private String birthDate;
	private int politicsInts;
	private int economyInts;
	private int societyInts;
	private int lifeCultureInts;
	private int worldInts;
	private int itScienceInts;
	private int entertainmentInts;
	private int sportsInts;
	
	public MembersVO(){
		super();
	};
	
	public MembersVO(String email, String password, String name,
			String birthDate , int politicsInts, int economyInts, int societyInts,
			int lifeCultureInts, int worldInts, int itScienceInts,
			int entertainmentInts, int sportsInts) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthDate = birthDate;
		this.politicsInts = politicsInts;
		this.economyInts = economyInts;
		this.societyInts = societyInts;
		this.lifeCultureInts = lifeCultureInts;
		this.worldInts = worldInts;
		this.itScienceInts = itScienceInts;
		this.entertainmentInts = entertainmentInts;
		this.sportsInts = sportsInts;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public int getPoliticsInts() {
		return politicsInts;
	}
	public void setPoliticsInts(int politicsInts) {
		this.politicsInts = politicsInts;
	}
	public int getEconomyInts() {
		return economyInts;
	}
	public void setEconomyInts(int economyInts) {
		this.economyInts = economyInts;
	}
	public int getSocietyInts() {
		return societyInts;
	}
	public void setSocietyInts(int societyInts) {
		this.societyInts = societyInts;
	}
	public int getLifeCultureInts() {
		return lifeCultureInts;
	}
	public void setLifeCultureInts(int lifeCultureInts) {
		this.lifeCultureInts = lifeCultureInts;
	}
	public int getWorldInts() {
		return worldInts;
	}
	public void setWorldInts(int worldInts) {
		this.worldInts = worldInts;
	}
	public int getItScienceInts() {
		return itScienceInts;
	}
	public void setItScienceInts(int itScienceInts) {
		this.itScienceInts = itScienceInts;
	}
	public int getEntertainmentInts() {
		return entertainmentInts;
	}
	public void setEntertainmentInts(int entertainmentInts) {
		this.entertainmentInts = entertainmentInts;
	}
	public int getSportsInts() {
		return sportsInts;
	}
	public void setSportsInts(int sportsInts) {
		this.sportsInts = sportsInts;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MembersVO [email=").append(email)
				.append(", password=").append(password).append(", name=")
				.append(name).append(", birthDate=").append(birthDate)
				.append(", politicsInts=").append(politicsInts)
				.append(", economyInts=").append(economyInts)
				.append(", societyInts=").append(societyInts)
				.append(", lifeCultureInts=").append(lifeCultureInts)
				.append(", worldInts=").append(worldInts)
				.append(", itScienceInts=").append(itScienceInts)
				.append(", entertainmentInts=").append(entertainmentInts)
				.append(", sportsInts=").append(sportsInts).append("]");
		return builder.toString();
	}
}