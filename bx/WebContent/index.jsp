<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>分院校园网上报修系统 1.0-身份验证</title>
<script type="text/javascript">
	function checkInput(form) {
		if (form.adminUsername.value == "") {
			alert("请输入管理员用户名!");
			return false;
		}
		if (form.adminPassword.value == "") {
			alert("请输入管理员密码!");
			return false;
		}
		return true;
	}
</script>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">

<form name="form1" method="post" action="AdminProcess"
	onsubmit="return checkInput(this)">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="362" height="252" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td height="156" valign="top" background="images/00.jpg">
		<table width="323" height="209" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td height="43" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td height="35" colspan="2" align="center"><b>管 理 登 陆</b></td>
			</tr>
			<tr>
				<td width="102" height="30" align="right">用户名：</td>
				<td width="221">&nbsp; <input name="adminId" type="text"
					class="wu" size="20"
					style="font-size: 9pt; background-color: #CDF0F9" font face="宋体">
				</td>
			</tr>
			<tr>
				<td height="30" align="right">密&nbsp;&nbsp;码：</td>
				<td height="30">&nbsp; <input name="adminPassword"
					type="password" class="wu" size="20"
					style="font-size: 9pt; background-color: #CDF0F9" font face="宋体">
					<input type="hidden" name="action" value="adminlogin">
				</td>
			</tr>
			<tr>
				<td height="27" colspan="2" align="center"><input name="ok"
					type="submit" class="button2" value="确定"> <input
					name="Submit2" type="reset" class="button2" value="重填"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>