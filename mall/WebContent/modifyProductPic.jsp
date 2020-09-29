<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>modifyProductPic</title>
</head>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
%>
	<h1>상품 이미지 수정</h1>
	<form action="/mall-admin/product/modifyProductPicAction.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productId" value="<%=productId %>">
		<div>
		이미지 선택 :
		<input type="file" name="productPic">
		</div>
		<div>
			<button type="submit">이미지 수정</button>
		</div>
	</form>
</body>
</html>