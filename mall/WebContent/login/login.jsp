<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginMemberEmail") != null){
		System.out.println("로그인중 입니다.");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="jumbotron">
		<h1>사용자 로그인</h1>
	</div>
	<form method="post" action="/mall/login/loginAction.jsp" class="was-validated">
		<div class="form-group">
			<table class="table table-bordered">
				<tr>
					<td>사용자 ID</td>
					<td><input class="form-control" type="text" name="memberEmail" value="aa" required></td>
				</tr>
				<tr>
					<td>사용자 PW</td>
					<td><input class="form-control" type="text" name="memberPw" value="1234" required></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-primary"><img src="/mall-admin/img/key.jpg" width="40" height="22" alt="">로그인</button>
		<a class="btn btn-primary"  href="/mall/login/signupForm.jsp">회원가입</a>
		</div>
	</form>
	<div><a href="/mall-admin/login.jsp" class="btn btn-secondary">관리자 계정</a></div>
	
</div>
</body>
</html>