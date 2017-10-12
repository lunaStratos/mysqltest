<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.id').keyup(function(event) {

			if (event.keyCode == 32) { // 스페이스 방지
				$('.id').val($(".id").val().slice(0, -1));

			}

		});
	});
</script>
</head>
<body>
	<h1>TestDrive - 로그인</h1>
	<p>
	<form action="login" method="post">
		<input type="text" name="id" class="id">
		<p>
			<input type="password" name="password">
		<p>
			<input type="submit" value="로그인">
	</form>
	<p>
		<a href="register">회원가입</a>
		<c:if test="${sessionScope.loginUser != null}">
			<a href="logout">로그아웃</a>
			  현재 로그인 아이디 : ${sessionScope.loginUser}
		</c:if>
		
	<p>
		<c:choose>
			<c:when test="${loginResult eq 0}">
				로그인 실패. 아이디가 없습니다.
			</c:when>
			<c:when test="${loginResult eq 1}">
				로그인 성공
			</c:when>
			<c:when test="${loginResult eq 2}">
				로그인 실패. 잘못된 암호입니다.
			</c:when>

			<c:when test="${registerResult eq 0}">
				회원가입 실패
			</c:when>

			<c:when test="${registerResult eq 1}">
				회원가입 성공
			</c:when>
		</c:choose>
</body>
</html>