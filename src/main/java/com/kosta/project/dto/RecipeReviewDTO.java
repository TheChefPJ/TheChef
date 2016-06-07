package com.kosta.project.dto;

import java.util.Date;

public class RecipeReviewDTO {
	private String r_no;
	private String id;
	private Date reg_date;
	private int score;
	private String r_review;
	private String r_title;
	
	public RecipeReviewDTO() {}

	public RecipeReviewDTO(String r_no, String id, Date reg_date, int score, String r_review, String r_title) {
		this.r_no = r_no;
		this.id = id;
		this.reg_date = reg_date;
		this.score = score;
		this.r_review = r_review;
		this.r_title = r_title;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getR_review() {
		return r_review;
	}

	public void setR_review(String r_review) {
		this.r_review = r_review;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	
	
}
