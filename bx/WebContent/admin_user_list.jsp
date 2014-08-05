<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="js/js_user.js"></script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
	<table cellpadding="2" cellspacing="1" border="0" width="100%"
		class="TableBorder" align=center>
		<tr align="center">
			<td height=30 colspan=2 class="TableTitle1"><strong>用 户
					管 理</strong>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height=25><strong>管理快捷方式：</strong>
			</td>
			<td height="30" class="TableRow2"><a href="Admin_system.asp">网站信息设置</a>
				| <A href="admin_user_add.asp" target="main">添加用户</A> | <A
				href="admin_user_list.asp" target="main">用户列表</A><A
				href="admin_manager_list.asp" target="main"></A></td>
		</tr>
	</table>
	<table border="0" width="98%" cellspacing="0" cellpadding="0"
		height="72" align="center">
		<tr>
			<td height="20" align=center>
		<tr>
			<td align=center>
				<table cellspacing="0" bordercolorlight="#FFFFFF" width="100%">
					<tr align="center">
						<td valign="top" colspan="3">
							<form name="Del_User" method="post">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="TableBorder">
									<tr>
										<td width="56" height="25" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">编号</td>
										<td width="118" height="25" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">登录用户名</strong></td>
										<td width="151" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">用户真实姓名</td>
										<td width="153" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">注册时间</td>
										<td width="73" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">登录次数</td>
										<td width="48" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">修改</td>
										<td width="41" height="25" align="center" bgcolor="#F7F7F7"
											class="TableTitle1">删除</td>
									</tr>
									
									<c:forEach var="userList" items="${requestScope.allUserList }">
										<tr>
										<td width="56" height="25" align="center" class="TableRow2"><font
											color="#FF0000"></font>
										</td>
										<td height="25" align="center" class="TableRow2">${userList.uname }</td>
										<td height="25" align="center" class="TableRow2">${userList.username }</td>
										<td height="25" align="center" class="TableRow2">${userList.regTime }</td>
										<td height="25" align="center" class="TableRow2">${userList.loginCount }</td>
										<td height="25" align="center" class="TableRow2">修改</td>
										<td width="41" align="center" class="TableRow2"><input
											name="BoxUser" type="checkbox" value="">
										</td>
									</tr>
									</c:forEach>
									
								</table>

							</form>
						</td>
					</tr>
				</table>
	</table>
	<%@include file="copyright.jsp"%>
</body>
</html>