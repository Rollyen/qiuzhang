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
<style type="text/css">
.btnn{
text-align: center;
}
.find{
text-align: center;
}
</style>
<script type="text/javascript">
var pageNum=1;
var pageSize=4;
var pageMax;
var totalRecord;
var user = new Object();
function remind(){
	$("#pageTotal").text("共"+pageMax+"页/当前第"+pageNum+"页");
}
	function show(data){
		var tbody=$("#tbody");
		if(data.length>0){
	tbody.html("");
	for(var i=0;i<data.length;i++){
		tbody.append("<tr>"
						+"<td>"+data[i].id+"</td>"
						+"<td>"+data[i].name+"</td>"
						+"<td>"+data[i].pwd+"</td>"
						+"<td>"+data[i].sex+"</td>"
						+"<td>"+data[i].age+"</td>"
						+"<td>"+data[i].phone+"</td>"
						+"<td><button class='btn btn-link' data-toggle='modal' data-target='#myModal' value='"+data[i].id+"' onclick='findUserById(this)'>修改</button><button class='btn btn-link' value='"+data[i].id+"' data-target='#delcfmOverhaul' data-toggle='modal' onclick='deleteUserById(this)'>删除</button></td>"
						+"</tr>");
				}
			}else{
				tbody.html("");
				tbody.append("<tr>");
				tbody.append("<td>没有数据</td>");
				tbody.append("</tr>");
			}
			}
	/* 查询数据总页数 */ 
  	function totalNum(){
  		$.ajax({
			url:"totalNum.do",
			type:"post",
			datatype:"json",
			data:{
				"name":user.name,
	  			"sex":user.sex,
	  			"age":user.age,
	  			"phone":user.phone
			},
			success:function(data){
				pageMax=data;
				remind();
			},
			error:function(){
				alert("错误2");
			}
		});
  	}	
  	/* 查询条数 */
  	 function totalRecord1(){
  		$.ajax({
			url:"totalRecord.do",
			type:"post",
			datatype:"json",
			data:{
				"name":user.name,
	  			"sex":user.sex,
	  			"age":user.age,
	  			"phone":user.phone
			},
			success:function(data){
				totalRecord=data;
				remind();
			},
			error:function(){
				alert("错误12");
			}
		});
  	} 
		$(function(){
		$.ajax({
			url:"pageFindAll.do",
			data:{
				"pageNum":1,
				"pageSize":pageSize
			},
			type:"post",
			datatype:"json",
			success:function(data){
				show(data);
				totalNum();
				totalRecord1();
			},
			error:function(){
				alert("错误1");
			}
		});
  	});
	/* 首页 */
	function home() {
		pageNum = 1;
		$.ajax({
			url : "pageFindAll.do",
			data : {
				"pageNum" : 1,
				"pageSize" : pageSize,
				"name" : user.name,
				"sex" : user.sex,
				"age" : user.age,
				"phone" : user.phone
			},
			type : "post",
			datatype : "json",
			success : function(data) {
				show(data);
				remind();
			},
			error : function() {
				alert("错误6");
			}
		});
	}
	/* 多条件查询 */
	function manySelect() {
		user = {
			"name" : $("#findname").val(),
			"sex" : $("#findsex").val(),
			"age" : $("#findage").val(),
			"phone" : $("#findphone").val()
		};
		$.ajax({
			url : "pageFindAll.do",
			data : {
				"pageNum" : 1,
				"pageSize" : pageSize,
				"name" : user.name,
				"sex" : user.sex,
				"age" : user.age,
				"phone" : user.phone
			},
			datatype : "json",
			type : "post",
			success : function(data) {
				pageNum = 1;
				show(data);
				totalNum();
				totalRecord1();
			},
			error : function() {
				alert("错误11");
			}
		});
	}
	/* 尾页 */
	function last() {
		$.ajax({
			url : "pageFindAll.do",
			data : {
				"pageNum" : pageMax,
				"pageSize" : pageSize,
				"name" : user.name,
				"sex" : user.sex,
				"age" : user.age,
				"phone" : user.phone
			},
			type : "post",
			datatype : "json",
			success : function(data) {
				pageNum = pageMax;
				show(data);
				remind();
			},
			error : function() {
				alert("错误7");
			}
		});
	}
	/* 下一页 */
	function next() {
		if (pageNum + 1 <= pageMax) {
			$.ajax({
				url : "pageFindAll.do",
				data : {
					"pageNum" : ++pageNum,
					"pageSize" : pageSize,
					"name" : user.name,
					"sex" : user.sex,
					"age" : user.age,
					"phone" : user.phone
				},
				type : "post",
				datatype : "json",
				success : function(data) {
					show(data);
					remind();
				},
				error : function() {
					alert("错误8");
				}
			});
		} else
			alert("没了");
	}
	/* 上一页 */
	function previous() {
		if (pageNum - 1 > 0) {
			$.ajax({
				url : "pageFindAll.do",
				data : {
					"pageNum" : --pageNum,
					"pageSize" : pageSize,
					"name" : user.name,
					"sex" : user.sex,
					"age" : user.age,
					"phone" : user.phone
				},
				type : "post",
				datatype : "json",
				success : function(data) {
					show(data);
					remind();
				},
				error : function() {
					alert("错误9");
				}
			});
		} else
			alert("没了");
	}
	/* 跳至 */
	function jump() {
		if ($("#pageJump").val() != "") {
			if ($("#pageJump").val() <= pageMax) {
				$.ajax({
					url : "pageFindAll.do",
					data : {
						"pageNum" : $("#pageJump").val(),
						"pageSize" : pageSize,
						"name" : user.name,
						"sex" : user.sex,
						"age" : user.age,
						"phone" : user.phone
					},
					type : "post",
					datatype : "json",
					success : function(data) {
						pageNum = $("#pageJump").val();
						show(data);
						remind();
						$("#pageJump").val("");
					},
					error : function() {
						alert("错误10");
					}
				});
			} else {
				alert("没有")
			}
			;
		} else {
			alert("请输入页码");
		}
	}
	/* $(function(){
		var tbody=$("#tbody");
		$.ajax({
			url:"index.action",
			type:"post",
			datatype:"json",
			success:function(data){
				if(data.length>0){
					tbody.html("");
				for(var i=0;i<data.length;i++){
					tbody.append("<tr>"
								+"<td>"+data[i].id+"</td>"
								+"<td>"+data[i].name+"</td>"
								+"<td>"+data[i].pwd+"</td>"
								+"<td>"+data[i].sex+"</td>"
								+"<td>"+data[i].age+"</td>"
								+"<td>"+data[i].phone+"</td>"
								+"<td><button class='btn btn-link' data-toggle='modal' data-target='#myModal' value='"+data[i].id+"' onclick='findUserById(this)'>修改</button><button class='btn btn-link' value='"+data[i].id+"' data-target='#delcfmOverhaul' data-toggle='modal' onclick='deleteUserById(this)'>删除</button></td>"
								+"</tr>");
				  }
				}else{
					tbody.append("<tr>");
					tbody.append("<td>没有数据</td>");
					tbody.append("</tr>");
				}
			},
			error:function(){
				alert("错误");
			}
		});
	}); */
	/* function deleteUserById(id){
		$.ajax({
			url:"delete.action",
			data:{"id":$(id).val()},
			datatype:"json",
			type:"post",
			success:function(data){
				if(data){
					// if(confirm("您是否要删除？")){
						hidedata(id);
					} //
				}else{
					alert("删除失败");
				}
			}
		});
	}  */
	function hidedata(data) {
		$(data).parent().parent().remove();//移除，hide()隐藏
	}
	function deleteUserById(id) {
		$("#btn_id").click(function() {
			$.ajax({
				url : "delete.action",
				data : {
					"id" : $(id).val()
				},
				datatype : "json",
				type : "post",
				success : function(data) {
					if (data) {
						/* if(confirm("您是否要删除？")){
							hidedata(id);
						} */
						hidedata(id);
					} else {
						alert("删除失败");
					}
				}
			});
		});
	}
	function findUserById(id) {
		$.ajax({
			url : "findUserById.action",
			data : {
				"id" : $(id).val()
			},
			datatype : "json",
			type : "post",
			success : function(data) {
				$("#id").val(data.id);
				$("#name").val(data.name);
				$("#pwd").val(data.pwd);
				$("#sex").val(data.sex);
				$("#age").val(data.age);
				$("#phone").val(data.phone);
			},
			error : function() {
				alert("操作错误");
			}
		});
	}
	function updateUserById() {
		$.ajax({
			url : "updateUserById.action",
			data : {
				"id" : $("#id").val(),
				"name" : $("#name").val(),
				"pwd" : $("#pwd").val(),
				"sex" : $("#sex").val(),
				"age" : $("#age").val(),
				"phone" : $("#phone").val(),
			},
			datatype : "json",
			type : "post",
			success : function(data) {
				if (data == "success") {
					alert("修改成功");
					$(location).attr("href", "index.html");
				} else {
					alert("修改失败");
					$(location).attr("href", "index.html");
				}
			},
			error : function() {
				alert("操作错误");
			}
		});
	}
	/* $(function(){
		$("#btn_find").click(function(){
		var tbody=$("#tbody");
			$.ajax({
				//url:"findUserByProperty.do",
				url:"pageFindAll.do",
				data:{
					"name":$("#findname").val(),
					"sex":$("#findsex").val(),
					"age":$("#findage").val(),
					"phone":$("#findphone").val(),
					"pageNum":1,
					"pageSize":pageSize
				},
				datatype:"json",
				type:"post",
				success:function(data){
						show(data);
						remind();
						$("#username").val("");
						$("#usersex").val("");
						$("#userage").val("");
						$("#userphone").val("");
				}
			});
		});
	}); */

	/* $(function(){
	 $("#btn_find").click(function(){
		 var tbody=$("#tbody");
		 $.ajax({
			 url:"findUserByProperty.action",
			 data:{
				 "name":$("#findname").val(),
				 "sex":$("#findsex").val(),
				 "age":$("#findage").val(),
				 "phone":$("#findphone").val(),
			 },
			 datatype:"json",
			 type:"post",
			 success:function(data){
				 if(data.length>0){
						tbody.html("");
					for(var i=0;i<data.length;i++){
						tbody.append("<tr>"
									+"<td>"+data[i].id+"</td>"
									+"<td>"+data[i].name+"</td>"
									+"<td>"+data[i].pwd+"</td>"
									+"<td>"+data[i].sex+"</td>"
									+"<td>"+data[i].age+"</td>"
									+"<td>"+data[i].phone+"</td>"
									+"<td><button class='btn btn-link' data-toggle='modal' data-target='#myModal' value='"+data[i].id+"' onclick='findUserById(this)'>修改</button><button class='btn btn-link' value='"+data[i].id+"' data-target='#delcfmOverhaul' data-toggle='modal' onclick='deleteUserById(this)'>删除</button></td>"
									+"</tr>");
					  }
					}else{
						tbody.append("<tr>");
						tbody.append("<td>没有数据</td>");
						tbody.append("</tr>");
					}
			 },
			 error:function(){
					alert("操作错误");
				}
		 });
	 });
	}); */
	function btn_login(){
	 if(confirm("您是否要退出？")){
		 $(location).attr("href", "login.html");
	}
}
</script>
</head>
<body>
<!-- 多条件查询 -->
<div class="find">
	姓名:<input type="text" id="findname"> 
	性别:<input type="text" id="findsex">
	年龄:<input type="text" id="findage"> 
	电话:<input type="text" id="findphone">
	<button id="btn_find" onclick="manySelect()" class="btn btn-default">查询</button>
	</div>
