package com.newshare.web.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import com.newshare.web.model.dao.SubscriptionsDAOImpl;
import com.newshare.web.model.vo.SubscriptionsVO;

public class SubscriptionsService {
	
	SubscriptionsDAOImpl subscriptionsDao;
	
	public void setSubscriptionsDao(SubscriptionsDAOImpl subscriptionsDao){
		this.subscriptionsDao = subscriptionsDao;
	}
	
	/*
	 * 구독 체크하기
	 */
	public SubscriptionsVO checkSubscription(SubscriptionsVO svo) throws SQLException{
		return subscriptionsDao.checkSubscription(svo);
	}
	
	/*
	 * 구독하기
	 */
	public boolean insertSubscription(String distributor, String email) throws SQLException{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("distributor", distributor);
		map.put("subscriber", email);
		
		return subscriptionsDao.insertSubscription(map);
	}
	
	/*
	 * 구독취소하기
	 */
	public boolean cancleSubscription(String distributor, String email) throws SQLException{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("distributor", distributor);
		map.put("subscriber", email);
		
		return subscriptionsDao.cancleSubscription(map);
	}
	
	/*
	 *  내가 구독하고 있는 사람들 리스트 뽑아오기
	 */
	public ArrayList<String> distributorList(String email) throws SQLException {
		return (ArrayList<String>) subscriptionsDao.distributorList(email);
	}
}
