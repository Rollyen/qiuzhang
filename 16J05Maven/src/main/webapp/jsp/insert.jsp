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
	<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			var name=$("#name").val();
			var pwd=$("#pwd").val();
			var sex=$("#sex").val();
			var age=$("#age").val();
			var phone=$("#phone").val();
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
			if(sex==""||sex==null){
				$("#sex").focus();//获取
				alert("性别不能为空");
				return false;
			}
			if(age==""||age==null){
				$("#age").focus();//获取
				alert("年龄不能为空");
				return false;
			}
			if(phone==""||phone==null){
				$("#phone").focus();//获取
				alert("电话不能为空");
				return false;
			}
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
						$(location).attr("href","index.html");
					}else{
						alert("注册失败");
						$(location).attr("href","insert.html");
					}
				},
				error:function(){
					alert("服务器飞去火星了！！！");
					$(location).attr("href","error.html")
				}
			});
		});
	});
	 $(document).ready(function(){
		$("#name").blur(function(){
			$.ajax({
				url:"findUserByName.action",
				type:"post",
				data:{name:$("#name").val()},
				dataype:"json",
				success:function(data){
					if(data=="success"){
						$("#message").html("<font color='red'>已经存在</font>");
					}else{
						$("#message").html("<font color='green'>不存在</font>");
					}
				},
				error:function(){
					alert("服务器飞去火星了！！！");
					$(location).attr("href","error.html")
				}
			});
		});
	}); 
	/* $(function(){
		$("#name").blur(function(){
			var url="findUserByName.action";
			var args={name:$("#name").val()}
			$.post(url,args,function(data){
				$("#message").html(data)
			});
		});
	}); */
	</script>
</head>
<body>
<form id="user_insert">
	<input type="text" id="name" name="name" placeholder="姓名"><div id="message"></div><br/>
	<input type="text" id="pwd" name="pwd" placeholder="密码"><br/>
	<input type="text" id="sex" name="sex" placeholder="性别"><br/>
	<input type="text" id="age" name="age" placeholder="年龄"><br/>
	<input type="text" id="phone" name="phone" placeholder="电话"><br/>
	<input type="button" name="btn1" id="btn1" value="注册">
	</form>
</body>
</html>