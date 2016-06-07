package com.kosta.project.dto;

import java.util.Date;

public class ProductJoinDto {
	private String title, id, no, contentFile, thumbFile, category1, category2, category3;
	private int price;
	private Date regdate;
	public ProductJoinDto() {}
	public ProductJoinDto(String title, String id, String no, String contentFile, String thumbFile, String category1,
			String category2, String category3, int price, Date regdate) {
		this.title = title;
		this.id = id;
		this.no = no;
		this.contentFile = contentFile;
		this.thumbFile = thumbFile;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.price = price;
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getContentFile() {
		return contentFile;
	}
	public void setContentFile(String contentFile) {
		this.contentFile = contentFile;
	}
	public String getThumbFile() {
		return thumbFile;
	}
	public void setThumbFile(String thumbFile) {
		this.thumbFile = thumbFile;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
