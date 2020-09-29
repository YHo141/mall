package dao;
import vo.*;

import java.sql.*;
import commons.DBUtil;


public class MemberDao {
	
	/*
	 * select id from 
	 * (select member_email id from member union select admin_id id from admin) 
	 * t where id=?
	 */
	
	
	// 사용자 로그인
	public String login(Member member) throws Exception{
		String returnMember = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select member_email from member where member_email = ? and member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			returnMember = rs.getString("member_email");
		}
		
		return returnMember;
	}
	
	// email추가 항목
	public void insertMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) value(?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeUpdate();
		
		conn.close();

	}
	
	public Member selectMemberEmailCk(String member) throws Exception{
		Member returnMember = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {	// 이메일 중복 확인
			returnMember = new Member();
			returnMember.setMemberEmail(rs.getString("id"));
		}

		conn.close();
		return returnMember;
	}
}
