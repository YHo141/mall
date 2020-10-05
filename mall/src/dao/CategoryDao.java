package dao;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;
import vo.Product;

import java.sql.*;

public class CategoryDao {
	//	ī�װ��� ���
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select category_id, category_name, category_pic from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setCategoryPic(rs.getString("category_pic"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	
	//	��õ ī�װ��� ���
	public ArrayList<Category> selectCategoryCkList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select category_id, category_pic, category_ck from category where category_ck = 'Y' limit 0,4";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryPic(rs.getString("category_pic"));
			category.setCategoryCk(rs.getString("category_ck"));
			list.add(category);
		}
		conn.close();
		return list;
	}
}
