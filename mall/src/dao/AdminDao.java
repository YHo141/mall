package dao;
import vo.*;
import java.sql.*;

import commons.DBUtil;

public class AdminDao {
	
	public Admin login(Admin admin) throws Exception{
		Admin returnAdmin = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select admin_id from admin where admin_id = ? and admin_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getString("admin_id"));
		}
		
		return returnAdmin;	//	null일때 로그인 실패, null이 아니면 로그인 성공
	}
}
