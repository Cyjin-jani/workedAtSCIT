<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[구매완료페이지]</title>
<style type="text/css">
th, td {
		border: 1px solid red;
		text-align: center;
		
	}
	#table1 {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 200px;
		width: 800px;
	}
	#table2 {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 400px;
		width: 500px;
	}
	#table3 {
		border: 1px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 50px;
		width: 400px;
	}
	#table4 {
		border: 1px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 200px;
		width: 400px;
	}
	body {
		color: white;
		background: black;
	}
</style>
</head>
<body>
	<h1 align="center">구매확인페이지</h1>
	<br>
	<h2 align="center">[상품 확인]</h2>
	<table id="table1">
		<tr>
			<th>Image</th> <th>Product</th> <th>Size</th>
			<th>Quantity</th> <th>Price</th> <th>Delivery Fee</th>
		</tr>
		<c:choose>
		<c:when test="${cartList != null }">
			<c:forEach var="list" items="${sessionScope.cartList }">
			<tr>
				<td><img alt="" src="<c:url value="${list.prod_imgpath }"/>"></td>
				<td>
				<marquee onmouseover="stop();" onmouseout="start();" scrollamount="2" direction="right" border="0"> ${list.prod_name }</marquee></td>
				<td><span id="size">${list.prod_size}</span></td>
				<td>
					<input type="number" id="ea" value="${list.prod_ea }" required name="prod_ea" style="width: 40px;"> 개
				</td>
				<td><input type="text" id="price" value="${list.prod_price }" readonly="readonly" style="width: 55px;"> 원 </td>
				<c:choose>
					<c:when test="${list.prod_price >= 50000 }">
						<td>무료</td>
					</c:when>
					<c:otherwise>
						<td> 3000원 </td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td><img alt="" src="<c:url value="${pd.prod_imgpath }"/>"></td>
				<td>
				<marquee onmouseover="stop();" onmouseout="start();" scrollamount="2" direction="right" border="0"> ${pd.prod_name }</marquee></td>
				<td><span id="size">${pd.prod_size}</span></td>
				<td>
					<input type="number" id="ea" value="${pd.prod_ea }" required name="prod_ea" style="width: 40px;"> 개
				</td>
				<td><input type="text" id="price" value="${pd.prod_price }" readonly="readonly" style="width: 55px;"> 원 </td>
				<c:choose>
					<c:when test="${pd.prod_price >= 50000 }">
						<td>무료</td>
					</c:when>
					<c:otherwise>
						<td> 3000원 </td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:otherwise>
			</c:choose>
	</table>
	
	<input type="hidden" name="prod_num" value="${pd.prod_num }">
	
	
	<br>
	<h2 align="center"> [배송지 정보] </h2>
	
	
	<table id="table2">
		<tr>
			<td> 수령인 이름 </td>
			<td> <input type="text" value="${member.name }"> </td>
		</tr>
		<tr>
			<td> 연락처(휴대폰) </td>
			<td> <input type="tel" value="${member.phonenum }"> </td>
		</tr>
		<tr>
			<td> 이메일 </td>
			<td> <input type="email" value="${member.email }"> </td>
		</tr>
		<tr>
			<td> 주소 </td>
			<td> <input type="text" value="${member.address }"> </td>
		</tr>
		<tr>
			<td> 배송 시 요청사항 </td>
			<td> <input type="text" value="${req }"> </td>
		</tr>
	
	</table>
	
	
	
	<br><br><br>
	<center><a href="../"> <input type="button" value="홈으로 돌아가기"></a></center>
	
	
	
</body>
</html>