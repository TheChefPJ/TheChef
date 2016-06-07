package com.kosta.project.dto;

import java.util.Date;

public class CheckOutDTO {
	private String c_no, id, c_name, c_address, c_zip_code, c_phone;
	private Date reg_date;
	private int c_price, count, shipping_fee, c_total_price;
	
	public CheckOutDTO() {}

	public CheckOutDTO(String c_no, String id, String c_name, String c_address, String c_zip_code, String c_phone,
			Date reg_date, int c_price, int count, int shipping_fee, int c_total_price) {
		this.c_no = c_no;
		this.id = id;
		this.c_name = c_name;
		this.c_address = c_address;
		this.c_zip_code = c_zip_code;
		this.c_phone = c_phone;
		this.reg_date = reg_date;
		this.c_price = c_price;
		this.count = count;
		this.shipping_fee = shipping_fee;
		this.c_total_price = c_total_price;
	}



	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
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

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getShipping_fee() {
		return shipping_fee;
	}

	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
	}

	public int getC_total_price() {
		return c_total_price;
	}

	public void setC_total_price(int c_total_price) {
		this.c_total_price = c_total_price;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_zip_code() {
		return c_zip_code;
	}

	public void setC_zip_code(String c_zip_code) {
		this.c_zip_code = c_zip_code;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	
}
