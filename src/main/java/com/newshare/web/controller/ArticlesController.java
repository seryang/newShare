package com.newshare.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.newshare.web.model.vo.ArticlesVO;
import com.newshare.web.model.vo.MembersVO;
import com.newshare.web.model.vo.ScrapsVO;
import com.newshare.web.service.ArticlesService;

@Controller
@SessionAttributes("userInfo")
public class ArticlesController {

	@Resource(name="arService")
	private ArticlesService articlesService;

	/*
	 * 스크랩하여 DB에 저장하기
	 */
	@RequestMapping(value="/scrapArticle.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String scrapArticle(@RequestParam("articleUrl")String url, @ModelAttribute("userInfo")MembersVO mvo){
		String checkMsg = "네이버에서 제공하지 않는 기사입니다.";
		try {
			// 받아온 url로 들어가 크롤링해오고 -> url로 articles 테이블에 중복 유무 확인 해보고 -> 없으면 추가 (있으면 넘어감) 
			// -> 스크랩 테이블에 url이랑 이메일 넣어주고 article 카운트 증가 (있으면 이미 스크랩된 기사라고 띄워주고 카운트 증가 x)
			ArticlesVO avo = articlesService.articleCrawling(url);
			if( articlesService.checkArticle(avo.getArticleUrl()) == null ){
				articlesService.insertArticle(avo);
			}

			ScrapsVO svo = new ScrapsVO(mvo.getEmail(), avo.getArticleUrl());
			if( articlesService.checkScrap(svo) == null){
				articlesService.insertScrap(svo);
				articlesService.updateCount(avo.getArticleUrl());
				checkMsg = "스크랩 되었습니다.";
			}else{
				checkMsg = "이미 스크랩 하신 기사입니다.";
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}

	/*
	 *  내 DB에 저장된 스크랩 List 가져오기
	 */
	@RequestMapping(value="/scrapList.do")
	public String scrapList(@ModelAttribute("userInfo")MembersVO mvo, Model model ){
		try{
			model.addAttribute("scrapList",articlesService.scrapList(mvo.getEmail()));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "articles/scrapList";
	}

	/*
	 * 스크랩 삭제
	 */
	@RequestMapping(value="/scrapDelete.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String scrapDelete(@RequestParam("articleUrl")String articleUrl , @ModelAttribute("userInfo")MembersVO mvo){
		String checkMsg = "삭제에 실패하였습니다.\n다시 시도해주세요.";
		ScrapsVO svo = new ScrapsVO(mvo.getEmail(), articleUrl);
		try {
			if(articlesService.scrapDelete(svo)){
				checkMsg = "삭제 되었습니다.";
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	/*
	 * 스크랩한 기사 하나 보기
	 */
	@RequestMapping(value="/scrapView.do", produces="text/plain;charset=UTF-8" )
	public String scrapView(@RequestParam("url")String articleUrl, Model model){
		try{
			model.addAttribute("json", articlesService.scrapView(articleUrl));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	/*
	 * 기사 보기
	 */
	@RequestMapping(value="/articleView.do", produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String searchKeyword(@RequestParam("url")String url){
		Gson gson = new Gson();
		String json = null;
		try {
			json = gson.toJson(articlesService.articleCrawling(url));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	/*
	 * 내가 스크랩한 언론사 List 가져오기
	 */
	@RequestMapping(value="/scrapPressList.do")
	public String scrapPressList(@ModelAttribute("userInfo")MembersVO mvo, Model model){
		try {
			model.addAttribute("json", articlesService.scrapPressList(mvo.getEmail()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	/*
	 * 내가 스크랩한 기사 분야 List 가져오기
	 */
	@RequestMapping(value="/scrapSectionList.do")
	public String scrapSectionList(@ModelAttribute("userInfo")MembersVO mvo, Model model){
		try {
			model.addAttribute("json", articlesService.scrapSectionList(mvo.getEmail()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}

	/*
	 * 추천된 기사 List 가져오기
	 */
	@RequestMapping(value="/recommendArticleList.do")
	public String recommendArticleList(@ModelAttribute("userInfo")MembersVO mvo, Model model ){
		try{
			model.addAttribute("recommendArticleList",articlesService.recommendArticleList(mvo.getEmail()));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "articles/recommendArticleList";
	}
	
	/*
	 * 관심 있는 기사 List 가져오기 
	 */
	@RequestMapping(value="interestArticleList.do")
	public String interestArticle(@ModelAttribute("userInfo")MembersVO mvo, Model model){
		try{
			model.addAttribute("interestArticleList", articlesService.interestArticle(mvo.getEmail()));
		} catch(Exception e){
			e.printStackTrace();
		}
		return "articles/interestArticleList";
	}
}