package com.scmaster.milanmall.board.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.milanmall.board.dao.BoardDAO;
import com.scmaster.milanmall.board.vo.Board;
import com.scmaster.milanmall.board.vo.Reply;
import com.scmaster.milanmall.common.util.FileService;
import com.scmaster.milanmall.common.util.PageNavigator;



@Controller
@RequestMapping(value="board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardDAO dao;
	
	final String uploadPath = "/boardfile";
	final int countPerPage = 5; //5개 글씩 보여줌.
	final int pagePerGroup = 5; //밑에 1,2,3,4,5라고 페이징 보여줌.
	
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(ArrayList<Board> lists, Model model,
			@RequestParam(value="searchText", defaultValue="")String searchText
			,@RequestParam(value="searchSelect", defaultValue="revw_title")String searchSelect
			,@RequestParam(value="page", defaultValue="1")int page){
		logger.info("글 목록 시작");
		
		HashMap<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchSelect", searchSelect);
		searchMap.put("searchText", searchText);
		
		//전체 글 개수 조회
		int total = dao.getTotal(searchMap);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
				
		//DB에서 목록을 가져와서 화면에 전달
		lists = dao.showList(searchMap, navi.getStartRecord(), navi.getCountPerPage());
		model.addAttribute("lists", lists);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("navi", navi);
		
		logger.info("글 목록 종료");
		return"board/list";
	}
	
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeForm(){
		logger.info("글 작성 폼 이동 시작");
		logger.info("글 작성 폼 이동 종료");
		return"board/writeForm";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Board board, MultipartFile upload){
		logger.info("글 작성 시작");
		int result = 0;
		
		//upload파일이 있을 경우. (즉, 파일을 첨부 했을 때에만 해주어야 한다.)
		if(!upload.isEmpty()){
			
		//실제로 파일을 저장할 경로에 파일을 저장해야 함. (지금은 parameter로 전달만 받은 상태)
			String savedfilename = FileService.saveFile(upload, uploadPath);
		//board VO에 originalfile명과 savedfile명을 세팅해주어야 한다.
			board.setRevw_savedfile(savedfilename); //실제 저장되는 파일명.
			board.setRevw_originalfile(upload.getOriginalFilename()); //원본파일명.
		}
		
		result = dao.writeOne(board);
		
		if(result != 1){
			logger.info("글 작성 종료지만 오류나서 다시 write폼으로");
			return"board/writeForm";
		}
		logger.info("글 작성 종료");
		return "redirect:list"; //requestMapping이 list인 곳을 찾는다.
		
	}
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(HttpServletRequest request, int revw_boardnum, Board board, Model model
			,@RequestParam(value="page", defaultValue="1")int page
			,@RequestParam(value="searchText", defaultValue="")String searchText
			,@RequestParam(value="searchSelect", defaultValue="revw_title")String searchSelect){
		logger.info("글 읽기 시작");
		//int boardnum= Integer.parseInt((String)request.getAttribute("boardnum"));
		//해당 번호의 글 내용 조회
		board = dao.readOne(revw_boardnum);
		
		//해당 글 번호의 댓글 내용들 조회
		ArrayList<Reply> replyList = dao.selectReplyAll(revw_boardnum);
		
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		model.addAttribute("replyList", replyList);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		

		logger.info("글 읽기 종료");
		return "board/readOne"; 
		
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession session
			,Board board, Model model){
		logger.info("글 삭제 시작");
		
		int revw_boardnum = Integer.parseInt(request.getParameter("revw_boardnum"));
		//Spring에서는 boardnum을 이렇게 request에서 꺼내지 않고, 바로 parameter에 int boardnum으로 받아서 처리가 가능하다.
		//혹은 board만 받아도 이미 boardnum은 들어간 채로 존재하게 되어, id만 넣어주어도 무방하다.
		String id = (String)session.getAttribute("loginId");
		board.setRevw_id(id); 
		board.setRevw_boardnum(revw_boardnum);
		//vo를 사용할 수 있는 경우에는 vo를 사용하는 게 가장 편하고 좋은 방법.
		
		Board vo = dao.selectBoardOne(board); //지운 애의 데이터가 들어있다.
		
		
		int result = dao.deleteOne(board);
		
		if(result!=1){
			//삭제실패
		}
		//파일 삭제 여부를 리턴할 변수 flag	
		boolean flag = FileService.deleteFile(uploadPath+"/"+vo.getRevw_savedfile());
		
		
		logger.info("글 삭제 종료");
		return "redirect:list";
		
	}
	@RequestMapping(value="updateForm", method=RequestMethod.GET)
	public String updateForm(int revw_boardnum, Board board, HttpSession session
			,Model model){
		logger.info("수정 폼 이동 시작");
		String id = (String)session.getAttribute("loginId");
		//int revw_boardnum = board.getRevw_boardnum();
		board.setRevw_id(id);
		board.setRevw_boardnum(revw_boardnum);
		
		board = dao.selectBoardOne(board);
		
		model.addAttribute("board", board);
		logger.info("수정 폼 이동 종료");
		return"board/updateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Board board, HttpSession session, MultipartFile upload){
		logger.info("글 수정 시작");
		int result = 0;
		
		//upload파일이 있을 경우. (즉, 파일을 첨부 했을 때에만 해주어야 한다.)
		if(!upload.isEmpty()){
			
			board = dao.readOne(board.getRevw_boardnum());
			FileService.deleteFile(uploadPath+"/"+board.getRevw_savedfile());
			
			//실제로 파일을 저장할 경로에 파일을 저장해야 함. (지금은 parameter로 전달만 받은 상태)
			String savedfilename = FileService.saveFile(upload, uploadPath);
			//board VO에 originalfile명과 savedfile명을 세팅해주어야 한다.
			board.setRevw_savedfile(savedfilename); //실제 저장되는 파일명.
			board.setRevw_originalfile(upload.getOriginalFilename()); //원본파일명.
			
		
		}else{
			String savedfilename = FileService.saveFile(upload, uploadPath);
			board.setRevw_savedfile(savedfilename); //실제 저장되는 파일명.
			board.setRevw_originalfile(upload.getOriginalFilename()); //원본파일명.
		}
		
		result = dao.updateOne(board);
		
		logger.info("글 수정 종료");
		return"redirect:list";
	}
	
	//파일다운로드
	@RequestMapping(value="download", method=RequestMethod.GET)
	public void download(int revw_boardnum, Board board, HttpServletResponse response
			,HttpSession session){
		logger.info("파일 다운로드 시작");
		board = dao.readOne(revw_boardnum);
		dao.updateHit2(revw_boardnum); //왠지 모르게 아래꺼는 안되고 readOne만 되는데 readOne에 조회수증가가 있어서 글을 읽을때마다 조회수가 2번 증가되어버리므로 다시 1을 감소함.
		//board = dao.selectBoardOne(board);
		//원본파일명
		String originalFileName = board.getRevw_originalfile();
		//response의 Header영역에 파일 이름을 인코딩해서 등록해야 함.
		//이 처리를 해주지 않으면, 다운로드가 안되고 그냥 페이지에서 파일이 오픈되어 버린다.

		try{
			response.setHeader("Content-Disposition", "attachment;filename="
					+URLEncoder.encode(originalFileName, "UTF-8"));
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		//여기까지가 단순 설정.
		
		//파일이 저장된 전체(실제) 경로필요.
		String fullPath = uploadPath+"/"+board.getRevw_savedfile(); 
		
		//서버에 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력 스트림이 필요.
		FileInputStream fis = null;
		ServletOutputStream sos = null; //서블릿을 통해서 출력할 때 사용하는 스트림.
		
		try{
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream(); //response에 태워서 보내야 하기 때문이다.
			
			//얘가 슈퍼코드...(제공: 스프링) 
			FileCopyUtils.copy(fis, sos); //inputstream에서 읽어서 outputstream에 자동으로 카피 해준다.(스프링 기능)
			
			fis.close();
			sos.close();
			
		}catch(IOException e){
			e.printStackTrace();
		}
		logger.info("파일 다운로드 종료");
	}
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReply(Reply reply, HttpSession session, HttpServletRequest request){
		logger.info("댓글 입력 시작");
		String id = (String) session.getAttribute("loginId");
		int page = Integer.parseInt((String) request.getParameter("page"));
		
		reply.setRep_id(id);
		dao.insertReply(reply);
		logger.info("댓글 입력 종료");
		return"redirect:read?revw_boardnum="+reply.getRevw_boardnum()+"&page="+page;
	}
	
	@RequestMapping(value="deleteReply", method=RequestMethod.GET)
	public String deleteReply(Reply reply, HttpSession session){
		logger.info("댓글 삭제 시작");
		String id = (String)session.getAttribute("loginId");
		reply.setRep_id(id);
		
		
		dao.deleteReply(reply);
		logger.info("댓글 삭제 종료");
		return "redirect:read?revw_boardnum="+reply.getRevw_boardnum();

	}
	
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public String updateReply(Reply reply, HttpSession session){
		
		logger.info("댓글 수정 시작");
		
		String id = (String)session.getAttribute("loginId");
		reply.setRep_id(id);
		
		dao.updateReply(reply);
		
		logger.info("댓글 수정 종료");
		return "redirect:read?revw_boardnum="+reply.getRevw_boardnum();
	}
	

}

	


















