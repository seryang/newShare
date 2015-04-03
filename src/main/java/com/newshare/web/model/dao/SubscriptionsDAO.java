package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.newshare.web.model.vo.SubscriptionsVO;

public interface SubscriptionsDAO {
	
	/*
	 * 구독 체크하기
	 */
	SubscriptionsVO checkSubscription(SubscriptionsVO svo) throws SQLException ;
		
	/*
	 * 구독하기
	 */
	boolean insertSubscription(HashMap<String, Object> map) throws SQLException;
	
	/*
	 * 구독 취소하기
	 */
	boolean cancleSubscription(HashMap<String, Object> map) throws SQLException;
	
	/*
	 * 내가 구독하고 있는 사람들 리스트 뽑아오기
	 */
	List<String> distributorList(String email) throws SQLException;
}
