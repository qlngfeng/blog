<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>博客</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/layui.css" media="all">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/detail.css" />
<script src="layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>

<body>
	<!-- 导航栏 -->
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
			</dl> <li class="layui-nav-item" style="float: right">
			<!--<img src="./images/logo.png" alt="layui">--> <a
			href="sendblog.jsp"> 发布文章 </a>
		</li>
		</li>
		<%
			}
		%>
	</ul>
<!-- 导航栏以下 -->
			<div class="all_box" style="width: 1200px; margin: 0 auto;">
		<!-- 文章内容 -->
		<c:forEach var="blogword" items="${blog }" varStatus="st">
			<div class="suibi_box" style="width: 70%; margin-left: 180px;">
				<!-- 标题 -->
				<div id="nei">
					<p>
					
							<h1 id="suibi_title">${blogword.blogtitle }</h1>
					</p>
					<br />
					<ul class="message">
						<li>作者： ${blogword.username } <span id="zuozhe"></span>
						</li>
						<li>时间： ${blogword.releaseDate } <span id="shijian"></span>
						</li>
						<li>阅读人数：${blogword.clickHit } <span id="yuedurenshu"></span>
						</li>
					</ul>
					<hr>
					<br />
					<div
								style="text-indent: 2em; font: 25px Helvetica Neue, Helvetica, PingFang SC, \5FAE\8F6F\96C5\9ED1, Tahoma, Arial, sans-serif; margin-left: 25px; margin-right: 25px; margin-bottom: 20px;">
						${blogword.content }
					</div>
					<br />
				</div>
				<hr>
				<div id="wai"
							style="height: 50px; width: 400px; border-radius: 20px; box-shadow: 0 0 5px rgba(0, 0, 0, .5);margin-top: 20px">
					<ul class="tools">
						<li><img src="images/twitter.png" title="分享到XX">分享到XX</li>
						<li><img src="images/twitter.png" title="分享到XX">分享到XX</li>
						<li><img src="images/twitter.png" title="分享到XX">分享到XX</li>
					</ul>
				</div>
				<ins class="adsbygoogle"
							style="display: inline-block; width: 970px; height: 90px"
							data-ad-client="ca-pub-6111334333458862"
							data-ad-slot="3820120620"></ins>
			</div>
		</c:forEach>
	</div>




		</body>

</html>