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
$(function() {
	$("#check").click(function() {
		var id = $('input[name="id"]').val();
		var isPass = $('input[name="isPass"]:checked').val();
		var opinion = $('textarea[name="opinion"]').val();
		if(null==isPass){
			alert("请选择通过或不通过");
		}else{
			$.ajax({
				type : "post",
				url : "updateWeekReport",
				data : {
					"id":id,
					"isPass":isPass,
					"opinion":opinion
				},
				success : function(data) {
					if (data == 1) {
						alert("审核完成!");
						
						window.parent.frames['menu'].location.reload();
						window.location.href=document.referrer;
					} else {
						alert("审核失败!");
						$('#form')[0].reset();
					}

				}
				
			});
		};
	})
})
</script>
</head>
<body>
	<!-- 标题显示 -->
<DIV ID="Title_bar">
    <DIV ID="Title_bar_Head">
        <DIV ID="Title_Head"></DIV>
        <DIV ID="Title"><!--页面标题-->
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 项目工作周报
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
                          
                            <DIV class=FuncBtnMemo>项目工作周报表</DIV>
 
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
					<TD STYLE="border-bottom: 1px solid #94C6E7;">报告名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${weekReport.title}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">报告日期</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${weekReport.date }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">制作人</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${prepared.name}"></c:out>
					</TD>
					
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.projectName}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目完成进度</TD>
					<TD ALIGN="center" VALIGN=middle STYLE="border-bottom: 1px solid #94C6E7;">
						
						<div class="easyui-progressbar" data-options="value:${weekReport.process}" style="width:100%;text-align: left;">
						</div>
					</TD>
						
					
					<TD STYLE="border-bottom: 1px solid #94C6E7;">审核人</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${checked.name}"></c:out>
					</TD>
				</TR>
				
				
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6">&nbsp;&nbsp;人员变动情况统计（项目成员，调入时间，调出时间）</TD>
				</TR>
			</THEAD>
			<TBODY>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="staffChange" rows="2" readonly="readonly"><c:out value="${weekReport.staffChange }"></c:out>
				</textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;二、本周任务跟踪情况</TD>
				</TR>
			</THEAD>
			<TBODY>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;2.1 本周工作任务及完成情况（本周工作任务，项目成员，完成百分比）</TD>
			</tr>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="completion" rows="6" readonly="readonly"><c:out value="${weekReport.completion }"></c:out>
				</textarea> 
				</td>
			</tr>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;2.2 本周应完成而未完成的任务（工作任务，责任人，未完成的原因，何时完成）</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="uncompletion" rows="6" readonly="readonly"><c:out value="${weekReport.uncompletion }"></c:out>
				</textarea> 
				</td>
				</tr>
            <tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;2.3 本周任务变动情况（增加或减少的任务，增减原因）</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="taskChange" rows="6" readonly="readonly"><c:out value="${weekReport.taskChange }"></c:out>
				</textarea> 
				</td>
				</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<TD colspan="6" align="left">&nbsp;&nbsp;2.4 项目当前存在的问题及解决建议（问题，解决建议）</TD>
			</tr>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="problem" rows="6" readonly="readonly"><c:out value="${weekReport.problem }"></c:out>
				</textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;三、下周工作计划</TD>
				</TR>
			</THEAD>
			<TBODY>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="nextPlan" rows="6" readonly="readonly"><c:out value="${weekReport.nextPlan}"></c:out>
				</textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;四、其他</TD>
				</TR>
			</THEAD>
			<TBODY>
				<tr ALIGN=center VALIGN=middle ID=TableTitle>
				<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="others" rows="6" readonly="readonly"><c:out value="${weekReport.others}"></c:out>
				</textarea> 
				</td>
				</tr>
			</TBODY>
			
		</TABLE>
		<c:if test="${weekReport.preparedName eq user.userId}">
				<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">是否审核</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">
							<c:out value="${weekReport.isCheck }"></c:out>
						</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">是否通过</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;" width="25%">
							<c:out value="${weekReport.isPass }"></c:out>
						</TD>
					</TR>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;四、批注意见</TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
						<textarea name="opinion" rows="6" class="i1" readonly="readonly"><c:out value="${weekReport.opinion}"></c:out>
						</textarea> 
						</td>
					</tr>
					</TABLE>
				</c:if>
				<c:if test="${weekReport.reviewedName eq user.userId}">
					<c:if test="${'是' eq weekReport.isCheck }">
						<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
						<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">是否审核</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">
							<c:out value="${weekReport.isCheck }"></c:out>
						</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">是否通过</TD>
						<TD STYLE="border-bottom: 1px solid #94C6E7;">
							<c:out value="${weekReport.isPass }"></c:out>
						</TD>
					</TR>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;四、批注意见</TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
						<textarea name="opinion" rows="6" class="i1" readonly="readonly"><c:out value="${weekReport.opinion}"></c:out>
						</textarea> 
						</td>
					</tr>
					</TABLE>
					</c:if>
					<c:if test="${'否' eq weekReport.isCheck }">
					<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">	
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD colspan="6" align="left">&nbsp;&nbsp;四、批注意见</TD>
					</TR>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
						<textarea name="opinion" rows="6" class="i1">
						</textarea> 
						</td>
					</tr>
					</TABLE>
					<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle"
				STYLE="width: 90%">
					<tr align="center">
						<td width="50%"><b>通过</b><input type="radio" name="isPass" value="是"></td>
						<td width="50%"><b>不通过</b><input type="radio" name="isPass" value="否"></td>
					</tr>
					<tr ALIGN=center VALIGN=middle ID=TableTitle>
						<td colspan="6" rowspan="10" align="center" STYLE="border-bottom: 1px solid #94C6E7;">
							<a id="check">审核</a>
							<input type="hidden" name="id" value="${weekReport.id}">
						</td>
					</tr>
					</TABLE>	
					</c:if>
				</c:if>
    </FORM>
    
</DIV>
<DIV ID="InputDetailBar">
		<a href="download?path=${weekReport.link}" id="afile">附件下载</a>
</DIV>
<DIV CLASS="Description">

</DIV>
</body>
</html>