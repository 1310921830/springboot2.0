<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="style/blue/top.css" />
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#out").click(function() {
			top.location.href="loginout";
		})
	})
</script>
</head>
<body class="PageBody" style="margin: 0">
 
	<div id="Head1">
		<div id="Logo">
			<a id="msgLink" href="javascript:void(0)"></a>
            <font color="#0000CC" style="color:#F1F9FE; font-size:30px; font-family:Arial Black, Arial">源涂项目管理系统</font> 
			
        </div>
		
		<div id="Head1Right">
			<div id="Head1Right_UserName">
                <img border="0" width="13" height="14" src="style/images/top/user.gif" /> 
                <b>欢迎&nbsp;<c:out value="${user.name}"></c:out>&nbsp;登录</b>&nbsp;&nbsp;
			</div>
			<div id="Head1Right_UserDept"></div>
			
			<div id="Head1Right_Time"></div>
		</div>
		
        
		
       
	</div>
    
    <div id="Head2">
        <div id="Head2_Awoke">
            <ul id="AwokeNum">
                <li><a target="right" href="userInfo?deptNo=${user.deptNo}">
						<img border="0" width="11" height="13" src="style/images/top/user_setup.gif" /> 
						<span id="msg">用户设置</span>
					</a>
				</li>
                <li class="Line"></li>
                <li><a>
						<img border="0" width="16" height="11" src="style/images/top/user.gif" /> 
						<span id="out">退出</span>
					</a>
				</li>
                
            </ul>
        </div>
        
		<div id="Head2_FunctionList">
			<marquee style="WIDTH: 100%;" onMouseOver="this.stop()" onMouseOut="this.start()" 
				scrollamount=1 scrolldelay=40 direction=left>
				<b>欢迎使用Yunatu项目管理系统</b>
			</marquee>
		</div>
	</div>

</body>
</html>