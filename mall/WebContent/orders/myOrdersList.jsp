<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
<title>myOrderList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		//전체 주문내역 리스트
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<Orders> ordersList = ordersDao.selectOrdersListByEmail();
		
		//이메일별로 주문내역 리스트선택
		String memberEmail = "";
		if(request.getParameter("memberEmail") != null){
			memberEmail = request.getParameter("memberEmail");
		}
		
		ArrayList<Orders> list = null;
		if(memberEmail.equals("")){
			list = ordersDao.selectOrdersListByEmail();
		}else{
			list = ordersDao.selectOrdersEmailListByEmail(memberEmail);
		}
		ArrayList<String> ordersEmailList = ordersDao.selectOrdersEmailList();
	%>
	<div class="container">
		<div class="jumbotron">
			<h1>주문내역</h1>
		</div>
		<form method="post" action="<%=request.getContextPath()%>/orders/myOrdersList.jsp">
			<select name="memberEmail">
				<option value="">선택</option>
				<%
					for(String o : ordersEmailList){
				%>
						<option value=<%=o %>><%=o %></option>
				<%
					}
				%>
			</select>
			<button type="submit">검색</button>
		</form>
		<table class="table table-info table-striped">
		<tr>
			<td>orders_id</td>
			<td>product_id</td>
			<td>orders_amount</td>
			<td>orders_price</td>
			<td>member_email</td>
			<td>orders_addr</td>
			<td>orders_state</td>
		</tr>
		<%
			for(Orders o : list){
		%>
		<tr>	
				<td><%=o.getOrdersId() %></td>
				<td><%=o.getProductId() %></td>
				<td><%=o.getOrdersAmount() %></td>
				<td><%=o.getOrdersPrice() %></td>
				<td><%=o.getMemberEmail() %></td>
				<td><%=o.getOrdersAddr() %></td>
				<td><%=o.getOrdersState() %></td>
		</tr>
		<%
			}
		%>
		</table>
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary">메인으로</a>
	</div>
</body>
</html>