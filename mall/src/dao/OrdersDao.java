package dao;
import java.sql.*;
import commons.DBUtil;
import vo.*;
import java.util.*;

public class OrdersDao {
	
	// mall주문리스트
	// 주문내역 리스트
	public ArrayList<Orders> selectOrdersListByEmail() throws Exception{
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select orders_id, product_id, orders_amount, orders_price, member_email, orders_addr, orders_state from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Orders orders = new Orders();
			
			orders.setOrdersId(rs.getInt("orders_id"));
			orders.setProductId(rs.getInt("product_id"));
			orders.setOrdersAmount(rs.getInt("orders_amount"));
			orders.setOrdersPrice(rs.getInt("orders_price"));
			
			orders.setMemberEmail(rs.getString("member_email"));
			orders.setOrdersAddr(rs.getString("orders_addr"));
			orders.setOrdersState(rs.getString("orders_state"));
			
			list.add(orders);
		}
		conn.close();
		
		return list;
	}
	
	// 주문하기 데이터 베이스에 입력
	public void insertOrders(Orders orders) throws Exception{
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, member_email, orders_addr) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());

		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeUpdate();
		conn.close();
	}

	// 이메일별로 주문내역 띄우기
	public ArrayList<String> selectOrdersEmailList() throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select distinct member_email from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			
			list.add(rs.getNString("member_email"));
			
		}
		conn.close();
		
		return list;
	}
	
	
	public ArrayList<Orders> selectOrdersEmailListByEmail(String memberEmail) throws Exception{
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select orders_id, product_id, orders_amount, orders_price, member_email, orders_addr, orders_state from orders where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Orders o = new Orders();
			
			o.setOrdersId(rs.getInt("orders_id"));
			o.setProductId(rs.getInt("product_id"));
			o.setOrdersAmount(rs.getInt("orders_amount"));
			o.setOrdersPrice(rs.getInt("orders_price"));
			o.setMemberEmail(rs.getString("member_email"));
			o.setOrdersAddr(rs.getString("orders_addr"));
			o.setOrdersState(rs.getString("orders_state"));
			
			list.add(o);
		}
		conn.close();
		
		return list;
	}
}
