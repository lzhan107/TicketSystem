<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
function FrmAddLink_onsubmit() {
	 if (document.FrmAddLink.password.value=="")
		{
		  alert("�Բ��������������룡");
		  document.FrmAddLink.password.focus();
		  return false;
		 }
	else if (document.FrmAddLink.password.value.length < 4)
		{
		  alert("Ϊ�˰�ȫ����������Ӧ�ó�һ�㣡");
		  document.FrmAddLink.password.focus();
		  return false;
		 }
	else if (document.FrmAddLink.password.value.length > 16)
		{
		  alert("��������̫���˰ɣ�");
		  document.FrmAddLink.password.focus();
		  return false;
		 }
	else if (document.FrmAddLink.user_name.value==document.FrmAddLink.password.value)
		{
		  alert("Ϊ�˰�ȫ���û��������벻Ӧ����ͬ��");
		  document.FrmAddLink.password.focus();
		  return false;
		 }
	else if (document.FrmAddLink.password_two.value=="")
		{
		  alert("�Բ�������������֤���룡");
		  document.FrmAddLink.password_two.focus();
		  return false;
		 }
	else if (document.FrmAddLink.password_two.value !== document.FrmAddLink.password.value)
		{
		  alert("�Բ�����������������벻һ�£�");
		  document.FrmAddLink.password_two.focus();
		  return false;
		 }
	else if (document.FrmAddLink.zs_name.value=="")
		{
		  alert("�Բ�����������ʵ������");
		  document.FrmAddLink.zs_name.focus();
		  return false;
		 }
	}	 
</script>
</head>
<body>
	<table cellpadding="2" cellspacing="1" border="0" width="100%"
		class="TableBorder" align=center>
		<tr align="center">
			<td height=30 colspan=2 class="TableTitle1"><b>�� �� �� �� �� ��</b>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height=25><strong>�����ݷ�ʽ��</strong>
			</td>
			<td height="30" class="TableRow2"><a href="Admin_system.asp">��վ��Ϣ����</a>
				| <A href="admin_user_list.asp" target="main">�û��б�</A> | <A
				href="admin_manager_list.asp" target="main">����Ա�б�</A>
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
				<form method="POST" name="FrmAddLink"
					action="admin_user_edit_save.jsp?user_id=<%-- <%=user_id%> --%>"
					onsubmit="return FrmAddLink_onsubmit()">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="TableBorder">
						<tr>
							<td height="30" colspan="2" align="center" class="TableTitle1">�����޸�</td>
						</tr>
						<tr>
							<td width="35%" height="30" align="center" class="TableRow2">��¼���ƣ�</td>
							<td width="65%" height="14" class="TableRow2">&nbsp; <input
								name="user_name" type="text" value="" size="18"
								onKeyUp="value=value.replace(/[\W]/g,'') "
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
								onKeyDown="if(event.keyCode==13)event.keyCode=9" readonly>&nbsp;
								<span class="style1">�粻�޸��벻Ҫ�Ķ�</span>
							</td>
						</tr>
						<tr>
							<td width="35%" height="30" align="center" class="TableRow2">�û����ƣ�</td>
							<td width="65%" height="14" class="TableRow2">&nbsp; <input
								name="zs_name" type="text" value="" size="18"
								onKeyUp="value=value.replace(/[ -~]/g,'')" onKeyDown=if
								(event.keyCode== 13)
		event.keyCode=9;>&nbsp; <span
								class="style1">�粻�޸��벻Ҫ�Ķ�</span>
							</td>
						</tr>
						<tr>
							<td width="35%" height="30" align="center" class="TableRow2">�û����룺</td>
							<td width="65%" height="30" class="TableRow2">&nbsp; <input
								name="password" type="password" value="" size="18">&nbsp;
								<span class="style1">�粻�޸��벻Ҫ�Ķ�����������4λ</span>
							</td>
						</tr>
						<tr>
							<td width="35%" height="25" align="center" class="TableRow2">ȷ�����룺</td>
							<td width="65%" height="25" class="TableRow2">&nbsp; <input
								name="password_two" type="password" value="" size="18">&nbsp;
								<span class="style1">�粻�޸��벻Ҫ�Ķ�</span>
							</td>
						</tr>
						<tr>
							<td width="35%" height="25" align="center" class="TableRow2">�û�Ȩ�ޣ�</td>
							<td height="25" class="TableRow2"><font color="#000099">
									&nbsp; <select name="purview" size=1 class=wu id="purview">
										<option selected value="1">����Ա</option>
										<option selected value="0">�����û�</option>
								</select> </font>
							</td>
						</tr>
					</table>
					<br> <input type="reset" value="�� ��" onClick=javascript:history.go(-1);
>
					&nbsp;&nbsp; <input name="B1" type="submit" value="�� ��">
					&nbsp;&nbsp; <input name="B2" type="reset" value="�� д">
				</form></td>
		</tr>
	</table>
	<%@include file="copyright.jsp"%>
</body>
</html>