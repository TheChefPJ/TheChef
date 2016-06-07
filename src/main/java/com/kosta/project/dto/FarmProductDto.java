package com.kosta.project.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FarmProductDto {
	String s_title, id, s_no, s_contentFile, s_thumbFile, s_category;
	Date s_regdate;
	int s_price;
	
	//constructor
	public FarmProductDto() {}
	public FarmProductDto(String s_title, String id, String s_no, String s_contentFile, String s_thumbFile,
			String s_category, Date s_regdate, int s_price) {
		this.s_title = s_title;
		this.id = id;
		this.s_no = s_no;
		this.s_contentFile = s_contentFile;
		this.s_thumbFile = s_thumbFile;
		this.s_category = s_category;
		this.s_regdate = s_regdate;
		this.s_price = s_price;
	}
	
	//setter/getter
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_contentFile() {
		return s_contentFile;
	}
	public void setS_contentFile(String s_contentFile) {
		this.s_contentFile = s_contentFile;
	}
	public String getS_thumbFile() {
		return s_thumbFile;
	}
	public void setS_thumbFile(String s_thumbFile) {
		this.s_thumbFile = s_thumbFile;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public Date getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}	
	//////////////////////////////////////////////////////////////////
	//다중 파일 업로드 upload CommonsMultipartFile 하나이상 필요////
	private List<CommonsMultipartFile> files;
	
	public List<CommonsMultipartFile> getFiles(){ // get 메소드
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files){ // set 메소드
		this.files = files;
	}
	//////////////////////////////////////////////////////////////////////

}
