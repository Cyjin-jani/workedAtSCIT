package com.scmaster.milanmall.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.milanmall.member.dao.MemberDAO;
import com.scmaster.milanmall.member.service.MemberService;
import com.scmaster.milanmall.member.vo.MallMember;

@Controller
@RequestMapping(value="member")
public class MemberLoginController {
	
	@Resource(name="sampleService")
    private MemberService sampleService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	/*@Autowired
	MemberDAO dao;
*/	
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm(){
		logger.info("로그인 화면 이동 시작");
		logger.info("로그인 화면 이동 종료");
		return "member/loginPage";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(MallMember member, Model model, HttpSession session){

	//MallMember vo = dao.selectOne(member.getMember_id());
		MallMember vo = sampleService.memberSearchOne(member.getMember_id());
	 
	  if(vo !=null && vo.getPassword().equals(member.getPassword())){
	 
	  		session.setAttribute("loginId", vo.getMember_id());
			session.setAttribute("name", vo.getName());
		
			return "redirect:/";
	 }
	else{
		model.addAttribute("errorMsg", "로그인실패");
	 	return "member/loginPage";
	  }
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logOut(HttpSession session){
		logger.info("로그아웃 시작");
		session.removeAttribute("loginId");
		session.removeAttribute("name");
		session.removeAttribute("cartList");
		session.removeAttribute("pd");
		logger.info("로그아웃 종료");

		return "redirect:/";
	}
	
	
	
	
	
}