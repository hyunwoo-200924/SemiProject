package com.eol.product.model.dao;

import java.io.FileReader;
import java.util.Properties;

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
}
