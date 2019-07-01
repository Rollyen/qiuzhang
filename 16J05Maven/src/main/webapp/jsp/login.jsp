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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/book/bootstrap.min.css">
	
	<style>
        div {
            /*垂直居中 */
            vertical-align: middle;
            /*水平居中*/
            text-align: center;
        }
        body{
 background:url("./static/images/sj.jpg") no-repeat;
 background-size: 100%;
 margin: 350px;
}
    </style>
 
<script type="text/javascript">
	$(function() {
		$("#name").blur(function() {
			if (!$("#name").val()) {
				$("#nameMsg").html("<font color='red'>姓名不能为空</font>");
				$("#name").focus();
			} else {
				$("#nameMsg").html("");
			}
		});
	});
	$(function() {
		$("#pwd").blur(function() {
			if (!$("#pwd").val()) {
				$("#pwdMsg").html("<font color='red'>密码不能为空</font>");
				$("#pwd").focus();
			} else {
				$("#pwdMsg").html("");
			}
		});
	});
	$(function() {
		$("#btn1").click(function() {
			if (!$("#name").val()) {
				alert("用户名不能为空");
				$("#name").focus();
			} else if (!$("#pwd").val()) {
				alert("密码不能为空");
				$("#pwd").focus();
			} else {
				$("#btn1").val("登陆中...");
				$.ajax({
					url : "login.action",
					type : "post",
					data : {
						"name" : $("#name").val(),
						"pwd" : $("#pwd").val()
					},
					datatype : "json",
					success : function(data) {
						if (data == "success") {
							alert("登录成功");
							$(location).attr('href', 'index.html');
						} else {
							alert("登录失败");
							$(location).attr('href', 'login.html');
						}
					},
					error : function() {
						alert("错误");
					}
				});
			}
		});
	});
	$(function(){
		$("#btn2").click(function(){
			$(location).attr('href', 'insert.html');
		});
	});
</script>
</head>
<body>
    <div class="col-lg-10">
	  <input  type="text" name="name" id="name" placeholder="姓名"><span id="nameMsg"></span>
	</div>
	<div class="col-lg-10"></div>
	<div class="col-lg-10">
	  <input type="text" name="pwd" id="pwd" placeholder="密码"><span id="pwdMsg"></span>
	</div>
	<div class="col-lg-10"></div>
	<div class="col-lg-10">
	  <input class="btn btn-default" type="button" value="登录" id="btn1">
	  <button class="btn btn-default" type="button" id="btn2">注册</button>
	</div>
</body>
</html>