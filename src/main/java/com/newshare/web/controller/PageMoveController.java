package com.newshare.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.model.vo.MembersVO;

@Controller
@SessionAttributes("userInfo")
public class PageMoveController {

	/*
	 * 유저 페이지 이동
	 */
	// 회원가입 페이지 이동
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String insert(Model model){
		return "members/insertForm";
	}

	// 로그인 페이지 이동
	@RequestMapping(value="/loginForm.do" , method=RequestMethod.GET)
	public String login(Model model){
		return "members/loginForm";
	}

	// 회원 정보 수정 및 탈퇴 이동하기 전 비밀번호 확인하는 페이지 이동 
	@RequestMapping(value="/passwordForm.do" , method=RequestMethod.GET)
	public String passwordCheck(Model model){
		return "members/passwordForm";
	}

	// 회원 정보 수정 및 탈퇴 페이지 이동
	@RequestMapping(value="/modifyForm.do" , method=RequestMethod.GET)
	public String modify(Model model){
		return "members/modifyForm";
	}

	// 로그아웃 페이지 이동
	@RequestMapping(value = {"/sessionOver.do" ,"/logout.do"} , method=RequestMethod.GET )
	public String sessionOver(Model model){
		return "members/logout";
	}

	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value="/passwordSearchForm.do" , method=RequestMethod.GET)
	public String pwsearch(Model model){
		return "members/passwordSearchForm";
	}

	
	/*
	 *  Paper page 이동
	 */
	@RequestMapping(value="/editing.do" , method=RequestMethod.GET)
	public String editing(@ModelAttribute("userInfo")MembersVO mvo,Model model){
		String url = null;
		try{
			if(mvo != null){
				url = "paperMaking/papertitle";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return url;
	}
	
	/*
	 * Press page 이동 
	 */
	// 언론사리스트 page이동
	@RequestMapping(value="/pressList.do", method=RequestMethod.GET)
	public String pressList(Model model){
		return "articles/pressList";
	}
	
	/*
	 * Portal page 이동 
	 */
	// 포털 page이동
	@RequestMapping(value="/portalList.do", method=RequestMethod.GET)
	public String portal(Model model){
		return "articles/portalView";
	}
	
	//wallBoard 페이지 이동
	@RequestMapping(value="wallboardview.do", method=RequestMethod.GET)
	public String wallBoardView(Model model){
		return "papers/wallboard";
	}
	
	/*
	 * 신문 검색 ( 유저 아이디 , 신문 타이틀로 검색 )
	 */
	@RequestMapping(value="paperSearchView.do", method=RequestMethod.GET)
	public String paperSearchView(Model model){
		return "papers/paperSearchView";
	}
}
