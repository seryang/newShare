package com.newshare.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.newshare.web.service.PressService;

@Controller
public class PressController {
	@Resource(name="prService")
	private PressService pressService;
	
	@RequestMapping(value="/pressView.do")
	public String pressView(@RequestParam("pressNum")String pressNum, @RequestParam("date")int date, @RequestParam("page")int page, Model model){
		ArrayList list = new ArrayList();
		try{
			list = pressService.pressView(pressNum, date, page);
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("pressNum", pressNum);
		model.addAttribute("date", date);
		model.addAttribute("pressName", list.get(0));
		model.addAttribute("articles", list.get(1));
		model.addAttribute("paging", list.get(2));
		model.addAttribute("recDays", list.get(3));
		return "articles/pressView";
	}
	
	@RequestMapping(value="/pressView2.do")
	public String pressView2(@RequestParam("pressNum")String pressNum, @RequestParam("date")int date, Model model){
		ArrayList list = new ArrayList();
		try{
			list = pressService.pressView(pressNum, date);
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("pressNum", pressNum);
		model.addAttribute("date", date);
		model.addAttribute("pressName", list.get(0));
		model.addAttribute("articles", list.get(1));
		model.addAttribute("paging", list.get(2));
		model.addAttribute("recDays", list.get(3));
		return "articles/pressView";
	}
}