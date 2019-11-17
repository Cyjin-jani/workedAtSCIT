<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 글 목록 ]</title>
<style type="text/css">
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin-left: auto;
	margin-right: auto;
    border-color: red;
}
table.type05 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #282828;
}

table.type05 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #B94646;
}

.div {
	margin-left:100px;
	margin-right: auto;
}

.wbtw {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#FFC6C3	;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#000000	;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}

.mbtw {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#FFC6C3	;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#000000	;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}

body {
	color : white;
	background: #787878;
}

</style>
<script type="text/javascript">
	function writeForm(){
		location.href = "writeForm";
	}
	function read(revw_boardnum, page, searchSelect, searchText){
		location.href = "read?revw_boardnum="+revw_boardnum+"&page="+page+"&searchSelect="+searchSelect+"&searchText="+searchText;
	}
	function pagingFormSubmit(currentPage){
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		
		page.value = currentPage;
		
		form.submit(); /* 값이 저장된 후 submit이 됨. */
	}
	
	
</script>
</head>
<body>

	<h2 align="center"> [ 후기 게시판 ] </h2>
	
	<c:if test="${loginId != null }">
	
	<div class="div"><input type="button" style="WIDTH: 60pt; HEIGHT: 20pt" value="글쓰기" onclick="writeForm()" class="wbtw"></div>
	
	</c:if>
	
		<table class="type05">
			<tr>
				<th>번호 </th> <th>제목</th> <th>작성자 </th>
				<th>조회수 </th> <th>작성일 </th>
			</tr>
	<c:forEach var="list" items="${lists }">
			<tr>
				<td>${list.revw_boardnum }</td>
				<td><a href="#" onclick="read('${list.revw_boardnum}', '${navi.currentPage }', '${searchSelect }', '${searchText }')">${list.revw_title }</a></td>
				<td>${list.revw_id }</td>
				<td>${list.revw_hits }</td><td>${list.revw_inputdate }</td>
			
			</tr>
	</c:forEach>
		</table>
	<br>
	
	<div align="center">
		<a href="javascript:pagingFormSubmit(${navi.startPageGroup-navi.pagePerGroup })">◁◁</a>
		<a href="javascript:pagingFormSubmit(${navi.currentPage-1 })">◀</a>
		<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
			
			<c:choose>
				<c:when test="${counter == navi.currentPage }">
					<a href="javascript:pagingFormSubmit(${counter })"><b>${counter }</b></a>
				</c:when>
				<c:otherwise>
					<a href="javascript:pagingFormSubmit(${counter })">${counter }</a>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		<a href="javascript:pagingFormSubmit(${navi.currentPage+1 })">▶</a>
		<a href="javascript:pagingFormSubmit(${navi.endPageGroup+1 })">▷▷</a>
	</div>
	<br>
	<div align="center">
	<form action="list" method="get" id="pagingForm">
		<input type="hidden" name="page" id="page">
		
		<select name="searchSelect" id="searchSelect">
		  <option value="revw_title" <c:if test="${searchSelect == 'revw_title' }">selected="selected"</c:if>>제목</option>
		  <option value="revw_content" <c:if test="${searchSelect == 'revw_content' }">selected="selected"</c:if>>본문</option>
		  <option value="revw_id" <c:if test="${searchSelect == 'revw_id' }">selected="selected"</c:if>> 작성자 </option>
		</select>

		 <input type="text" name="searchText" value="${searchText }">
		<input type="button" value="검색" onclick="pagingFormSubmit(1)">
	
	</form>
	</div>
	
	
	
	
	
	<div class="div"><a href="../"><input type="button" style="WIDTH: 60pt; HEIGHT: 20pt" value="메인으로" class="mbtw"></a></div>
	
</body>
</html>