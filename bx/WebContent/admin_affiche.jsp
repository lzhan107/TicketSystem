<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bx.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>管理中心</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="js/js_Affiche.js">
	
</script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table cellpadding="0" cellspacing="1" border="0" width="100%"
	class="TableBorder" align=center>
	<tr align="center">
		<td height=25 colspan=2 class="TableTitle1"><strong>公 告
		管 理</strong>
	</tr>
	<tr>
		<td width="100" height=25 class="TableRow2"><strong>管理快捷方式：</strong>
		</td>
		<td height="25" class="TableRow2"><a href="admin_main.jsp">管理首页</a>
		| <a href="admin_affiche_add.jsp">添加公告</a></td>
	</tr>
</table>
<form name="Del_Affiche" method="post">
<TABLE border=0 cellPadding=0 cellSpacing=0 width=100% align=center
	class="border">
	<TBODY>
		<TR>
			<TD align=center width=100%>

			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" class="TableBorder">
				<tr>
					<td width="10%" height="25" align="center" class="TableTitle1">ID</td>
					<td width="10%" height="25" align="center" class="TableTitle1">发布人</td>
					<td width="50%" height="25" align="center" class="TableTitle1">修改</td>
					<td width="20%" height="25" align="center" class="TableTitle1">更新日期</td>
					<td width="10%" height="25" align="center" class="TableTitle1">删除</td>
				</tr>


				<%
					ArrayList allAffiche = (ArrayList)request.getSession().getAttribute("allAffiche");
					ArrayList adminNameList = (ArrayList)request.getSession().getAttribute("adminNameList");
					
					for (int i = 0; i<allAffiche.size(); i++)
					{
				%>
					<tr>
						<td width="10%" height="25" align="center" class="TableRow2"
							name="id"><%=((BxAffiche)allAffiche.get(i)).getAfficheId() %></td>
						<td width="10%" height="25" align="center" class="TableRow2"
							name="adminid"><%=((BxAdmin)adminNameList.get(i)).getAdminName() %></td>
						<td width="50%" height="25" align="center" class="TableRow2"
							name="affichetitle"><a class="date"
							href="admin_affiche_edit.jsp?AfficheId="><b><%=((BxAffiche)allAffiche.get(i)).getAfficheTitle() %></b> </a></td>
						<td width="20%" height="25" align="center" class="TableRow2"
							name="affichepubdate"><%=((BxAffiche)allAffiche.get(i)).getAfficheDate() %></td>
						<td width="10%" height="25" align="center" class="TableRow2"><input
							name="BoxUser" type="checkbox" value=""></td>
					</tr>
				
				<%
					}
				%>

			</table>
</TABLE>
</form>
</body>
</html>