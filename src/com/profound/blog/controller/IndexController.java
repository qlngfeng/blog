package com.profound.blog.controller;

import java.awt.event.ContainerListener;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.profound.blog.bean.Img;
import com.profound.blog.bean.IndexBlog;
import com.profound.blog.bean.Page;
import com.profound.blog.bean.Reuser;
import com.profound.blog.service.IndexService;
import com.profound.blog.service.LoginService;
import com.sun.corba.se.pept.transport.ContactInfoList;
import com.sun.prism.Image;

import net.sf.json.JSONArray;

@Controller
public class IndexController {
	@Autowired
	private IndexService service;
	@Autowired
	private LoginService service1;

	@RequestMapping("index")
	public ModelAndView selectblog(HttpServletRequest request, HttpServletResponse response, Page page, Img img)
			throws UnsupportedEncodingException, NoSuchAlgorithmException {
		// 获取保存的Cookie实现免登录
		Cookie[] cks = request.getCookies();
		String username = null;
		String password = null;
		for (int i = 0; i < cks.length; i++) {
			Cookie c = cks[i];
			String name = c.getName();
			String value = c.getValue();
			if ("username".equals(name)) {
				username = value;
			}
			if ("password".equals(name)) {
				password = value;
			}
		}
		if (username != null && password != null) {
			Reuser user = new Reuser();
			user.setUsername(username);
			user.setPassword(password);
			List<Reuser> result_1 = new ArrayList<Reuser>();
			result_1 = service1.selectuser(user);
			Iterator<Reuser> iter = result_1.iterator();
			Date day = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = df.format(day);
			request.getSession().setAttribute("time", time);
			Reuser rs = iter.next();
			String email = rs.getEmail();
			String phone = rs.getPhone();
			String sex = rs.getSex();
			int user_id = rs.getUser_id();
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("phone", phone);
			request.getSession().setAttribute("sex", sex);
			request.getSession().setAttribute("user_id", user_id);
		}
		// 博客分页加载
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		int pagecount;
//		result = service.selectblog();
		result = service.list(page);
		int count;
		count = service.selectcount();
		page.caculateLast(count);
		// 最新博客加载
		List<IndexBlog> newresult = new ArrayList<IndexBlog>();
		newresult = service.newlist();
		// 最多点击加载
		List<IndexBlog> hotresult = new ArrayList<IndexBlog>();
		hotresult = service.hotlist();
		// 获取用户头像地址
		List<Img> result_img = new ArrayList<Img>();
		img.setUsername((String) request.getSession().getAttribute("username"));
		result_img = service.images(img);
		Iterator<Img> iter_img = result_img.iterator();
//		System.out.println(result_img);
		try {
			Img rs_img = iter_img.next();
			String image = rs_img.getImage();
			request.getSession().setAttribute("image", image);
		} catch (Exception e) {
			// TODO: handle exception
		}
//		System.out.println(result_img);
		ModelAndView mav = new ModelAndView();
		// 存入视图
		mav.addObject("bloglist", result);
		mav.addObject("newlist", newresult);
		mav.addObject("hotlist", hotresult);
		// 放入jsp路径
		mav.setViewName("index");
		return mav;
//		if(count<4) {
//			pagecount=1;
//		}else {
//			pagecount=(int) Math.ceil(count/4);
//			System.out.println(pagecount);
//		}
//		System.out.println(count);
//		request.getSession().setAttribute("bloglist",result);
//		  mav.addObject("bloglist", result);
//		  mav.addObject("pagecount",pagecount);
//		  mav.setViewName("index");
//		  return mav;
	}

	@RequestMapping(value = "/backContent")
	@ResponseBody
	public String userblog(Reuser user, HttpServletRequest request) {
		String username = (String) request.getSession().getAttribute("username");
		user.setUsername(username);
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		result = service.userblog(user);
		int count;
		count = service.userblogcount(user);

		// 用json来传值
		JSONArray json = JSONArray.fromObject(result);
		String js = json.toString();
		// *****转为layui需要的json格式
		String jso = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + js + "}";
		return jso;

	}

