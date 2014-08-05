<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>添加新用户</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	/* function checkInput() {
		if (document.addUserForm.uname.value == "") {
			alert("用户名称不能为空!");
			document.addUserForm.focus();
			return;
		}
		if (document.addUserForm.Username.value == "") {
			alert("真是姓名不能为空!");
			return;
		}
		if (document.addUserForm.Password.value == "") {
			alert("密码不能为空!");
			return;
		}
		if (document.addUserForm.Repassword.value == "") {
			alert("确认密码不能为空!");
			return;
		}
		else if (document.addUserForm.Password.value != document.addUserForm.Repassword.value)
			{
				alert("两次密码不一致!");
				return;
			}
		return false;
	} */
</script>
</head>
<body topmargin="0" leftmargin="0"
	oncontextmenu=self.event.returnValue=false>
	<table cellpadding="2" cellspacing="1" border="0" width="100%"
		class="TableBorder" align=center>
		<tr align="center">
			<td height=30 colspan=2 class="TableTitle1"><strong>添 加
					新 用 户</strong>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height=25><strong>管理快捷方式：</strong>
			</td>
			<td height="30" class="TableRow2"><a href="Admin_system.asp">网站信息设置</a>
				| <A href="admin_user_list.asp" target="main">用户列表</A> | <A
				href="admin_user_add.asp" target="main">添加用户</A><A
				href="admin_manager_list.asp" target="main"></A>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>

	<table width="600" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="600" align="center">
				<form method="POST" name="addUserForm" action="UserManage?action=adduserinfo">
					<table width="100%" height="66" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td width="100%" valign="top" height="43">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="TableBorder">
									<tr>
										<td height="30" colspan="2" align="center" class="TableTitle1">添加新用户</td>
									</tr>
									<tr>
										<td width="30%" height="30" align="center" class="TableRow2">用户名称：</td>
										<td width="70%" height="30" class="TableRow2">&nbsp; <input
											name="uname" type="text" size="18"> &nbsp; <span
											class="style1">最好填写手机号</span>
										</td>
									</tr>
									<tr>
										<td height="30" align="center" class="TableRow2">真实姓名：</td>
										<td width="70%" height="15" class="TableRow2">&nbsp; <input
											name="Username" type="text" size="18"> &nbsp; <span
											class="style1">真实姓名只限中文</span>
										</td>
									</tr>
									<tr>
										<td width="30%" height="30" align="center" class="TableRow2">用户密码：</td>
										<td width="70%" height="30" class="TableRow2">&nbsp; <input
											name="Password" type="password" size="18"> &nbsp; <span
											class="style1">不能少于4位</span>
										</td>
									</tr>
									<tr>
										<td width="30%" height="25" align="center" class="TableRow2">确认密码：</td>
										<td width="70%" height="25" class="TableRow2">&nbsp; <input
											name="Repassword" type="password" size="18">
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
					<br> <input type="reset" value="返 回"
						onClick=javascript:history.go(-1);> &nbsp;&nbsp; <input
						name="B1" type="submit" value="提 交" onclick="checkInput()">
					&nbsp;&nbsp; <input name="B2" type="reset" value="重 写"> <input
						type="hidden" name="action" value="adduserinfo">
				</form></td>
		</tr>
	</table>
	<%@include file="copyright.jsp"%>
</body>
</html>