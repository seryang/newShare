package com.newshare.web.model.dao;

import java.sql.SQLException;

import com.newshare.web.model.vo.MemberCountsVO;

public interface MemberCountsDAO {
	// 회원의 카운트 정보 초기화
	boolean insertCounts(String email) throws SQLException;
	
	// 분야 카운트
	boolean politicsCount(String email) throws SQLException;
	
	boolean economyCount(String email) throws SQLException;
	
	boolean societyCount(String email) throws SQLException;
	
	boolean lifecultureCount(String email) throws SQLException;
	
	boolean worldCount(String email) throws SQLException;
	
	boolean itscienceCount(String email) throws SQLException;
	
	boolean entertainmentCount(String email) throws SQLException;
	
	boolean sportsCount(String email) throws SQLException;
	
	// 분야별 카운트 정보 가져오기
	MemberCountsVO selectCount(String email) throws SQLException;
}