package com.newshare.web.model.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.MembersVO;

public class MembersDAOImpl extends SqlSessionDaoSupport implements MembersDAO{

	public boolean insertMembers(MembersVO mvo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.insert("members.insertMember",mvo) > 0 ? true : false;
	}
	
	public boolean updateMembers(MembersVO mvo) throws SQLException{
		SqlSession session = getSqlSession();
		return session.update("members.updateMember", mvo) > 0 ? true : false;
	}
	
	public boolean deleteMembers(MembersVO mvo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.delete("members.deleteMember",mvo) > 0 ? true : false;
	}

	public String idCheck(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("members.idCheck", email);
	}

	public MembersVO loginMembers(MembersVO mvo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("members.loginMember", mvo);
	}

	public MembersVO searchPassword(MembersVO mvo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("members.searchPassword", mvo);
	}
	
	public String userName(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("members.userName", email);
	}
}