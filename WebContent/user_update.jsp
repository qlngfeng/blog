<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>修改资料</title>
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
		<legend>修改信息</legend>
	</fieldset>
	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title" style="text-align: center">
			<li class="layui-this">修改密码</li>
			<li>个人资料</li>
			<li>上传头像</li>
		</ul>
		<div class="layui-tab-content" style="height: 600px;"
			style="text-align: center;">
			<div class="layui-tab-item layui-show">
				<form class="layui-form layui-form-pane" action="update.action"
					style="margin-left: 360px; margin-top: 30px;" method="POST">
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">用户名：</label>
						<div class="layui-input-inline">
							<input type="text" name="username" lay-verify="required"
								placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">初始密码:</label>
						<div class="layui-input-inline">
							<input type="password" name="password" lay-verify="pass"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">新的密码:</label>
						<div class="layui-input-inline">
							<input type="password" name="n_password" lay-verify="pass"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label" style="color: black;">密保问题：</label>
							<div class="layui-input-inline">
								<select name="question">
									<option value="">请选择问题</option>
									<option value="你工作的第一个城市">你工作的第一个城市</option>
									<option value="你的工号">你的工号</option>
									<option value="你最喜欢的老师">你最喜欢的老师</option>
									<option value="您最熟悉的童年好友名字是？">您最熟悉的童年好友名字是？</option>
									<option value="您最熟悉的学校宿舍舍友名字是？">您最熟悉的学校宿舍舍友名字是？</option>
									<option value="对您影响最大的人名字是？">对您影响最大的人名字是？</option>
									<option value="您目前的姓名是？">您目前的姓名是？</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="color: black;">问题答案：</label>
							<div class="layui-input-inline">
								<input type="text" name="questionresult" lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<font style="color: red;">${requestScope.message }</font>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div class="layui-tab-item">

				<form class="layui-form layui-form-pane"
					action="updateusername.action"
					style="margin-left: 360px; margin-top: 30px;" method="POST">
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">用户名：</label>
						<div class="layui-input-inline">
							<input type="text" name="username" lay-verify="required"
								placeholder="请输入" autocomplete="off" class="layui-input"
								onchange="validateReName(this.value);">
						</div>
						<div class="layui-form-mid layui-word-aux">
							<label id="message"></label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">邮箱:</label>
						<div class="layui-input-inline">
							<input type="text" name="email" lay-verify="email"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">验证日期</label>
						<div class="layui-input-inline">
							<input type="text" name="date" id="date" lay-verify="date"
								placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="color: black;">单选框</label>
						<div class="layui-input-block">
							<input type="radio" name="sex" value="男" title="男" checked="">
							<input type="radio" name="sex" value="女" title="女">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-tab-item">
			<div style="text-align: center">
				<form action="sendimg.action" method="post"
					enctype="multipart/form-data">
					<div>
					<p>当前头像<p>
					<img src="${image }" style="width: 300px;height: 300px">
					<div>
					<label style="margin-top: 30px">上传头像：</label><input type="file" name="file"><br>
					<input type="submit" style="margin-top: 30px">
				</form>
			</div>
			<div>
		</div>
</body>
<script>
	layui
			.use(
					[ 'form', 'layedit', 'laydate' ],
					function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
						//日期
						laydate.render({
							elem : '#date'
						});
						laydate.render({
							elem : '#date1'
						});
						//自定义验证规则
						form.verify({
							pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
							content : function(value) {
								layedit.sync(editIndex);
							}
						});
						//监听提交
						form.on('submit(demo1)', function(data) {
							layer.alert(JSON.stringify(data.field), {
								title : '最终的提交信息'
							})
							return false;
						});
					});
	function validateReName(username) {
		var ajax = new XMLHttpRequest()
				|| new ActiveXObject('Microsoft.XMLHTTP');
		ajax.open("post", "test.action", true)
		ajax.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded; charset=utf-8")
		ajax.send("username=" + username);
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
				var flag = ajax.responseText;
				var message = document.getElementById("message")
				if (flag == 'true') {
					message.innerHTML = "用戶名可以使用"
				}
				if (flag == 'false') {
					message.innerHTML = "用戶名不可以使用"
				}
			}
		}
	}
</script>
</html>