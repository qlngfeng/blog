<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>登录</title>
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

<style>
body {
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
	width: 100%;
	height: 280px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

.u_logo {
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: relative;
	top: 11px;
	left: 6px;
}

.p_logo {
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}

a {
	text-decoration: none;
}

.tou {
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}

.left_hand {
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}

.right_hand {
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}

.initial_left_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}

.initial_right_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}

.left_handing {
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}

.right_handinging {
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}
</style>
<script type="text/javascript">
	$(function() {
		//得到焦点
		$("#password").focus(function() {
			$("#left_hand").animate({
				left : "150",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 140) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-64",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -70) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#password").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:100px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-112px;top:-12px");
		});
	});
</script>

</head>
<body style="background-color: #262b2e;">
	<div style="position: absolute; z-index: -2;">
		<canvas id="canvas" width="1950px" height="800px" style="z-index: -1;"></canvas>
		<canvas id="canvasbg" width="1950px" height="800px"
			style="z-index: -1;"></canvas>
	</div>
	<ul class="layui-nav">
		<li class="layui-nav-item"><a href="index.action">首页</a></li>
		<li class="layui-nav-item" style="float: right"><a
			href="./login.jsp">登录</a></li>
		<li class="layui-nav-item" style="float: right"><a
			href="./regsite.jsp">注册</a></li>
	</ul>
	<div class="top_div"></div>
	<div
		style="width: 400px; height: 210px; margin: auto auto; background: #FAF0E6; text-align: center; margin-top: -100px; border: 1px solid #e7e7e7;border-radius:10px;" >
		<div style="width: 165px; height: 96px; position: absolute">
			<div class="tou"></div>
			<div id="left_hand" class="initial_left_hand"></div>
			<div id="right_hand" class="initial_right_hand"></div>
		</div>

		<p style="padding: 30px 0px 10px 0px; position: relative;">
		</p>
		<form action="login.action" method="post">
		<P>
		<span class="u_logo"></span>
			<input class="ipt" type="text" placeholder="请输入用户名或邮箱"
				name="username" style="margin-left: -23px;">
			</p>
			<p style="position: relative;">
				<span class="p_logo"></span> <input id="password" class="ipt"
					type="password" placeholder="请输入密码" name="password"> <br />
				<font color="red">${requestScope.message }</font>
			</p>

			<div
				style="height: 50px; line-height: 50px; margin-top: 30px; border-top: 1px solid #e7e7e7;">
				<p style="margin: 0px 35px 20px 45px;">
					<span style="float: left"><input name="rememberme"
						type="checkbox" id="rememberme" value="1" /> 记住密码</span><span
						style="float: right"> <a href="./regsite.jsp"
						style="color: #F08080; margin-right: 10px;">注册</a> <input
						type="submit"
						style="background: #008ead; padding: 7px 10px; border-radius: 4px; border: 1px solid #1a7598; color: #FFF; font-weight: bold;"
						value="Login">
					</span>
				</p>
			</div>
		</form>
	</div>

	<div
		style="position: fixed; bottom: 0px; text-align: center; width: 100%;">
		Copyright ©2015 <a
			style="margin-left: 10px; color: #000000; text-decoration: underline"
			href="http://www.sevennight.cn">http://www.sevennight.cn</a>
	</div>
</body>

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