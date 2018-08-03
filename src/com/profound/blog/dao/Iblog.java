package com.profound.blog.dao;

import java.util.List;

import com.profound.blog.bean.Img;
import com.profound.blog.bean.IndexBlog;
import com.profound.blog.bean.Page;
import com.profound.blog.bean.Reuser;


public interface Iblog {
	public  List<IndexBlog> selectblog();
	public int selectcount();
	public List<IndexBlog> list(Page page);
	public List<IndexBlog> newlist();
	public List<IndexBlog> hotlist();
	public List<IndexBlog> userblog(Reuser user);
	public int userblogcount(Reuser user);
	public List<IndexBlog> blog(IndexBlog user);
	public void sendimg(Img img);
	public List<Img> images(Img img);
	public void delimg(Img img);
}
