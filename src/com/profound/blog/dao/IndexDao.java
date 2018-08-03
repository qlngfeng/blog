package com.profound.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.profound.blog.bean.Img;
import com.profound.blog.bean.IndexBlog;
import com.profound.blog.bean.Page;
import com.profound.blog.bean.Reuser;

@Repository
public class IndexDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<IndexBlog> selectblog() {
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = sst.selectList("selectblog");
		return result;
	}
	public int selectcount() {
		int count;
		count=sst.selectOne("selectcount");
		return count;
	}
	public List<IndexBlog> list(Page page){
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = sst.selectList("list",page);
		return result;
	}
	public List<IndexBlog> newlist(){
		List<IndexBlog> result=new ArrayList<IndexBlog>();
		result=sst.selectList("selectnew");
		return result;
	}
	public List<IndexBlog> hotlist(){
		List<IndexBlog> result=new ArrayList<IndexBlog>();
		result=sst.selectList("selecthot");
		return result;
	}
	public List<IndexBlog> userblog(Reuser user) {
		List<IndexBlog> result=new ArrayList<IndexBlog>();
		result=sst.selectList("userblog",user);
		return result;
	}
	public int userblogcount(Reuser user) {
		int count;
		count=sst.selectOne("userblogcount",user);
		return count;
	}
	public void sendblog(IndexBlog user) {
		sst.selectList("sendblog",user);
	}
	public List<IndexBlog> blog(IndexBlog user) {
		List<IndexBlog> result=new ArrayList<IndexBlog>();
		result=sst.selectList("blog",user);
		return result;
	}
	public void sendimg(Img img) {
		sst.selectList("sendimg", img);
	}
	public List<Img> images(Img img){
		List<Img> result=new ArrayList<Img>();
		result=sst.selectList("images", img);
		return result;
	}
	public void delimg(Img img) {
		sst.selectList("delimg", img);
	}
}
