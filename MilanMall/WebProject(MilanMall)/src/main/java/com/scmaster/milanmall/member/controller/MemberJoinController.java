package com.scmaster.milanmall.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.scmaster.milanmall.member.dao.MemberDAO;
import com.scmaster.milanmall.member.vo.MallMember;



@Controller
@RequestMapping(value="member")
@SessionAttributes("mallmember")
public class MemberJoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberJoinController.class);
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="joinForm", method=RequestMethod.GET)
	public String JoinForm(Model model){
		
		logger.info("회원가입 폼 이동 시작");
		
		MallMember member = new MallMember();
		model.addAttribute("mallmember", member);
		
		logger.info("회원가입 폼 이동 종료");
		
		return "member/joinForm";
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public boolean idCheck(String id, MallMember member){
		boolean idCheckflag = false;
		logger.info("아이디체크 이동 시작");
		member = dao.selectOne(id);
		
		if(member == null){
			idCheckflag = true;
		}
		
		logger.info("아이디체크 이동 종료");
		
		return idCheckflag;
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(
			@ModelAttribute("mallmember") MallMember member){
		logger.info("회원가입 이동 시작");
		
		dao.insertMember(member);
		
		logger.info("회원가입 이동 종료");
		return "redirect:joinComplete";
	}
	
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(SessionStatus session,
			Model model,
			@ModelAttribute("mallmember") MallMember member){
		logger.info("회원가입 성공 폼 이동 시작");
		model.addAttribute("id", member.getMember_id());
		//위 작업(id를 넣는 작업)을 하지 않더라도, joinComplete에 일반적인 루트를 타지 않고 들어 오는 것을
		//막기 위해서, @ModelAttribute를 한번 더 써준 것이다.
		session.setComplete(); //위의 model에 id를 넣고 난 뒤에 setComplete를 해주어야 한다!
		logger.info("회원가입 성공 폼 이동 종료");
		return"member/joinComplete";
	}
	
	
}
