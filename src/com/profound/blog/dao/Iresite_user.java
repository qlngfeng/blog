package com.profound.blog.dao;

import com.profound.blog.bean.Reuser;

public interface Iresite_user {
	public void insert(Reuser user);
	public Reuser select(String username);
}
