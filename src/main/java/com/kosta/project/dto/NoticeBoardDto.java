package com.kosta.project.dto;

import java.util.Date;

public class NoticeBoardDto {
	private int n_no;
	private String n_title;
	private String n_writer;
	private Date n_regdate;
	private int n_hit;
	private String n_contents;
	
	public NoticeBoardDto() {
		super();
	}
	public NoticeBoardDto(int n_no, String n_title, String n_writer, Date n_regdate, int n_hit, String n_contents) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_regdate = n_regdate;
		this.n_hit = n_hit;
		this.n_contents = n_contents;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	
	
	
}
