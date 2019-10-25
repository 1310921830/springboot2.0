<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="style/blue/menu.css" />
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#a1").click(function() {
			top.location.href="http://www.njyuantu.xyz";
		});
		$("#a2").click(function() {
			top.location.href="http://www.learncoder.com/#/home" ;
		})
	})
</script>
</head>
<body style="margin: 0;height: 516px;" >
<div id="Menu">
    <ul id="MenuUl">
    	<c:if test="${'企业领导' eq user.position}">
    	<li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC241000.gif" class="Icon" />
            	<a href="saveProject" target="right">立项</a>
            </div>
        </li> 
        <li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20024.gif" class="Icon" />
            	<a href="getAllProjects" target="right">项目管理</a>
            </div>
        </li>    
        <li class="level1">
            <div class="level1Style"><img src="style/images/top/wait.gif" class="Icon" />
            	<a href="paddingMatters?userId=${user.userId}" target="right">待办事项(<c:out value="${count.num}"></c:out>)</a>
            </div>
    	</li>
    	
    	</c:if>
    	<c:if test="${'部门经理' eq user.position}">
    	 <li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20024.gif" class="Icon" />
            	<a href="getDeptProjects?deptMgId=${user.userId}" target="right">项目管理</a>
            </div>
        </li>    
        <li class="level1">
            <div class="level1Style"><img src="style/images/top/wait.gif" class="Icon" />
            	<a href="paddingMatters?userId=${user.userId}" target="right">待办事项(<c:out value="${count.num}"></c:out>)</a>
            </div>
    	</li>
    	
    	</c:if>
    	<c:if test="${'项目经理' eq user.position}">
    	 <li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20024.gif" class="Icon" />
            	<a href="getProjects?pjMgId=${user.userId}" target="right">项目管理</a>
            </div>
        </li>    
        <li class="level1">
            <div class="level1Style"><img src="style/images/top/wait.gif" class="Icon" />
            	<a href="paddingMatters?userId=${user.userId}" target="right">待办事项(<c:out value="${count.num}"></c:out>)</a>
            </div>
    	</li>
    	
    	</c:if>
    	<c:if test="${'普通员工' eq user.position}">
    	<li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20024.gif" class="Icon" />
            	<a href="getSomeProjects?userId=${user.userId}" target="right">项目管理</a>
            </div>
        </li>    
        <li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20001.gif" class="Icon" />
            	<a href="showAttence" target="right">考勤登记</a>
            </div>
    	</li>
    	
    	</c:if>
    	<c:if test="${'管理员' eq user.position}">
    	<li class="level1">
            <div class="level1Style">
            <img src="style/images/MenuIcon/FUNC20001.gif" class="Icon" />
            	<a target="right">公司人员</a>
            </div>
        </li>    
        <li class="level1">
            <div class="level1Style">
            
            <img src="style/images/MenuIcon/in.gif" class="Icon" />
           		<a> 员工入职</a>
            </div>
    	</li>
    	<li class="level1">
            <div class="level1Style">
             
            <img src="style/images/MenuIcon/out.gif" class="Icon" />
				<a>离职办理</a>
            </div>
    	</li>
    	<li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/icq.gif" class="Icon" />
            	<a>项目工时费</a>
            </div>
    	</li>
    	</c:if>
    	<li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20077.gif" class="Icon" />
            	<a target="right" href="userInfo?deptNo=${user.deptNo}">个人设置</a>
            </div>
        </li>
        <li class="level1">
            <div class="level1Style"><img src="style/images/ie.gif" class="Icon" />
            	<a id="a1">公司网站</a>
            </div>
        </li>
        <li class="level1">
            <div class="level1Style"><img src="style/images/MenuIcon/FUNC20056.gif" class="Icon" />
            	<a id="a2">学习网站</a>
            </div>
        </li>
    </ul>
</div>
</body>
</html>