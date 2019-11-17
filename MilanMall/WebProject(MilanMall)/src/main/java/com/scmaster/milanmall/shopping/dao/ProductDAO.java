package com.scmaster.milanmall.shopping.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.milanmall.shopping.vo.Product;



@Repository
public class ProductDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	
	@Autowired
	SqlSession sqlsession;
	
	public Product selectProdOne(String prod_num) {
		// TODO Auto-generated method stub
		Product product = null;
		logger.info("상품 하나 조회 시작");
		ProductMapper mapper = sqlsession.getMapper(ProductMapper.class);
		
		try{
			product = mapper.selectProdOne(prod_num);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("상품 하나 조회 종료");
		return product;
	}

	public ArrayList<Product> showAll() {
		// TODO Auto-generated method stub
		ArrayList<Product> productList = null;
		
		logger.info("상품 전체조회 시작");
		ProductMapper mapper = sqlsession.getMapper(ProductMapper.class);
		
		try{
			productList = mapper.selectAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("상품 전체조회 종료");
		
		return productList;
	}

	public String searchOne(Product product) {
		// TODO Auto-generated method stub
		//Product product2 = null;
		String pk = null;
		
		logger.info("상품 전체조회 시작");
		ProductMapper mapper = sqlsession.getMapper(ProductMapper.class);
		
		try{
			pk= mapper.searchOne(product);
			
			//product2 = mapper.selectProdOne(pk);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return pk;
	}
	
	
	
	
	
}
