<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ԺУ԰���ϱ���ϵͳ 1.0-�����֤</title>
<script type="text/javascript">
	function checkInput(form) {
		if (form.adminUsername.value == "") {
			alert("���������Ա�û���!");
			return false;
		}
		if (form.adminPassword.value == "") {
			alert("���������Ա����!");
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
				<td height="35" colspan="2" align="center"><b>�� �� �� ½</b></td>
			</tr>
			<tr>
				<td width="102" height="30" align="right">�û�����</td>
				<td width="221">&nbsp; <input name="adminId" type="text"
					class="wu" size="20"
					style="font-size: 9pt; background-color: #CDF0F9" font face="����">
				</td>
			</tr>
			<tr>
				<td height="30" align="right">��&nbsp;&nbsp;�룺</td>
				<td height="30">&nbsp; <input name="adminPassword"
					type="password" class="wu" size="20"
					style="font-size: 9pt; background-color: #CDF0F9" font face="����">
					<input type="hidden" name="action" value="adminlogin">
				</td>
			</tr>
			<tr>
				<td height="27" colspan="2" align="center"><input name="ok"
					type="submit" class="button2" value="ȷ��"> <input
					name="Submit2" type="reset" class="button2" value="����"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>