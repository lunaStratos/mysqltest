<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.id').keyup(function(event) {

			if (event.keyCode == 32) { // 스페이스 방지
				$('.id').val($(".id").val().slice(0, -1));

			}
			var id = $('.id').val();
			console.log(id);
			$.ajax({ // idcheck ajax

				url : 'checkid',
				type : 'post',
				data : {
					id : id
				},
				dataType : 'text',
				success : function(item) {
					
					$('#checkid').text(item);
				}

			});

		});
	});
</script>
</head>
<body>
	<h1>TestDrive - 회원가입</h1>
	<p>
	<form action="register" method="post">
		ID : <input type="text" name="id" class="id">
		<p>
			<span id="checkid"></span>
		<p>
			NAME : <input type="text" name="name">
		<p>
			PASSWORD: <input type="password" name="password">
		<p>
			<input type="submit" value="회원가입">
	</form>
	<p>
		<a href="login">로그인으로</a>
</body>
</html>