<!-- 显示后台数据 -->
	<table class="table table-striped">
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>密码</th>
				<th>性别</th>
				<th>年龄</th>
				<th>电话</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	 <div class="btnn">
		<button class="btn btn-default" onclick="home()">首页</button>
		<button class="btn btn-default" onclick="previous()">上一页</button>
		<button class="btn btn-default" onclick="next()">下一页</button>
		<button class="btn btn-default" onclick="last()">尾页</button>
		<button class="btn btn-default" onclick="jump()">跳至</button>
		<input type="text" name="pageJump" id="pageJump" style="width: 60px;display: inline-block;" class="form-control">页
		<span id="pageTotal"></span>
        <button class="btn btn-default" onclick="btn_login()">返回</button>	
	</div>
	<!-- 模态框   信息修改确认 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改数据</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group" align="center" id="update-div">
							学号：<input type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="id" name="id"><br> 姓名：<input
								type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="name" name="name"><br> 密码：<input
								type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="pwd" name="pwd"><br> 性别：<input
								type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="sex" name="sex"><br> 年龄：<input
								type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="age" name="age"><br> 电话：<input
								type="text" style="width: 50%; display: inline-block;"
								class="form-control" id="phone" name="phone"><br>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="updateUserById()">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 模态框   信息删除确认 -->
	<div class="modal fade" id="delcfmOverhaul">
		<div class="modal-dialog">
			<div class="modal-content message_align">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<!-- 隐藏需要删除的id -->
					<input type="hidden" id="deleteHaulId" />
					<p>您确认要删除该条信息吗？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="btn_id"
						data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>