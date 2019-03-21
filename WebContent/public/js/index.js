//点击登录或注册 弹出登录或者注册框
//设置遮幕的高度为整个文档的高度

$(".black").height($(document).height());
$("#login,#register").click(function(e) {
	e.preventDefault();
	$(".black,.boxwrap").fadeToggle("fast");
	// 如果是注册那么切换form，并带有动画效果
	if ($(this).is("#register")) {
		$(".boxwrap").addClass("boxwrap-register");
		$(".form-login").fadeOut("fast");
		$(".form-register").delay(500).fadeIn();
	} else {
		$(".form-register").hide();
		$(".form-login").delay(500).fadeIn();
		$(".boxwrap").removeClass("boxwrap-register");

	}
});
// 监听登录按钮点击事件
$(".btn-login").click(function(e) {
	e.preventDefault();
	$(this).siblings(".btn-black").fadeIn("fast");
	$(this).siblings(".btn-black").find(".loading").fadeIn("fast");
	ajaxlogin();
});
// 监听注册按钮点击事件
$(".btn-register").click(function(e) {
	e.preventDefault();
	$(".btn-black,.loading").fadeIn("fast");
	ajaxregister();
});
// 关闭弹出框
$(".close").click(function(e) {
	e.preventDefault();
	close();
});
// 关闭弹出框方法
function close() {
	$(".black,.boxwrap,.btn-black,.loading").fadeOut("fast");
	
}

// 当点击搜索时，设置 a 超链接地址
$(".gosearch").click(function(e){
	e.preventDefault();
	window.location.href="search.jsp?search="+$(".search").val();	
});
// ajax 实现登录和注册
// 用户登录
function ajaxlogin() {
	var username = $(".form-login input[name='username']").val();
	var password = $(".form-login input[name='password']").val();
	var check = $(".form-login input[name='check']").val();
	var type = $(".form-login input[name='type']").val();
	var page = $(".form-register input[name='page']").val();
	var url = "/lanmao/userservlet";
	var data = {
		username : username,
		password : password,
		check:check,
		type : type,
		page:page,
		ajax : true
	};
	$.ajax({
		type : 'POST',
		url : url,
		data : data,
		success : doresponse,
		dataType : 'json'
	});

}
// 注册
function ajaxregister() {
	var username = $(".form-register input[name='username']").val();
	var password = $(".form-register input[name='password']").val();
	var sex = $(".form-register input[name='sex']").val();
	var email = $(".form-register input[name='email']").val();
	var phone = $(".form-register input[name='phone']").val();
	var check = $(".form-register input[name='check']").val();
	var type = $(".form-register input[name='type']").val();
	var page = $(".form-register input[name='page']").val();
	var url = "/lanmao/userservlet";
	var data = {
		username : username,
		password : password,
		email : email,
		sex : sex,
		phone : phone,
		check:check,
		type:type,
		page:page,
		
		ajax : true
	};
	$.ajax({
		type : 'POST',
		url : url,
		data : data,
		success : doresponse,
		dataType : 'json'
	});
}

// 序列化json数据，方便客户端进行调用
function arrayJson(json) {
	var arrs = {};//存储数据的对象
	json = json.replace("{", "").replace("}", "").split(",");
	console.log(json);
	for (var i = 0; i < json.length; i++) {
		var temp = json[i];
		var key = temp.split(":")[0].replace(/\"/g, "").replace(/\\/g,"");
		var value = temp.split(":")[1].replace(/\"/g, "").replace(/\\/g,"");
		arrs[key] = value;
	}
	return arrs;
}
// 处理返回过来的数据
function doresponse(data, status) {
	var response = JSON.stringify(data).replace("[", "").replace("]", "");
	var arrs = arrayJson(response);
	if (arrs.username != null) {
		console.log("登录或注册成功");
		$(".user").html(
				"<a href='javascript;' class='userinfo'>我的懒猫</a>"
						+ "欢迎你&nbsp;<a href='#'>" + arrs.username + "</a>"
						+ "&nbsp;<a href='loginout'>退出</a>");
		close();
		$("input").removeClass("error");
	} else if (arrs.error != null) {
		//重新设置验证码
		$(".checkimg").click();
		if (arrs.error == "login") {
			console.log("登录失败");
			if(arrs.info!=null){
				$(".login-msg").text(arrs.info);	
			}else{
				$(".login-msg").text("用户或密码输入错误");	
			}
			
			$(".form-login input").addClass("error");
		} else {
			console.log("注册失败");
			if(arrs.info!=null){
				$(".register-msg").text(arrs.info);	
			}else{
				$(".register-msg").text("请输入合法数据");
			}
			$(".form-register input[type!='radio']").addClass("error");
		}

	}
	$(".btn-black").fadeOut("fast");

}

//检测用户名是否注册
$(".form-register input[name='phone']").blur(function(){
	isregister();
});
function isregister(){
	$.ajax({
		url:"userservlet",
		data:{isregister:true,phone:$(".form-register input[name='phone']").val()},
		dataType:"json",
		success:doregister
	});
}

//处理isregister返回的数据
function doregister(data){
	console.log(data);
	if(data[0].error){
		$(".form-register input[name='phone']").css("border","1px solid red");
		$(".register-msg").text(data[0].error);
	}else if(data[0].success){
		$(".register-msg").text("");
		$(".form-register input[name='phone']").css("border","1px solid #1296db");
	}
}
