package com.scmaster.milanmall.shopping.dao;

import java.util.ArrayList;

import com.scmaster.milanmall.shopping.vo.Product;

public interface ProductMapper {

	public Product selectProdOne(String prod_num);

	public ArrayList<Product> selectAll();

	public String searchOne(Product product);
	
	
}
