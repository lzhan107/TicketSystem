<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������û�</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	/* function checkInput() {
		if (document.addUserForm.uname.value == "") {
			alert("�û����Ʋ���Ϊ��!");
			document.addUserForm.focus();
			return;
		}
		if (document.addUserForm.Username.value == "") {
			alert("������������Ϊ��!");
			return;
		}
		if (document.addUserForm.Password.value == "") {
			alert("���벻��Ϊ��!");
			return;
		}
		if (document.addUserForm.Repassword.value == "") {
			alert("ȷ�����벻��Ϊ��!");
			return;
		}
		else if (document.addUserForm.Password.value != document.addUserForm.Repassword.value)
			{
				alert("�������벻һ��!");
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
			<td height=30 colspan=2 class="TableTitle1"><strong>�� ��
					�� �� ��</strong>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height=25><strong>�����ݷ�ʽ��</strong>
			</td>
			<td height="30" class="TableRow2"><a href="Admin_system.asp">��վ��Ϣ����</a>
				| <A href="admin_user_list.asp" target="main">�û��б�</A> | <A
				href="admin_user_add.asp" target="main">����û�</A><A
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
										<td height="30" colspan="2" align="center" class="TableTitle1">������û�</td>
									</tr>
									<tr>
										<td width="30%" height="30" align="center" class="TableRow2">�û����ƣ�</td>
										<td width="70%" height="30" class="TableRow2">&nbsp; <input
											name="uname" type="text" size="18"> &nbsp; <span
											class="style1">�����д�ֻ���</span>
										</td>
									</tr>
									<tr>
										<td height="30" align="center" class="TableRow2">��ʵ������</td>
										<td width="70%" height="15" class="TableRow2">&nbsp; <input
											name="Username" type="text" size="18"> &nbsp; <span
											class="style1">��ʵ����ֻ������</span>
										</td>
									</tr>
									<tr>
										<td width="30%" height="30" align="center" class="TableRow2">�û����룺</td>
										<td width="70%" height="30" class="TableRow2">&nbsp; <input
											name="Password" type="password" size="18"> &nbsp; <span
											class="style1">��������4λ</span>
										</td>
									</tr>
									<tr>
										<td width="30%" height="25" align="center" class="TableRow2">ȷ�����룺</td>
										<td width="70%" height="25" class="TableRow2">&nbsp; <input
											name="Repassword" type="password" size="18">
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
					<br> <input type="reset" value="�� ��"
						onClick=javascript:history.go(-1);> &nbsp;&nbsp; <input
						name="B1" type="submit" value="�� ��" onclick="checkInput()">
					&nbsp;&nbsp; <input name="B2" type="reset" value="�� д"> <input
						type="hidden" name="action" value="adduserinfo">
				</form></td>
		</tr>
	</table>
	<%@include file="copyright.jsp"%>
</body>
</html>