<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[로그인 화면]</title>
<script type="text/javascript">
<c:if test="${errorMsg !=null }">alert('${errorMsg }');</c:if>

function formCheck(){
	var id = document.getElementById("inputId");
	var password = document.getElementById("password");
	
	if(id.length == 0 || password.length == 0){
		alert("아이디와 비번을 입력해주세요.");
		return false;
	}
	return true;
	
}
</script>
<style type="text/css">
	body{
		color : white;
		background-color: black;
		background-image: url(https://www.city.kr/background/316594) no-repeat center center fixed; 
	}
	table{
		margin-left: auto;
		margin-right: auto;
	}
</style>
</head>
<body>
	<h2 align="center">로그인</h2>
	
	<form action="login" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>ID</th>
			</tr>
			<tr>
				<td>
					<input type="text" required name="member_id" id="inputId">
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
			</tr>
			<tr>
				<td>
					<input type="password" required name="password" id="password">
				</td>
			</tr>
		</table>
		<center><input type="submit" value="Login"></center>
	</form>
	
</body>
</html>