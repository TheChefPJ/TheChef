package com.kosta.project.dto;

import java.util.Date;

public class CartDTO {
	private String f_no;
	private String id;
	private Date reg_date;
	private int f_total_price;
	private int f_total_count;
	
	public CartDTO() {}
	
	public CartDTO(String f_no, String id, Date reg_date, int f_total_price, int f_total_count) {
		this.f_no = f_no;
		this.id = id;
		this.reg_date = reg_date;
		this.f_total_price = f_total_price;
		this.f_total_count = f_total_count;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getF_total_price() {
		return f_total_price;
	}

	public void setF_total_price(int f_total_price) {
		this.f_total_price = f_total_price;
	}

	public int getF_total_count() {
		return f_total_count;
	}

	public void setF_total_count(int f_total_count) {
		this.f_total_count = f_total_count;
	}
	
	
}
