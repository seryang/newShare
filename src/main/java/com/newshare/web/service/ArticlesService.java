package com.newshare.web.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.newshare.service.CollaborativeFiltering;
import com.newshare.web.model.dao.ArticlesDAOImpl;
import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.ScrapsVO;

public class ArticlesService {
	@Resource(name="arDao")
	ArticlesDAOImpl articlesDao;
	
	private CollaborativeFiltering cf = new CollaborativeFiltering();
	
	public void setArticlesDao(ArticlesDAOImpl articlesDao){
		this.articlesDao = articlesDao;
	}
	
	/*
	 *  기사 크롤링
	 */
	public ArticlesVO articleCrawling(String tempUrl) throws IOException {
		String articleUrl = null;
		String title = null;
		String description = null;
		String image = null;
		String content = null;
		String writingDate = null;
		String press = null;
		String articleSection = null;
		Element temp1;
		Elements temp2;
		
		tempUrl = tempUrl.replaceAll(" ", "+");
		Document doc = Jsoup.connect(tempUrl).get();
		temp2 = doc.getElementsByTag("meta");
		temp1 = temp2.get(2);
		articleSection = temp1.attr("content");
		
		if (articleSection.equals("article")) {
			temp1 = temp2.get(3);
			articleUrl = temp1.attr("content");
			
			temp1 = temp2.get(5);
			description = temp1.attr("content");
			
			temp1 = temp2.get(4);
			image = temp1.attr("content");
	
			temp1 = temp2.get(6);
			press = temp1.attr("content").split(" \\| ")[1];
			
			temp2 = doc.getElementsByClass("article");
			temp1 = temp2.get(0);
			temp1.getElementsByClass("link_news").empty();
			temp1.getElementsByTag("a").empty();
			temp1.getElementsByTag("table").empty();
			content = temp1.toString().replaceAll("<br />", "궭").replaceAll("<p>", "궭").replaceAll("<br>", "궭");
			temp2 = Jsoup.parse(content).getElementsByClass("article");
			temp1 = temp2.get(0);
			content = temp1.text().replaceAll("궭", "<br>");
			
			temp2 = doc.getElementsByClass("time");
			writingDate = temp2.get(0).text();
			
			temp2 = doc.getElementsByClass("tit_article");
			temp1 = temp2.get(0);
			title = temp1.text().trim();
		} else {		
			temp1 = temp2.get(8);
			articleUrl = temp1.attr("content");
			
			temp1 = temp2.get(4);
			articleSection = temp1.attr("content");
			
			temp1 = doc.getElementById("articleTitle");
			title = temp1.text();

			temp1 = temp2.get(10);
			description = temp1.attr("content");
			
			temp1 = temp2.get(5);
			image = temp1.attr("content");
	
			temp1 = temp2.get(3);
			press = temp1.attr("content");
			
			temp1 = doc.getElementById("articleBody");
			temp1.getElementsByClass("link_news").empty();
			temp1.getElementsByTag("table").empty();
			temp1.getElementsByTag("font").empty();
			content = temp1.toString().replaceAll("<br />", "궭").replaceAll("<p>", "궭").replaceAll("<br>", "궭");
			temp1 = Jsoup.parse(content).getElementById("articleBody");
			content = temp1.text().replaceAll("궭", "<br>");

			temp2 = doc.getElementsByClass("t11");
			temp1 = temp2.get(0);
			writingDate = temp1.text();
		}
		articleUrl = articleUrl.replaceAll("u003d", "=");
		articleUrl = articleUrl.replaceAll("u0026", "&");
		ArticlesVO avo = new ArticlesVO();
		avo.setArticleUrl(articleUrl);
		avo.setTitle(title);
		avo.setDescription(description);
		avo.setImage(image);
		avo.setContent(content);
		avo.setWritingDate(writingDate);
		avo.setPress(press);
		avo.setArticleSection(articleSection.replace("article", "sports"));
        return avo;
	}
	
	/*
	 *  articles 테이블에 기사 url로 중복 유무 체크
	 */
	public String checkArticle(String url) throws SQLException{
		return articlesDao.checkArticle(url);
	}
	
	/*
	 * articles 테이블에 기사 추가
	 */
	public boolean insertArticle(ArticlesVO avo) throws SQLException{
		return articlesDao.insertArticle(avo);
	}
	
	/*
	 * 스크랩시 기사 카운트 증가
	 */
	public boolean updateCount(String url) throws SQLException {
		return articlesDao.updateCount(url);
	}
	
