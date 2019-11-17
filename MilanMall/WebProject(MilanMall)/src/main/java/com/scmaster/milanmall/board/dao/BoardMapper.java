package com.scmaster.milanmall.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.milanmall.board.vo.Board;
import com.scmaster.milanmall.board.vo.Reply;


public interface BoardMapper {

	public int writeOne(Board board);

	public ArrayList<Board> showList(HashMap<String, Object> searchMap, RowBounds rb); //RowBounds를 사용하면 xml의 쿼리는 바꿀 필요가 없다!

	public Board readOne(int boardnum);
	
	public void updateHit(int boardnum);
	public void updateHit2(int boardnum);

	public int deleteOne(Board board);

	public Board selectBoardOne(Board board);

	public int updateOne(Board board);
	
	//글 갯수조회 (검색어 포함)
	public int getTotal(HashMap<String, Object> searchMap);
	
	//리플달기
	public void insertReply(Reply reply);
	
	//리플 조회
	public ArrayList<Reply> selectReplyAll(int boardnum);
	
	//댓글삭제
	public void deleteReply(Reply reply);
	
	//댓글 수정
	public void updateReply(Reply reply);
	
}
