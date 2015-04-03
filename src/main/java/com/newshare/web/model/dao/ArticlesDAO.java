package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.ScrapsVO;

public interface ArticlesDAO {
	/* 스크랩하기 1단계 
	 * Article Table
	 */
	// DB에 있는 기사인지 확인
	String checkArticle(String url) throws SQLException;

	// DB에 있는 기사일 경우 Articles 테이블의 scrapCnt 컬럼값 증가
	boolean updateCount(String url) throws SQLException;

	// DB에 없는 기사일 경우 Articles 테이블에 저장하기
	boolean insertArticle(ArticlesVO avo) throws SQLException;
	
	/* 스크랩하기 2단계
	 * Scrap Table
	 */
	// 스크랩 중복 체크
	ScrapsVO checkScrap(ScrapsVO svo) throws SQLException;
	
	// DB에 스크랩한 회원 email과 기사 url을 Scraps 테이블에 저장하기 
	boolean insertScrap(ScrapsVO svo) throws SQLException;
	
	/*
	 * 스크랩 삭제하기
	 */
	boolean deleteScrap(ScrapsVO svo) throws SQLException;
	
	/*
	 * 내가 스크랩한 기사 보기
	 */
	List<ArticlesVO> scrapList(String email) throws SQLException;
	
	/*
	 * url주고 article 빼오기 
	 */
	ArticlesVO getArticle(String url) throws SQLException;
	
	/*
	 * 내가 스크랩한 기사의 언론사 리스트 
	 */
	List<String> scrapPressList(String email) throws SQLException;
	
	/*
	 * 내가 스크랩한 기사의 분야 리스트 
	 */
	List<String> scrapSectionList(String email) throws SQLException;
	
	/*
	 * 추천된 기사 List 가져오기
	 */
	List<ArticlesVO> recommendArticleList(String email) throws SQLException;
	
	/*
	 * 스크랩 테이블 보기(email 오름차순)
	 */
	List<ScrapsVO> scrapsTableList() throws SQLException;
	
	/*
	 * 스크랩 테이블에서 articleUrl List 가져오기
	 */
	List<String> scrapUrlList() throws SQLException;
	
	/*
	 * 스크랩 테이블에서 Email List 가져오기
	 */
	List<String> scrapEmailList() throws SQLException;

	/*
	 * 스크랩한 기사 하나 보기
	 */
	ArticlesVO scrapView(String articleUrl) throws SQLException;

	/*
	 * 관심있는 기사 List 가져오기 ( 회원 가입 시 체크했던 관심도를 기준으로 뽑아오기 ) 
	 */
	List<ArticlesVO> interestArticle(String email) throws SQLException;
}