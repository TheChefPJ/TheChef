package com.kosta.project.dto;

public class RoleDTO {
	private String id;
	private String role_name;
	
	public RoleDTO() {}

	public RoleDTO(String id, String role_name) {
		this.id = id;
		this.role_name = role_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
}
