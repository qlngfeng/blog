package com.profound.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.profound.blog.bean.Reuser;

@Repository
public class LoginuserDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Reuser> selectuser(Reuser user) {
		List<Reuser> result = new ArrayList<Reuser>();
		result = sst.selectList("selectuser", user);
		return result;
	}
}
