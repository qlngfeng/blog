package com.profound.blog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.profound.blog.bean.Reuser;
import com.profound.blog.dao.Resite_userDao;

@Service
public class ReuserService {

	@Autowired
	private Resite_userDao dao;

	public void addUser(Reuser user) {
		dao.addUser(user);
	}

	public List<Reuser> selectUser(String username) {
		List<Reuser> result = new ArrayList<Reuser>();
		result = dao.select(username);
		return result;
	}
}
