package com.kosta.project.dto;

public class FrequentQuestionDTO {
	int fq_no;
	String fq_category, fq_title, fq_contents;
	
	
	public FrequentQuestionDTO() {
	}
	
	public FrequentQuestionDTO(int fq_no, String fq_category, String fq_title, String fq_contents) {
		super();
		this.fq_no = fq_no;
		this.fq_category = fq_category;
		this.fq_title = fq_title;
		this.fq_contents = fq_contents;
	}
	
	public int getFq_no() {
		return fq_no;
	}
	public void setFq_no(int fq_no) {
		this.fq_no = fq_no;
	}
	public String getFq_category() {
		return fq_category;
	}
	public void setFq_category(String fq_category) {
		this.fq_category = fq_category;
	}
	public String getFq_title() {
		return fq_title;
	}
	public void setFq_title(String fq_title) {
		this.fq_title = fq_title;
	}
	public String getFq_contents() {
		return fq_contents;
	}
	public void setFq_contents(String fq_contents) {
		this.fq_contents = fq_contents;
	}
	
}

