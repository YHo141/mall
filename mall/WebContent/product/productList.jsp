<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<%
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1){
			productList = productDao.selectProductList();
		}else{
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		
		ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
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
	<h1>상품 목록</h1>
</div>
	
			<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<td>product_id</td>
				<td>category_id</td>
				<td>product_name</td>
				<td>product_price</td>
				<td>product_soldout</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.getProductSoldout().equals("Y")){
			%>
					<tr class="text-danger">
					<td><del><%=p.getProductId() %></del></td>
					<td><del><%=p.getCategoryId() %></del></td>
					<td><del><%=p.getProductName() %></del></td>
					<td><del><%=p.getProductPrice() %></del></td>
					<td>품절</td>
					</tr>
			<%
					}else{
			%>
				<tr class="text-success">
					<td><a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getCategoryId() %>" class="btn btn-primary"><%=p.getProductId() %></a></td>
					<td><%=p.getCategoryId() %></td>
					<td><%=p.getProductName() %></td>
					<td><%=p.getProductPrice() %></td>
					<td>판매중</td>
				<tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
	<a href="<%=request.getContextPath()%>/index/index.jsp" class="btn btn-secondary">뒤로가기</a>
	</div>
	</div>
</body>
</html>