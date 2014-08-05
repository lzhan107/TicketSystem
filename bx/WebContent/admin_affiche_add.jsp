<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>管理中心</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function form_onsubmit() {
		if (document.form.affichename.value == "") {
			alert("友情提示!\n\n请填写公告标题!");
			document.form.affichename.focus();
			return false;
		} else if (document.form.affichecontent.value == "") {
			alert("友情提示!\n\n请填写公告内容!");
			document.form.affichecontent.focus();
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript" src="../inc/ubb.js">
	
</script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<form name="form" method="post" action="AfficheProcess?action=pubaffichecontent"
	onsubmit="return form_onsubmit()">
<table width="100%" border="0" align=center cellpadding="0"
	cellspacing="1" class="TableBorder">
	<tr align="center">
		<td height=23 colspan=2 class="TableTitle1"><strong>公 告
		发 布</strong>
	</tr>
	<tr>
		<td width="100" height=25 class="TableRow2"><strong>管理快捷方式：</strong></td>
		<td height="25" class="TableRow2"><a href="admin_main.jsp">管理首页</a>
		| <a href="admin_affiche.jsp">公告管理</a></td>
	</tr>
</table>

<table width="98%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="20"></td>
	</tr>
</table>
<TABLE width=100% border=0 align=center cellPadding=0 cellSpacing=0>
	<TBODY>
		<TR>
			<TD align="center" vAlign=top width=100%>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" class="TableBorder">

				<tr>
					<td height="25" colspan="2" align="center" class="TableTitle1">公
					告 发 布</td>
				</tr>
				<tr>
					<td width="15%" height="25" align="right" class="TableRow2">公告标题：</td>
					<td width="85%" class="TableRow2">&nbsp; <input type="text"
						name="afficheTitle" class="an" maxlength="50" size="73"> <font color="red">*</font>
					</td>
				</tr>

				<tr>
					<td height="25" align="right" valign="top" class="TableRow2">
					</td>
					<td valign="top" class="TableRow2"></td>
				</tr>

				<tr>
					<td align="right" valign="top" class="TableRow2">公告内容：</td>
					<td valign="top" class="TableRow2">&nbsp; <textarea
						name="afficheCont" class="an" cols="72" rows="13"></textarea></td>
				</tr>
				<tr>
					<td height="25" colspan="2" align="center" class="TableRow2"><input
						type="submit" value="提交公告" name="Submit"> &nbsp; <input
						type="reset" value="清除重写" name="Submit2"></td>
				</tr>

			</table>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</form>
</body>
</html>