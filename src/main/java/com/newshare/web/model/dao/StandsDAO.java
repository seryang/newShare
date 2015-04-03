package com.newshare.web.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;

public interface StandsDAO {
	int getTotalPapers(String email) throws SQLException;
	
	int getUserTotalPapers(String email) throws SQLException;
	
	List<PapersVO> getPagePapers(HashMap map) throws SQLException;
	
	List<PapersVO> getUserPagePapers(HashMap map) throws SQLException;
	
	boolean deletePaper(PapersVO pvo) throws SQLException;
	
	int getTotalNeighborPapers(String email) throws SQLException;
	
	List<PapersVO> getMyNeighborPagePapers(HashMap map) throws SQLException;
		
	boolean updateInfo(HashMap map) throws SQLException;
	
	boolean likePaper(int paperNum) throws SQLException;
}
