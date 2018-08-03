package com.profound.blog.bean;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class Louser {
	private String username;
	private String password;
	private String rememberme;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword(){
		return password;
	}

	public void setPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md5;
		md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		// ¼ÓÃÜºóµÄ×Ö·û´®
		String password1 = base64en.encode(md5.digest(password.getBytes("utf-8")));
		this.password = password1;
	}
	public String getRememberme() {
		return rememberme;
	}

	public void setRememberme(String rememberme) {
		this.rememberme = rememberme;
	}

	@Override
	public String toString() {
		return "Louser [username=" + username + ", password=" + password + ", rememberme=" + rememberme + "]";
	}

	public Louser(String username, String password, String rememberme) {
		super();
		this.username = username;
		this.password = password;
		this.rememberme = rememberme;
	}

	public Louser() {
		super();
		// TODO Auto-generated constructor stub
	}

}
