<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[제품상세페이지]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$('#prod_detail').on('click', function(){
			
		});
		
		$('.selectbox').on('blur', function(){
			
			var prod_name = $('#prod_name').val();
			var selval = $(this).val();
			
			$.ajax({
				url : "findPdNum",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify({
					prod_name : prod_name,
					prod_size : selval
				}),
				dataType : "text",
				success : function(prod_num){
					$('#prod_num').val(prod_num);
					
				},
				error : function(e){
					console.log(e);
				}
				
			});
		});
		
		//장바구니 클릭 시 이동
		$('#goCart').on('click', function(){
			var form = document.getElementById("buyProd");
			form.action = "goCart";
			form.submit();
		});
		
		
	});
	
	function formCheck() {
		var id = document.getElementById("member_id");
		if(id.length == 0 || id.value == ''){
			alert("로그인 후 이용 가능합니다.");
			location.href="../";
			return false;
		}
		return true;
	}
	
	
</script>
</head>
<body style="background-color: black; color: white;">
	<h1 style="color: red;"> 제품 상세 보기 </h1>
	
	<br>
	
	<form action="goBuyPage" id="buyProd" method="post" onsubmit="return formCheck()">
		
		<input type="hidden" name="member_id" id="member_id" value="${sessionScope.loginId }">
		<input type="hidden" name="prod_num" value="${vo.prod_num }">
		<input type="hidden" name="prod_name" id="prod_name" value="${vo.prod_name }">
		<input type="hidden" name="prod_price" value="${vo.prod_price }">
		<input type="hidden" name="prod_imgpath" value="${vo.prod_imgpath }">
		
		<img alt="" src="<c:url value="${vo.prod_imgpath }"/>">
		<br>
		
		제품명 : ${vo.prod_name }<br> 
		제품번호: ${vo.prod_num} <br>
		가격  : ${vo.prod_price } 원<br>
		
		<c:if test="${vo.prod_size != 0 }">
		사이즈
		<select name="prod_size" class="selectbox">
			<option value="95"> 95 (S)</option>
			<option value="100"> 100 (M)</option>
			<option value="105"> 105 (L)</option>
		</select>
		</c:if>
		
		<br>
		수량
		<input type="number" value="1" required name="prod_ea" style="width: 40px;"> 개
		<br>
		<p id="prod_detail">제품 상세정보 보기</p>
		<div id="detail">
			
		</div>
		<c:choose>
			<c:when test="${vo.prod_ea == '0'}">
			 ㅠㅠ 품절입니다 ㅠㅠ 재입고 시 구매 부탁드립니다.
			</c:when>
			<c:otherwise>
			<input type="submit" value="바로 구매">
			<input type="button" id="goCart" value="장바구니에 담기">
			</c:otherwise>
		</c:choose>	
	</form>
	<br>
	<a href="../#shopping"><input type="button" value="뒤로가기"></a>
	
</body>
</html>