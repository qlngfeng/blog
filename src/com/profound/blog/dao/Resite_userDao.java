package com.profound.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.profound.blog.bean.Reuser;

@Repository
public class Resite_userDao {

	@Autowired

	private SqlSessionTemplate sst;

	public void addUser(Reuser user) {
		SqlSessionFactory sql = sst.getSqlSessionFactory();
		SqlSession openSession = sql.openSession();
		openSession.insert("insert", user);

	}

	public List<Reuser> select(String username) {
		SqlSessionFactory sql = sst.getSqlSessionFactory();
		SqlSession openSession = sql.openSession();
		List<Reuser> result = new ArrayList<Reuser>();
		result=openSession.selectList("select", username);
		return result;
	}
}
