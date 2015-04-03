package com.newshare.web.controller;

import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.newshare.web.model.vo.MembersVO;
import com.newshare.web.service.MembersService;

@Controller
@SessionAttributes("userInfo")
public class MembersController {

	@Resource(name="meService")
	private MembersService membersService;

	/*
	 * [회원가입]
	 */
	@RequestMapping(value="/insertMembers.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertMembers(@ModelAttribute MembersVO mvo){
		String checkMsg = "회원 가입에 실패하였습니다.\n다시 시도해주세요.";
		try{
			if(membersService.insertMembers(mvo)){
				membersService.insertCounts(mvo.getEmail());
				checkMsg = "회원가입에 성공하였습니다. 로그인 후 이용해주세요.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}

	/*
	 * [회원가입] -> id 중복체크
	 */
	@RequestMapping(value="/idCheck.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(String email){
		String checkMsg="사용 불가능한 ID 입니다. 다시 입력해 주세요.";
		Pattern p = Pattern.compile("^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$");
		try{
			if(p.matcher(email).matches()){
				if(membersService.idCheck(email) == null){
					checkMsg = "사용 가능한 ID 입니다.";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	}

	/*
	 * [로그인] -> id / password 확인
	 */
	@RequestMapping(value="/loginMembers.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String loginMembers(@ModelAttribute MembersVO mvo, Model model){
		String checkMsg = "입력한 이메일 또는 비밀번호가 잘못되었습니다.";
		try{
			if(membersService.loginMembers(mvo) != null){
				checkMsg = "로그인 되었습니다.";
				model.addAttribute("userInfo", membersService.loginMembers(mvo));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	} 

	/*
	 * [로그인상태] -> [회원정보] 넘어가기 전 비밀번호 재확인
	 */
	@RequestMapping(value="/passwordCheck.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String passwordCheck(@ModelAttribute MembersVO mvo){
		String checkMsg = "입력한 비밀번호가 잘못되었습니다.";
		try{
			if(membersService.loginMembers(mvo) != null){
				checkMsg = "비밀번호가 확인되었습니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	} 

	/*
	 *  [회원정보수정]
	 */
	@RequestMapping(value="/updateMembers.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String updateMembers(@ModelAttribute MembersVO mvo, Model model){
		String checkMsg = "업데이트에 실패하였습니다.\n다시 시도해주세요.";
		try{
			if(membersService.updateMembers(mvo)){
				model.addAttribute("userInfo", membersService.loginMembers(mvo));
				checkMsg = "회원 정보가 수정되었습니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	} 

	/*
	 * [회원 탈퇴]
	 */
	@RequestMapping(value="/deleteMembers.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteMembers(@ModelAttribute MembersVO mvo){
		String checkMsg = "회원 탈퇴에 실패하였습니다.\n다시 시도해주세요.";
		try{
			if(membersService.deleteMembers(mvo)){
				checkMsg = "회원 탈퇴 되었습니다. 이용해 주셔서 감사합니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	} 

	/*
	 * [비밀번호찾기 - 이메일서비스]
	 */
	@RequestMapping(value="/searchPassword.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchPassword(@ModelAttribute MembersVO mvo){
		String checkMsg = "입력한 정보가 잘못되었습니다.\n다시 확인해주세요.";
		try{
			if(membersService.searchPassword(mvo) != null){
				membersService.SendEmail(membersService.searchPassword(mvo));
				checkMsg = "귀하의 이메일로 비밀번호가 전송되었습니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return checkMsg;
	} 
}