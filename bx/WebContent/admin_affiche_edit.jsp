<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function form_onsubmit() {
		if (document.form.affichename.value == "") {
			alert("������ʾ!\n\n����д�������!")
			document.form.affichename.focus()
			return false
		} else if (document.form.affichecontent.value == "") {
			alert("������ʾ!\n\n����д��������!")
			document.form.affichecontent.focus()
			return false
		}
		return true;
	}
</script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
�����ĳ������ʱ������editҳ��




<form name="form" method="post"
	action="admin_ffiche_edit_save.jsp?AfficheId=<%-- <%=request("AfficheId")%> --%>"
	onsubmit="return form_onsubmit()">
<table cellpadding="0" cellspacing="1" border="0" width="100%"
	class="TableBorder" align=center>
	<tr align="center">
		<td height=25 colspan=2 class="TableTitle1"><strong>�� ��
		�� ��</strong>
	</tr>
	<tr>
		<td width="100" class="TableRow2" height=25><strong>�����ݷ�ʽ��</strong></td>
		<td height="25" class="TableRow2"><a href="Admin_All.asp">������ҳ</a>
		| <a href="Admin_Affiche.asp">�������</a></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="20"></td>
	</tr>
</table>

<TABLE border=0 cellPadding=0 cellSpacing=0 width=100% align=center
	class="border">
	<TBODY>
		<TR>
			<TD align=middle vAlign=top width=100%>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" class="TableBorder">

				<tr>
					<td height="25" colspan="2" align="center" class="TableTitle1">��
					�� �� ��</td>
				</tr>
				<tr>
					<td height="25" align="right" class="TableRow2">������⣺</td>
					<td class="TableRow2"><input type="text" name="affichename"
						maxlength="50" size="73" value="">
					*</td>
				</tr>
				<tr>
					<td height="25" align="right" valign="top" class="TableRow2">
					</td>
					<td valign="top" class="TableRow2"></td>
				</tr>
				<tr>
					<td align="right" valign="top" class="TableRow2">�������ݣ�</td>
					<td valign="top" class="TableRow2"><textarea
						name="affichecontent" cols="71" rows="15"></textarea></td>
				</tr>
				<tr>
					<td height="25" colspan="2" align="center" class="TableRow2"><input
						type="submit" value="�ύ����" name="Submit"> &nbsp; <input
						type="reset" value="�����д" name="Submit2"></td>
				</tr>

			</table>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</form>
<%@include file="copyright.jsp"%>
</body>
</html>