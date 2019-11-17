package com.scmaster.milanmall.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scmaster.milanmall.member.dao.MemberDAO;
import com.scmaster.milanmall.member.vo.MallMember;

@Service("sampleService")
public class MemberService implements IMemberService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public MallMember memberSearchOne(String id) {
		// TODO Auto-generated method stub
		MallMember member = null;
		try{
			member = dao.selectOne(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return member;
	}

}
