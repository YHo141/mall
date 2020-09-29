<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("loginMemberEmail") != null){
		System.out.println("로그아웃중 입니다.");
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupForm.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	
%>
<div class="container">
	<div class="jumbotron">
		<h1>회원가입</h1>
	</div>
	<form method="post" action="<%=request.getContextPath() %>/signupAction.jsp">
	<div>
		<table>
			<tr>
				<td>Email</td>
				<td><input class="form-control" type="text" name="memberEmail" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input class="form-control" type="text" name="memberPw" required></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input class="form-control" type="text" name="memberName" required></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-primary">가입</button>
		<a href="<%=request.getContextPath()%>/login/login.jsp" class="btn btn-primary">뒤로가기</a>
		</div>
	</form>
</div>
</body>
</html>