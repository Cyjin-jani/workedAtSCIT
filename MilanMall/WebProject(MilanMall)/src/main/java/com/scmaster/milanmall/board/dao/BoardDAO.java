package com.scmaster.milanmall.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.milanmall.board.vo.Board;
import com.scmaster.milanmall.board.vo.Reply;



@Repository
public class BoardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

	
	@Autowired
	SqlSession sqlsession;

	//글 쓰기
	public int writeOne(Board board) {
		int result = 0;
			logger.info("글쓰기 다오 시작");
			BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
			
			try{
				result = mapper.writeOne(board);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
			logger.info("글쓰기 다오 종료");
		return result;
	}

	//글 목록 보여주기
	public ArrayList<Board> showList(HashMap<String, Object> searchMap, int startRecord, int countPerPage) {
		logger.info("전체 글보기 -다오 시작");
		ArrayList<Board> lists = null;
		
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		
		RowBounds rb = new RowBounds(startRecord, countPerPage); //시작위치부터 countPerPage까지 가져오겠다.
		
		
		
		try{
			lists = mapper.showList(searchMap, rb);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("전체 글보기 -다오 종료");
		return lists;
	}

	//글 읽기
	public Board readOne(int boardnum) {
		logger.info("글읽기 -다오 시작");
		Board one = null;
		
			BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		
		try{
			mapper.updateHit(boardnum);
			one = mapper.readOne(boardnum);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글읽기 -다오 종료");	
		return one;
	}

	//글 삭제
	public int deleteOne(Board board) {
		logger.info("글삭제 -다오 시작");
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		int result = 0;
		
		try{
			result = mapper.deleteOne(board);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글삭제 -다오 종료");
		return result;
	}

	public Board selectBoardOne(Board board) {
		// TODO Auto-generated method stub
		Board board2 = null;
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			board2 = mapper.selectBoardOne(board);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return board2;
	}
	public void updateHit2(int boardnum) {
		// TODO Auto-generated method stub
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			mapper.updateHit2(boardnum);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public int updateOne(Board board) {
		// TODO Auto-generated method stub
		logger.info("글 수정 다오 시작");
		int result = 0;
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			result = mapper.updateOne(board);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글 수정 다오 종료");
		
		return result;
	}
	
	public int getTotal(HashMap<String, Object> searchMap){
		logger.info("글 갯수 조회 다오 시작");
		int result = 0;
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			result = mapper.getTotal(searchMap);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글 갯수 조회 다오 종료");
		return result;
	}
	
	public void insertReply(Reply reply){
		logger.info("댓글 등록 다오 시작");
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			mapper.insertReply(reply);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("댓글 등록 다오 종료");

	}
	
	public ArrayList<Reply> selectReplyAll(int boardnum){
		
		logger.info("댓글 조회 다오 시작");
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		ArrayList<Reply> replylist = null;
		try{
			replylist = mapper.selectReplyAll(boardnum);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("댓글 조회 다오 종료");
		
		return replylist;
	}
	
	public void deleteReply(Reply reply){
		logger.info("댓글 삭제 다오 시작");
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			mapper.deleteReply(reply);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("댓글 삭제 다오 종료");
		
	}

	public void updateReply(Reply reply) {
		// TODO Auto-generated method stub
		logger.info("댓글 수정 다오 시작");
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		try{
			mapper.updateReply(reply);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("댓글 수정 다오 종료");
	}
	
	
}
