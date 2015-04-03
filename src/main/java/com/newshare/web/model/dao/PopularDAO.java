package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.PapersVO;
import com.newshare.web.model.vo.SubscriptionsVO;

public interface PopularDAO {
	
	/*
	 * 인기 기사 보기 (스크랩순)
	 */
	List<ArticlesVO> popularArticle(int day) throws SQLException;
	
	/*
	 * 인기 에디터 보기 (구독자순)
	 */
	List<SubscriptionsVO> followEditor(String standard) throws SQLException;
	
	/*
	 * 인기 에디터 보기 (추천순)
	 */
	List<SubscriptionsVO> recommendEditor(String standard) throws SQLException;
	
	/*
	 * 인기 신문 보기 (구독자순)
	 */
	List<PapersVO> followPaper(String standard) throws SQLException;
	
	/*
	 * 인기 신문 보기 (추천순)
	 */
	List<PapersVO> recommendPaper(String standard) throws SQLException;
}
