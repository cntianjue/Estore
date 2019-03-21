<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("ctx", request.getContextPath());
%>
<c:if test="${requestScope.typelist ==null}">
	<jsp:forward page="indexservlet" />
</c:if>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>懒猫 - 越购越开心</title>
<!-- css -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/DSlider.css">
<link rel="stylesheet" href="css/index.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" type="image/x-icon" />
<style>
li.DSlider-item img {
	height: 100%;
}
div{
maigin:0;
padding:0;
}
.fix-search{
background-position: 0px 10px;
top:3px;
}
</style>
</head>
<body>
	<!-- 遮幕-->
	<div class="black"></div>
	<!-- 登录  注册 框-->
	<div class="boxwrap">
		<div class="box">
			<!--登录-->
			<form action="userservlet" method="post" class="form-login">
				<div class="form-item">
					<input type="text" class="input-text" placeholder="请输入手机号或邮箱"
						name="username" required="required"/>
				</div>
				<div class="form-item">
					<input type="password" class="input-text" placeholder="请输入密码"
						name="password" required="required"/>
				</div>
				<div class="form-item">
					<input type="text" class="input-text" name="check"
						placeholder="4位验证码" style="width: 100px" required /> <img
						src="${pageContext.request.contextPath}/authImage" alt="验证码无法显示"
						title="看不清？点击刷新" class="checkimg" onclick="changeImg(this);" />
				</div>
				<span class="msg login-msg"></span>
				<div class="form-item login">
					<div class="btn-black">
					<div class="loading"></div>
					</div>
					<input type="hidden" name="type" value="login" />
					<button type="submit" class="btn btn-login">登录</button>
				</div>
			</form>

			<!--注册-->
			<form action="userservlet" method="post" class="form-register">
				<div class="form-item">
					<input type="text" class="input-text" maxlength="16"
						placeholder="请输入6-16位用户名" required name="username" />
				</div>
				<div class="form-item">
					<input type="password" class="input-text" maxlength="16"
						placeholder="请输入6-16位密码" required name="password" />
				</div>

				<div class="form-item">
					<input type="number" class="input-text" required maxlength="11"
						placeholder="请输入手机号（11位）" name="phone" />
				</div>
				<div class="form-item">
					<input type="email" class="input-text" required
						placeholder="请输入有效邮箱" name="email" />
				</div>
				<div class="form-item ">
					<span class="span-radio">男</span><input type="radio" name="sex"
						value="M" class="input-radio" checked /> <span class="span-radio">女</span><input
						type="radio" name="sex" value="F" class="input-radio" />
				</div>
				<div class="form-item">
					<input type="text" class="input-text" name="check"
						placeholder="4位验证码" style="width: 100px" required /> <img
						src="${pageContext.request.contextPath}/authImage" alt="验证码无法显示"
						title="看不清？点击刷新" class="checkimg" onclick="changeImg(this);" />
				</div>
				<span class="msg register-msg"></span>
				<div class="form-item register">
					<div class="btn-black">
					<div class="loading"></div>
					</div>
					<input type="hidden" name="type" value="register" />
					<button type="submit" class="btn btn-register">注册</button>
				</div>
			</form>


			<!--  关闭 按钮  -->
			<a href="" class="close"></a>
		</div>
	</div>

	<!--头部-->
	<header>
		<div class="header-nav">
			<div class="logo-s" >
				<!--<img src="imgs/logo-s.png" alt="" title="懒猫国际">-->
				<a href="index.jsp"><img alt="" src="imgs/head.png"><span>&nbsp; 懒猫首页</span></a>
			</div>
			<div class="user">
				<!-- jstl -->
				<c:choose>
					<c:when test="${sessionScope.name!=null }">
						<a href="userinfo.jsp" class="userinfo">我的懒猫</a>
        	欢迎你&nbsp;<a href="userinfo.jsp">${sessionScope.name}</a>
        	&nbsp;<a href="loginout">退出</a>
					</c:when>
					<c:otherwise>
            请&nbsp;<a href="" id="login">登录</a>
            或者&nbsp;<a href="" id="register">注册</a>
					</c:otherwise>
				</c:choose>
				<span>在线人数: ${sessionScope.count}</span>
			</div>
		</div>
		<div class="head-content">
			<div class="logo">
				<img src="imgs/logos.png" alt="" title="懒猫国际" />
			</div>
			<div class="search-show">
				<input type="text" name="search" class="search" placeholder="分类/商品">
				<a href="" class="gosearch"></a>
			</div>
			<a class="shopcar" href="shopcar.jsp">我的购物车 &nbsp;&gt;</a>
		</div>
		<!-- 固定搜索框-->
		<div class="box-slide" style="display: none;">
			<div class="logo-slide">
				<a href="" class="logo-href"><img src="imgs/logo-slide.png"
					alt="" title="懒猫国际"></a>
			</div>
			<div class="search-slide search-show">
				<input type="text" name="search" class="search" placeholder="分类/商品">
				<a href="" class="gosearch fix-search"></a>
			</div>
		</div>
	</header>
	<!--main-content-->
	<div class="main">
		<!--           主要内容                      -->
		<!-- 分类列表 -->
		<div class="show-content">
			<ul class="type-list">
				<c:forEach items="${requestScope.typelist}" var="big" begin="0"
					end="10">
					<li class="type-item icon-${big['typename']}">
						<div class="item-content">
							<a href="search.jsp?search=${big['typename']}"
								class="item-head ">${big['typename']}</a> &nbsp;&nbsp;/
							<c:forEach items="${big['detail']}" var="detail" begin="0">
                  				&nbsp;<a href="search.jsp?search=${detail}">${detail}</a>
							</c:forEach>
						</div>
					</li>
				</c:forEach>

			</ul>
			<!-- 轮播图 -->
			<ul class="Slider ">
				<li class="DSlider-item" data-title="11111"><a href="#women"><img
					src="imgs/1.jpg" alt="11111" /></a></li>
				<li class="DSlider-item" data-title="22222"><a href="#man"><img
					src="imgs/2.jpg" alt="22222" /></a></li>
				<li class="DSlider-item" data-title="33333"><a href ="#type1"><img
					src="imgs/3.jpg" alt="33333" /></a></li>
				<li class="DSlider-item" data-title="44444"><a href ="#type2"><img
					src="imgs/4.jpg" alt="44444" /></a></li>
				<li class="DSlider-item" data-title="55555"><a href ="#type3"><img
					src="imgs/5.jpg" alt="55555" /></a></li>
			</ul>
		</div>
		<!-- 模块分化-->
		<div class="module " id="women">
			<div class="m-left">
				<img src="imgs/f-1.png" title="缤纷五一" />
			</div>
			<div class="m-right">
				<ul class="m-list">
					<c:forEach items="${requestScope.womenlist}" var="women" end="7">
						<li class="m-item"><span class="good-m">￥ ${women.goodprice}</span>
							<a href="good.jsp?goodid=${women.goodid}"><img
								src="${ women.goodimage}" title="${women.goodname}" /></a>
							<div class="item-slide">
								<a href="good.jsp?goodid=${women.goodid}"><span
									class="good-t">${women.goodname }</span> </a>
							</div></li>
					</c:forEach>
					
				</ul>
			</div>
		</div>

		<!-- slide module-->
		<div class="module" id="type1">
			<div class="m-s-left">
				<ul class="Slider-m">
					<li class="DSlider-item" data-title="11111"><a href="search.jsp?search=数码"><img
						src="imgs/1.jpg" alt="11111" /></a></li>
					<li class="DSlider-item" data-title="22222"><a href="search.jsp?search=手机"><img
						src="imgs/2.jpg" alt="22222" /></a></li>
					<li class="DSlider-item" data-title="33333"><a href="search.jsp?search=家电"><img
						src="imgs/3.jpg" alt="33333" /></a></li>
					<li class="DSlider-item" data-title="44444"><a href="search.jsp?search=家具"><img
						src="imgs/4.jpg" alt="44444" /></a></li>
					<li class="DSlider-item" data-title="55555"><a href="search.jsp?search=护肤"><img
						src="imgs/5.jpg" alt="55555" /></a></li>
				</ul>
			</div>
			<div class="m-s-right">
				<div class="m-s-item">
					<a href="search.jsp?search=家电"><img src="imgs/type-4.png" /></a>
				</div>
				<div class="m-s-item">
					<a href="search.jsp?search=护肤"><img src="imgs/type-3.png" /></a>
				</div>
			</div>
		</div>
		<!---->
		<div class="module" id="man">
			<div class="m-left">
				<img src="imgs/m-1.jpg" title="缤纷五一" />
			</div>
			<div class="m-right">
				<ul class="m-list">
					<c:forEach items="${requestScope.manlist}" var="man" end="7">
						<li class="m-item"><span class="good-m">￥ ${man.goodprice}</span>
							<a href="good.jsp?goodid=${man.goodid}"><img
								src="${ man.goodimage}" title="${man.goodname}" /></a>
							<div class="item-slide">

								<a href="good.jsp?goodid=${man.goodid}"><span class="good-t">${man.goodname }</span>
								</a>
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!---->

		<div class="module" id="type2">
			<div class="m-left">
				<img src="imgs/p-1.jpg" title="缤纷五一" />
			</div>
			<div class="m-right">
				<ul class="m-list">
					<c:forEach items="${requestScope.phonelist}" var="phone" end="7">
						<li class="m-item"><span class="good-m">￥
								${phone.goodprice}</span> <a href="good.jsp?goodid=${phone.goodid}"><img
								src="${ phone.goodimage}" title="${phone.goodname}" /></a>
							<div class="item-slide">
								<a href="good.jsp?goodid=${phone.goodid}"><span
									class="good-t">${phone.goodname }</span> </a>
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!---->
		<div class="module" id="type3">
			<div class="m-s-left">
				<ul class="Slider-m">
					<li class="DSlider-item" data-title="11111"><a href="search.jsp?search=电脑"><img
						src="imgs/1.jpg" alt="11111" /></a></li>
					<li class="DSlider-item" data-title="22222"><a href="search.jsp?search=书籍"><img
						src="imgs/2.jpg" alt="22222" /></a></li>
					<li class="DSlider-item" data-title="33333"><a href="search.jsp?search=清洁"><img
						src="imgs/3.jpg" alt="33333" /></a></li>
					<li class="DSlider-item" data-title="44444"><a href="search.jsp?search=婴儿"><img
						src="imgs/4.jpg" alt="44444" /></a></li>
					<li class="DSlider-item" data-title="55555"><a href="search.jsp?search=水果"><img
						src="imgs/5.jpg" alt="55555" /></li>
				</ul>
			</div>
			<div class="m-s-right">
				<div class="m-s-item">
					<a href="search.jsp?search=男装"><img src="imgs/type-1.png" /></a>
				</div>
				<div class="m-s-item">
					<a href="search.jsp?search=童装 "><img src="imgs/type-2.png" /></a>
				</div>
			</div>
		</div>

	</div>
	<!-- 尾部 -->
	<footer> 懒猫集团&copy; 2017 版权所有 </footer>
	<script src="js/jquery.1.9.1.js"></script>
	<script src="js/jQuerySlider.js"></script>
	<script src="js/index.js"></script>
	<script>
		$(".Slider").Slider({
			mode : 'fade',
			isFlexible : true,
			isShowPage : true,
			isShowTitle : false,
			isShowControls : false
		});
		/*模块 轮播图*/
		$(".Slider-m").each(function() {
			var type = (Math.floor((Math.random() * 2))) ? "move" : "fade";
			$(this).Slider({
				mode : type,
				isFlexible : true,
				isShowTitle : false,
				isShowPage : false
			});
		});
		/* 商品淡入淡出*/
		/* $(".m-item").hover(function() {
			$(this).find(".item-slide").stop(true, false).fadeToggle();
		}); */
		//点击验证码重新获取新的验证码
		function changeImg(elem) {
			elem.src = "${ctx}/authImage?date=" + new Date();
		}
	
		//控制 固定搜索框的淡入淡出
		$(document).on("scroll", function() {
			var $offset = $(this).scrollTop();
			if ($offset > 100) {
				$(".box-slide").slideDown("fast");
			} else if ($offset < 100) {
				$(".box-slide").slideUp("fast");
			}
	
		});
		
		
	</script>

</body>
</html>
