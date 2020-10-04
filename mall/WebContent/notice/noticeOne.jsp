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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("utf-8");

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeDate = request.getParameter("noticeDate");
	
%>
<div class="container">

<div>	<!-- 홈페이지 이름 / 검색바 -->
			<div class="row">
				<div class="col-sm-6 text-left" style="font-size:50px"><a href="<%=request.getContextPath()%>/index/index.jsp">Goodee Shop</a></div>
				<div class="col-sm-6 text-right">
					<a href="<%=request.getContextPath()%>/orders/myOrdersList.jsp" class="fas fa-shopping-cart" style="font-size:48px;color:black"></a>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row-reverse bg-secondary">
		
			<ul class="navbar-nav">
				
			    <div class="p-2"><%=session.getAttribute("loginMemberEmail") %>님 어서오세요.&nbsp;&nbsp;&nbsp;
			    <a class="btn btn-danger" role="button" href="<%=request.getContextPath()%>/login/logoutAction.jsp">로그아웃</a></div>
			    
			</ul>
		</div>

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
	<a href="<%=request.getContextPath()%>/index/index.jsp" class="btn btn-secondary">메인으로</a>

</div>
<body>

</body>
</html>