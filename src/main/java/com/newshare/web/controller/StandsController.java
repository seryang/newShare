package com.newshare.web.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.model.vo.MembersVO;
import com.newshare.web.model.vo.PapersVO;
import com.newshare.web.service.MembersService;
import com.newshare.web.service.StandsService;

@Controller
@SessionAttributes("userInfo")
public class StandsController {
	
	@Resource(name="stService")
	private StandsService standsService;
	@Resource(name="meService")
	private MembersService membersService;
	
	// 비회원으로 들어갔을 때 신문 보기
	@RequestMapping(value="/userstand.do")
	public String userStand(String id, Model model){
		try{
			model.addAttribute("papers", standsService.getUserPagePapers(id, 1));
			model.addAttribute("pages", standsService.getUserTotalPages(id));
			model.addAttribute("curpage", 1);
			model.addAttribute("userName", membersService.userName(id));
			model.addAttribute("email", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/userStand";
	}
	
	// 비회원으로 들어갔을 때 페이지 넘기기
	@RequestMapping(value="/userstand2.do")
	public String userStand(String id, int pageNum, Model model){
		try{
			model.addAttribute("papers", standsService.getUserPagePapers(id, pageNum));
			model.addAttribute("pages", standsService.getUserTotalPages(id));
			model.addAttribute("curpage", pageNum);
			model.addAttribute("userName", membersService.userName(id));
			model.addAttribute("email", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/userStand";
	}
	
	// 회원으로 들어갔을 때 유저 스탠드(내 스탠드 & 다른 사람 스탠드) 보기
	@RequestMapping(value="/userStand.do")
	public String userStand(@RequestParam("id") String id, @ModelAttribute("userInfo")MembersVO mvo, Model model){
		try{
			if(mvo.getEmail().equals(id)){
				model.addAttribute("papers", standsService.getPagePapers(id, 1));
				model.addAttribute("pages", standsService.getTotalPages(id));
			}else{
				model.addAttribute("papers", standsService.getUserPagePapers(id, 1));
				model.addAttribute("pages", standsService.getUserTotalPages(id));
			}
			model.addAttribute("curpage", 1);
			model.addAttribute("userName", membersService.userName(id));
			model.addAttribute("email", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/userStand";
	}
	
	// 회원으로 들어갔을 때 유저 스탠드(내 스탠드 & 다른 사람 스탠드) 페이지 넘기기
	@RequestMapping(value="/userStand2.do", produces="text/plain;charset=UTF-8")
	public String userStand2(@RequestParam("id") String id, int pageNum, @ModelAttribute("userInfo")MembersVO mvo, Model model){
		try{
			if(mvo.getEmail().equals(id)){
				model.addAttribute("papers", standsService.getPagePapers(id, pageNum));
				model.addAttribute("pages", standsService.getTotalPages(id));
			}else{
				model.addAttribute("papers", standsService.getUserPagePapers(id, pageNum));
				model.addAttribute("pages", standsService.getUserTotalPages(id));
			}
			model.addAttribute("curpage", pageNum);
			model.addAttribute("userName", membersService.userName(id));
			model.addAttribute("email", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/userStand";
	}
	
	// 신문 삭제
	@RequestMapping(value="/paperDelete.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String paperDelete(String email, @RequestParam("paperNum")int paperNum){
		String checkMsg = "신문 삭제에 실패하였습니다.\n다시 시도해주세요.";
		PapersVO pvo = new PapersVO(paperNum, email);
		try {
			if(standsService.deleteMyPaper(pvo)){
				checkMsg = "삭제 되었습니다.";
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	// 내 이웃들 신문 보기
	@RequestMapping(value="/myNeighborStand.do")
	public String myNeighborPaper(@ModelAttribute("userInfo")MembersVO mvo, Model model){
		try{
			model.addAttribute("papers", standsService.getNeighborPagePapers(mvo.getEmail(), 1));
			model.addAttribute("pages", standsService.getTotalNeighborPapers(mvo.getEmail()));
			model.addAttribute("curpage", 1);
			model.addAttribute("userName", membersService.userName(mvo.getEmail()));
			model.addAttribute("email", mvo.getEmail());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/mySubscribingStand";
	}
	
	// 내 이웃들 신문 페이지 넘기기
	@RequestMapping(value="/myNeighborStand2.do", produces="text/plain;charset=UTF-8")
	public String myNeighborPaper2(@ModelAttribute("userInfo")MembersVO mvo, int pageNum, Model model){
		try{
			model.addAttribute("papers", standsService.getNeighborPagePapers(mvo.getEmail(), pageNum));
			model.addAttribute("pages", standsService.getTotalNeighborPapers(mvo.getEmail()));
			model.addAttribute("curpage", pageNum);
			model.addAttribute("userName", membersService.userName(mvo.getEmail()));
			model.addAttribute("email", mvo.getEmail());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stands/mySubscribingStand";
	}
	
	// 내 스탠드에서 신문 정보 등록하기
	@RequestMapping(value="updatepaperinfo.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String updateInfo(String info, int paperNum){
		String checkMsg = "신문 정보 등록을 실패하였습니다.\n다시 시도해주세요.";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("info", info);
		map.put("paperNum", paperNum);
		try {
			boolean update = standsService.updateInfo(map);
			if(update){
				checkMsg = "신문 정보를 성공적으로 등록하였습니다.";
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}
	
	// 신문 추천하기
	@RequestMapping(value="likepaper.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String likePaper(int paperNum){
		String checkMsg = "신문 추천을 실패하였습니다.\n다시 시도해주세요.";
		try{
			boolean update = standsService.likePaper(paperNum);
			if(update){
				checkMsg = "신문을 추천하였습니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}
}
