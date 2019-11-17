package com.scmaster.milanmall.shopping.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.milanmall.member.vo.MallMember;
import com.scmaster.milanmall.shopping.dao.ProductDAO;
import com.scmaster.milanmall.shopping.vo.Product;


@Controller
@RequestMapping(value="product")
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	//dao부르기.
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(value="goPdView", method=RequestMethod.GET)
	public String goPdView(String prod_num, Model model){
		logger.info("제품상세 페이지 이동 시작");
		
		Product vo = dao.selectProdOne(prod_num); 
		
		model.addAttribute("vo", vo);
		
		logger.info("제품상세 페이지 이동 종료");
		return "product/productview";
	}
	
	@ResponseBody
	@RequestMapping(value="findPdNum", method=RequestMethod.POST)
	public String findPdNum(@RequestBody Product product){
		
		String prod_num = dao.searchOne(product);
		
		return prod_num;
	}
	
	@RequestMapping(value="goBuyPage", method=RequestMethod.POST)
	public String goBuyPage(Product product, Model model){
		
		if(product.getProd_price()!=null){
		int ea = product.getProd_ea();
		int price = Integer.parseInt(product.getProd_price());
		
		int result = ea*price;
		String price2 = String.valueOf(result);
		
		product.setProd_price(price2);
		
		model.addAttribute("pd", product);
		}
		return "product/buyPage";
	}
	
	@ResponseBody
	@RequestMapping(value="calPrice", method=RequestMethod.POST)
	public String calPrice(@RequestBody Product product){
		
		int ea = product.getProd_ea();

		product = dao.selectProdOne(product.getProd_num());
		
		int price = Integer.parseInt(product.getProd_price());
		
		int result = ea*price;
		String price2 = String.valueOf(result);
		
		return price2;
	}
	
	@RequestMapping(value="pay", method=RequestMethod.POST)
	public String payComplete(String req, MallMember member, HttpSession session, Model model, Product product){
		
		session.setAttribute("req", req);
		session.setAttribute("member", member);
		session.setAttribute("pd", product);

		
		CopyOnWriteArrayList<Product> listtest = (CopyOnWriteArrayList<Product>)session.getAttribute("cartList");
		if(listtest !=null){
		for (Product pd: listtest) {
			if(pd == null){
				model.addAttribute("pd", product);
			}
		}
		}else{
			model.addAttribute("pd", product);

		}
		
		return "product/buyComplete";
	}
	
	@RequestMapping(value="goCart", method=RequestMethod.POST)
	public String goCart(HttpSession session, Model model, Product product){
		logger.info("카트에 제품 추가 시작");

		List<Product> cartList = (CopyOnWriteArrayList<Product>) session.getAttribute("cartList");
		
		if(cartList == null){
			cartList = new CopyOnWriteArrayList<Product>();
			
		}
		cartList.add(product);
		
		/*중복 상품 구매시 자동 수량 추가 실패 코드.
		 * else{
			for(Product pd : cartList){
				if(pd.getProd_num().equals(product.getProd_num())){
					pd.setProd_ea(pd.getProd_ea()+product.getProd_ea());
				}else{
					
					cartList.add(product);
				}
			}
		}*/
		
		session.setAttribute("cartList", cartList);
		logger.info("카트에 제품 추가 종료");
		return "product/myCart";
	}
	
	
	@ResponseBody
	@RequestMapping(value="delCart", method=RequestMethod.POST)
	public void delCart(String prod_num, HttpSession session){
		logger.info("카트에 제품 삭제 시작");
		System.out.println(prod_num);
		CopyOnWriteArrayList<Product> cartList = (CopyOnWriteArrayList<Product>) session.getAttribute("cartList");
		
		Product product = dao.selectProdOne(prod_num);
		
		for(Product pd : cartList){
			if(pd.getProd_num().equals(product.getProd_num())){
				cartList.remove(pd);
			}
		}
		
		//cartList.remove(product);
		//	cartList.removeAll(cartList); 얘는 장바구니 전체 비우기
		//session.removeAttribute("cartList");
		
		session.setAttribute("cartList", cartList);
		logger.info("카트에 제품 삭제 종료");

		
	}
	
	@RequestMapping(value="goMyCart", method=RequestMethod.GET)
	public String goMyCart(){
		return "product/myCart";
	}
	@RequestMapping(value="gobuyComplete", method=RequestMethod.GET)
	public String gobuyComplete(Model model, HttpSession session){
		
		Product product = (Product)session.getAttribute("pd");
		
		model.addAttribute("pd", product);

		return "product/buyComplete";
	}
	
}
