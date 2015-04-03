package com.newshare.web.model.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.MemberCountsVO;

public class MemberCountsDAOImpl extends SqlSessionDaoSupport implements MemberCountsDAO {
	public boolean insertCounts(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.insert("membercounts.insertCounts",email) > 0 ? true : false;
	}
	
	public boolean politicsCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.politicsCount", email) > 0 ? true : false;
	}
	
	public boolean economyCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.economyCount", email) > 0 ? true : false;
	}
	
	public boolean societyCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.societyCount", email) > 0 ? true : false;
	}
	
	public boolean lifecultureCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.lifecultureCount", email) > 0 ? true : false;
	}
	
	public boolean worldCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.worldCount", email) > 0 ? true : false;
	}
	
	public boolean itscienceCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.itscienceCount", email) > 0 ? true : false;
	}
	
	public boolean entertainmentCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.entertainmentCount", email) > 0 ? true : false;
	}
	
	public boolean sportsCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("membercounts.sportsCount", email) > 0 ? true : false;
	}
	
	public MemberCountsVO selectCount(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("membercounts.selectCount",email);
	}
}