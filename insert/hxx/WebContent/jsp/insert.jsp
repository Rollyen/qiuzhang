<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/book/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/book/bootstrap.min.css">
<style type="text/css">
h1{
background-color: blue;
text-align: center;
}
.form{
background-color: Azure;
text-align: center;
}
</style>	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			var name=$("#name").val();
			var pwd=$("#pwd").val();
			var pwd1=$("#pwd1").val();
			var email=$("#email").val();
			var phone=$("#phone").val();
			var check=$("#check");
			if(name==""||name==null){
				$("#name").focus();//获取
				alert("用户名不能为空");
				return false;
			}
			if(pwd==""||pwd==null){
				$("#pwd").focus();//获取
				alert("密码不能为空");
				return false;
			}
			if(pwd!=pwd1){
				$("#pwd1").focus();//获取
				alert("两次密码不一致");
				return false;
			}
			if(email==""||email==null){
				$("#email").focus();//获取
				alert("邮件地址不能为空");
				return false;
			}
			if(phone==""||phone==null){
				$("#phone").focus();//获取
				alert("电话不能为空");
				return false;
			}
			if(check.prop('checked')){//check返回true
			$.ajax({
				url:"insert.action",
				/* data:{
					name:$("#name").val(),
					pwd:$("#pwd").val(),
					sex:$("#sex").val(),
					age:$("#age").val(),
					phone:$("#phone").val()
				}, */
				data:$("#user_insert").serialize(),
				type:"post",
				dataype:"json",
				success:function(data){
					if(data=="success"){
						alert("注册成功");
						$(location).attr("href","insert.html");
					}else{
						alert("注册失败");
						$(location).attr("href","insert.html");
					}
				},
				error:function(){
					alert("服务器飞去火星了！！！");
					//$(location).attr("href","error.html")
				}
			});
		    }else{
		    	alert("请阅读用户协议");
		    	return false;
		    }
		});
	});
	//email格式判断
	$(document).ready(function(){
		$("#email").blur(function(){
			var email=$("#email").val();
			var regEmail = /^([A-Za-z0-9_\-\.\u4e00-\u9fa5])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/;
			if(!regEmail.test(email)){
	            $(".tip").html("email格式不正确");
	            $(".tip").css("color","#ff0705");
	        }else {
	            $(".tip").html("email格式正确");
	            $(".tip").css("color","#4cae4c");
	        }
		});
	});
	//手机号码正格式判断
	$(document).ready(function(){
		$("#phone").blur(function(){
			var phone=$("#phone").val();
			if(!(/^1(3|4|5|6|7|8|9)\d{9}$/.test(phone))){
		        $(".phe").html("手机号码有误，请重填");
	            $(".phe").css("color","#ff0705");
		    }else{
		    	$(".phe").html("手机号码格式正确");
	            $(".phe").css("color","#4cae4c");
		    }
		});
	});
	</script>
</head>
<body>
<div class="form">
<form id="user_insert" class="btn btn-default" id="bbb">
<h1>注册账号</h1>
	<input type="text" id="name" name="name" placeholder="用户名" class="btn btn-default"><br/>
	<div></div><br/>
	<input type="text" id="email" name="email" placeholder="email" class="btn btn-default"><br/>
	<span class="tip"></span><br/>
	<input type="text" id="pwd" name="pwd" placeholder="密码" class="btn btn-default"><br/>
	<div></div><br/>
	<input type="text" id="pwd1" name="pwd1" placeholder="确认密码" class="btn btn-default"><br/>
	<div></div><br/>
	性别：<input id="man" type="radio" checked="checked" name="sex" value="m" class="btn btn-default"/>男
	<input id="woman" type="radio" name="sex" value="f" class="btn btn-default"/>女<br/>
	<div></div><br/>
	<input type="text" id="phone" name="phone" placeholder="手机号码" class="btn btn-default"><br/>
	<span class="phe"></span><br/>
	<input type="checkbox" id="check" name="check">我已经看过并接受<a href="index.html">《用户协议》</a><br/>
	<div></div><br/>
	<input type="button" name="btn1" id="btn1" value="立即注册" class="btn btn-default">
	</form>
	</div>
</body>
</html>