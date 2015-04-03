package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.SubscriptionsVO;

public class SubscriptionsDAOImpl extends SqlSessionDaoSupport implements SubscriptionsDAO {

	/*
	 * 구독 체크하기
	 */
	public SubscriptionsVO checkSubscription(SubscriptionsVO svo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("subscriptions.checkSubscription",svo);
	}
	
	/*
	 * 구독하기
	 */
	public boolean insertSubscription(HashMap<String, Object> map) throws SQLException {
		SqlSession session = getSqlSession();
		return session.insert("subscriptions.insertSubscription", map) > 0 ? true : false;
	}
	
	/*
	 * 구독 취소하기
	 */
	public boolean cancleSubscription(HashMap<String, Object> map) throws SQLException {
		SqlSession session = getSqlSession();
		return session.delete("subscriptions.cancleSubscription", map) > 0 ? true : false;
	}
	
	/*
	 *  내가 구독하고 있는 사람들 리스트 뽑아오기
	 */
public List<String> distributorList(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("subscriptions.distributorList",email);
	}
}
