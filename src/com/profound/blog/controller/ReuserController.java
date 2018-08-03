package com.profound.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.profound.blog.bean.Reuser;
import com.profound.blog.service.ReuserService;

@Controller
public class ReuserController {
	@Autowired
	private ReuserService service;

	@RequestMapping("/regsite")
	public String addUser(Reuser user) {
		service.addUser(user);
		return "wait";
	}

	@RequestMapping("/test")
	public void selectUser(HttpServletRequest request, HttpServletResponse response, String username,String blog_id)
			throws IOException {
		List<Reuser> result = new ArrayList<Reuser>();
		System.out.println(blog_id);
		result = service.selectUser(username);
		Iterator<Reuser> iter = result.iterator();
		PrintWriter writer = response.getWriter();
		if (iter.hasNext()) {
			writer.write("false");
		} else {
			writer.write("true");
		}
	}

	@RequestMapping(value = "/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置相应类型,告诉浏览器输出的内容为图片
		response.setContentType("image/jpeg");

		// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);

		RandomValidateCode randomValidateCode = new RandomValidateCode();
		try {
			randomValidateCode.getRandcode(request, response);// 输出图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/vCodeCheck")
	public void getcode(HttpServletRequest request, HttpServletResponse response, String vCode, HttpSession session)
			throws IOException {
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		String code = (String) session.getAttribute("randomcode_key");
//        System.out.println(code);
		PrintWriter writer = response.getWriter();
		if (code != null) {
			if (code.equals(vCode)) {
				writer.write("true");
			} else {
				writer.write("false");
			}
		} else {
			request.getRequestDispatcher("login.jsp");
		}
	}

}