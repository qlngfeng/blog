package com.profound.blog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.profound.blog.bean.Userupdate;
import com.profound.blog.dao.UpdateDao;

@Service
public class UpdateService {
	@Autowired
	private UpdateDao dao;

	public List<Userupdate> userupdate(Userupdate user) {
		List<Userupdate> result = new ArrayList<Userupdate>();
		result = dao.userupdate(user);
		return result;
	}

	public void passwordupdate(Userupdate user) {
		dao.passwordupdate(user);
	}
	public void usernameupdate(Userupdate user) {
		dao.usernameupdate(user);
	}
	public void delblog(int blog_id) {
		dao.delblog(blog_id);
	}
}
