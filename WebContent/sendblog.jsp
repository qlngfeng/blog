<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发布文章</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/layui.css" media="all">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/index.css" />
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
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script type="text/javascript" charset="utf-8"
	src="./Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./Ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./Ueditor/lang/zh-cn/zh-cn.js"></script>
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
	<div style="margin-top: 30px">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend style="font-size: 30px;">发布博文</legend>
		</fieldset>
		<form action="" method="Post">
			<div class="layui-form-item" style="margin-left: 350px;">
				<label class="layui-form-label"
					style="color: darkgrey; font-size: 15px; font-family: 微软雅黑;" >文章标题:</label>
				<div class="layui-input-inline">
					<input type="text" name="blogtitle" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input" id="blogtitle">
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 350px;">
				<label class="layui-form-label"
					style="color: darkgrey; font-size: 15px; font-family: 微软雅黑;">文章类型:</label>
				<div class="layui-input-inline">
					<input type="text" name="blogtype" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input" id="blogtype">
				</div>
			</div>
			<div id="editor" style="height: 360px;width:900px;margin-left: 350px;" name="content">
				<script type="text/javascript" charset="utf-8">
					UE.getEditor('editor');
				</script>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block"
					style="margin-top: 30px; margin-left: 600px;">
					<button class="layui-btn" lay-filter="demo1" id="submit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary"
						style="margin-left: 50px;">重置</button>
				</div>
			</div>
		</form>
		<div>
</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
	var ue = UE.getEditor('editor');
</script>
<script>
	$("#submit").click(function() {
		submitData()
	})
	function submitData() {
		var summary = UE.getEditor('editor').getContentTxt().substr(0, 100);
		var blogtitle= document.getElementById("blogtitle").value;
		var blogtype=document.getElementById("blogtype").value;
		var content = UE.getEditor('editor').getContent();
		$.post("sendblog.action", {
			'summary' : summary,
			'blogtitle':blogtitle,
			'blogtype':blogtype,
			'content':content
		})
		alert("发布成功")
	}
</script>
</html>