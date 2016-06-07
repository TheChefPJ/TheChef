package com.kosta.project.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class RTPdto {
	String p_title, id, p_no, p_contentFile, p_thumbFile, p_category1, p_category2;
	int p_price;
	Date p_regdate;

	// constructor
	public RTPdto() {}

	public RTPdto(String p_title, String id, String p_no, String p_contentFile, String p_thumbFile, String p_category1,
			String p_category2, int p_price, Date p_regdate) {
		this.p_title = p_title;
		this.id = id;
		this.p_no = p_no;
		this.p_contentFile = p_contentFile;
		this.p_thumbFile = p_thumbFile;
		this.p_category1 = p_category1;
		this.p_category2 = p_category2;
		this.p_price = p_price;
		this.p_regdate = p_regdate;
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


	//setter, getter
	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getP_contentFile() {
		return p_contentFile;
	}

	public void setP_contentFile(String p_contentFile) {
		this.p_contentFile = p_contentFile;
	}

	public String getP_thumbFile() {
		return p_thumbFile;
	}

	public void setP_thumbFile(String p_thumbFile) {
		this.p_thumbFile = p_thumbFile;
	}

	public String getP_category1() {
		return p_category1;
	}

	public void setP_category1(String p_category1) {
		this.p_category1 = p_category1;
	}

	public String getP_category2() {
		return p_category2;
	}

	public void setP_category2(String p_category2) {
		this.p_category2 = p_category2;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	
}
