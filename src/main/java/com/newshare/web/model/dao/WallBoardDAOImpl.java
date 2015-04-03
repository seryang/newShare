package com.newshare.web.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.WallBoardVO;

public class WallBoardDAOImpl extends SqlSessionDaoSupport implements WallBoardDAO {

	public List getWallBoard(String date) {
		SqlSession session = getSqlSession();
		return session.selectList("papers.getWallBoard", date);
	}

	public boolean addWallPaper(WallBoardVO wvo) {
		SqlSession session = getSqlSession();
		return session.insert("papers.insertWall", wvo) > 0 ? true : false;
	}

}
