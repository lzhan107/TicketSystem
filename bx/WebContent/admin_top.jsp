<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��������</title>
<script type="text/javascript">
	var displayBar = true;
	function switchBar(obj) {
		if (displayBar) {
			parent.frame.cols = "0,*";
			displayBar = false;
			obj.src = "images/admin_logo_2.gif";
			obj.title = "����߹���˵�";
		} else {
			parent.frame.cols = "180,*";
			displayBar = true;
			obj.src = "images/admin_logo_1.gif";
			obj.title = "�ر���߹���˵�";
		}
	}
</script>
<link href="style.css" type="text/css" rel="stylesheet">
<style type="text/css">
a {
	color: #FFFFFF;
	text-decoration: none
}

a:hover {
	color: #DBDBDB;
	text-decoration: underline
}

td {
	color: #FFFFFF;
	font-family: "����";
	font-weight: bold;
}
</style>
</head>
<body leftmargin="0" topmargin="0">
<table cellSpacing="0" cellPadding="0" align="center" width="100%"
	border="0">
	<tr>
		<td class="BodyTitle" height="28">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td align="left"></td>
				<td><font color="FFFFAA">&nbsp;&nbsp;&nbsp;&nbsp;����ϵͳ��̨�������</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="admin_left.jsp" target="leftFrame">��վ����</a>&nbsp;&nbsp;<a
					href="http://www.njacc.cn" target="_blank">����֧��</a></td>
				<td width="5%" align=right><A href=.. / target=_blank><img
					src="images/i_home.gif" title="������ҳ" border=0> </A>&nbsp;</TD>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td bgColor="#485161" height="1"></td>
	</tr>
	<tr>
		<td bgColor="#CDCDCD" height="1"></td>
	</tr>
	<tr>
		<td bgColor="#B5BCC7" height="1"></td>
	</tr>
</table>

</body>
</html>