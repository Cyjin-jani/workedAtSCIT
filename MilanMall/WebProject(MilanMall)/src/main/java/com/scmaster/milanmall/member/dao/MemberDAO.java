package com.scmaster.milanmall.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.milanmall.member.vo.MallMember;


@Repository
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	@Autowired
	SqlSession sqlsession;

	public MallMember selectOne(String id) {
		// TODO Auto-generated method stub
		MallMember member = null;
		logger.info("idcheck 시작");
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		
		try{
			member = mapper.selectOne(id);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("idcheck 종료");
		return member;
	}

	public int insertMember(MallMember member) {
		// TODO Auto-generated method stub
		int result = 0;
		logger.info("회원가입 DAO 시작");
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		try{
			result = mapper.insertMember(member);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("회원가입 DAO 종료");
		return result;
	}

	public int updateMember(MallMember mallmember) {
		// TODO Auto-generated method stub
		int result = 0;
		logger.info("회원정보 수정 DAO 시작");
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		try{
			result = mapper.updateMember(mallmember);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("회원정보 수정 DAO 종료");
		return result;
	}
	
	
}
