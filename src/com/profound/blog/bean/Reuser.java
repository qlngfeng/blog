package com.profound.blog.bean;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class Reuser {
	private int user_id;
	private String username;
	private String password;
	private String phone;
	private String question;
	private String questionresult;
	private String email;
	private String date;
	private String sex;
	private String rememberme;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {	
		return password;
	}
	public void setPassword(String password) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		MessageDigest md5;
		md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		    //¼ÓÃÜºóµÄ×Ö·û´®
		String password1=base64en.encode(md5.digest(password.getBytes("utf-8")));
		this.password=password1;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionresult() {
		return questionresult;
	}
	public void setQuestionresult(String questionresult) {
		this.questionresult = questionresult;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRememberme() {
		return rememberme;
	}
	public void setRememberme(String rememberme) {
		this.rememberme = rememberme;
	}
	public Reuser(int user_id, String username, String password, String phone, String question, String questionresult,
			String email, String date, String sex, String rememberme) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.question = question;
		this.questionresult = questionresult;
		this.email = email;
		this.date = date;
		this.sex = sex;
		this.rememberme = rememberme;
	}
	public Reuser() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Reuser [user_id=" + user_id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", question=" + question + ", questionresult=" + questionresult + ", email=" + email + ", date="
				+ date + ", sex=" + sex + ", rememberme=" + rememberme + "]";
	}
}
