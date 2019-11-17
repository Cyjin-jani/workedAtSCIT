<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[장바구니]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		//장바구니에서 제거
		$('.delCart').on('click', function(){
			var prod_num = $(this).next().val();
			$.ajax({
				url : "delCart",
				type : "post",
				data :{
					prod_num : prod_num
				},
				success : function(){
					//location.reload();
					location.href="goMyCart";
				},
				error : function(e){
					console.log(e);
				}
			});
			
		});
		
		
	});
</script>
<style type="text/css">
	body {
		color: white;
		background: black;
	}
	
	th, td {
		border: 1px solid white;
		text-align: center;
		
	}
	#table1 {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 200px;
		width: 800px;
	}
</style>
</head>
<body>
	<h2 align="center"> [내 장바구니 목록]</h2>
	
	
	<h2 align="center">[상품 확인]</h2>
	<form action="goBuyPage" method="post" id="cartForm" onsubmit="return formCheck()">
	<table id="table1">
		<tr>
			<th>Image</th> <th>Product</th> <th>Size</th>
			<th>Quantity</th> <th>Price</th> <th>Delete</th>
		</tr>
		<c:forEach var="pd" items="${cartList }">
			<tr>
				<td><img alt="" src="<c:url value="${pd.prod_imgpath }"/>"></td>
				<td>
				<marquee onmouseover="stop();" onmouseout="start();" scrollamount="2" direction="right" border="0"> ${pd.prod_name }</marquee></td>
				<td>${pd.prod_size}</td>
				<td>
					<input type="number" value="${pd.prod_ea }" style="width: 40px;"> 개
				</td>
				<td><input type="text" value="${pd.prod_price }" readonly="readonly" style="width: 55px;"> 원 </td>
				<td><input type="button" class="delCart" value="제거"><input type="hidden" class="pk" value="${pd.prod_num }"> </td>
			</tr>
				
		</c:forEach>
		
	</table>
		<br>
		<center><c:if test="${cartList != null }"><input type="submit" value="구매하러가기"> </c:if>&nbsp;&nbsp; <a href="../"> <input type="button" value="쇼핑 계속하기"></a></center>
	</form>
	
	<br>
	
	
	<br><br><br>
	
</body>
</html>