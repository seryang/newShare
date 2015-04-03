package com.newshare.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.service.MembersService;
import com.newshare.web.service.PapersService;
import com.newshare.web.service.StandsService;
import com.newshare.web.service.WallBoardService;

@Controller
@SessionAttributes("userInfo")
public class WallBoardController {
	
	@Resource(name="waService")
	private WallBoardService wallBoardService;
	@Resource(name="stService")
	private StandsService standsService;
	@Resource(name="meService")
	private MembersService membersService;
	@Resource(name="paService")
	private PapersService papersService;
	
	@RequestMapping(value="/getwallpaper.do")
	public String getWallBoard(@RequestParam("date")String date, Model model){
		System.out.println(date);
		System.out.println(wallBoardService.getWallBoard(date));
		model.addAttribute("json", wallBoardService.getWallBoard(date));
		return "jsonView";
	}
	
	@RequestMapping(value="/addwallpaperready.do")
	public String addWallPaperReady(@RequestParam("id")String id, Model model){
		try{
			model.addAttribute("json", standsService.getUserPagePapers(id, 1));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/addwallpaper.do")
	public String addWallPaper(@RequestParam("papernum")String paperNum, Model model){
		int paperiNum = Integer.parseInt(paperNum);
		boolean ab = wallBoardService.addWallPaper(paperiNum, papersService.getPaper(paperiNum).getInfo());
		
		return "jsonView";
	}
	/*
	@RequestMapping(value="/insertwallpaper.do")
	public void insertWallBoard()*/
	
}
