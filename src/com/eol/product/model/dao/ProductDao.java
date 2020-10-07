package com.eol.product.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.product.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			String path = ProductDao.class.getResource("/product/product.properties").getPath();
			prop.load(new FileReader(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertProduct"));
			pstmt.setNString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setInt(3, p.getpDiscount());
			pstmt.setInt(4, p.getpStock());
			pstmt.setInt(5, p.getpServing());
			pstmt.setInt(6, p.getpCooktime());
			pstmt.setInt(7, p.getpReadytime());
			pstmt.setInt(8, p.getpTaste());
			
			pstmt.setNString(9, p.getpImage1());
			pstmt.setNString(10, p.getpImage2());
			pstmt.setNString(11, p.getpImage3());
			pstmt.setNString(12, p.getpVideo());
			
			pstmt.setNString(13, p.getpDetailImage1());
			pstmt.setNString(14, p.getpDetailImage2());
			pstmt.setNString(15, p.getpDetailImage3());
			
			pstmt.setNString(16, p.getpDetailTitle1());
			pstmt.setNString(17, p.getpDetailTitle2());
			pstmt.setNString(18, p.getpDetailMain());
			
			pstmt.setNString(19, p.getpDetailContent1());
			pstmt.setNString(20, p.getpDetailContent2());
			
			pstmt.setNString(21, p.getpRecipeImage1());
			pstmt.setNString(22, p.getpRecipeImage2());
			pstmt.setNString(23, p.getpRecipeImage3());
			pstmt.setNString(24, p.getpRecipeImage4());
			
			pstmt.setNString(25, p.getpRecipeContent1());
			pstmt.setNString(26, p.getpRecipeContent2());
			pstmt.setNString(27, p.getpRecipeContent3());
			pstmt.setNString(28, p.getpRecipeContent4());

			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
}