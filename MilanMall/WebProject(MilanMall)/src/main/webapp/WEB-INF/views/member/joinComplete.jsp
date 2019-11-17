<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 회원가입 성공 폼 ]</title>
<script type="text/javascript">

	setTimeout('go_url()',3000);
	
	function go_url(){
		 location.href="/milanmall"
	}

</script>
<style type="text/css">
	body {
		color: white;
		background: black;
	}
</style>
</head>
<body>
	<h3>3초 후에 메인으로 이동합니다.</h3><br>
	
	<p> ${id }님 회원 가입을 축하합니다.</p>
	<a href="/milanmall">로그인 이동</a>
	
</body>
</html>