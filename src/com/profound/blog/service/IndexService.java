package com.profound.blog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.profound.blog.bean.Img;
import com.profound.blog.bean.IndexBlog;
import com.profound.blog.bean.Page;
import com.profound.blog.bean.Reuser;
import com.profound.blog.dao.IndexDao;

@Service
public class IndexService {
	@Autowired
	private IndexDao dao;

	public List<IndexBlog> selectblog() {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.selectblog();
		return result;
	}

	public int selectcount() {
		int count;
		count = dao.selectcount();
		return count;
	}

	public List<IndexBlog> list(Page page) {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.list(page);
		return result;
	}

	public List<IndexBlog> newlist() {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.newlist();
		return result;
	}

	public List<IndexBlog> hotlist() {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.hotlist();
		return result;
	}

	public List<IndexBlog> userblog(Reuser user) {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.userblog(user);
		return result;
	}

	public int userblogcount(Reuser user) {
		int count;
		count = dao.userblogcount(user);
		return count;
	}

	public void sendblog(IndexBlog user) {
		dao.sendblog(user);
	}
	public List<IndexBlog> blog(IndexBlog user) {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = dao.blog(user);
		return result;
	}
	public void sendimg(Img img) {
		dao.sendimg(img);
	}
	public List<Img> images(Img img) {
		List<Img> result = new ArrayList<Img>();
		result = dao.images(img);
		return result;
	}
	public void delimg(Img img) {
		dao.delimg(img);
	}
}
