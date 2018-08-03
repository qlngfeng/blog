<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的文章</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/layui.css" media="all">
<script src="layui.js" charset="utf-8"></script>
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>

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
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend style="font-size:30px">我的发布的文章</legend>
</fieldset>
	<div style="margin-bottom: 5px;">

<!-- 示例-970 -->
<ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px;" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

</div>
<div style="margin-left: 230px">
<table class="layui-table" lay-data="{width: 1100, height:332, url:'backContent.action', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'blog_id', width:90, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'username', width:100}">用户名</th>
      <th lay-data="{field:'blogtype', width:150}">类型</th>
      <th lay-data="{field:'blogtitle', width:200}">标题</th>
      <th lay-data="{field:'clickHit', width:80, sort: true}">点击数</th>
      <th lay-data="{field:'releaseDate', width:200, sort: true}">发布日期</th>
      <th lay-data="{fixed: 'right', width:230, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
  </thead>
</table>
</div>
<script src="./layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" onclick="">删除</a>
</script>
  </body>
<script>
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.blog_id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
    	  console.log(index);
    	  $.post("deblog.action",{"blog_id":data.blog_id},function(msg){
    		  console.log();
          })
          obj.del();
          layer.close(data.blog_id);
          layer.msg('删除成功！');
        
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
</html>