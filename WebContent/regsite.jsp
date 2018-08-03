<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*,java.awt.*,java.io.*,java.awt.image.*,javax.imageio.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/layui.css"  media="all">
        <script src="layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<style>
body {
  background: #202124;
}

@-webkit-keyframes circle {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  80% {
    -webkit-transform: translateY(-100vh);
            transform: translateY(-100vh);
    opacity: 1;
  }
  100% {
    opacity: 0;
    -webkit-transform: translateY(-100vh);
            transform: translateY(-100vh);
  }
}

@keyframes circle {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  80% {
    -webkit-transform: translateY(-100vh);
            transform: translateY(-100vh);
    opacity: 1;
  }
  100% {
    opacity: 0;
    -webkit-transform: translateY(-100vh);
            transform: translateY(-100vh);
  }
}
@-webkit-keyframes shadow {
  0% {
    -webkit-transform: scaleY(0);
            transform: scaleY(0);
  }
  30% {
    -webkit-transform: scaleY(1);
            transform: scaleY(1);
  }
  100% {
    -webkit-transform: scaleY(0.5);
            transform: scaleY(0.5);
  }
}
@keyframes shadow {
  0% {
    -webkit-transform: scaleY(0);
            transform: scaleY(0);
  }
  30% {
    -webkit-transform: scaleY(1);
            transform: scaleY(1);
  }
  100% {
    -webkit-transform: scaleY(0.5);
            transform: scaleY(0.5);
  }
}
.shape {
  position: absolute;
  width: 66px;
  height: 66px;
  -webkit-animation: circle 5s linear infinite;
          animation: circle 5s linear infinite;
  -webkit-animation-fill-mode: both;
          animation-fill-mode: both;
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
}
.shape::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  height: 360px;
  -webkit-transform-origin: top center;
          transform-origin: top center;
  -webkit-animation: inherit;
          animation: inherit;
  -webkit-animation-name: shadow;
          animation-name: shadow;
}

