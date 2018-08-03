package com.profound.blog.bean;

import org.springframework.web.multipart.MultipartFile;

public class Img {
	private String username;
	private String image;
	private MultipartFile dizhi;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getDizhi() {
		return dizhi;
	}
	public void setDizhi(MultipartFile dizhi) {
		this.dizhi = dizhi;
	}
	public Img(String username, String image, MultipartFile dizhi) {
		super();
		this.username = username;
		this.image = image;
		this.dizhi = dizhi;
	}
	public Img() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Img [username=" + username + ", image=" + image + ", dizhi=" + dizhi + "]";
	}

}
