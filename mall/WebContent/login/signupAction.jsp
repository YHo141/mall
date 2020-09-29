<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8");
	
	//	이메일을 사용할 수 있는지 확인
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	Member memberCk = new Member();
	memberCk.setMemberEmail(memberEmail);
	memberCk.setMemberPw(memberPw);
	memberCk.setMemberName(memberName);
	
	System.out.println(memberEmail);
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	
	if(member != null){
		System.out.println("사용불가능한 아이디 입니다.");
		response.sendRedirect(request.getContextPath()+"/signup.jsp");
		return;
	}
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	memberDao.insertMember(paramMember);
	
	response.sendRedirect(request.getContextPath()+"/login/login.jsp");

%>
