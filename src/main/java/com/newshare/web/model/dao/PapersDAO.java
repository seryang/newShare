package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;

public interface PapersDAO {
	public boolean makePaper(PapersVO pvo);
	
	public int getPaperNum();
	
	public boolean savePosition(PaperPagesVO pvo);
	
	public List<PaperPagesVO> getPaperPages(int paperNum);
	
	List<PapersVO> paperSearch(String keyword) throws SQLException;
	
	/*
	 * 게시글 공개유무 변환하기
	 */
	boolean changeOnOff(HashMap<String, Integer> map) throws SQLException;
}
