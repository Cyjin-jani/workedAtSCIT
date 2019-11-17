<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 글 쓰기 ]</title>
<script type="text/javascript">
	function formCheck(){
		var title = document.getElementById("title");
		
		
		
		return true;
	}
</script>
</head>
<body>
	<h2 align="center"> [ 글 쓰기 ] </h2>
	<form action="write" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
		<input type="hidden" name="revw_id" value="${sessionScope.loginId }">
		<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="revw_title" id="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="100" rows="25" name="revw_content" id="content"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<input type="file" name="upload">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="저장"></td>
		</tr>
		</table>
	</form>
	
</body>
</html>