<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>主页</title>
<head>
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
<!--
body {
	font-family: Tahoma;
	font-size: 8pt
}

.leftmenu {
	width: 150px;
}

.leftmenu li {
	display: inline;
	white-space: nowrap;
}

.leftmenu span, .leftmenu a:active, .leftmenu a:visited, .leftmenu a:link
	{
	display: block;
	text-decoration: none;
	margin: 6px 10px 6px 0px;
	padding: 2px 6px 2px 6px;
	color: #F08080;
	background-color: #d9e8f3;
	border: 1px solid #004266;
	border-radius: 30px;
}

.leftmenu a:hover {
	color: red;
	background-color: #8cbbda;
}

.leftmenu span {
	color: #a13100;
}
-->
</style>

<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="background-color: #262b2e;">
	<div style="position: absolute; z-index: -2;">
		<canvas id="canvas" width="1950px" height="800px" style="z-index: -1;"></canvas>
		<canvas id="canvasbg" width="1950px" height="800px"
			style="z-index: -1;"></canvas>
	</div>
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
	<div class="indexMain">
		<div class="indexMain_left">
			<div class="indexMain_left_con">
				<c:forEach var="blog" items="${bloglist }" varStatus="st">
					<div class="indexCon_msg">
						<div class="indexCon_msg_pic">
							<img src="./images/logo.jpg">
						</div>
						<div class="indexCon_msg_detail">
							<a href="blog.action?blog_id=${blog.blog_id }" value="${blog.blog_id }">
								<div class="indexCon_msg_detail_tittle">
									<span>${blog.blogtype}</span>
									<p>${blog.blogtitle }</p>
								</div>
							</a>
							<div class="havePic">
								<a href=""><div class="havePic_head">
										<p>${blog.summary }</p>
									</div></a>
							</div>
							<div class="indexCon_msg_detail_other">
								<ul>
									<li>${blog.username }</li>
								</ul>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			</div>
			<div class="indexFooter">
				<div class="indexFooter_con">
					<a href="?start=0">首 页</a> <a
						href="?start=${page.start-page.count}">上一页</a> <a
						href="?start=${page.start+page.count}">下一页</a> <a
						href="?start=${page.last}">末 页</a>
				</div>
			</div>
		</div>
		<div class="indexMain_right">
			<div class="indexMain_rightCon">
				<div class="pwfb">
					<div class="pwfbHead">最多点击</div>
					<div class="pwfbCon">
						<ul class="myweek">
							<c:forEach var="hotblog" items="${hotlist }">
								<li><a href="blog.action?blog_id=${hotblog.blog_id }" value="${hotblog.blog_id }">${hotblog.blogtitle }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="pwfbFooter"></div>
				</div>
				<div class="indexPublic">
					<div class="indexPublic_head">本周最新(按日期排序)</div>
					<div class="indexPublic_con">
						<ul class="weekHot">
							<c:forEach var="newblog" items="${newlist }">
								<li><a href="blog.action?blog_id=${newblog.blog_id }" value="${newblog.blog_id }">${newblog.blogtitle }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="indexPublic">
					<div class="indexPublic_head">友情链接</div>
					<div class="indexPublic_con">
						<ul class="leftmenu">
							<li><a target="_blank" href="http://www.microsoft.com/china">www.Microsoft.com</a>
							<li><a target="_blank" href="https://www.jianshu.com">www.jianshu.com</a>
							<li><a target="_blank" href="https://www.zhihu.com/">www.zhihu.com</a>
							<li><a target="_blank" href="http://www.csdn.net/">www.Baidu.Com</a>
							<li><a target="_blank" href="http://www.csdn.net/">www.Github.Com</a>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>

	<ins class="adsbygoogle"
		style="display: inline-block; width: 970px; height: 90px"
		data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>


