package dao;
import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.*;

public class ProductDao {
	
	public Product selectProductOne(int productId) throws Exception{
		
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select product_id, product_pic, product_name, product_content, product_price, product_soldout from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		System.out.println(stmt);
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			System.out.println(product.getProductId()+" <-- dao");
			product.setProductName(rs.getString("product_name"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		
		return product;
		
	}
	
	public ArrayList<Product> selectProductList() throws Exception{
		
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select product_id, product_pic, product_name, product_price, product_soldout from product limit 0,6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception{
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout from product where category_id=? limit 0, 6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
}
