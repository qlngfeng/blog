package com.profound.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.profound.blog.bean.Userupdate;
import com.profound.blog.service.UpdateService;

@Controller
public class UpdateController {
	@Autowired
	private UpdateService service;

	// �޸����룬�޸������session��Cookie
	@RequestMapping("/update")
	public ModelAndView userupdate(Userupdate user, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		List<Userupdate> result = new ArrayList<Userupdate>();
		result = service.userupdate(user);
//		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		Iterator<Userupdate> iter = result.iterator();
		if (iter.hasNext()) {
			service.passwordupdate(user);
			// ���session
			request.getSession().invalidate();
			// ���Ҫɾ��ĳ��Cookie��ֻ��Ҫ�½�һ��ͬ����Cookie������maxAge����Ϊ0������ӵ�response�и���ԭ����Cookie��
			Cookie cName = new Cookie("username", "");
			Cookie cPassword = new Cookie("password", "");
			cName.setMaxAge(0);
			cPassword.setMaxAge(0);
			response.addCookie(cName);
			response.addCookie(cPassword);
			return new ModelAndView("redirect:/login.jsp");
		} else {
			mav.addObject("message", "�������Ϣ����");
			mav.setViewName("user_update");
		}
		return mav;
	}

	// �޸ĸ�����Ϣ�޸������session��Cookie
	@RequestMapping("/updateusername")
	public ModelAndView usernameupdate(Userupdate user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		int user_id = (int) request.getSession().getAttribute("user_id");
		user.setUser_id(user_id);
		service.usernameupdate(user);
		// ���session
		request.getSession().invalidate();
		// ���Ҫɾ��ĳ��Cookie��ֻ��Ҫ�½�һ��ͬ����Cookie������maxAge����Ϊ0������ӵ�response�и���ԭ����Cookie��
		Cookie cName = new Cookie("username", "");
		Cookie cPassword = new Cookie("password", "");
		cName.setMaxAge(0);
		cPassword.setMaxAge(0);
		response.addCookie(cName);
		response.addCookie(cPassword);
		return new ModelAndView("redirect:/login.jsp");
	}
//ɾ�����ͣ�����ֵ���󣬹��ܿ���ʵ�֣�
	@RequestMapping("/deblog")
	public void deblog(String blog_id) {
		int id;
		System.out.println(blog_id);
		id = Integer.parseInt(blog_id);
		System.out.println(id);
		service.delblog(id);	
	}
}