	@RequestMapping("/sendblog")
	public void sendblog(IndexBlog user, HttpServletRequest request, String summary, String blogtitle, String blogtype,
			String content) {
		// 默认点击为1
		int min = 1;
		int max = 100;
		int clickHit = min + ((int) (new Random().nextFloat() * (max - min)));
		user.setClickHit(clickHit);
		// 获取当前时间
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String releaseDate = df.format(day);
		user.setReleaseDate(releaseDate);
		// 获取用户
		String username = (String) request.getSession().getAttribute("username");
		System.out.println(username);
		user.setUsername(username);
//		System.out.println(username);
		// 获取内容,显示，标题，类型并set
		user.setContent(content);
		user.setSummary(summary);
		user.setBlogtitle(blogtitle);
		user.setBlogtype(blogtype);
//		System.out.println(content);
//		System.out.println(summary);
		service.sendblog(user);
	}

	@RequestMapping("/blog")
	public ModelAndView blog(IndexBlog user, HttpServletRequest request, HttpServletResponse response, int blog_id) {
//		System.out.println(blog_id);
		List<IndexBlog> result = new ArrayList<IndexBlog>();
		user.setBlog_id(blog_id);
		result = service.blog(user);
		Iterator<IndexBlog> iter = result.iterator();
		IndexBlog rs = iter.next();
		String blogtitle = rs.getBlogtitle();
//		Cookie blogname = new Cookie(blogtitle, blogtitle);
//		blogname.setMaxAge(60 * 60 * 24 * 3);
//		response.addCookie(blogname);
		// 保存session用户历史记录
		if (request.getSession().getAttribute("blogtitle") != null) {
			List<String> result_title = new ArrayList<String>();
			List<String> result_title1 = new ArrayList<String>();
			result_title1.add(blogtitle);
			result_title = (List<String>) request.getSession().getAttribute("blogtitle");
			result_title.removeAll(result_title1);// 此处指的是将与l2重复的删除
			result_title.addAll(result_title1);// 此处指加上l2
			request.getSession().setAttribute("blogtitle", result_title);
			System.out.println(request.getSession().getAttribute("blogtitle"));

		} else {
			List<String> result_title_new = new ArrayList<String>();
			result_title_new.add(blogtitle);
			request.getSession().setAttribute("blogtitle", result_title_new);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("blog", result);
		mav.setViewName("blog");
		mav.setViewName("blog");
		return mav;
	}

	@RequestMapping("/old")
	public ModelAndView old(HttpServletRequest request) {
		List<String> result = new ArrayList<String>();
		result = (List<String>) request.getSession().getAttribute("blogtitle");
		ModelAndView mav = new ModelAndView();
		// 存入视图
		mav.addObject("oldsee", result);
		mav.setViewName("oldsee");
		return mav;
	}

	@RequestMapping("/sendimg")
	public String sendimg(Img img, HttpServletRequest request, MultipartFile file)
			throws IllegalStateException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		// 定义文件保存的本地路径
//		String localPath = "C:/Users/admin/Documents/workspace-sts-3.9.5.RELEASE/blog/WebContent/images/";
//		String file1="file:///";
		// 定义 文件名
		ServletContext ctx=ContextLoaderListener.getCurrentWebApplicationContext().getServletContext();
		String path=ctx.getRealPath("/")+"photos";
		System.out.println(path);
		String filename = null;
		filename = "\\"+username + ".jpg";
//		System.out.println("name=" + username);
//		System.out.println("==" + file.getName());// 文件名字
//		System.out.println("1=" + file.getContentType());
//		System.out.println("2=" + file.getOriginalFilename());
//		System.out.println("3=" + file.getSize());
//		System.out.println("--" + file.getInputStream());
		File fileSource = new File(path, filename);
		file.transferTo(fileSource);
		String dizhi = path+filename;
		img.setImage(dizhi);
		img.setUsername(username);
		service.delimg(img);
		service.sendimg(img);
		return "user_update";
	}
}
