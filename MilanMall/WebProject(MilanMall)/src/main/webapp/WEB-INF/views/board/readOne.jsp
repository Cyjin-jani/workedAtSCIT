<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[글 읽기]</title>
<script type="text/javascript">
	function deleteOne(revw_boardnum){
		if(confirm("정말로 삭제하시겠습니까?")){
			//확인을 누르면 true, 아니면 false가 됨.
			location.href="delete?revw_boardnum="+revw_boardnum;
		}
		
	}
	function updateOne(revw_boardnum){
		location.href="updateForm?revw_boardnum="+revw_boardnum;
	}
	function deleteReply(rep_replynum, revw_boardnum){
		if(confirm("정말로 삭제하시겠습니까?")){
			//확인을 누르면 true, 아니면 false가 됨.
			location.href="deleteReply?revw_boardnum="+revw_boardnum+"&rep_replynum="+rep_replynum;
		}
	}
	function updateReplyForm(rep_replynum, revw_boardnum, rep_text){
		var div = document.getElementById("div"+rep_replynum);
		
		var str = '<form action="updateReply" method="post" id="editForm'+rep_replynum+'">';
		str+= '<input type="text" name="rep_text" value="'+rep_text+'">';
		str+= '<input type="hidden" name="revw_boardnum" value="'+revw_boardnum+'">';
		str+= '<input type="hidden" name="rep_replynum" value="'+rep_replynum+'">';
		str+= '<a href="javascript:replyUpdate('+rep_replynum+')">[수정하기]</a>';
		str+= '<a href="javascript:replyCancel(div'+rep_replynum+')">[취소]</a>';
		str+= '</form>';
		
		div.innerHTML = str;
	}
	function replyCancel(div){
		div.innerHTML = "";
	}
	function replyUpdate(replynum){
		
		var form = document.getElementById("editForm"+replynum);
		
		form.submit();
	}
	
</script>
</head>
<body>
	
	<table>
		<tr>
			<th> 작성자 </th>
			<td> ${board.revw_id }</td>
		</tr>
		<tr>
			<th> 작성일 </th>
			<td>${board.revw_inputdate } </td>
		</tr>
		<tr>
			<th> 조회수 </th>
			<td>${board.revw_hits } </td>
		</tr>
		<tr>
			<th> 제목 </th>
			<td> ${board.revw_title }</td>
		</tr>
		<tr>
			<th> 내용 </th>
			<td> <textarea rows="25" cols="50" readonly="readonly"> ${board.revw_content }</textarea></td>
		</tr>
		<tr>
			<th> 첨부파일 </th>
			<td>
			<a href="download?revw_boardnum=${board.revw_boardnum }">
			${board.revw_originalfile }
			</a>
			<img alt="" src="download?revw_boardnum=${board.revw_boardnum }">
			</td>
		</tr>
	</table>
	
	<c:if test="${sessionScope.loginId == board.revw_id }">
	
	<input type="button" value="글 삭제" onclick="deleteOne('${board.revw_boardnum}')">
	<input type="button" value="글 수정" onclick="updateOne('${board.revw_boardnum}')">
	</c:if>
	<a href="list?page=${page}&searchSelect=${searchSelect}&searchText=${searchText}"><button >목록으로</button></a>
	<br>
	
	<form action="insertReply" method="post">
		<input type="hidden" name="revw_boardnum" value="${board.revw_boardnum }">
		<input type="hidden" name="page" value="${page }">
		리플 내용 <input type="text" name="rep_text">
		<input type="submit" value="확인">
	</form>
	<br>
	
	<table>
		<c:forEach var="reply" items="${replyList }">
			<tr>
			<td>${reply.rep_id }</td>
			<td>${reply.rep_text }</td>
				<td>
					<c:if test="${sessionScope.loginId == reply.rep_id }">
						<a href="javascript:updateReplyForm('${reply.rep_replynum }','${reply.revw_boardnum }','${reply.rep_text }')">
						[수정]
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${sessionScope.loginId == reply.rep_id  }">
						<a href="javascript:deleteReply('${reply.rep_replynum }','${reply.revw_boardnum }')">
							[삭제]
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div id="div${reply.rep_replynum }"></div>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>