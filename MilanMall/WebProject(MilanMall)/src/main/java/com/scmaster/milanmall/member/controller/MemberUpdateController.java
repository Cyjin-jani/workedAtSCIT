package com.scmaster.milanmall.member.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.scmaster.milanmall.member.dao.MemberDAO;
import com.scmaster.milanmall.member.vo.MallMember;

@Controller
@RequestMapping(value="member")
@SessionAttributes("mallmember")
public class MemberUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberUpdateController.class);
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="updateForm", method=RequestMethod.GET)
	public String updateForm(MallMember mallmember, HttpSession session, Model model){
		logger.info("업데이트 폼 이동 시작");
			String loginId = (String)session.getAttribute("loginId");
			
			mallmember = dao.selectOne(loginId);
			model.addAttribute("mallmember", mallmember);
			
		logger.info("업데이트 폼 이동 종료");
		return "member/updateForm";
	}
	
	@RequestMapping(value="updateMember", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("mallmember")MallMember mallmember
			,Model model){
		logger.info("업데이트 시작");
		int result = 0;
		
		result = dao.updateMember(mallmember);
		
		if(result != 1){
			//등록 실패
			model.addAttribute("errorMsg", "수정실패");
			
			return"member/updateForm";//뭔가 잘못 입력해서 실패했으므로, 다시 돌아가게 함.
		}
		
		logger.info("업데이트 종료");
		return "redirect:updateComplete";
	}
	
	@RequestMapping(value="updateComplete", method=RequestMethod.GET)
	public String updateComplete(SessionStatus status, Model model,
			@ModelAttribute("mallmember") MallMember mallmember
			,HttpSession session){
		logger.info("회원정보 수정 성공 폼 이동 시작");

		session.setAttribute("name", mallmember.getName());
		//이름을 수정했으면, 그 수정된 이름이 바로 보여야 하기 때문에...
		//home으로 돌아왔을 때 전의 이름이 아닌 수정한 이름이 뜸.
		model.addAttribute("id", mallmember.getMember_id());
		status.setComplete();
		
		logger.info("회원정보 수정 성공 폼 이동 종료");

		return"member/updateComplete";
	}
	
	
	
}