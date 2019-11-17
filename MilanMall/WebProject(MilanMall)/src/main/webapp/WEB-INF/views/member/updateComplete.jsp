<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 회원정보 수정 완료 ]</title>
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
	<p>${id }님 정보가 수정되었습니다.</p>
	<h3>3초 후 메인으로 자동으로 이동합니다.</h3>
	<a href="/milanmall">메인으로</a>
</body>
</html>