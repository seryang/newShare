package com.newshare.web.model.vo;

public class SubscriptionsVO {
	private String subscriber;
	private String distributor;
	private String subscriptionDate;
	private int followerCount;
	
	public SubscriptionsVO(){}
	
	public SubscriptionsVO(String subscriber, String distributor,
			String subscriptionDate) {
		super();
		this.subscriber = subscriber;
		this.distributor = distributor;
		this.subscriptionDate = subscriptionDate;
	}

	public SubscriptionsVO(String subscriber, String distributor,
			String subscriptionDate, int followerCount) {
		super();
		this.subscriber = subscriber;
		this.distributor = distributor;
		this.subscriptionDate = subscriptionDate;
		this.followerCount = followerCount;
	}
	
	public SubscriptionsVO(String subscriber, String distributor) {
		super();
		this.subscriber = subscriber;
		this.distributor = distributor;
	}
	
	public String getSubscriber() {
		return subscriber;
	}

	public void setSubscriber(String subscriber) {
		this.subscriber = subscriber;
	}

	public String getDistributor() {
		return distributor;
	}

	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}

	public String getSubscriptionDate() {
		return subscriptionDate;
	}

	public void setSubscriptionDate(String subscriptionDate) {
		this.subscriptionDate = subscriptionDate;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}

	@Override
	public String toString() {
		return "SubscriptionsVO [subscriber=" + subscriber + ", distributor="
				+ distributor + ", subscriptionDate=" + subscriptionDate
				+ ", followerCount=" + followerCount + "]";
	} 
	
}