</body>
<script>
        // min and max radius, radius threshold and percentage of filled circles
        var radMin = 5,
            radMax = 125,
            filledCircle = 60, //percentage of filled circles
            concentricCircle = 30, //percentage of concentric circles
            radThreshold = 25; //IFF special, over this radius concentric, otherwise filled

        //min and max speed to move
        var speedMin = 0.3,
            speedMax = 2.5;

        //max reachable opacity for every circle and blur effect
        var maxOpacity = 0.6;

        //default palette choice
        var colors = ['52,168,83', '117,95,147', '199,108,23', '194,62,55', '0,172,212', '120,120,120'],
            bgColors = ['52,168,83', '117,95,147', '199,108,23', '194,62,55', '0,172,212', '120,120,120'],
            circleBorder = 10,
            backgroundLine = bgColors[0];
        var backgroundMlt = 0.85;

        //min distance for links
        var linkDist = Math.min(canvas.width, canvas.height) / 2.4,
            lineBorder = 2.5;

        //most importantly: number of overall circles and arrays containing them
        var maxCircles = 12,
            points = [],
            pointsBack = [];

        //populating the screen
        for (var i = 0; i < maxCircles * 2; i++) points.push(new Circle());
        for (var i = 0; i < maxCircles; i++) pointsBack.push(new Circle(true));

        //experimental vars
        var circleExp = 1,
            circleExpMax = 1.003,
            circleExpMin = 0.997,
            circleExpSp = 0.00004,
            circlePulse = false;

        //circle class
        function Circle(background) {
            //if background, it has different rules
            this.background = (background || false);
            this.x = randRange(-canvas.width / 2, canvas.width / 2);
            this.y = randRange(-canvas.height / 2, canvas.height / 2);
            this.radius = background ? hyperRange(radMin, radMax) * backgroundMlt : hyperRange(radMin, radMax);
            this.filled = this.radius < radThreshold ? (randint(0, 100) > filledCircle ? false : 'full') : (randint(0, 100) > concentricCircle ? false : 'concentric');
            this.color = background ? bgColors[randint(0, bgColors.length - 1)] : colors[randint(0, colors.length - 1)];
            this.borderColor = background ? bgColors[randint(0, bgColors.length - 1)] : colors[randint(0, colors.length - 1)];
            this.opacity = 0.05;
            this.speed = (background ? randRange(speedMin, speedMax) / backgroundMlt : randRange(speedMin, speedMax)); // * (radMin / this.radius);
            this.speedAngle = Math.random() * 2 * Math.PI;
            this.speedx = Math.cos(this.speedAngle) * this.speed;
            this.speedy = Math.sin(this.speedAngle) * this.speed;
            var spacex = Math.abs((this.x - (this.speedx < 0 ? -1 : 1) * (canvas.width / 2 + this.radius)) / this.speedx),
                spacey = Math.abs((this.y - (this.speedy < 0 ? -1 : 1) * (canvas.height / 2 + this.radius)) / this.speedy);
            this.ttl = Math.min(spacex, spacey);
        };

        Circle.prototype.init = function() {
            Circle.call(this, this.background);
        }

        //support functions
        //generate random int a<=x<=b
        function randint(a, b) {
            return Math.floor(Math.random() * (b - a + 1) + a);
        }
        //generate random float
        function randRange(a, b) {
            return Math.random() * (b - a) + a;
        }
        //generate random float more likely to be close to a
        function hyperRange(a, b) {
            return Math.random() * Math.random() * Math.random() * (b - a) + a;
        }

        //rendering function
        function drawCircle(ctx, circle) {
            //circle.radius *= circleExp;
            var radius = circle.background ? circle.radius *= circleExp : circle.radius /= circleExp;
            ctx.beginPath();
            ctx.arc(circle.x, circle.y, radius * circleExp, 0, 2 * Math.PI, false);
            ctx.lineWidth = Math.max(1, circleBorder * (radMin - circle.radius) / (radMin - radMax));
            ctx.strokeStyle = ['rgba(', circle.borderColor, ',', circle.opacity, ')'].join('');
            if (circle.filled == 'full') {
                ctx.fillStyle = ['rgba(', circle.borderColor, ',', circle.background ? circle.opacity * 0.8 : circle.opacity, ')'].join('');
                ctx.fill();
                ctx.lineWidth = 0;
                ctx.strokeStyle = ['rgba(', circle.borderColor, ',', 0, ')'].join('');
            }
            ctx.stroke();
            if (circle.filled == 'concentric') {
                ctx.beginPath();
                ctx.arc(circle.x, circle.y, radius / 2, 0, 2 * Math.PI, false);
                ctx.lineWidth = Math.max(1, circleBorder * (radMin - circle.radius) / (radMin - radMax));
                ctx.strokeStyle = ['rgba(', circle.color, ',', circle.opacity, ')'].join('');
                ctx.stroke();
            }
            circle.x += circle.speedx;
            circle.y += circle.speedy;
            if (circle.opacity < (circle.background ? maxOpacity : 1)) circle.opacity += 0.01;
            circle.ttl--;
        }

        //initializing function
        function init() {
            window.requestAnimationFrame(draw);
        }

        //rendering function
        function draw() {

            if (circlePulse) {
                if (circleExp < circleExpMin || circleExp > circleExpMax) circleExpSp *= -1;
                circleExp += circleExpSp;
            }
            var ctxfr = document.getElementById('canvas').getContext('2d');
            var ctxbg = document.getElementById('canvasbg').getContext('2d');

            ctxfr.globalCompositeOperation = 'destination-over';
            ctxfr.clearRect(0, 0, canvas.width, canvas.height); // clear canvas
            ctxbg.globalCompositeOperation = 'destination-over';
            ctxbg.clearRect(0, 0, canvas.width, canvas.height); // clear canvas

            ctxfr.save();
            ctxfr.translate(canvas.width / 2, canvas.height / 2);
            ctxbg.save();
            ctxbg.translate(canvas.width / 2, canvas.height / 2);

            //function to render each single circle, its connections and to manage its out of boundaries replacement
            function renderPoints(ctx, arr) {
                for (var i = 0; i < arr.length; i++) {
                    var circle = arr[i];
                    //checking if out of boundaries
                    if (circle.ttl < 0) {}
                    var xEscape = canvas.width / 2 + circle.radius,
                        yEscape = canvas.height / 2 + circle.radius;
                    if (circle.ttl < -20) arr[i].init(arr[i].background);
                    //if (Math.abs(circle.y) > yEscape || Math.abs(circle.x) > xEscape) arr[i].init(arr[i].background);
                    drawCircle(ctx, circle);
                }
                for (var i = 0; i < arr.length - 1; i++) {
                    for (var j = i + 1; j < arr.length; j++) {
                        var deltax = arr[i].x - arr[j].x;
                        var deltay = arr[i].y - arr[j].y;
                        var dist = Math.pow(Math.pow(deltax, 2) + Math.pow(deltay, 2), 0.5);
                        //if the circles are overlapping, no laser connecting them
                        if (dist <= arr[i].radius + arr[j].radius) continue;
                        //otherwise we connect them only if the dist is < linkDist
                        if (dist < linkDist) {
                            var xi = (arr[i].x < arr[j].x ? 1 : -1) * Math.abs(arr[i].radius * deltax / dist);
                            var yi = (arr[i].y < arr[j].y ? 1 : -1) * Math.abs(arr[i].radius * deltay / dist);
                            var xj = (arr[i].x < arr[j].x ? -1 : 1) * Math.abs(arr[j].radius * deltax / dist);
                            var yj = (arr[i].y < arr[j].y ? -1 : 1) * Math.abs(arr[j].radius * deltay / dist);
                            ctx.beginPath();
                            ctx.moveTo(arr[i].x + xi, arr[i].y + yi);
                            ctx.lineTo(arr[j].x + xj, arr[j].y + yj);
                            var samecolor = arr[i].color == arr[j].color;
                            ctx.strokeStyle = ["rgba(", arr[i].borderColor, ",", Math.min(arr[i].opacity, arr[j].opacity) * ((linkDist - dist) / linkDist), ")"].join("");
                            ctx.lineWidth = (arr[i].background ? lineBorder * backgroundMlt : lineBorder) * ((linkDist - dist) / linkDist); //*((linkDist-dist)/linkDist);
                            ctx.stroke();
                        }
                    }
                }
            }

            var startTime = Date.now();
            renderPoints(ctxfr, points);
            renderPoints(ctxbg, pointsBack);
            deltaT = Date.now() - startTime;

            ctxfr.restore();
            ctxbg.restore();

            window.requestAnimationFrame(draw);
        }

        init();

        /*Credits and aknowledgements:
        Original Idea and Design by Luca Luzzatti

        Optimizing tips from Benjamin K?stner
        General tips from Salvatore Previti*/
        </script>
</html>