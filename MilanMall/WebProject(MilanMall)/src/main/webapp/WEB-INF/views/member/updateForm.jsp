<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[업데이트 폼]</title>
<script type="text/javascript">
<c:if test="${errorMsg !=null }">alert('${errorMsg }');</c:if> //편법이므로 사용 자제...


function formCheck(){
	var password = document.getElementById("inputPw");
	var checkpassword = document.getElementById("checkPw");
	
	if(checkpassword.length == 0){
		alert("비밀번호를 다시 한 번 입력해주세요.");
		return false;
	}
	if(password.value !=checkpassword.value ){
		alert("비밀번호가 다릅니다.")
		return false;
	}
	
	return true;
	
}

</script>
<style type="text/css">
	table {
		border: 2px solid red;
		margin-left: auto;
		margin-right: auto;
		height: 400px;
		width: 400px;
	}
	body {
		color: white;
		background: black;
	}
</style>
</head>
<body>
	
	<h1 align="center">[ 수정하기 ]</h1>

	<form action="updateMember" method="post" onsubmit="return formCheck();">
		<table>	
			<tr>
				<th>
					ID
				</th>
				<td>
					${loginId }
					<input type="hidden" name="member_id" id="member_id" value="${mallmember.member_id }">
				</td>
				
			</tr>
			<tr>
				<th>
					PASSWORD
				</th>
				<td>
					<input type="password" placeholder="enter your password" required name="password" id="password"> <br>
					<input type="password" placeholder="check your password" id="password2">
				</td>
			</tr>
			<tr>
				<th>
					NAME
				</th>
				<td>
					<input type="text" name="name" id="name" value="${mallmember.name }">
				</td>
			</tr>
			<tr>
				<th>
					EMAIL
				</th>
				<td>
					<input type="text" name="email" id="email" value="${mallmember.email }">
				</td>
			</tr>
			<tr>
				<th>
					PHONE
				</th>
				<td>
					<input type="tel" id="phone" name="phonenum" value="${mallmember.phonenum }">
					
				</td>
			</tr>
			<tr>
				<th>
					ADDRESS
				</th>
				<td>
					<input type="text" name="address" value="${mallmember.address }">
				</td>
			</tr>
		</table>
		<br>
			<div align="center">
			<input type="submit" value="수정하기">
			<input type="reset" value="다시쓰기">
			<a href="../"><input type="button" value="메인으로"></a>
			</div>
	</form>
	
	
</body>
</html>