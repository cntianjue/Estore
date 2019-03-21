<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Course Registration Form Flat Responsive Widget Template :: w3layouts</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Course Registration Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script  type="text/javascript" src="public/js/jquery.1.9.1.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<!-- //js -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<!-- //web-fonts --> 
</head>
<body>
	<!-- banner --> 
<div class="video"> 
	<div class="center-container">
	    <div class="w3ls-agileinfo">
			<h1> Course Registration Form </h1>	
		</div>
		 <div class="bg-agile">
			<h2>Training Course </h2>
			<div class="login-form">	
			
					<input type="text"    id ="zaccount" placeholder="用户名" required="ï¼" />
					<input type="text"     id="zpass"   placeholder="密码"  required="" />
					<input type="text"    id="rpass"    placeholder="确认密码："  required="" />
					

					<div class="left-w3-agile">
					
						<input type="text"    id ="lpic" placeholder="请输入验证码"   required="" />
					</div>
					<div class="right-agileits">
						<img src="PictureServlet" onclick="getPicture()"  id="pic">
					</div>
			
					<input type="submit" value="注册"  onclick="register()">
				
			</div>	
		</div>
	<!-- //banner --> 
	 <!--copyright-->
		<div class="copy w3ls">
		    <p>&copy; 2018 Course Registration Form . All Rights Reserved  | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
	    </div>
	<!--//copyright-->
	</div>	
</div>
<script  type="text/javascript">
$(function(){
	$('#loginModal'),modal('hide');
})
function getPicture(){
	$("#pic").attr("src","PictureServlet?a="+Math.random());
}
function register(){
	
	$.ajax({
		url:"Register",
		type:"post",
		data:{
			oper:"Register",
			account:$("#zaccount").val(),
			pass:$("#zpass").val(),
			rpass:$("#rpass").val(),
			picture:$("#lpic").val()
		},
		dataType : "json",
		success : function(data) {
			var reg = new RegExp('"', "g");
			var msg = data = data.replace(reg, "");
			$("#msg").html(msg);
			if (msg == "注册成功") {

				window.location.href = "computerServlet?method=getComputers";
			} else {
				alert(data);
			}
		}
	})
}

</script>	
</body>
</html>