	/*
	 * 스크랩 중복 유무 체크
	 */
	public ScrapsVO checkScrap(ScrapsVO svo) throws SQLException{
		return articlesDao.checkScrap(svo);
	}
	
	/*
	 * 스크랩테이블에 추가
	 */
	public boolean insertScrap(ScrapsVO svo) throws SQLException{
		return articlesDao.insertScrap(svo);
	}
	
	/*
	 *  내 DB에 저장된 스크랩 List 가져오기
	 */
	public ArrayList<ArticlesVO> scrapList(String email) throws SQLException{
		return (ArrayList<ArticlesVO>) articlesDao.scrapList(email);
	}
	
	/*
	 * 스크랩 삭제
	 */
	public boolean scrapDelete(ScrapsVO svo) throws SQLException {
		return articlesDao.deleteScrap(svo);
	}
	
	/*
	 * 스크랩한 기사 하나 보기
	 */
	public ArticlesVO scrapView(String articleUrl) throws SQLException {
		return articlesDao.scrapView(articleUrl);
	}

	/*
	 * 내가 스크랩한 언론사 List 가져오기
	 */
	public ArrayList<String> scrapPressList(String email) throws SQLException {
		return (ArrayList<String>) articlesDao.scrapPressList(email);
	}
	
	/*
	 * 내가 스크랩한 기사 분야 List 가져오기
	 */
	public ArrayList<String> scrapSectionList(String email) throws SQLException {
		return (ArrayList<String>) articlesDao.scrapSectionList(email);
	}
	
	/*
	 *  추천된 기사 List 가져오기
	 */
	public ArrayList<ArticlesVO> recommendArticleList(String email) throws SQLException{
		int user[];
		int data[][];
		int recommend[];
		int userIndex = 9999;
		int otherIndex = 0;
		List<String> scrapUrlList;
		List<String> scrapEmailList;
		List<ScrapsVO> scrapsTableList;
		List<String> ul = new ArrayList<String>();
		List<String> el = new ArrayList<String>();
		List<ArticlesVO> recommendArticleList = new ArrayList<ArticlesVO>();
		
		scrapUrlList = articlesDao.scrapUrlList();
		for (int i = 0; i < scrapUrlList.size(); i++) {
			ul.add(scrapUrlList.get(i));
		}
		
		scrapEmailList = articlesDao.scrapEmailList();
		for (int i = 0; i < scrapEmailList.size(); i++) {
			el.add(scrapEmailList.get(i));
		}
		
		user = new int[scrapUrlList.size()];
		data = new int[scrapEmailList.size()-1][scrapUrlList.size()];
		recommend = new int[scrapUrlList.size()];
		scrapsTableList = articlesDao.scrapsTableList();
		for (int i = 0; i < scrapsTableList.size(); i++) {
			if (scrapsTableList.get(i).getEmail().equals(email)) {
				userIndex = ul.indexOf(scrapsTableList.get(i).getEmail());
				user[ul.indexOf(scrapsTableList.get(i).getArticleUrl())] = 1;
			} else {
				otherIndex = el.indexOf(scrapsTableList.get(i).getEmail());
				if (userIndex < otherIndex) {
					data[otherIndex-1][ul.indexOf(scrapsTableList.get(i).getArticleUrl())] = 1;
				} else {
					data[otherIndex][ul.indexOf(scrapsTableList.get(i).getArticleUrl())] = 1;
				}
			}
		}
		
		recommend = cf.cal(user, data);
		for (int i = 0; i < data[0].length; i++) {
			System.out.print(recommend[i] + " ");
		}
		for (int i = 0; i < data[0].length; i++) {
			if (recommend[i] == 1) {
				recommendArticleList.add(articlesDao.getArticle(scrapUrlList.get(i)));
			}
		}		
		
		return (ArrayList<ArticlesVO>)recommendArticleList;
	}
	
	/*
	 * 관심있는 기사 List 가져오기 ( 회원 가입 시 체크했던 관심도를 기준으로 뽑아오기 ) 
	 */
	public HashMap <String,ArrayList<ArticlesVO>> interestArticle(String email) throws SQLException {
		ArrayList<ArticlesVO> avoList = (ArrayList<ArticlesVO>) articlesDao.interestArticle(email);
		HashMap <String,ArrayList<ArticlesVO>> interest = new HashMap <String,ArrayList<ArticlesVO>>();
		for( ArticlesVO avo : avoList ){
			if( !interest.containsKey( avo.getArticleSection() ) ){
				interest.put( avo.getArticleSection() , new ArrayList<ArticlesVO>());
			}
			interest.get( avo.getArticleSection()).add(avo);
		}
		return interest;
	}
}
