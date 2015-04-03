package com.newshare.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newshare.web.service.SearchService;

@Controller
public class SearchController {

	@Resource(name="seService")
	private SearchService searchService;
	
	/*
	 *  NAVER api를 이용한 검색
	 */
	@RequestMapping(value="/searchKeyword.do")
	public String searchKeyword(@RequestParam("keyword")String keyword,Model model){
		try {
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
			model.addAttribute("keyword", keyword );
			model.addAttribute("json", searchService.naverOpenAPI(keyword));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "articles/searchView";
	}
	
	/*
	 *  title로 네이버 기사 페이지 검색
	 */
	@RequestMapping(value="/titleSearch.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String titleSearch(@RequestParam("title")String title) {
		title = title.replace("뛓", "%");
		String url = null;
		
		try {
			url = (String) searchService.naverOpenAPI(title).getJSONObject(0).get("link");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	/*
	 * 회원들이 만든 신문 검색하기
	 */
	@RequestMapping(value="/paperSearch.do")
	public String paperSearch(@RequestParam("keyword")String keyword, Model model){
		try{
			model.addAttribute("searchResult", searchService.paperSearch(keyword));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonView";
	}
}
