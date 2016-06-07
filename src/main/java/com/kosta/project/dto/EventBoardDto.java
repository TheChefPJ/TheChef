package com.kosta.project.dto;

import java.util.Date;

public class EventBoardDto {
	private int e_no;
	private String e_title;
	private String e_writer;
	private Date e_regdate;
	private int e_hit;
	private String e_contents;
	
	public EventBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventBoardDto(int e_no, String e_title, String e_writer, Date e_regdate, int e_hit, String e_contents) {
		super();
		this.e_no = e_no;
		this.e_title = e_title;
		this.e_writer = e_writer;
		this.e_regdate = e_regdate;
		this.e_hit = e_hit;
		this.e_contents = e_contents;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_writer() {
		return e_writer;
	}
	public void setE_writer(String e_writer) {
		this.e_writer = e_writer;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public int getE_hit() {
		return e_hit;
	}
	public void setE_hit(int e_hit) {
		this.e_hit = e_hit;
	}
	public String getE_contents() {
		return e_contents;
	}
	public void setE_contents(String e_contents) {
		this.e_contents = e_contents;
	}
	
	
	
}



