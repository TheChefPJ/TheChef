package com.kosta.project.dto;

import java.util.Date;

public class CartJoinDTO {
	private String p_thumbFile;
	private String fno;
	private String fid;
	private String p_category1;
	private String p_title;
	private Date reg;
	private int total_price;
	private int total_count;
	private int p_price;
	
	public CartJoinDTO() {}

	public CartJoinDTO(String p_thumbFile, String fno, String fid, String p_category1, String p_title, Date reg,
			int total_price, int total_count, int p_price) {
		this.p_thumbFile = p_thumbFile;
		this.fno = fno;
		this.fid = fid;
		this.p_category1 = p_category1;
		this.p_title = p_title;
		this.reg = reg;
		this.total_price = total_price;
		this.total_count = total_count;
		this.p_price = p_price;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_thumbFile() {
		return p_thumbFile;
	}

	public void setP_thumbFile(String p_thumbFile) {
		this.p_thumbFile = p_thumbFile;
	}

	public String getFno() {
		return fno;
	}

	public void setFno(String fno) {
		this.fno = fno;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getP_category1() {
		return p_category1;
	}

	public void setP_category1(String p_category1) {
		this.p_category1 = p_category1;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
}
