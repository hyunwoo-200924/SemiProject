package com.eol.cart.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CartDao {
	
	Properties prop = new Properties();	
	
	public CartDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=CartDao.class.getResource("/cart/cart.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	

}
