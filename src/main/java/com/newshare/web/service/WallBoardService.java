package com.newshare.web.service;


import java.util.List;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.newshare.web.model.dao.WallBoardDAOImpl;
import com.newshare.web.model.vo.WallBoardVO;

public class WallBoardService {
	
	@Resource(name="waDao")
	WallBoardDAOImpl wallBoardDao;
	
	public void setWallBoardDao(WallBoardDAOImpl wallBoardDao){
		this.wallBoardDao = wallBoardDao;
	}

	public List getWallBoard(String date) {
		Gson gson = new Gson();
		List list = wallBoardDao.getWallBoard(date);
		String json = gson.toJson(list);
		return list;
	}

	public boolean addWallPaper(int paperiNum, String info) {
		return wallBoardDao.addWallPaper(new WallBoardVO(paperiNum, info));
	}
	
}
