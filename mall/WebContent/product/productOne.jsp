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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
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
					<td><img src="<%=request.getContextPath() %>/img/<%=product.getProductPic() %>" width="500" height="500"></td>
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
		<a href="<%=request.getContextPath()%>/index/index.jsp" class="btn btn-secondary">메인으로</a>
	</div>
</body>
</html>