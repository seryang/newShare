package com.newshare.web.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.newshare.web.service.PortalService;

@Controller
public class PortalController {

	@Resource(name="poService")
	private PortalService portalService;

	@RequestMapping(value="/portalView.do")
	public String portalView(@RequestParam("portal")String portal, Model model) throws IOException {
		try {
			model.addAttribute("json",portalService.portalCrawling(portal));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
}