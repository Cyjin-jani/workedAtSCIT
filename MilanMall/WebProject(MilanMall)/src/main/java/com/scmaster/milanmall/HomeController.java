package com.scmaster.milanmall;


import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.milanmall.shopping.dao.ProductDAO;
import com.scmaster.milanmall.shopping.vo.Product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
				
		ArrayList<Product> productList = null;
		
		productList = dao.showAll();
		/*
		
		Product vo1 = new Product();
		vo1.setProd_name("제품1");
		vo1.setProd_num("1");
		vo1.setProd_price("79,000");
		vo1.setProd_imgpath("resources/image/mainphoto/23960_milan_home_authentic_jersey.png");
		
		Product vo2 = new Product();
		vo2.setProd_name("제품2");
		vo2.setProd_num("2");
		vo2.setProd_price("29,000");
		vo2.setProd_imgpath("resources/image/mainphoto/23969_milan_home_authentic_shorts.png");
		
		Product vo3 = new Product();
		vo3.setProd_name("제품3");
		vo3.setProd_num("3");
		vo3.setProd_price("79,000");
		vo3.setProd_imgpath("resources/image/mainphoto/23959_milan_away_jerseyl.png");
		
		productList.add(vo1);
		productList.add(vo2);
		productList.add(vo3);*/
		
		model.addAttribute("productList", productList);
		
		return "home";
	}
	
}
