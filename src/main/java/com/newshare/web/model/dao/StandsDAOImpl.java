package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;

public class StandsDAOImpl extends SqlSessionDaoSupport implements StandsDAO{
	public int getTotalPapers(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("papers.totalPapers", email);
	}
	
	public int getUserTotalPapers(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("papers.totalUserPapers", email);
	}
	
	public List<PapersVO> getPagePapers(HashMap map) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("papers.eachPagePapers", map);
	}
	
	public List<PapersVO> getUserPagePapers(HashMap map) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("papers.eachUserPagePapers", map);
	}
	
	public boolean deletePaper(PapersVO pvo) throws SQLException {
		SqlSession session = getSqlSession();
		return session.delete("papers.deletePaper", pvo) > 0 ? true : false;
	}
	
	public int getTotalNeighborPapers(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("papers.totalNeighborPapers", email);
	}
	
	public List<PapersVO> getMyNeighborPagePapers(HashMap map) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("papers.eachNeighborPagePapers", map);
	}
	
	public boolean updateInfo(HashMap map) throws SQLException{
		SqlSession session = getSqlSession();
		return session.update("papers.updateInfo", map) > 0 ? true : false;
	}
	
	public boolean likePaper(int paperNum) throws SQLException{
		SqlSession session = getSqlSession();
		return session.update("papers.likePaper", paperNum) > 0 ? true : false;
	}
}
