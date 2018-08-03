package com.profound.blog.dao;

import java.util.List;

import com.profound.blog.bean.Userupdate;

public interface Iupdate {
	public List<Userupdate> userupdate(Userupdate user);
	public void passwordupdate(Userupdate user);
	public void usernameupdate(Userupdate user);
	public void delblog(int blog_id);
}
