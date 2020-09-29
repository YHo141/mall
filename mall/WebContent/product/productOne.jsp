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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
if(session.getAttribute("loginMemberEmail") == null){
	response.sendRedirect(request.getContextPath()+"/login/login.jsp");
	return;
}

	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<-- productId");


	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
	<div class="container">
		<div class="jumbotron">
			<h1>상품 상세보기</h1>
			<form method="post" action="<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
					<input type="hidden" value="<%=product.getProductId() %>" name="productId">
					<input type="hidden" value="<%=product.getProductPrice() %>" name="productPrice">
					
				<div>
				수량
				<select name="ordersAmount">
					<%
						for(int i=1; i<11; i+=1){
					%>
							<option value="<%=i %>"><%=i %></option>
					<%
						}
					%>
				</select>개
				</div>
				<div>
					배송주소 :
					<input type="text" name="ordersAddr">
				</div>
				<div><button type="submit">주문</button></div>
			</form>
			<table>
				<tr>
					<td>product_id</td>
					<td><%=product.getProductId() %></td>
				</tr>
				<tr>
					<td>product_pic</td>
					<td><img src="<%=request.getContextPath() %>/img/<%=product.getProductPic() %>"></td>
				</tr>
				<tr>
					<td>product_name</td>
					<td><%=product.getProductName() %></td>
				</tr>
				<tr>
					<td>product_content</td>
					<td><%=product.getProductContent() %></td>
				</tr>
				<tr>
					<td>product_price</td>
					<td><%=product.getProductPrice() %></td>
				</tr>
				<tr>
					<td>product_soldout</td>
					<td><%=product.getProductSoldout() %></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>