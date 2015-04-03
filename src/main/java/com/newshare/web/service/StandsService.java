package com.newshare.web.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.newshare.web.model.dao.ArticlesDAOImpl;
import com.newshare.web.model.dao.PapersDAOImpl;
import com.newshare.web.model.dao.StandsDAOImpl;
import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;


public class StandsService {
	@Resource(name="stDao")
	private StandsDAOImpl standsDao ;
	
	@Resource(name="paDao")
	PapersDAOImpl papersDao;
	
	@Resource(name="arDao")
	ArticlesDAOImpl articlesDao;
	
	public void setStandsDao(StandsDAOImpl standsDao){
		this.standsDao = standsDao;
	}
	
	public void setPapersDao(PapersDAOImpl papersDao){
		this.papersDao = papersDao;
	}
	
	public int getTotalPages(String email) throws SQLException{
		return ((standsDao.getTotalPapers(email)-1) / 6) + 1;
	}
	
	public int getUserTotalPages(String email) throws SQLException{
		return ((standsDao.getUserTotalPapers(email)-1) / 6) + 1;
	}
	
	public ArrayList<PapersVO> getPagePapers(String email, int pageNum) throws SQLException{
		HashMap map = new HashMap<String, Object>();
		ArrayList<PapersVO> arr = new ArrayList();
		PapersVO pvo = null;
		if(((standsDao.getTotalPapers(email)-1)/6 + 1) == pageNum){
			int firstNum = (pageNum-1)*6+1;
			int lastNum = standsDao.getTotalPapers(email);
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}else{
			int firstNum = (pageNum-1)*6+1;
			int lastNum = pageNum*6;
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}
		arr = (ArrayList<PapersVO>)standsDao.getPagePapers(map);
		for(int i = 0; i<arr.size(); i++){
			arr.get(i).setArticles(getStandArticles(arr.get(i).getPaperNum()));
			arr.get(i).setDayOfWeek(calDayOfWeek(arr.get(i).getMakingDate()));
		}
		return arr;
	}
	
	public ArrayList<PapersVO> getUserPagePapers(String email, int pageNum) throws SQLException{
		HashMap map = new HashMap<String, Object>();
		ArrayList<PapersVO> arr = new ArrayList();
		PapersVO pvo = null;
		if(((standsDao.getUserTotalPapers(email)-1)/6 + 1) == pageNum){
			int firstNum = (pageNum-1)*6+1;
			int lastNum = standsDao.getUserTotalPapers(email);
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}else{
			int firstNum = (pageNum-1)*6+1;
			int lastNum = pageNum*6;
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}
		arr = (ArrayList<PapersVO>)standsDao.getUserPagePapers(map);
		for(int i = 0; i<arr.size(); i++){
			arr.get(i).setArticles(getStandArticles(arr.get(i).getPaperNum()));
			arr.get(i).setDayOfWeek(calDayOfWeek(arr.get(i).getMakingDate()));
		}
		return arr;
	}
	
	public boolean deleteMyPaper(PapersVO pvo) throws SQLException{
		return standsDao.deletePaper(pvo);
	}
	
	public int getTotalNeighborPapers(String email) throws SQLException{
		return ((standsDao.getTotalNeighborPapers(email)-1) / 6) + 1;
	}
	
	public ArrayList<PapersVO> getNeighborPagePapers(String email, int pageNum) throws SQLException{
		HashMap map = new HashMap<String, Object>();
		ArrayList<PapersVO> arr = new ArrayList();
		PapersVO pvo = null;
		if(((standsDao.getTotalNeighborPapers(email)-1)/6 + 1) == pageNum){
			int firstNum = (pageNum-1)*6+1;
			int lastNum = standsDao.getTotalNeighborPapers(email);
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}else{
			int firstNum = (pageNum-1)*6+1;
			int lastNum = pageNum*6;
			map.put("email", email);
			map.put("firstNum", firstNum);
			map.put("lastNum", lastNum);
		}
		arr = (ArrayList<PapersVO>)standsDao.getMyNeighborPagePapers(map);
		for(int i = 0; i<arr.size(); i++){
			arr.get(i).setArticles(getStandArticles(arr.get(i).getPaperNum()));
			arr.get(i).setDayOfWeek(calDayOfWeek(arr.get(i).getMakingDate()));
		}
		return arr;
	}
	
	public String getStandArticles(int paperNum) throws SQLException{
		List<PaperPagesVO> list = papersDao.getPaperPages(paperNum);
		PaperPagesVO pvo = null;
		ArticlesVO avo = null;
		String jsonArticles = "";
		for(int i=0; i<list.size(); i++){
			pvo = list.get(i);
			String [] informs = pvo.getFrameInform().split(",");
			for(int j=0; j<informs.length; j++){
				avo = articlesDao.getArticle(informs[j].substring((informs[j].indexOf('h'))));
				String jsonTitle = avo.getTitle() + "<br>";
				jsonArticles += jsonTitle;
			}
		}
		return jsonArticles;
	}
	
	public String calDayOfWeek (String date) throws SQLException{
		Calendar cal = Calendar.getInstance();
		String dayOfWeek = null;
		String [] arr;
		arr = date.split("/");
		cal.set(Integer.parseInt(arr[2]), Integer.parseInt(arr[0])-1, Integer.parseInt(arr[1]));
		switch (cal.get(Calendar.DAY_OF_WEEK)){
			case 1:
				dayOfWeek = "Sun";
				break;
			case 2:
				dayOfWeek = "Mon";
				break;
			case 3:
				dayOfWeek = "Tue";
				break;
			case 4:
				dayOfWeek = "Wed";
				break;
			case 5:
				dayOfWeek = "Thu";
				break;
			case 6:
				dayOfWeek = "Fri";
				break;
			case 7:
				dayOfWeek = "Sat";
				break;
		}
		return dayOfWeek;
	}
	
	public boolean updateInfo(HashMap map) throws SQLException{
		return standsDao.updateInfo(map);
	}
	
	public boolean likePaper(int paperNum) throws SQLException{
		return standsDao.likePaper(paperNum);
	}
}
