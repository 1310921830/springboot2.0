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
<script type="text/javascript">
	$(function() {
		//文件上传
		$("#upload").click(function() {
			$.ajax({
				url : 'upload',
				type : 'POST',
				cache : false,
				data : new FormData($('#uploadForm')[0]),
				processData : false,
				contentType : false,
				success : function(data) {
					$("#sp").html("已上传");
					$("#link").val(data.filepath + data.filename);
				}

			});
		});
		
		//计划提交
		$("#btn").click(function() {
			if ($("#i1").val().length == 0) {
				alert("不能为空");
			} else if ($("#i2").val().length == 0) {
				alert("不能为空");
			} else if ($("#i3").val().length == 0) {
				alert("不能为空");
			} else if ($("#i4").val().length == 0) {
				alert("不能为空");
			} else if ($("#i5").val().length == 0) {
				alert("不能为空");
			} else if ($("#i6").val().length == 0) {
				alert("不能为空");
			} else if ($("#i0").val().length == 0) {
				alert("标题不能为空");
			}else if ($("#link").val().length == 0) {
				alert("附件不能为空");
			}else {
				
				$.ajax({
					type : "post",
					url : "addPlan",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("项目计划提交成功!");
							window.location.href=document.referrer;
						} else {
							alert("项目计划提交失败!");
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
			<DIV ID="Title">
				<!--页面标题-->
				<IMG BORDER="0" WIDTH="13" HEIGHT="13"
					SRC="style/images/title_arrow.gif" /> 项目计划展示
			</DIV>
			<DIV ID="Title_End"></DIV>
		</DIV>
	</DIV>

	<!--显示表单内容-->
	<DIV ID=MainArea>
		<FORM id="form" action="addPlan" method="post">
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

									<DIV class=FuncBtnMemo>项目计划表</DIV>

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
						<TD colspan="6" align="left">&nbsp;&nbsp;一、项目基本情况</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">标题</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="200px">
							<input type="text" name="title" id="i0"></TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">制作人</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;"><input
							type="hidden" name="preparedName" id="i1" value="${user.userId}">
							<c:out value="${user.name}"></c:out>
							</TD>
					</TR>

				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;二、项目描述</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;">&nbsp;&nbsp;1.项目背景与目的(所有项目均起源于某个商业问题，简要描述这些问题)</TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="bgTarget" rows="8" cols="125" id="i2"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;2.项目目标(包含质量目标，工期目标，费用目标和交付产品特征与特征的主要描述)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="aim" rows="4" cols="125" id="i3"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;三、项目里程碑计划(包含里程碑的时间和结果)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="milestones" rows="5" cols="125" id="i4"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;四、评价标准(说明项目成果在何种情况下将被接受)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="standard" rows="8" cols="125" id="i5"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;五、项目假定与约束条件(说明项目的主要假设条件和限制条件)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="requirement" rows="5" cols="125" id="i6"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;六、附件上传状态(项目重要文件存档)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="center"
							STYLE="border-bottom: 1px solid #94C6E7;">
							<input type="hidden" name="projectId" value="${project.id}">
							<input type="hidden" name="reviewedName" value="${project.deptManagerId}">
							<input type="hidden"
							name="link" id="link"> <span id="sp">未上传</span></td>
					</tr>
				</TBODY>

			</TABLE>
		</FORM>

		<form id="uploadForm" enctype="multipart/form-data">
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<tr>
					<td align="center"><input type="file" name="file"></td>
					<td align="center"><a><img
							src="style/images/uploadSelectedFiles.PNG" id="upload" /></a></td>
				</tr>


			</TABLE>
		</form>

	</DIV>
	<DIV ID="InputDetailBar">
		<input type="button" value="确认提交" style="width: 100px; height: 30px;"
			id="btn">
	</DIV>
	<DIV CLASS="Description"></DIV>
</body>
</html>