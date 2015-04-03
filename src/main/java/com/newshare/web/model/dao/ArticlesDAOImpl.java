package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.ScrapsVO;

public class ArticlesDAOImpl extends SqlSessionDaoSupport implements ArticlesDAO {
	
	/* 스크랩하기 1단계 
	 * Article Table
	 */
	// DB에 있는 기사인지 확인
	public String checkArticle(String url) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("articles.checkArticle", url);
	}

	// DB에 있는 기사일 경우 Articles 테이블의 scrapCnt 컬럼값 증가
	public boolean updateCount(String url) throws SQLException{
		SqlSession session = getSqlSession();
		return session.update("articles.updateCount",url) > 0 ? true : false;
	}

	// DB에 없는 기사일 경우 Articles 테이블에 저장하기
	public boolean insertArticle(ArticlesVO avo) throws SQLException{
		SqlSession session = getSqlSession();
		return session.insert("articles.insertArticle",avo) > 0 ? true : false;
	}
	
	/* 스크랩하기 2단계
	 * Scrap Table
	 */
	// 스크랩 중복 체크
	public ScrapsVO checkScrap(ScrapsVO svo) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectOne("scraps.checkScrap",svo);
	}
	
	// DB에 스크랩한 회원 email과 기사 url을 Scraps 테이블에 저장하기 
	public boolean insertScrap(ScrapsVO svo) throws SQLException{
		SqlSession session = getSqlSession();
		return session.insert("scraps.insertScrap",svo) > 0 ? true : false;
	}
	
	/*
	 * 스크랩 삭제하기
	 */
	public boolean deleteScrap(ScrapsVO svo) throws SQLException{
		SqlSession session = getSqlSession();
		return session.delete("scraps.deleteScrap",svo) > 0 ? true : false;
	}
	
	/*
	 * 내가 스크랩한 기사 보기
	 */
	public List<ArticlesVO> scrapList(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapList",email);
	}
	
	/*
	 * url주고 article 빼오기 
	 */
	public ArticlesVO getArticle(String url) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("articles.getArticle",url);
	}
	
	/*
	 * 내가 스크랩한 기사의 언론사 리스트 
	 */
	public List<String> scrapPressList(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapPressList",email);
	}
	
	/*
	 * 내가 스크랩한 기사의 분야 리스트 
	 */
	public List<String> scrapSectionList(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapSectionList",email);
	}
	
	
	/*
	 * 추천된 기사 List 가져오기
	 */
	public List<ArticlesVO> recommendArticleList(String email) throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("articles.recommendArticleList",email);
	}
	
	/*
	 * 스크랩 테이블 보기(email 오름차순)
	 */
	public List<ScrapsVO> scrapsTableList() throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapsTableList");
	}
	
	/*
	 * 스크랩 테이블에서 articleUrl List 가져오기
	 */
	public List<String> scrapUrlList() throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapUrlList");
	}
	
	/*
	 * 스크랩 테이블에서 Email List 가져오기
	 */
	public List<String> scrapEmailList() throws SQLException{
		SqlSession session = getSqlSession();
		return session.selectList("articles.scrapEmailList");
	}
	
	/*
	 * 스크랩한 기사 하나 보기
	 */
	public ArticlesVO scrapView(String articleUrl) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectOne("articles.scrapView",articleUrl);
	}

	/*
	 * 관심있는 기사 List 가져오기 ( 회원 가입 시 체크했던 관심도를 기준으로 뽑아오기 ) 
	 */
	public List<ArticlesVO> interestArticle(String email) throws SQLException {
		SqlSession session = getSqlSession();
		return session.selectList("articles.interestArticle", email);
	}
}