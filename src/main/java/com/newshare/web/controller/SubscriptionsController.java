package com.newshare.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.model.vo.MembersVO;
import com.newshare.web.model.vo.SubscriptionsVO;
import com.newshare.web.service.SubscriptionsService;

@Controller
@SessionAttributes("userInfo")
public class SubscriptionsController {

	@Resource(name="suService")
	private SubscriptionsService subscriptionsService;
	
	/*
	 * 구독 체크하기
	 */
	@RequestMapping(value="/checkSubscription.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String checkSubscription(@ModelAttribute("userInfo")MembersVO mvo, @RequestParam("distributor")String distributor){
		String checkMsg="구독하고 있지 않습니다.";
		SubscriptionsVO svo = new SubscriptionsVO(mvo.getEmail() , distributor);
		try {
			if (subscriptionsService.checkSubscription(svo) != null) {
				checkMsg = "구독중입니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	/*
	 *  구독하기 
	 */
	@RequestMapping(value="/insertSubscription.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertSubscription(@RequestParam("distributor")String distributor, @ModelAttribute("userInfo")MembersVO mvo){
		String checkMsg="구독에 실패하였습니다.";
		try {
			if (subscriptionsService.insertSubscription(distributor, mvo.getEmail())) {
				checkMsg = "구독에 성공하였습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	/*
	 *  구독 취소하기
	 */
	@RequestMapping(value="/cancleSubscription.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String cancleSubscription(@RequestParam("distributor")String distributor, @ModelAttribute("userInfo")MembersVO mvo, Model model ){
		String checkMsg="구독 취소에 실패하였습니다.";
		try {
			if (subscriptionsService.cancleSubscription(distributor, mvo.getEmail())) {
				checkMsg = "구독 취소가 완료되었습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	/*
	 *  내가 구독하고 있는 사람들 리스트 뽑아오기
	 */
	@RequestMapping(value="/distributorList.do", produces="text/plain;charset=UTF-8")
	public String distributorList(@ModelAttribute("userInfo")MembersVO mvo, Model model ){
		try {
			model.addAttribute("json", subscriptionsService.distributorList(mvo.getEmail()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
}
