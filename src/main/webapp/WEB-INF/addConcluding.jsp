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
			$(".easyui-numberbox").each(function() {
				if($(this).val().length==0){
					result=0;
					return false;
				};
				
			});
			
			if (result==0){
				alert("不能为空");
			}else if ($("#link").val().length == 0) {
				alert("附件不能为空");
			}else {
				
				$.ajax({
					type : "post",
					url : "addConcluding",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("结题报告提交成功!");
							history.back();
						} else {
							alert("结题报告提交失败!");
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
					SRC="style/images/title_arrow.gif" /> 项目总结
			</DIV>
			<DIV ID="Title_End"></DIV>
		</DIV>
	</DIV>

	<!--显示表单内容-->
	<DIV ID=MainArea>
		<FORM id="form">
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

									<DIV class=FuncBtnMemo>项目总结表</DIV>

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
							<input type="text" name="title" class="i1"></TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">制作人</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;"><input
							type="hidden" name="preparedName" class="i1" value="${user.userId}">
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
						<TD colspan="6" align="left">&nbsp;&nbsp;二、项目完成情况总结</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;">&nbsp;&nbsp;1.时间总结</TD>
					</TR>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">开始时间</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">
							<input name="startTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:70%;"></TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">计划完成日期</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">
							<input name="exceptedFinishDate" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:70%;">
							
							</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">实际完成日期</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">
							<input name="actualFinishDate" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:70%;">
							
							</TD>
					</TR>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;">&nbsp;&nbsp;时间（差异）分析 </TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="timeAnalysis" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="4" align="left">&nbsp;&nbsp;2.成本总结</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">计划费用/￥</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">
							<input name="expectedExpense" class="easyui-numberbox"  precision="2" style="width:60%;">
							</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">实际费用</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">
							<input name="actualExpense" class="easyui-numberbox"  precision="2" style="width:60%;">
							
							</TD>
						
					</TR>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="4" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;">&nbsp;&nbsp;成本（差异）分析 </TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="4" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="costAnalysis" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;2.交付结果总结</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;">&nbsp;&nbsp;计划交付结果 </TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="exceptDeliverables" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
					
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;实际交付结果</TD>
					</TR>
				</THEAD>
				<TBODY>
					
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="actualDeliverables" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;未交付结果</TD>
					</TR>
				</THEAD>
				<TBODY>
					
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="undeliverables" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;交付结果（差异）分析</TD>
					</TR>
				</THEAD>
				<TBODY>
					
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="deliverablesAnalysis" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;三、项目经验、教训总结</TD>
					</TR>
				</THEAD>
				<TBODY>
					
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left"
							STYLE="border-bottom: 1px solid #94C6E7;"><textarea
								name="experience" rows="4" cols="125" class="i1"></textarea></td>
					</tr>
				</TBODY>

			</TABLE>
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
				<THEAD>
					<!-- 表头-->
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;四、附件上传状态(项目重要文件存档)</TD>
					</TR>
				</THEAD>
				<TBODY>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="center"
							STYLE="border-bottom: 1px solid #94C6E7;">
							<input type="hidden" name="projectId" value="${project.id}">
							<input type="hidden" name="reviewedName" value="${boss.userId}">
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