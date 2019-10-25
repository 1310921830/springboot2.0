<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<SCRIPT LANGUAGE="javascript" SRC="js/fSelect.js" CHARSET="utf-8"></SCRIPT>
<LINK TYPE="text/css" REL="stylesheet" HREF="style/blue/fSelect.css" />
<LINK TYPE="text/css" REL="stylesheet"
	HREF="style/blue/pageCommon.css" />

<style type="text/css">
	.demo1{
		width: 100px;
		
	 }
	.demo1 option {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.demo').fSelect();
		$("#btn").click(function() {
			if ($("#i1").val().length == 0) {
				alert("项目名称不能为空");
			} else if ($("#i2").val().length == 0) {
				alert("发起人不能为空");
			} else if ($("#i3").val().length == 0) {
				alert("部门经理不能为空");
			} else if ($("#i4").val().length == 0) {
				alert("项目经理不能为空");
			} else if ($("#i5").val().length == 0) {
				alert("项目成员不能为空");
			} else {

				$.ajax({
					type : "post",
					url : "saveProject",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("立项成功!");
							window.location.href="getAllProjects";
						} else {
							alert("立项失败!");
							$('#form')[0].reset();
						}

					},
					error : function() {
						//提交失败的提示词或者其他反馈代码

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
			<DIV ID="Title">
				<!--页面标题-->
				<IMG BORDER="0" WIDTH="13" HEIGHT="13"
					SRC="style/images/title_arrow.gif" /> 新建项目
			</DIV>
			<DIV ID="Title_End"></DIV>
		</DIV>
	</DIV>

	<!--显示表单内容-->
	<DIV ID=MainArea>
		<form action="saveProject" method="post" id="form">
			<DIV CLASS="ItemBlock_Title1">
				<!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="style/blue/images/item_point.gif" /> 部署流程定义 </DIV>  -->
			</DIV>

			<!-- 表单内容显示 -->
			<DIV CLASS="ItemBlockBorder">
				<DIV CLASS="ItemBlock">
					<TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
						<TR>
							<TD><DIV CLASS="FuncBtn">

									<DIV class=FuncBtnMemo>立项表</DIV>

								</DIV></TD>
						</TR>
					</TABLE>
				</DIV>
			</DIV>

			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;一、按要求填写该表</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">项目名称</TD>
						<TD colspan="2" STYLE="border-bottom: 1px solid #94C6E7;"><input
							type="text" name="projectName" placeholder="请输入项目名称" maxlength="15" id="i1">
						</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">发起人</TD>
						<TD colspan="2" STYLE="border-bottom: 1px solid #94C6E7;"><input
							type="text" name="founder" placeholder="请输入发起人" maxlength="15" id="i2">
						</TD>
					</TR>

				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;二、请选择项目相关人员</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">部门经理</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;"><select
							class="demo1" name="deptManagerId" id="i3">
								<option value="">=请选择=</option>
								<c:forEach items="${deptManagers}" var="user">
								<option value="${user.userId}">
									<c:out value="${user.name}"></c:out>
								</option>
								</c:forEach>
								</select>
						</TD>
								
						<TD STYLE="border-bottom: 1px solid #94C6E7;">项目经理</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;"><select
							class="demo1" name="projectManagerId" id="i4">
								<option value="">=请选择=</option>
								<c:forEach items="${projectManagers}" var="user">
								<option value="${user.userId}">
									<c:out value="${user.name}"></c:out>
								</option>
								</c:forEach></select></TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">项目成员</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;"><select
							class="demo" name="staffs" multiple="multiple" id="i5">
								<optgroup label="员工姓名">
									
									<c:forEach items="${emps}" var="user">
								<option value="${user.userId}">
									<c:out value="${user.name}"></c:out>
								</option>
								</c:forEach>
								</optgroup>
						</select></TD>
					</TR>
				</TBODY>

			</TABLE>

		</FORM>
	</DIV>
	<DIV ID="InputDetailBar">
		<a id="btn">提交</a> <a href="">返回</a>
	</DIV>
	<DIV CLASS="Description"></DIV>
	
</body>
</html>