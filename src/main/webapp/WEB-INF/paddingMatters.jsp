<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待办事项列表</title>
 	<script language="javascript" src="js/jquery.js"></script>
    <link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
    <script type="text/javascript">
    </script>
</head>
<body>
	<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="style/images/title_arrow.gif"/> 待办事项
        </div>
        <div id="Title_End"></div>
    </div>
	</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td>日期时间</td>
            	<td>标题</td>
            	<td>类型</td>
            	<td>项目编号</td>
                <td>查看事项</td>
                <td>查看项目</td>
                
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="roleList">
			<c:forEach items="${paddingMatters}" var="pm">
			<tr class="TableDetail1 template" align="CENTER">
				<td>${pm.date}</td>
				<td>${pm.title}</td>
				<td>${pm.type}</td>
				<td>${pm.projectId}</td>
				<td>
					<c:if test="${'项目计划' eq pm.type}">
					<a href="getPlan?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'结题报告' eq pm.type}">
					<a href="getConcluding?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'风险报告' eq pm.type}">
					<a href="riskReportDetail?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'重大事项' eq pm.type}">
					<a href="matterDetail?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'日报' eq pm.type}">
					<a href="dailyReportDetail?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'周报' eq pm.type}">
					<a href="weekReportDetail?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
					<c:if test="${'奖惩/绩效' eq pm.type}">
					<a href="schemeDetail?id=${pm.linkId}&projectId=${pm.projectId}"><img src="style/images/point.gif"></a>
					</c:if>
				</td>
				<td><a href="projectDetail?id=${pm.projectId}"><img alt="" src="style/images/ar.gif"></a></td>
				
			</tr>
			</c:forEach>
        </tbody>
    </table>
    
    <!-- 跳转到创建项目页面 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            
        </div>
    </div>
</div>
	
	
</body>
</html>