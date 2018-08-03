package com.profound.blog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.profound.blog.bean.Reuser;
import com.profound.blog.dao.LoginuserDao;

@Service
public class LoginService {
	@Autowired
	private LoginuserDao dao;

	public List<Reuser> selectuser(Reuser user) {
		List<Reuser> result = new ArrayList<Reuser>();
		result=dao.selectuser(user);
		return result;
	}
}
