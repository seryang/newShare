package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.PapersVO;
import com.newshare.web.model.vo.SubscriptionsVO;

public class PopularDAOImpl extends SqlSessionDaoSupport implements PopularDAO{

	/*
	 * 인기 기사 보기 (스크랩순)
	 */
	public List<ArticlesVO> popularArticle(int day) throws SQLException{
		SqlSession session = getSqlSession();
		
		return session.selectList("articles.popularArticle",day);
	}
	
	/*
	 * 인기 에디터 보기 (구독자순)
	 */
	public List<SubscriptionsVO> followEditor(String standard) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("subscriptions.distributor");
	}
	
	/*
	 * 인기 에디터 보기 (추천순)
	 */
	public List<SubscriptionsVO> recommendEditor(String standard) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("subscriptions.recommendEditor");
	}

	/*
	 * 인기 신문 보기 (구독자순)
	 */
	@Override
	public List<PapersVO> followPaper(String standard) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectList("papers.email");
	}

	/*
	 * 인기 신문 보기 (추천순)
	 */
	@Override
	public List<PapersVO> recommendPaper(String standard) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectList("papers.recommendPaper");
	}
}
