package com.newshare.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.newshare.web.service.PopularService;

@Controller
public class PopularController {

	@Resource(name="popService")
	private PopularService popularService;

	/*
	 * 인기 있는 기사 (스크랩순)
	 */
	@RequestMapping(value="/popularArticle.do")
	public String popularArticle(@RequestParam("day")int day, Model model){
		try{
			model.addAttribute("popularArticle", popularService.popularArticle(day));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	/*
	 * 인기 있는 에디터 ( 구독자순 / 추천순 )
	 */
	@RequestMapping(value="/popularEditor.do")
	public String popularEditor(@RequestParam("standard")String standard, Model model){
		try{
			if(standard.equals("follow")){
				model.addAttribute("popularEditor", popularService.followEditor(standard));
			}else{
				model.addAttribute("popularEditor", popularService.recommendEditor(standard));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	/*
	 * 인기 있는 신문 ( 구독순 / 추천순 )
	 */
	@RequestMapping(value="/popularPaper.do")
	public String popularPaper(@RequestParam("standard")String standard, Model model){
		try{
			if(standard.equals("follow")){
				model.addAttribute("popularPaper", popularService.followPaper(standard));
			}else{
				model.addAttribute("popularPaper", popularService.recommendPaper(standard));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonView";
	}
}
