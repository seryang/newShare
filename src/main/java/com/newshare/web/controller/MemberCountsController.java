package com.newshare.web.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.model.vo.MembersVO;
import com.newshare.web.service.MemberCountsService;

@Controller
@SessionAttributes("userInfo")
public class MemberCountsController {

	@Resource(name="mcService")
	private MemberCountsService memberCountsService;

	/*
	 *  분야 카운트
	 */
	@RequestMapping(value="/sectionCount.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String sectionCount(@RequestParam("section")String section, @ModelAttribute("userInfo")MembersVO mvo, Model model ){
		String checkMsg="실패";
		try {
			if (memberCountsService.sectionCount(section, mvo.getEmail())) {
				checkMsg = "성공";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	/*
	 *  카운트 정보 가져오기
	 */
	@RequestMapping(value="/selectCount.do")
	public String selectCount(@ModelAttribute("userInfo")MembersVO mvo, Model model) throws IOException {
		try {
			model.addAttribute("json",memberCountsService.selectCount(mvo.getEmail()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
}
