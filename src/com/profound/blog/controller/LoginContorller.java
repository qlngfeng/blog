package com.profound.blog.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.profound.blog.bean.Img;
import com.profound.blog.bean.Louser;
import com.profound.blog.bean.Reuser;
import com.profound.blog.service.IndexService;
import com.profound.blog.service.LoginService;

import sun.misc.BASE64Encoder;

@Controller
public class LoginContorller {
	@Autowired
	private LoginService service;
	@Autowired
	private IndexService service1;
	@RequestMapping("/login")
	public ModelAndView selectuser(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			Reuser user,Img img) throws IOException {
		List<Reuser> result = new ArrayList<Reuser>();
		result = service.selectuser(user);
//		System.out.println(request.getParameter("password"));
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(day);
		request.getSession().setAttribute("time", time);
		 System.out.println(result);
		Iterator<Reuser> iter = result.iterator();
		if (iter.hasNext()) {
			Reuser rs = iter.next();
			String email = rs.getEmail();
			String phone = rs.getPhone();
			String sex = rs.getSex();
			String username = rs.getUsername();
			int user_id = rs.getUser_id();
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("phone", phone);
			request.getSession().setAttribute("sex", sex);
			request.getSession().setAttribute("user_id", user_id);
			ServletContext ctx=ContextLoaderListener.getCurrentWebApplicationContext().getServletContext();
			String path=ctx.getRealPath("/")+"photos";
			String dizhi=path+"\\logo.jpg";
			img.setImage(dizhi);
			img.setUsername(username);
			List<Img> result_img=new ArrayList<Img>();
			result_img=service1.images(img);
//			System.out.println(result_img.size());
			if(result_img.size() == 0) {
				service1.sendimg(img);
			}
			// ���¼
			String rememberme = user.getRememberme();
			if (rememberme != null) {
				Cookie cName = new Cookie("username",username);
				String password=request.getParameter("password");
				Cookie cPassword = new Cookie("password", password);
				cName.setMaxAge(60 * 60 * 240);
				cPassword.setMaxAge(60 * 60 * 240);
				response.addCookie(cName);
				response.addCookie(cPassword);
			}
//			System.out.println(session.getAttribute("user"));
//			mv.addObject("message", username);
//			mv.setViewName("index.acton");
			return new ModelAndView("redirect:/index.action");
		} else {
			mv.addObject("message", "��¼���������������������");
			mv.setViewName("login");

		}

		return mv;
	}

	@RequestMapping("/loginout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		//���session
		session.invalidate();
		//���Ҫɾ��ĳ��Cookie��ֻ��Ҫ�½�һ��ͬ����Cookie������maxAge����Ϊ0������ӵ�response�и���ԭ����Cookie��
		Cookie cName = new Cookie("username", "");
		Cookie cPassword = new Cookie("password","");
		cName.setMaxAge(0);
		cPassword.setMaxAge(0);
		response.addCookie(cName);
		response.addCookie(cPassword);
		return "login";
	}

//	@RequestMapping("/Cologin")
//	public void autoLogin(HttpServletRequest request, HttpServletResponse response) {
//		Cookie[] cks=((HttpServletRequest) response).getCookies();
//		String username = null;
//		String password = null;
//		for (int i = 0; i < cks.length; i++) {
//			Cookie c = cks[i];
//			String name = c.getName();
//			String value = c.getValue();
//			if ("username".equals(name)) {
//				username = value;
//			} else if ("password".equals(name)) {
//				password = value;
//			}
//		}
//		if (username != null && password != null) {
//			Reuser user=new Reuser();
//			List<Reuser> result = new ArrayList<Reuser>();
//			result=service.selectuser(user);
//			Iterator<Reuser> iter = result.iterator();
//			Reuser rs = iter.next();
//			String email = rs.getEmail();
//			String phone = rs.getPhone();
//			String sex = rs.getSex();
//			int user_id = rs.getUser_id();
//			request.getSession().setAttribute("username", username);
//			request.getSession().setAttribute("email", email);
//			request.getSession().setAttribute("phone", phone);
//			request.getSession().setAttribute("sex", sex);
//			request.getSession().setAttribute("user_id", user_id);
//		}
//	@RequestMapping(value="/checkCode")
//	public void checkCode(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//		//������Ӧ����,������������������ΪͼƬ
//        response.setContentType("image/jpeg");
//        
//        //������Ӧͷ��Ϣ�������������Ҫ���������
//        response.setHeader("pragma", "no-cache");
//        response.setHeader("Cache-Control", "no-cache");
//        response.setDateHeader("Expire", 0);
//        
//        RandomValidateCode randomValidateCode = new RandomValidateCode();
//        try {
//            randomValidateCode.getRandcode(request, response);//���ͼƬ����
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//
//}
}
