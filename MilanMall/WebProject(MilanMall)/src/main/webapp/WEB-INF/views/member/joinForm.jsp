<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 회원 가입 폼 ]</title>
<link href="<c:url value="/resources/css/enroll.css"/>" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$('#inputId').on('blur', function(){
			var inputId = $('#inputId').val();
			if(inputId.length==0){
				alert('ID를 입력하세요.');
				return;
			}
			$.ajax({
				url : "idCheck",
				type : "post",
				data : {
					id : inputId
				},
				success : function(flag){
					
					if(flag){
						alert("사용해도 좋습니다.");
					}else{
						alert("아이디가 중복됩니다.");
					}
				},
				error : function(){
					alert("실패");
				}
			});
		});
	});
	function formCheck(){
		var password = document.getElementById("inputPw");
		var checkpassword = document.getElementById("checkPw");
		
		if(checkpassword.length == 0){
			alert("비밀번호를 다시 한 번 입력해주세요.");
			return false;
		}
		if(password.length <4){
			alert("비밀번호는 4자 이상 입력해주세요.");
		}
		if(password.value !=checkpassword.value ){
			alert("비밀번호가 다릅니다.")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<!-- 회원가입 폼 -->
	<form action="join" id="joinForm" method="post" onsubmit="return formCheck()">
	<div id="container">
		<h2 align="center"> !WELCOME!</h2>
		<!-- 아이디, 비번, 이메일 가입 구역-->
		<div class="loginfo">
			<!-- ID -->
			<div class="basicLogInfo">
				<label><b>User ID</b></label>
				<input type="text" placeholder="Enter ID" id="inputId" name="member_id">
			</div>
			
			<!-- PW -->
			<div class="basicLogInfo">
				<label><b>Password</b></label>
				<input type="password" placeholder="Enter password" id="inputPw" required name="password">
			</div>
			<!-- PW -->
			<div class="basicLogInfo">
				<label><b>Password Check</b></label>
				<input type="password" placeholder="check password" id="checkPw" >
			</div>
			
			
			<!-- Email -->
			<div class="basicLogInfo">
				<label><b>Email</b></label>
				<input type="email" placeholder="Your email @ email.com" id="inputEmail" required name="email">
			</div>
			
		</div>
			
		
		<!-- 개인정보 (이름, 전화번호, 주소 가입구역) -->
		<div class="indiviInfo">
			<!-- name -->
			<div class="basicLogInfo">
				<label><b>Name</b></label>
				<input type="text" placeholder="Enter Your Name" id="name" required name="name">
			</div>
			
			<!-- phone number -->
			<div class="basicLogInfo">
				<label><b>Phone</b></label>
				<input type="tel" placeholder="Ex)010-xxxx-xxxx" id="phone" required name="phonenum">
			</div>
			
			<!-- address -->
			<div class="basicLogInfo">
				<label><b>Address</b></label>
				<input type="text" placeholder="Enter Your Home Address" id="address" required name="address">
			</div>
			<div class="submitButton">
				<span>
					<input type="submit" value="Join" id="formBtn"> &nbsp;
					<input type="button" value="Cancel" id="cancelbttn">
				</span>
			</div>
			
		</div>
	
	</div>
	</form>
	
			
</body>
</html>