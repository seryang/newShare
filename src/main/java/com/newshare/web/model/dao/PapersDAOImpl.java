package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;

public class PapersDAOImpl extends SqlSessionDaoSupport implements PapersDAO {
	
	public boolean makePaper(PapersVO pvo) {
		SqlSession session = getSqlSession();
		return session.insert("papers.insertPaper", pvo) > 0 ? true : false;
	}

	public int getPaperNum() {
		SqlSession session = getSqlSession();
		return session.selectOne("papers.getPaperNum");
	}

	public boolean savePosition(PaperPagesVO pvo) {
		SqlSession session = getSqlSession();
		return session.insert("papers.savePosition", pvo) > 0? true : false;
	}

	public List<PaperPagesVO> getPaperPages(int paperNum) {
		SqlSession session = getSqlSession();
		return session.selectList("papers.getPaperPages", paperNum);
	}
	
	public PapersVO getPaper(int paperNum){
		SqlSession session = getSqlSession();
		return session.selectOne("papers.getPaper", paperNum);
	}

	public boolean setOpen(HashMap<String, Integer> map) {
		SqlSession session = getSqlSession();
		return session.insert("papers.setOpen", map) > 0? true : false;
	}

	public List<PapersVO> paperSearch(String keyword) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("papers.paperSearch", keyword);
	}
	
	/*
	 * 게시글 공개유무 변환하기
	 */
	public boolean changeOnOff(HashMap<String, Integer> map) throws SQLException {
		SqlSession session = getSqlSession();
		return session.update("papers.changeOnOff", map) > 0 ? true : false;
	}
}
