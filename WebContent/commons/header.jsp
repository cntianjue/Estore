<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="public/js/jquery.1.9.1.js"></script>


<nav class="navbar navbar-default navbar-static-top">
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="computerServlet?method=getComputers"><span
			class="glyphicon glyphicon-blackboard"></span> 呱呱网</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse" aria-expanded="false"
		style="height: 1px;">
		<ul class="nav navbar-nav">
			<li class="active"><a href="computerServlet?method=getComputers">首页</a></li>
			<li><a href="#">关于</a></li>
			<li><a href="#">联系我们</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<%-- <li role="presentation" ><a href="computerServlet?method=forwardPage&page=cart&pageNo=${computerpage.pageNo }"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;购物车&nbsp;<span class="badge">${sessionScope.ShoppingCart.computerNumber }</span></a></li> --%>
			<s:if test="${empty sessionScope.account }">
				<div onclick="login()">登录</div>
				<div onclick="register()">注册</div>
			</s:if>
			<s:if test="${!empty sessionScope.account }">
				<div>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-user"
							aria-hidden="true"></span>&nbsp;
							<td>${sessionScope.account}</td> <span class="caret"></span></a>
						<ul class="dropdown-menu">

							
							<input type="submit" value="余额查询" class="btn btn-primary"
								id="js-btn-login" onclick="balance()" />
							<li onclick="update()" class="btn btn-primary" id="js-btn-login">修改密码</li>
							<form action="exit" method="post">
								<input type="hidden" name="oper" value="exit"> <input
									type="submit" value="注销" class="btn btn-primary"
									id="js-btn-login" />
							</form>

						</ul>
				</div>
				<div>
					<td>当前在线人数: ${applicationScope.count}</td>
				</div>
				<div onclick="shopping()">购物车</div>
			</s:if>
			<script type="text/javascript">
				function login() {
					window.location.href = "login.html";
				}
				function register() {
					window.location.href = "register.jsp";
				}
				function update() {
					window.location.href = "update.html";
				}
				function shopping() {
				 window.location.href = "computerServlet?method=forwardPage&page=cart&pageNo=1&minPrice=&maxPrice=&oper=exit&oper=exit";
				}
				
				
				function balance() {
					$.ajax({
						url : "balance",
						type : "post",
						data : {
							oper : "balance",
						},
						dataType : "json",
						success : function(data) {
							alert(data);
						}

					});
				}
				
			</script>

		</ul>
	</div>
	<!--/.nav-collapse -->
</div>

</nav>