<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[구매정보창]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		
		$('#ea').on('blur', function(){
			var ea = $(this).val();
			var prod_num = $('#prod_num').val();
			
			$.ajax({
				url : "calPrice",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify({
					prod_ea : ea,
					prod_num : prod_num
				}),
				dataType : "text",
				success : function(prod_price){
					$('#price').val(prod_price);
				},
				error : function(e){
					console.log(e);
				}
			});
		});
		
		
		//결제안내(innerHTML)
		$('.payWay').on('click', function(){
			var payWay= $(this).val();
			var str = '';
			
			if(payWay =='payByCard'){
				
				str += '<table id="table4">';
				str += '<tr>';
				str += '<td>카드사</td>';	
				str += '<td><input type="text" ></td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>명의자 이름</td>';	
				str += '<td><input type="text" ></td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>카드번호</td>';	
				str += '<td><input type="text" placeholder="예) 0000-1234-4567-8907" ></td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>유효기간</td>';	
				str += '<td><input type="text" placeholder="month" style="width: 40px;"> / <input type="text" placeholder="year" style="width: 40px;"> </td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>cvc번호</td>';	
				str += '<td><input type="text" placeholder="카드 뒷면 3자리" ></td>';	
				str += '</tr>';
				str += '</table><br>';
				str += '<center><input type="submit" value="구매하기"></center>';
				str += '</form><br>';
				$('#div4').html(str);
				
			}else if(payWay == 'payByMoney'){
				str += '<table id="table4">';
				str += '<tr>';
				str += '<td>은행명</td>';	
				str += '<td>신한은행</td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>예금주 명</td>';	
				str += '<td>밀란</td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td>계좌번호</td>';	
				str += '<td>120-503-7293812</td>';	
				str += '</tr>';
				str += '<tr>';
				str += '<td></td>';	
				str += '<td> 3일 이내 위 계좌로 입금바랍니다. </td>';	
				str += '</tr>';
				str += '</table><br>';
				str += '<center><input type="submit" value="구매하기"></center>';
				
				$('#div4').html(str);
			}
		});
	});
	
	
</script>
<style type="text/css">
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
	#table2 {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 400px;
		width: 500px;
	}
	#table3 {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 50px;
		width: 400px;
	}
	#table4 {
		border: 2px solid red;
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
	<h1 align="center">[구매하기]</h1>
	<br>
	<h2 align="center">[상품 확인]</h2>
	<table id="table1">
		<tr>
			<th>Image</th> <th>Product</th> <th>Size</th>
			<th>Quantity</th> <th>Price</th> <th>Delivery Fee</th>
		</tr>
		<c:choose>
		<c:when test="${sessionScope.cartList != null }">
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
	
	<input type="hidden" id="prod_num" value="${pd.prod_num }">
	
	
	<br>
	<h2 align="center"> [배송지 정보] </h2>
	
	<form action="pay" method="post" onsubmit="return formCheck()">
		<input type="hidden" name="prod_num" value="${pd.prod_num }">
	<input type="hidden" name="prod_name" value="${pd.prod_name }">
	<input type="hidden" name="prod_price" value="${pd.prod_price }">
	<input type="hidden" name="prod_imgpath" value="${pd.prod_imgpath }">
	<table id="table2">
		<tr>
			<td> 수령인 이름 </td>
			<td> <input type="text" required name="name"> </td>
		</tr>
		<tr>
			<td> 연락처(휴대폰) </td>
			<td> <input type="tel" required name="phonenum"> </td>
		</tr>
		<tr>
			<td> 이메일 </td>
			<td> <input type="email" required name="email"> </td>
		</tr>
		<tr>
			<td> 주소 </td>
			<td> <input type="text" required name="address"> </td>
		</tr>
		<tr>
			<td> 배송 시 요청사항 </td>
			<td> <input type="text" required name="req"> </td>
		</tr>
	
	</table>
	
	<br>
	<h2 align="center"> [결제 정보] </h2>
	
	
	<table id="table3">
		<tr>
			<td> 결제방법 선택 </td>
			<td> 
				<input type="radio" class="payWay" name="payWay" value="payByCard" > 카드결제
				<input type="radio" class="payWay" name="payWay" value="payByMoney"> 무통장입금
			</td>
		</tr>
	</table>
	
	<div id="div4">
	
	
	</div>
	</form>
	
	<br><br><br><br><br>
	
	<center> <a href="../"> <input type="button" value="구매취소"> </a></center>
	
	
	
</body>
</html>