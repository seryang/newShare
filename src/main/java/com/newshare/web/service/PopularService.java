package com.newshare.web.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import com.newshare.web.model.dao.PopularDAOImpl;
import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.PapersVO;
import com.newshare.web.model.vo.SubscriptionsVO;

public class PopularService {
	
	@Resource(name="popDao")
	PopularDAOImpl popularDao;
	
	public void setPopularDao(PopularDAOImpl popularDao){
		this.popularDao = popularDao;
	}
	
	/*
	 * 인기있는 기사 (스크랩순)
	 */
	public ArrayList<ArticlesVO> popularArticle(int day) throws SQLException {
		return (ArrayList<ArticlesVO>) popularDao.popularArticle(day);
	}
	
	/*
	 * 인기있는 에디터 (구독자순)
	 */
	public ArrayList<SubscriptionsVO> followEditor(String standard) throws SQLException {
		return (ArrayList<SubscriptionsVO>) popularDao.followEditor(standard);
	}
	
	/*
	 * 인기있는 에디터 (추천순)
	 */
	public ArrayList<SubscriptionsVO> recommendEditor(String standard)throws SQLException {
		return (ArrayList<SubscriptionsVO>) popularDao.recommendEditor(standard);
	}
	
	/*
	 * 인기있는 신문 (구독자순)
	 */
	public ArrayList<PapersVO> followPaper(String standard) throws SQLException {
		return (ArrayList<PapersVO>) popularDao.followPaper(standard);
	}
	
	/*
	 * 인기있는 신문 (추천순)
	 */
	public ArrayList<PapersVO> recommendPaper(String standard)throws SQLException {
		return (ArrayList<PapersVO>) popularDao.recommendPaper(standard);
	}
}
