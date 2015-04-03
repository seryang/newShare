package com.newshare.web.service;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;

import com.newshare.web.model.dao.MemberCountsDAOImpl;
import com.newshare.web.model.dao.MembersDAOImpl;
import com.newshare.web.model.vo.EmailVO;
import com.newshare.web.model.vo.MembersVO;

public class MembersService {

	@Resource(name="meDao")
	MembersDAOImpl membersDao;
	
	@Resource(name="mcDao")
	MemberCountsDAOImpl memberCountsDao;

	@Resource(name="mailSender")
	JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender = mailSender;
	}
	
	public void setMembersDao(MembersDAOImpl membersDao){
		this.membersDao = membersDao;
	}
	
	public void setcountsDao(MemberCountsDAOImpl countsDao){
		this.memberCountsDao = memberCountsDao;
	}

	/*
	 * [회원가입]
	 */
	public boolean insertMembers(MembersVO mvo) throws SQLException{
		return membersDao.insertMembers(mvo);
	}
	
	/*
	 * [회원의 count정보 초기화]
	 */
	public boolean insertCounts(String email) throws SQLException{
		return memberCountsDao.insertCounts(email);
	}
	
	/*
	 * [회원가입] -> id 중복체크
	 */
	public String idCheck(String email) throws SQLException{
		return membersDao.idCheck(email);
	}

	/*
	 * [로그인] -> id / password 확인
	 */
	public MembersVO loginMembers(MembersVO mvo) throws SQLException{
		return membersDao.loginMembers(mvo);
	}

	/*
	 *  [회원정보수정]
	 */
	public boolean updateMembers(MembersVO mvo) throws SQLException{
		return membersDao.updateMembers(mvo);
	}

	/*
	 * [회원 탈퇴]
	 */
	public boolean deleteMembers(MembersVO mvo) throws SQLException {
		return membersDao.deleteMembers(mvo);
	}

	/*
	 * [비밀번호찾기 - 이메일서비스]
	 */
	public MembersVO searchPassword(MembersVO mvo) throws SQLException{
		return membersDao.searchPassword(mvo);
	}
	
	public void SendEmail(MembersVO userInfo) throws MessagingException{
		
		EmailVO email = new EmailVO();
		
		String reciver = userInfo.getEmail();
		String subject = "[newShare] "+userInfo.getName()+"님의 비밀번호가 발송되었습니다.";
		String content = "귀하의 비밀번호는 "+userInfo.getPassword()+" 입니다.\n 감사합니다."
						+"\n\n- [newShare] 뉴스의 새로운 패러다임 -";
		
		email.setReciver(reciver);
		email.setSubject(subject);
		email.setContent(content);
		
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReciver()));
		mailSender.send(msg);
	}
	
	public String userName(String email) throws SQLException{
		return membersDao.userName(email);
	}
}
