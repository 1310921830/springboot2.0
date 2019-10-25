<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
<link rel="stylesheet" type="text/css" href="style/easyui.css">
<link rel="stylesheet" type="text/css" href="style/icon.css">
<link rel="stylesheet" type="text/css" href="style/demo.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<style scoped="scoped">
		.md{
			height:16px;
			line-height:16px;
			background-position:2px center;
			text-align:right;
			font-weight:bold;
			padding:0 2px;
			color:red;
		}
		a{
			font-size: 24px;
		}
</style>
<script type="text/javascript">
var attences;
function formatDay(date){
	var y = date.getYear()+1900;
	var m = date.getMonth()+1;
	if(m<10){
		m = "0"+m;
	}
	var d = date.getDate();
	if(d<10){
		d = "0"+d;
	}
	var dd = y+"-"+m+"-"+d;

	for(i in attences){
		
		if(dd==attences[i]["date"]){
			return '<div class="icon-ok md">' + d + '</div>';
		}
	}
	return d;
}
$(function() {
	$.ajax({
		url:"getAttences",
		dataType:"json",
		
		type:"post",
		success:function(data){
	    	attences = data;
	    	
		 }
	}); 
})	
		
</script>
</head>
<body>
	<!-- 标题显示 -->
<DIV ID="Title_bar">
    <DIV ID="Title_bar_Head">
        <DIV ID="Title_Head"></DIV>
        <DIV ID="Title"><!--页面标题-->
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 签到页面
        </DIV>
        <DIV ID="Title_End"></DIV>
    </DIV>
</DIV>

<!--显示表单内容-->
<DIV ID=MainArea>
    <c:if test="${not empty attence}">
    	<a>今日已签</a>
    </c:if>
    <c:if test="${empty attence}">
    	<a href="addAttence?userId=${user.userId}">签到</a>
    </c:if>
    <div id="date">
		<div class="easyui-calendar" style="width:400px;height:400px;margin: 0 auto;"  data-options="formatter:formatDay"></div>
	</div>
</DIV>
<DIV ID="InputDetailBar">
	
	
</DIV>
<DIV CLASS="Description">
	
</DIV>
	
</body>
</html>