.circle {
  top: calc(100vh - 66px);
  left: calc(25vw - 66px);
  background: linear-gradient(45deg, #49E7C2 0%, #7AEC90 100%);
  border-radius: 100%;
}
.circle::after {
  background: linear-gradient(-180deg, rgba(73, 231, 194, 0.4) 0%, rgba(28, 28, 28, 0) 100%);
}

.rectangle {
  top: calc(100vh - 66px);
  left: calc(50vw - 66px);
  background: linear-gradient(45deg, #EA9F45 0%, #F4EE51 100%);
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
}
.rectangle::after {
  background: linear-gradient(-180deg, rgba(234, 159, 69, 0.3) 0%, rgba(28, 28, 28, 0) 100%);
  top: 100%;
}

.triangle {
  top: calc(100vh - 66px);
  left: calc(75vw - 66px);
  background: linear-gradient(45deg, #22A0F9 0%, #71FDC8 100%);
  -webkit-clip-path: polygon(0 0, 100% 100%, 100% 0);
          clip-path: polygon(0 0, 100% 100%, 100% 0);
  -webkit-animation-delay: 1s;
          animation-delay: 1s;
}
.triangle::after {
  background: linear-gradient(-180deg, rgba(34, 223, 249, 0.4) 0%, rgba(28, 28, 28, 0) 100%);
  top: 0;
  will-change: transform;
}
</style>


  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="shape circle"></div>
<div class="shape rectangle"></div>
<div class="shape triangle"></div>

<ul class="layui-nav" >
  <li class="layui-nav-item">
    <a href="index.action">首页</a>
  </li>
   <li class="layui-nav-item"style="float: right">
       <a href="./login.jsp">登录</a>
   </li>
     <li class="layui-nav-item"style="float: right">
       <a href="./regsite.jsp">注册</a>
   </li>
</ul>
<div style="margin: 70px auto;width: 500px;" >
<form id='myf' class="layui-form" action="regsite.action" method="post">
   <div class="layui-form-item">
    <label class="layui-form-label">用户名：</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="username" placeholder="请输入" autocomplete="off" class="layui-input" onchange="validateReName(this.value);">
   </div>
    <div class="layui-form-mid layui-word-aux"><label id="message"></label>
    </div>
  </div>
 
   <div class="layui-form-item">
    <label class="layui-form-label">密码：</label>
    <div class="layui-input-inline">
      <input type="password" id="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="on" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">再次输入：</label>
    <div class="layui-input-inline">
      <input type="password" name="r_password" lay-verify="pass" placeholder="请输入密码" autocomplete="on" class="layui-input" onchange="validatepassword(this.value)">
    </div>
    <div class="layui-form-mid layui-word-aux"><label id="passwordmessage"></label></div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">手机：</label>
      <div class="layui-input-inline">
        <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
 <div class="layui-form-item">
      <label class="layui-form-label">邮箱：</label>
      <div class="layui-input-inline">
        <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">密保问题：</label>
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
    <label class="layui-form-label">问题答案：</label>
    <div class="layui-input-inline">
      <input type="text" name="questionresult" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
     <div class="layui-form-item">
      <label class="layui-form-label">出生日期：</label>
      <div class="layui-input-inline">
        <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
      </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别：</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男" checked="">
      <input type="radio" name="sex" value="女" title="女">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">验证码：</label>
    <div class="layui-input-inline">
      <input type="text" name="vCodeCheck(this.value)" id=vCodeCheck(this.value)" placeholder="请输入" autocomplete="off" class="layui-input" onchange="vCodeCheck(this.value)">
   </div>
    <div class="layui-form-mid layui-word-aux">
    <img src="checkCode.action" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
	<label id="vCodeMessage"></label>
    </div>
  </div>
    <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick='upFrom()'>立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary" >重置</button>
    </div>
  </div>
</form>



<ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
</div>

</body>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  //自定义验证规则
  form.verify({
	  username: function(value, item){ //value：表单的值、item：表单的DOM对象
	    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
	      return '用户名不能有特殊字符';
	    }
	    if(/(^\_)|(\__)|(\_+$)/.test(value)){
	      return '用户名首尾不能出现下划线\'_\'';
	    }
	    if(/^\d+\d+\d$/.test(value)){
	      return '用户名不能全为数字';
	    }
	  }
	  
	  //我们既支持上述函数式的方式，也支持下述数组的形式
	  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
	  ,pass: [
	    /^[\S]{6,12}$/
	    ,'密码必须6到12位，且不能出现空格'
	  ] 
	}); 
});

function upFrom(){
	document.getElementById('myf').action('regsite.action')
	document.getElementById('myf').submit()
}
function validateReName(username) {
    var ajax =new XMLHttpRequest() || new ActiveXObject('Microsoft.XMLHTTP');
    ajax.open("post","test.action",true)
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8")
    ajax.send("username="+username);
    ajax.onreadystatechange=function(){
        if(ajax.readyState==4&&ajax.status==200){
            var flag=ajax.responseText;
            var message=document.getElementById("message")
            if(flag == 'true'){
                message.innerHTML="用戶名可以使用"
            }
            if(flag=='false'){
            	message.innerHTML="用戶名不可以使用"
            }
        }
    }
}
function validatepassword(r_password){
	var pw =document.getElementById("password").value;
	var pw1 =document.getElementById("passwordmessage");
	if(r_password==pw){
		pw1.innerHTML="兩次密碼一致"
		r_password=true
	}else{
		pw1.innerHTML="兩次密碼不一致"
		r_password=true
	}
}
function vCodeCheck(vCode){
	  var ajax = new XMLHttpRequest() || new ActiveXObject('Mircosoft.XMLHTTP');
		 
	  ajax.open("post","vCodeCheck.action",true);
	  ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  ajax.send("vCode="+vCode);
	  
	  
	  ajax.onreadystatechange = function(){
		  if(ajax.readyState==4 && ajax.status==200){
			  
			  var isok = ajax.responseText;
			  var vCodeMsg = document.getElementById('vCodeMessage');
			  if(isok == "true"){
				  vCodeMsg.innerHTML = "验证码正确";
			  	  
			  }else{
				  vCodeMsg.innerHTML = "验证码不正确";
			  }	  
			  
		  }
	  }
}
</script>
</html>