<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<script src="js/jquery-3.1.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
<style type="text/css">	
	table{
		
		border: 0.5px solid #2a8ed1;
		padding: 20px;
		margin-bottom: 20px;
		margin-top: 20px;
		
	}
	tr{
		height: 20px;
	}
	#bot{
		height: 500px;
		position: relative;
		top:50px;
	}
</style>
<script type="text/javascript">
	$(function() {
		 $("#upload").click(function() {
				
				$.ajax({
				    url: 'upload',
				    type: 'POST',
				    cache: false,
				    data: new FormData($('#uploadForm')[0]),
				    processData: false,
				    contentType: false,
				    success:function(data){
				    	$("#userImg").attr("src","/upload/"+data.filename);
				    	$.ajax({
				    		url:"changeImg",
				    		type:"post",
				    		data:{
				    			"url":"/upload/"+data.filename
				    		},
				    		success:function(data){
				    			$('#uploadForm')[0].reset();
				    		}
				    	});
				    }

				});
			});
		 //修改密码
		 $("#a1").click(function() {
			var oldPwd = $("#i1").val();
			var newPwd = $("#i2").val();
			var newPwd1 = $("#i3").val();
			if(oldPwd.length==0){
				$("#info").html("旧密码不能为空");
			}else if(newPwd.length==0){
				$("#info").html("新密码不能为空");
			}else if(newPwd1.length==0){
				$("#info").html("新密码不能为空");
			}else if(newPwd!=newPwd1){
				$("#info").html("再次输入的密码必须和新密码一致");
			}else{
				$.ajax({
					url:"updatePwd",
					type:"post",
					data:{
						"oldPwd":oldPwd,
						"newPwd":newPwd
					},
					success:function(data){
		    			if(data==0){
		    				$("#info").html("旧密码输入错误");
		    				$("#form")[0].reset();
		    			}else{
		    				$("#info").html("密码修改成功");
		    				$("#form")[0].reset();
		    			}
		    		}
				});
			}
			
		});
	})
   
    </script>
</head>
<body>
	<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="style/images/title_arrow.gif"/> 个人管理
        </div>
        <div id="Title_End"></div>
    </div>
	</div>

<div id="MainArea">

    <table cellspacing="0" cellpadding="0" align="center">
       		<tr align="left">
				<td width="200px">用户ID(登录名)</td>
				<td width="200px">
					<c:out value="${user.userId}"></c:out>
				</td>
				<td rowspan="9" width="300px">
					<img width="200" height="200" src="${user.headPortrait}" title="个人头像" id="userImg">
				</td>
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>岗位</td>
				<td>
					<c:out value="${user.position}"></c:out>
				</td>
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>姓名</td>
				<td>
				<c:out value="${user.name}"></c:out></td>
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>姓名</td>
				<td>
				<c:out value="${user.gender}"></c:out></td>
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>年龄</td>
				<td><c:out value="${user.age}"></c:out></td>
				
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>电话</td>
				<td><c:out value="${user.tel}"></c:out></td>
				
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>邮箱</td>
				<td><c:out value="${user.email}"></c:out></td>
				
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>证件号码</td>
				<td><c:out value="${user.idCard}"></c:out></td>
				
			</tr>
			<tr class="TableDetail1 template" align="left">
				<td>所在部门</td>
				<td><c:out value="${dept.deptName}"></c:out></td>
				
			</tr>
			
    </table>
    
    <!-- 跳转到创建项目页面 -->
    <div id="TableTail">
        <div id="TableTail_inside">
        	<form id="uploadForm" enctype="multipart/form-data">
        	<span>头像上传</span>
        	<input type="file" name="file">
            <a><img src="style/images/uploadFile.gif" id="upload"/></a>
            </form>
        </div>
    </div>
    
</div>
<div id="bot">
<div class="ItemBlockBorder">
            <div class="ItemBlock">
                <form id="form">
                <table cellpadding="0" cellspacing="0" class="mainForm">
					<tr height="50">
						<td width="150">
							<img border="0" width="4" height="7" src="style/blue/images/item_point.gif" />
							请输入原密码
						</td>
						<td><input type="password" name="oldPassword" class="InputStyle" id="i1"/> *</td>
					</tr>
					<tr height="25">
						<td width="150">
							<img border="0" width="4" height="7" src="style/blue/images/item_point.gif" />
							请填写新密码
						</td>
						<td><input type="password" name="password" class="InputStyle" id="i2"/> *</td>
						
					</tr>
					<tr height="25">
						<td width="150">
							<img border="0" width="4" height="7" src="style/blue/images/item_point.gif" />
							再次输入新密码
						</td>
						<td><input type="password" name="password2" class="InputStyle" id="i3"/></td>
						
					</tr>
					<tr height="25">
						<td width=150 colspan="2" style="color: red;text-align: center;" id="info"></td>
					</tr>
                </table>
                </form>
            </div>
        </div>
       
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <a id="a1"><img src="style/images/save.png"/></a>
        </div>
<div class="Description">
	<img alt="" src="style/images/help.gif"><br>
	验证规则：<br>
	1，旧密码不能为空。<br />
	2，新密码不能为空。<br />
	3，再次输入的密码要和新密码一致。<br />
</div>
</div>
</body>
</html>