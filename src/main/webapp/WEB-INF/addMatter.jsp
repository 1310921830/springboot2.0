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
		
		
		//风险报告提交
		$("#btn").click(function() {
			var result = 1;
			$(".i1").each(function() {
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
					url : "addMatter",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("重大事项提交成功!");
							history.back();
						} else {
							alert("重大事项提交失败!");
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
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 项目重大事项
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
                          
                            <DIV class=FuncBtnMemo>项目重大事项表</DIV>
 
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
					<TD STYLE="border-bottom: 1px solid #94C6E7;">事项名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<input type="text" name="title" class="i1"></TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.projectName}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">制作人</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${user.name}"></c:out>
					</TD>
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					
					<TD STYLE="border-bottom: 1px solid #94C6E7;">事项类型</TD>
					<TD colspan="3" STYLE="border-bottom: 1px solid #94C6E7;">
					
					<select name="type" class="easyui-combotree combotree-f combo-f textbox-f" style="width: 205px; height: 24px;" >

								<option value="重大人员变动">重大人员变动</option>
								<option value="重大风险告知">重大风险告知</option>
								<option value="重大项目调整">重大项目调整</option>
								<option value="重大财政支出">重大财政支出</option>
								</select>
								
					</TD>

					<TD colspan="2" STYLE="border-bottom: 1px solid #94C6E7;"></TD>

				</TR>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;二、重大事项报告</TD>
				</TR>
			</THEAD>
			<TBODY>
			<tr ALIGN=center VALIGN=middle ID=TableTitle>
			<td colspan="6" align="left" STYLE="border-bottom: 1px solid #94C6E7;">
				<textarea name="content" rows="25" class="i1"></textarea> 
				</td>
			</tr>
			
			</TBODY>
			
		</TABLE>
		<input type="hidden" name="projectId" value="${project.id}">
		<input type="hidden" name="preparedName" value="${user.userId}">
		<input type="hidden" name="reviewedName" value="${boss.userId}">
		
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