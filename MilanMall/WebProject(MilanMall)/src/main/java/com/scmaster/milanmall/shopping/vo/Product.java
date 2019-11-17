package com.scmaster.milanmall.shopping.vo;

public class Product {
	private String prod_name;	//제품명
	private	String prod_num;	//제품번호(일련번호)
	private int prod_ea;	//수량	
	private String prod_price;	//가격
	private int prod_hits;		//추천수
	private String prod_category; //카데고리	
	private int prod_size;	//사이즈(95,100,105,110)
	private String prod_imgpath; //제품이미지 경로
	
	public Product() {
		super();
	}

	public Product(String prod_name, String prod_num, int prod_ea, String prod_price, int prod_hits,
			String prod_category, int prod_size, String prod_imgpath) {
		super();
		this.prod_name = prod_name;
		this.prod_num = prod_num;
		this.prod_ea = prod_ea;
		this.prod_price = prod_price;
		this.prod_hits = prod_hits;
		this.prod_category = prod_category;
		this.prod_size = prod_size;
		this.prod_imgpath = prod_imgpath;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_num() {
		return prod_num;
	}

	public void setProd_num(String prod_num) {
		this.prod_num = prod_num;
	}

	public int getProd_ea() {
		return prod_ea;
	}

	public void setProd_ea(int prod_ea) {
		this.prod_ea = prod_ea;
	}

	public String getProd_price() {
		return prod_price;
	}

	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}

	public int getProd_hits() {
		return prod_hits;
	}

	public void setProd_hits(int prod_hits) {
		this.prod_hits = prod_hits;
	}

	public String getProd_category() {
		return prod_category;
	}

	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
	}

	public int getProd_size() {
		return prod_size;
	}

	public void setProd_size(int prod_size) {
		this.prod_size = prod_size;
	}

	public String getProd_imgpath() {
		return prod_imgpath;
	}

	public void setProd_imgpath(String prod_imgpath) {
		this.prod_imgpath = prod_imgpath;
	}

	@Override
	public String toString() {
		return "Product [prod_name=" + prod_name + ", prod_num=" + prod_num + ", prod_ea=" + prod_ea + ", prod_price="
				+ prod_price + ", prod_hits=" + prod_hits + ", prod_category=" + prod_category + ", prod_size="
				+ prod_size + ", prod_imgpath=" + prod_imgpath + "]";
	}
	
	
}
