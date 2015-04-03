package com.newshare.web.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.newshare.web.model.dao.ArticlesDAOImpl;
import com.newshare.web.model.dao.PapersDAOImpl;
import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;

public class PapersService {
	
	@Resource(name="paDao")
	PapersDAOImpl papersDao;
	
	@Resource(name="arDao")
	ArticlesDAOImpl articlesDao;

	public void setPapersDao(PapersDAOImpl papersDao){
		this.papersDao = papersDao;
	}
	
	public List<ArticlesVO> getScraps(String id, int col) throws SQLException {
		List<ArticlesVO> list = articlesDao.scrapList(id);
		//ArrayList<ArticlesVO> colList = new ArrayList<ArticlesVO>();
		System.out.println(list.size());
		if(list.size()>10){
			list = colScraps(list, col);
		}
		//System.out.println(list.size());
		//System.out.println(list);
		return list;
	}
	
	public static List<ArticlesVO> colScraps(List list, int col){
		List <ArticlesVO> colList = new ArrayList <ArticlesVO>();
		if(list.size() < col*10){
			for(int i = (col-1)*10; i < list.size(); i ++){
				colList.add((ArticlesVO) list.get(i));
			}
		}else{
		for(int i = (col-1)*10; i < col*10; i ++){
			colList.add((ArticlesVO) list.get(i));
		}
		}
		System.out.println(colList.size());
		return colList;
	}
	
	public int getScrapNum (String id) throws SQLException {
		List<ArticlesVO> list = articlesDao.scrapList(id);
		return list.size();
	}

	public boolean makePaper(PapersVO pvo) {
		return papersDao.makePaper(pvo);
	}

	public int getPaperNum() {
		return papersDao.getPaperNum();
	}

	public boolean savePosition(PaperPagesVO pvo) {
		return papersDao.savePosition(pvo);
		
	}

	public String getPaperPages(int paperNum) {
		HashMap hm = new HashMap();
		List<PaperPagesVO> list = papersDao.getPaperPages(paperNum);
		PaperPagesVO pvo = null;
		ArticlesVO avo = null;
		String jsonPaper = "[";
		System.out.println(list.size()+"!!");
		for(int i=0; i< list.size(); i++){
			pvo = list.get(i);
			System.out.println(pvo);
			String [] informs = pvo.getFrameInform().split(",");
			System.out.println(informs.length + "??");
			for(int j=0; j< informs.length; j ++){
				System.out.println(j+"번째 기사");
				String firstPoint = informs[j].substring((informs[j].indexOf('f') + 1),(informs[j].indexOf('l')));
				System.out.println(firstPoint);
				String lastPoint = informs[j].substring((informs[j].indexOf('l') + 1),(informs[j].indexOf('h')));
				System.out.println(lastPoint);
				try {
					avo = articlesDao.getArticle(informs[j].substring((informs[j].indexOf('h'))));
					//System.out.println(informs[j].substring((informs[j].indexOf('h'))));
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String jsonInfo = "{\"page\": \"" +pvo.getPage() + "\", \"firstPoint\": \""+firstPoint+"\", \"lastPoint\" : \"" +lastPoint + "\", \"articleUrl\" : \"" + avo.getArticleUrl() + "\", \"title\" : \"" + avo.getTitle().replaceAll("\"", "ffffffff") + "\", \"description\" : \"" + avo.getDescription().replaceAll("\"", "ffffffff") + "\", \"image\" : \"" + avo.getImage() + "\", \"content\" : \"" + avo.getContent().replaceAll("\"", "ffffffff") + "\", \"writingDate\" : \"" + avo.getWritingDate() + "\", \"press\" : \""  + avo.getPress() + "\", \"articleSection\" : \""  + avo.getArticleSection() + "\", \"scrapCnt\" : \"" + avo.getScrapCnt() + "\"}";
				System.out.println(jsonInfo);
				if(j > 0 || i > 0){
					jsonPaper += ",";
				}
				jsonPaper += jsonInfo;
			}
			
			hm.put("page"+pvo.getPage(), jsonPaper);//infoPerPage.put("page"+pvo.getPage(), pageStyle);
		}
		jsonPaper += "]";
		System.out.println(jsonPaper);
		return jsonPaper;
	}

	public PapersVO getPaper(int paperNum) {
		PapersVO pvo = papersDao.getPaper(paperNum);
		return pvo;
	}

	public boolean setOpen(int paperNum, int open) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("open", open);
		map.put("papernum",paperNum);
		return papersDao.setOpen(map);
	}
	
	/*
	 * 게시글 공개 유무 변환하기
	 */
	public boolean changeOnOff(int paperNum,int chk) throws SQLException {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("paperNum", paperNum);
		map.put("chk",chk);
		return papersDao.changeOnOff(map);
	}
}
