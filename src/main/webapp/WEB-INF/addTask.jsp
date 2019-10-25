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
<link rel="stylesheet" type="text/css" href="style/easyui.css">
<link rel="stylesheet" type="text/css" href="style/icon.css">
<link rel="stylesheet" type="text/css" href="style/demo.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(s){
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	}
	$(function() {
	
		//任务提交
		$("#btn").click(function() {
			var result = 1;
			$(".i1").each(function() {
				if($(this).val().length==0){
					result=0;
					return false;
				};
				
			});
			$(".easyui-datebox").each(function() {
				if($(this).val().length==0){
					result=0;
					return false;
				};
				
			});
			if (result==0){
				alert("不能为空");
			}else {
				
				$.ajax({
					type : "post",
					url : "addTask",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("任务提交成功!");
							history.back();
						} else {
							alert("任务提交失败!");
							$('#form')[0].reset();
						}

					}
					
				});
			};
			
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
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 项目工作任务
        </DIV>
        <DIV ID="Title_End"></DIV>
    </DIV>
</DIV>

<!--显示表单内容-->
<DIV ID=MainArea>
    <FORM id="form">
        <DIV CLASS="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="style/blue/images/item_point.gif" /> 部署流程定义 </DIV>  -->
        </DIV>
        
        <!-- 表单内容显示 -->
        <DIV CLASS="ItemBlockBorder">
            <DIV CLASS="ItemBlock">
                <TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
                    <TR>
						<TD><DIV CLASS="FuncBtn">
                          
                            <DIV class=FuncBtnMemo>项目任务计划表</DIV>
 
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
					<c:out value="${user.name }"></c:out>
					</TD>
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目成员</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<input type="hidden" name="userId" value="${projectStaff.userId}">
					<c:out value="${projectStaff.name }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">起始日期</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						
							<input name="startTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:70%;">
						
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">截止日期</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<input name="endTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:70%;">
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
				<textarea name="task1" rows="6" class="i1"></textarea> 
				</td>
			</tr>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周二任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task2" rows="6" class="i1"></textarea> 
				</td>
				</tr>
            <tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周三任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task3" rows="6" class="i1"></textarea> 
				</td>
				</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周四任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task4" rows="6" class="i1"></textarea> 
				</td>
				</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;周五任务安排</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="task5" rows="6" class="i1"></textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		
		
    </FORM>
</DIV>
<DIV ID="InputDetailBar">
	<input type="button" value="确认提交" style="width: 100px; height: 30px;"
			id="btn">
			
</DIV>
		
<DIV CLASS="Description">

</DIV>
</body>
</html>