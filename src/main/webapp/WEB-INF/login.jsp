<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<LINK HREF="style/blue/login.css" type=text/css rel=stylesheet />
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			if ($("#i1").val().length == 0) {
				alert("员工号不能为空");
			} else if ($("#i2").val().length == 0) {
				alert("密码不能为空");
			}else{
				$("#actForm").submit();
			};
		})
	})
</script>
</head>
<BODY LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 CLASS=PageBody >
<FORM METHOD="post" NAME="actForm" ACTION="login" id="actForm">
    <DIV ID="CenterAreaBg">
        <DIV ID="CenterArea">
        <div id="loginlogo">南京源涂公司</div>
            <DIV ID="LogoImg">项目管理系统</DIV>
            <DIV ID="LoginInfo">
                <TABLE BORDER=0 CELLSPACING="2" CELLPADDING="2" width=100%>
                    <TR>
                        <TD width=45 CLASS="Subject">账&nbsp;&nbsp;&nbsp;号</TD>
                        <TD><INPUT SIZE="20" CLASS="TextField" TYPE="text" NAME="userId" /></TD>
                        <TD ROWSPAN="2" STYLE="padding-left:10px;"><INPUT TYPE="image" SRC="style/blue/images/login/userLogin_button.gif"/></TD>
                    </TR>
                    <TR>
                        <TD CLASS="Subject">密&nbsp;&nbsp;&nbsp;码</TD>
                        <TD><INPUT SIZE="20" CLASS="TextField" TYPE="password" NAME="pwd" /></TD>
                    </TR>
                </TABLE>
                <div id="banquan">&copy; 南京源涂公司项目组 版权所有</div>
            </DIV>
			</DIV>
    </DIV>
</FORM>
</BODY>
</html>