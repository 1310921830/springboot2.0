<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="style/blue/pageCommon.css" />
<link rel="stylesheet" type="text/css" href="style/easyui.css">
<link rel="stylesheet" type="text/css" href="style/icon.css">
<link rel="stylesheet" type="text/css" href="style/demo.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<style type="text/css">
	#matters{
		width:100px;
		height:475px;
		
		/* border:3px solid #4891c6; */
		position: fixed;
		top:20%;
		right:3%;
	}
	#matters a{
		display: block;
		width:100%;
		height:20px;
		margin-bottom: 20px;
		margin-top:20px;
		color:#004779;
		padding-left: 10px;
		background: url("style/blue/images/menu_btn_bg.gif");
		
	}
</style>
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
	</style>

<script type="text/javascript">
var attences;

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
		$('.dd').datebox({
		    
		});
		$("#a1").click(function() {
			$('#w').window('open');
		});
		$("#btn2").click(function() {
			$('#w').window('close');
		});
		$("#a2").click(function() {
			$('#h').css("visibility","visible");
			$('#h').window('open');
		});
		
		$("#btn4").click(function() {
			$('#h').window('close');
		});
		//支出提交
		$("#btn1").click(function() {
			var result = 1;
			$(".i1").each(function() {
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
			}else {
				
				$.ajax({
					type : "post",
					async:false,
					url : "addCost",
					data : $('#form').serialize(),
					success : function(data) {
						if (data == 1) {
							alert("提交成功!");
							$('#form')[0].reset();
							$('#w').window('close');
						} else {
							alert("提交失败!");
							$('#form')[0].reset();
						}

					}
					
				});
			};
			
		});
		//工时提交
		$("#btn3").click(function() {
			var result = 1;
			
			if($("#d1").val().length==0){
				result=0;
			}else if($("#hours").val().length==0){
				result=0;
			};
			if (result==0){
				alert("不能为空");
			}else {
				
				$.ajax({
					type : "post",
					url : "addHour",
					data : $('#form1').serialize(),
					success : function(data) {
						if (data>0) {
							alert("提交成功!");
							$('#form1')[0].reset();
							$('#h').window('close');
						} else {
							alert("提交失败!");
							$('#form1')[0].reset();
						}

					}
					
				});
			};
			
		});
		//导入excel
		$("#import").click(function() {
			var filename = $("#uploadExcel").val();
			var endName = filename.slice(filename.lastIndexOf("."));
			if (endName==".xls" || endName==".xlsx") {
				$.ajax({
				    url: 'import',
				    type: 'post',
				    cache: false,
				    data: new FormData($('#uploadForm')[0]),
				    processData: false,
				    contentType: false,
				    success:function(data){
				    	if("01"==data){
				    		alert("工时提交成功");
				    		$('#uploadForm')[0].reset();
				    		$('#h').window('close');
				    	}else if("02"==data){
				    		alert("文件数据为空");
				    	}else{
				    		alert("提交失败");
				    	}
				    	
				    }

				});
			}else{
				alert("请选择excel格式的文件");
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
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="style/images/title_arrow.gif"/> 项目信息展示
        </DIV>
        <DIV ID="Title_End"></DIV>
    </DIV>
</DIV>

<!--显示表单内容-->
<DIV ID=MainArea>
    <FORM>
        <DIV CLASS="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="style/blue/images/item_point.gif" /> 部署流程定义 </DIV>  -->
        </DIV>
        
        <!-- 表单内容显示 -->
        <DIV CLASS="ItemBlockBorder">
            <DIV CLASS="ItemBlock">
                <TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
                    <TR>
						<TD><DIV CLASS="FuncBtn">
                          
                            <DIV class=FuncBtnMemo>项目信息表</DIV>
 
                        </DIV></TD>
                    </TR>
                </TABLE>
            </DIV>
        </DIV>
		
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;一、项目基本情况</TD>
				</TR>
			</THEAD>
			<TBODY>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目名称</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.projectName}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目编号</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.id}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">发起人</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.founder}"></c:out>
					</TD>
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">成立时间</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.establishedTime}"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目状态</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${project.status}"/>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">部门经理</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${deptManager.name }"></c:out>
					</TD>
				</TR>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目经理</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
						<c:out value="${projectManager.name }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目进度</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" colspan="3">
						<div class="easyui-progressbar" data-options="value:${project.process}" style="width:100%;text-align: left;">
						</div>
					</TD>
					
				</TR>
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;二、项目组成员</TD>
				</TR>
			</THEAD>
			<TBODY>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="100">项目角色</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="100">成员姓名</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="100">性别</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="150">年龄</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="150">员工号</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="150">部门号</TD>
					
					<TD STYLE="border-bottom: 1px solid #94C6E7;" width="100">
					
					</TD>
					
				</TR>
				
				<c:forEach items="${users}" var="u">
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">项目核心成员</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${u.name }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${u.gender }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${u.age }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${u.userId }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:out value="${u.deptNo }"></c:out>
					</TD>
					<TD STYLE="border-bottom: 1px solid #94C6E7;">
					<c:if test="${'项目经理' eq user.position}">
						<a href="addTask?projectId=${project.id}&userId=${u.userId}"><b>分配任务</b></a>
					</c:if>
					<c:if test="${'普通员工' ne user.position}">
						<a href="queryTasks?projectId=${project.id}&userId=${u.userId}">查看任务</a>
					</c:if>
					
					</TD>
					
				</TR>
				</c:forEach>
				
			</TBODY>
			
		</TABLE>
		<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle" STYLE="width: 90%">
			<THEAD><!-- 表头-->
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD colspan="6" align="left">&nbsp;&nbsp;三、项目查看</TD>
				</TR>
			</THEAD>
			<TBODY>
				<TR ALIGN=center VALIGN=middle ID=TableTitle>
					<TD STYLE="border-bottom: 1px solid #94C6E7;"> 
					<img alt="" src="style/images/search.gif">
					<a href="showPlan?projectId=${project.id}">项目计划</a>
					<c:if test="${'普通员工' eq user.position}">
						<a href="showDailyReports?projectId=${project.id}&userId=${user.userId}">日报</a>
						
					</c:if>
					<c:if test="${'普通员工' ne user.position}">
						<a href="getDailyReports?projectId=${project.id}">日报</a>
						
					</c:if>
					<c:if test="${'项目经理' eq user.position}">
						
						<a href="showWeekReports?projectId=${project.id}">周报</a>
						
						<a href="showRiskReports?projectId=${project.id}">风险报告</a>
						<a href="showSchemes?projectId=${project.id}">奖惩/绩效</a>
						
					</c:if>
					<c:if test="${'项目经理' ne user.position}">
						
						<a href="getWeekReports?projectId=${project.id}">周报</a>
						
						<a href="getRiskReports?projectId=${project.id}">风险报告</a>
						<a href="getSchemes?projectId=${project.id}">奖惩/绩效</a>
						
					</c:if>
					<c:if test="${'部门经理' eq user.position}">
						<a href="showMatters?projectId=${project.id}">重大事项</a>
					</c:if>
					<c:if test="${'部门经理' ne user.position}">
						<a href="getMatters?projectId=${project.id}">重大事项</a>
					</c:if>
                    <a href="getCosts?projectId=${project.id}">项目花费</a>
                    <a href="showMeetings?projectId=${project.id}">会议记录</a>
                    <a href="showConcluding?projectId=${project.id}">结题报告</a>
					</TD>
				</TR>
			</TBODY>
			
		</TABLE>
		
    </FORM>
</DIV>
<div id="matters">
	<img alt="" src="style/images/forumpage3.gif">
	<c:if test="${'项目经理' eq user.position}">
		<a href="addPlan?projectId=${project.id}"><b>制定项目计划</b></a>
		
		<a href="addWeekReport?projectId=${project.id}"><b>提交周报</b></a>
		<a id="a1"><b>财务支出</b></a>
		<div id="w" class="easyui-window" title="财务支出" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:5px;">
			
				<div style="width: 100%;height: 80%;">
					<form id="form">
					<table align="center">
						<tr align="center">
							<td width="250px"><b>支出日期</b></td>
							<td width="150px" align="left">
								<input type="text" name="date" class="dd" class="i1" data-options="formatter:myformatter,parser:myparser">
							</td>
						</tr>
						<tr align="center">
							<td><b>支出类型</b></td>
							<td align="left">
								<input type="text" name="type" class="i1">
							</td>
						</tr>
						<tr align="center">
						<td><b>支出金额</b></td>
							<td align="left"><input name="money" class="easyui-numberbox"  precision="2" style="width:60%;"></td>
						</tr>
						<tr align="center">
							<td><b>经手人</b></td>
							<td align="left">
								<input type="text" name="owner" class="i1">
							</td>
						</tr>
						<tr align="center">
							<td><b>备注信息</b></td>
							<td align="left">
								<input type="hidden" name="projectId" value="${project.id}">
								<textarea name="remark" rows="4" class="i1"></textarea>
							</td>
						</tr>
					</table>
					</form>
					
				</div>
				<div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;margin-top: 10px;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:80px" id="btn1">Ok</a>&nbsp;&nbsp;
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px" id="btn2">Cancel</a>
				</div>
			
		</div>
		
		<a href="addScheme?projectId=${project.id}"><b>奖惩/绩效</b></a>
		<a href="addRiskReport?projectId=${project.id}"><b>风险报告提交</b></a>
		<a href="addMeeting?projectId=${project.id}"><b>会议记录存档</b></a>
		<a href="addConcluding?projectId=${project.id}"><b>结题报告提交</b></a>
	</c:if>
	<c:if test="${'部门经理' eq user.position}">
		
		<a href="addMatter?projectId=${project.id}"><b>重大事项上报</b></a>
	</c:if>
	<c:if test="${'普通员工' eq user.position}">
		<a href="queryTasks?projectId=${project.id}&userId=${user.userId}"><b>查看任务</b></a>
		<a href="addDailyReport?projectId=${project.id}"><b>提交日报</b></a>
		
		<a id="a2"><b>提交工时</b></a>
		
		<div id="h" class="easyui-window" title="项目工时" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:400px;height:200px;padding:5px;visibility: hidden;">
			
				<div style="width: 100%;height: 80%;">
					<form id="uploadForm" enctype="multipart/form-data">
					批量导入:<br><input type="file" id="uploadExcel" name="file">
					<input type="button" value="导入" id="import">
					</form>
					<form id="form1">
					<table align="center">
						<tr align="center">
							<td width="250px"><b>日期</b></td>
							<td width="150px" align="left">
								<input type="hidden" name="userId" value="${user.userId }">
								<input type="hidden" name="projectId" value="${project.id }">
								<input type="text" name="date" class="dd" id = "d1" data-options="formatter:myformatter,parser:myparser">
							</td>
						</tr>
						
						<tr align="center">
						<td><b>工时/小时</b></td>
							<td align="left"><input name="hours" class="easyui-numberbox"  id = "hours" precision="2" style="width:60%;"></td>
						</tr>
						
						
					</table>
					</form>
					
				</div>
				<div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;margin-bottom: 20px;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:80px" id="btn3">Ok</a>&nbsp;&nbsp;
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px" id="btn4">Cancel</a>
				
				</div>
			
		</div>
		
	</c:if>
	<c:if test="${'企业领导' eq user.position}">
		
		<a href="saveProject"><b>新建项目</b></a>
		
	</c:if>
</div>

<DIV CLASS="Description">
	
</DIV>
</body>
</html>