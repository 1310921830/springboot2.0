<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>财务支出列表</title>
 	<script src="js/jquery-3.1.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
	<link rel="stylesheet" type="text/css" href="style/easyui.css">
	<link rel="stylesheet" type="text/css" href="style/icon.css">
	<link rel="stylesheet" type="text/css" href="style/demo.css">
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		
		})
    </script>
    <style type="text/css">
    	.remark{
    		display: none;
    	}
    	.search:hover + .remark{
			display:table-row;
		}
    	
    </style>
</head>
<body>
	<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="style/images/title_arrow.gif"/> 财务支出列表
        </div>
        <div id="Title_End"></div>
    </div>
	</div>

<div id="MainArea">
<table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
           <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td colspan="5"><b style="font-size: 24px;">统计信息</b></td>
            	
            
        	
            </tr>
          <tr align="CENTER" valign="MIDDLE" id="TableTitle">
				<td width="20%">项目总花费</td>
				<td width="20%" >
					￥<c:out value="${sum.sum }"></c:out>
				</td>
				<td width="20%"></td>
				<td width="20%">
				<a href="getSumCostByWeek?projectId=${project.id }">按周统计</a>
				</td>
				<td width="20%">
				<a href="getSumCostByMonth?projectId=${project.id }">按月统计</a></td>
				
			</tr>
            
            
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="roleList">
			
			<tr class="TableDetail1 template search" align="CENTER">
				<td colspan="5"></td>
				
				
			</tr>
			
			
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td colspan="5"><b style="font-size: 24px;">详细列表</b></td>
            	
            
        	
            </tr>
            
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td width="20%">支出日期</td>
            	<td width="20%">支出类型</td>
            	<td width="20%">金额</td>
            	<td width="20%">业务项目</td>
            	<td width="20%">经手人</td>
            	
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="roleList">
			<c:forEach items="${costs}" var="cost">
			<tr class="TableDetail1 template search" align="CENTER">
				<td>${cost.date}</td>
				<td>${cost.type}</td>
				<td>￥${cost.money}</td>
				<td>${project.projectName}</td>
				<td>${cost.owner }</td>
				
			</tr>
			<tr class="TableDetail1 template remark" align="left">
				<td><span style="color: red">备注信息</span></td>
				<td colspan="4">
					
					<textarea cols="26" rows="2"><c:out value="${cost.remark}"></c:out> 
					</textarea>
				</td>
			</tr>
			</c:forEach>
        </tbody>
    </table>
    
    <!-- 跳转到创建项目页面 -->
    <div id="TableTail">
        
        
    </div>
</div>

	
</body>
</html>