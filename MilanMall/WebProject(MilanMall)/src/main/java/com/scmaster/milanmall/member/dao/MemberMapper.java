package com.scmaster.milanmall.member.dao;

import com.scmaster.milanmall.member.vo.MallMember;

public interface MemberMapper {

	public MallMember selectOne(String id);

	public int insertMember(MallMember member);

	public int updateMember(MallMember mallmember);

	
	
	
}
