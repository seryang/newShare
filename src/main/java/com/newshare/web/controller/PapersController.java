package com.newshare.web.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

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
import com.newshare.web.model.vo.PaperPagesVO;
import com.newshare.web.model.vo.PapersVO;
import com.newshare.web.service.PapersService;
import com.newshare.web.service.StandsService;

@Controller
@SessionAttributes("userInfo")
public class PapersController {

	@Resource(name="paService")
	private PapersService papersService;

	@Resource(name="stService")
	private StandsService standsService;
	
	@RequestMapping(value="/titleinput.do" , produces="text/plain;charset=UTF-8")
	public String makePaper(@RequestParam("title")String title, @ModelAttribute("userInfo")MembersVO mvo, Model model){
		try {
			title = new String(title.getBytes("8859_1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Boolean b = papersService.makePaper(new PapersVO(mvo.getEmail(), title));
		int paperNum = papersService.getPaperNum();
		System.out.println(paperNum);
		model.addAttribute("title", title);
		model.addAttribute("paperNum", paperNum);
		return "paperMaking/paperframe";
	}
	
	
	@RequestMapping(value="/frametext.do" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String textChange(int flag){
		String msg;
		if(flag == 1){
			msg = "다음 점 눌러주세요";
		}else if(flag == 2){
			msg = "스크랩해주세요";
		}else{
			msg = "첫 점을 선택해 주세요";
		}
		return msg;
	}
	
	@RequestMapping(value="/scrapframing.do" , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String scrapFraming(@RequestParam("id")String id, @RequestParam("col")int col){
		Gson gson = new Gson();
		List<ArticlesVO> list = null;
		System.out.println(col);
		try {
			list = papersService.getScraps(id, col+1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String json = gson.toJson(list);
		return json;
	}
	
	@RequestMapping(value="/getlistnum.do")
	@ResponseBody
	public String getListNum(@RequestParam("id")String id){
		int result = 0;
		try {
			result = papersService.getScrapNum(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		result = result/10;
		return Integer.toString(result);
	}
	
	@RequestMapping(value="/paperset.do")
	@ResponseBody
	public String savePosition(@RequestParam("papernum")int paperNum, @RequestParam("page")int page, @RequestParam("position")String position, @RequestParam("openness")int open, @ModelAttribute("userInfo")MembersVO mvo){
		boolean op = papersService.setOpen(paperNum, open);
		boolean sb = papersService.savePosition(new PaperPagesVO (page, paperNum,position));
		return "userStand.do?id="+mvo.getEmail();
	}
	
	@RequestMapping(value="/nextpage.do")
	@ResponseBody
	public String savePage(@RequestParam("papernum")int paperNum, @RequestParam("page")int page, @RequestParam("position")String position, @ModelAttribute("userInfo")MembersVO mvo){
		System.out.println(position);
		boolean sb = papersService.savePosition(new PaperPagesVO (page, paperNum,position));
		
		String spage = Integer.toString(page+1);
		System.out.println(spage);
		return spage;
	}
	
	@RequestMapping(value="/paperview.do")
	public String paperView(@RequestParam("papernum")int paperNum, Model model){
		String jsonPaper = null;
		PapersVO pvo = null;
		jsonPaper= papersService.getPaperPages(paperNum);
		pvo = papersService.getPaper(paperNum);
		model.addAttribute("paper", jsonPaper);
		model.addAttribute("paperInfo", pvo);
		return "/papers/paperview";
	}
	
	/*
	 * 게시글 공개 유무 변환하기
	 */
	@RequestMapping(value="/changeOnOff.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String changeOnOff(@RequestParam("paperNum")int paperNum,@RequestParam("chk")int chk){
		String checkMsg = "공개 유무 변환에 실패하였습니다.";
		try{
			if(chk == 1){
				if(papersService.changeOnOff(paperNum,chk)){
					checkMsg="게시글이 공개로 변환되었습니다.";
				}
			}else{
				if(papersService.changeOnOff(paperNum,chk)){
					checkMsg="게시글이 비공개로 변환되었습니다.";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}
}
