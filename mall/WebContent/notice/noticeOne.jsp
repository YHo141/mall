<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginMemberEmail") == null){
		System.out.println("로그아웃중 입니다.");
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%
	request.setCharacterEncoding("utf-8");

	int noticeId =Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeDate = request.getParameter("noticeDate");
	
%>
<div class="container">
	<div class="jumbotron">
	<h1>공지사항</h1>
	</div>
	<table class="table table-info table-striped">
		<tr>
			<td>notice_id</td>
			<td><%=noticeId %></td>
		</tr>
		<tr>
			<td>notice_title</td>
			<td><%=noticeTitle %></td>
		</tr>
		<tr>
			<td>notice_content</td>
			<td><%=noticeContent %></td>
		</tr>
		<tr>
			<td>notice_date</td>
			<td><%=noticeDate %></td>
		</tr>
	</table>


</div>
<body>

</body>
</html>