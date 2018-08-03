<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List,java.awt.*,java.io.*,java.awt.image.*,javax.imageio.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>用户中心</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/layui.css" media="all">
<script src="layui.js" charset="utf-8"></script>
<script>
	layui.use('element', function() {
		var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

		//监听导航点击
		element.on('nav(demo)', function(elem) {
			//console.log(elem)
			layer.msg(elem.text());
		});
	});
</script>
</head>
<body>
	<ul class="layui-nav">
		<li class="layui-nav-item">
			<!--<img src="./images/logo.png" alt="layui">--> <a
			href="index.action"> 首页 </a>
		</li>
		<%
			String name = (String) session.getAttribute("username");
			if (name == null) {
		%><li class="layui-nav-item" style="float: right"><a
			href="./login.jsp">登录</a></li>
		<li class="layui-nav-item" style="float: right"><a
			href="./regsite.jsp">注册</a></li>
		<%
			} else {
		%>
		<li class="layui-nav-item" lay-unselect="" style="float: right"><a
			href="javascript:;">${username }</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="./user_center.jsp">个人主页</a>
				</dd>
				<dd>
					<a href="./myblog.jsp">我的文章</a>
				</dd>
				<dd>
					<a href="./user_update.jsp">修改信息</a>
				</dd>
				<dd>
					<a href="old.action">浏览记录</a>
				</dd>
				<dd>
					<a href="loginout.action">退了</a>
				</dd>
			</dl>
		<li class="layui-nav-item" style="float: right">
			<!--<img src="./images/logo.png" alt="layui">--> <a
			href="sendblog.jsp"> 发布文章 </a>
		</li>
		</li>
		<%
			}
		%>
	</ul>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>我的主页</legend>
	</fieldset>
	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title" >
			<li class="layui-this">个人信息</li>
		</ul>
		<div class="layui-tab-item layui-show">
			<ul class="layui-timeline">
				<li class="layui-timeline-item"><i
					class="layui-icon layui-timeline-axis"></i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">用户名：</h3>
						<p>${sessionScope.username }</p>
					</div></li>
				<li class="layui-timeline-item"><i
					class="layui-icon layui-timeline-axis"></i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">性别：</h3>
						<p>${sessionScope.sex }</p>

					</div></li>
				<li class="layui-timeline-item"><i
					class="layui-icon layui-timeline-axis"></i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">邮箱：</h3>
						<p>${sessionScope.email }</p>
					</div></li>
				<li class="layui-timeline-item"><i
					class="layui-icon layui-timeline-axis"></i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">手机：</h3>
						<p>${sessionScope.phone }</p>

					</div></li>
				<li class="layui-timeline-item"><i
					class="layui-icon layui-timeline-axis"></i>
					<div class="layui-timeline-content layui-text">
						<h3 class="layui-timeline-title">上次在线时间：</h3>
						<p>${sessionScope.time }</p>

					</div></li>
			</ul>
		</div>
	</div>
</body>
</html>