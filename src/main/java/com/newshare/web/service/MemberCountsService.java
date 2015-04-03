package com.newshare.web.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.newshare.web.model.dao.MemberCountsDAOImpl;
import com.newshare.web.model.vo.MemberCountsVO;

public class MemberCountsService {
	@Resource(name="mcDao")
	MemberCountsDAOImpl memberCountsDao;
	
	public void setMemberCountsDao(MemberCountsDAOImpl memberCountsDao){
		this.memberCountsDao = memberCountsDao;
	}
	
	/*
	 * 분야 카운트
	 */
	public boolean sectionCount(String section, String email) throws SQLException{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("section", section);
		map.put("email", email);
		
		if (section.equals("정치")) {
			return memberCountsDao.politicsCount(email);
		} else if (section.equals("경제")) {
			return memberCountsDao.economyCount(email);
		} else if (section.equals("사회")) {
			return memberCountsDao.societyCount(email);
		} else if (section.equals("생활/문화")) {
			return memberCountsDao.lifecultureCount(email);
		} else if (section.equals("세계")) {
			return memberCountsDao.worldCount(email);
		} else if (section.equals("IT/과학")) {
			return memberCountsDao.itscienceCount(email);
		} else if (section.equals("연예")) {
			return memberCountsDao.entertainmentCount(email);
		} else if (section.equals("sports")) {
			return memberCountsDao.sportsCount(email);
		} else {
			return false;
		}
	}
	
	public JSONArray selectCount(String email) throws IOException, SQLException {
		MemberCountsVO mc;
		double[] list = new double [8];
		double sum = 0;
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		
		mc = (MemberCountsVO) memberCountsDao.selectCount(email);
		list[0] = mc.getPoliticsCnt();
		list[1] = mc.getEconomyCnt();
		list[2] = mc.getSocietyCnt();
		list[3] = mc.getLifeCultureCnt();
		list[4] = mc.getWorldCnt();
		list[5] = mc.getItScienceCnt();
		list[6] = mc.getEntertainmentCnt();
		list[7] = 	mc.getSportsCnt();
		
		for (double i : list) {
			sum += i;
		}
		
		for (int i = 0; i < list.length; i++) {
			list[i] = (list[i] / sum) * 100;
		}
		
		obj.put("po", list[0]);
		obj.put("ec", list[1]);
		obj.put("so", list[2]);
		obj.put("lc", list[3]);
		obj.put("wo", list[4]);
		obj.put("is", list[5]);
		obj.put("en", list[6]);
		obj.put("sp", list[7]);
		
		arr.add(obj);
		
		return arr;
	}
}
