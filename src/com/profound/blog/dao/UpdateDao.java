package com.profound.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.profound.blog.bean.Userupdate;

@Repository
public class UpdateDao {
	@Autowired

	private SqlSessionTemplate sst;
	public List<Userupdate> userupdate(Userupdate user){
		List<Userupdate> result=new ArrayList<Userupdate>();
		result=sst.selectList("userupdate", user);
		return result;
	}
	public void passwordupdate(Userupdate user){
		sst.selectList("passwordupdate", user);
	}
	public void usernameupdate(Userupdate user){
		sst.selectList("usernameupdate", user);
	}
	public void delblog(int blog_id) {
		sst.delete("delblog", blog_id);
	}
}