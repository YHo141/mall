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
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	CategoryDao categoryDao = new CategoryDao();
	
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();	//	전체 카테고리 리스트
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();	//	추천 카테고리 리스트
	
%>
<body>
	<div class="container">
		<div>	<!-- 홈페이지 이름 / 검색바 -->
			<div class="row">
				<div class="col-sm-4 text-left" style="font-size:50px">Goodee Shop</div>
				<div class="col-sm-4 text-center">
					<form action="">
						<input type="text">
						<button type="submit">검색</button>
					</form>
				</div>
				<div class="col-sm-4 text-right">
					<a href="<%=request.getContextPath()%>/orders/myOrdersList.jsp" class="fas fa-user-alt" style="font-size:48px;color:black"></a>
					<i class="fas fa-shopping-cart" style="font-size:48px;color:black"></i>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row-reverse bg-secondary">
		
			<ul class="navbar-nav">
				
			    <div class="p-2"><%=session.getAttribute("loginMemberEmail") %>님 어서오세요.&nbsp;&nbsp;&nbsp;
			    <a class="btn btn-danger" role="button" href="<%=request.getContextPath()%>/login/logoutAction.jsp">로그아웃</a></div>
			    
			</ul>
		
		</div>
		<div>
			<div class="row">
				<!-- 전체카테고리 / 이미지 배너9 -->
 				<div class="col-sm-2  text-left">
 				<button type="button" class="btn btn-primary btn-group-vertical">
 					<!-- 전체 카테고리 -->
 					<%
 						for(Category c : categoryList1){
 					%>
 					
 							<a href="" class="btn btn-primary"><%=c.getCategoryName() %></a>
 							
 					<%
 						}
 					%>
 					</button>
 				</div>
  				<div class="col-sm-6" >
					<img src="<%=request.getContextPath()%>/img/shop.jpg" width="900" height="500">
				</div>
				<div class="col-sm-4"></div>
			</div>
		</div>
		
		<br>
		
		<!-- 추천 카테고리 이미지 링크 -->
		<div class="row">
			
			<%
				for(Category c : categoryList2){
			%>
			<div class="col-sm-3">
					<a href="">
						<img src="<%=request.getContextPath()%>/img/category.png" class="rounded-circle" width="200" height="200">
					</a>
			</div>
			<%
				}
			%>
			
		</div>
		<br>
		
		<%
			Calendar today = Calendar.getInstance();
		%>
		<div>
			<h2>오늘의 추천상품
			<span class="badge badge-pill badge-primary">
				<!-- 오늘의 날짜 --><%=today.get(Calendar.YEAR) %>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DAY_OF_MONTH) %>
			</span></h2>
		</div>
		<br>
		
		<div class="row">
			<%
 				for(Category c : categoryList1){
 			%>
 			<div class="col-sm-2">
 					<a href="" class="btn btn-secondary btn-group-vertical"><%=c.getCategoryName() %></a>
 			</div>
 			<%
 				}
 			%>
		</div>
		
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductList();
		%>
		<!-- 상품 목록6개 -->
		<table>
			<tr>
				<%
					int i = 0;
					for(Product p : productList){
						i=i+1;
				%>
					<td>
					<div class="row">
						<div class="card col-sm-12">
						  <img class="card-img-top" src="<%=request.getContextPath()%>/img/default.jpg" alt="Card image">
						  <div class="card-body">
						    <a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId() %>&productPic=<%=p.getProductPic() %>&productName=<%=p.getProductName() %>&productContent=<%=p.getProductContent() %>"><%=p.getProductName() %></a>
						    <p class="card-text col-sm-12"><%=p.getProductPrice() %></p>
						  </div>
						</div>
					</div>
					</td>
				<%
						if(i%3 == 0){
				%>
					</tr><tr>
				<%
						}
					}
				%>
			</tr>
		</table>
		<br>
	
	<!-- 공지 나오는 부분 -->
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<div>
	<div>
		<h3>공지</h3>
	</div>
		<table class="table">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Notice n : noticeList){
				%>
					<tr>
						<td><%=n.getNoticeId() %></td>
						<td><a href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId() %>&noticeTitle=<%=n.getNoticeTitle() %>&noticeContent=<%=n.getNoticeContent() %>&noticeDate=<%=n.getNoticeDate() %>"><%=n.getNoticeTitle() %></a></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>