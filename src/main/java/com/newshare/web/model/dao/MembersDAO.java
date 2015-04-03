package com.newshare.web.model.dao;

import java.sql.SQLException;

import com.newshare.web.model.vo.MembersVO;

public interface MembersDAO {

	boolean insertMembers(MembersVO mvo) throws SQLException;
	
	String idCheck(String id) throws SQLException;
	
	MembersVO loginMembers(MembersVO mvo) throws SQLException;
	
	boolean updateMembers(MembersVO mvo) throws SQLException;
	
	boolean deleteMembers(MembersVO mvo) throws SQLException;
	
	MembersVO searchPassword(MembersVO mvo) throws SQLException;
	
	String userName(String email) throws SQLException;
}
