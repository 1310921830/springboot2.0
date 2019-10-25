<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
<script src="js/jquery-3.1.1.min.js"></script>

</head>
<body>
	<!-- 标题显示 -->
<DIV ID="Title_bar">
    <DIV ID="Title_bar_Head">
        <DIV ID="Title_Head"></DIV>
        <DIV ID="Title"><!--页面标题-->
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 项目工作任务
        </DIV>
        <DIV ID="Title_End"></DIV>
    </DIV>
</DIV>

<!--显示表单内容-->
<DIV ID=MainArea>
    <FORM id="form">
        <DIV CLASS="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="../style/blue/images/item_point.gif" /> 部署流程定义 </DIV>  -->
        </DIV>
        
        <!-- 表单内容显示 -->
        <DIV CLASS="ItemBlockBorder">
            <DIV CLASS="ItemBlock">
                <TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
                    <TR>
						<TD><DIV CLASS="FuncBtn">
                          
                            <DIV class=FuncBtnMemo>项目任务表</DIV>
 
                        </DIV></TD>
                    </TR>
                </TABLE>
            </DIV>
        </DIV>
		
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;一、项目信息</TD>
				</TR>
			</THEAD>
			<TBODY>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.projectName }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目编号</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<input type="hidden" name="projectId" value="${project.id}">
					<c:out value="${project.id }"></c:out></TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目经理</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${projectManager.name }"></c:out>
					</TD>
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目成员</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					
					<c:out value="${projectStaff.name }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">起始日期</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${task.startTime }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">截止日期</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${task.endTime }"></c:out>
					</TD>
				</TR>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;二、本周任务安排</TD>
				</TR>
			</THEAD>
			<TBODY>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周一任务安排</TD>
			</tr>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task1" rows="6" readonly="readonly"><c:out value="${task.task1}"></c:out>
				</textarea> 
				</td>
			</tr>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周二任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task2" rows="6" readonly="readonly"><c:out value="${task.task2 }"></c:out>
				</textarea> 
				</td>
				</tr>
            <tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周三任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task3" rows="6" readonly="readonly"><c:out value="${task.task3 }"></c:out>
				</textarea> 
				</td>
				</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周四任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task4" rows="6" readonly="readonly"><c:out value="${task.task4 }"></c:out>
				</textarea> 
				</td>
				</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周五任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task5" rows="6" readonly="readonly"><c:out value="${task.task5 }"></c:out>
				</textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		
		
    </FORM>
</DIV>
<DIV ID="InputDetailBar">
	
</DIV>
<DIV CLASS="Description">

</DIV>
</body>
</html>