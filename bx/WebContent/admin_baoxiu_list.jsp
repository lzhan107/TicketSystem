<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bx.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>后台管理</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function save_onclick() {
		var strTemp = document.forms.weixiu_zhuangtai.value;
		if (strTemp.length == "") {
			alert("请选择维修状态！");
			document.forms.weixiu_zhuangtai.focus();
			return false;
		}
		var strTemp = document.forms.weixiu_main.value;
		if (strTemp.length == "") {
			alert("请输入维修反馈！");
			document.forms.weixiu_main.focus();
			return false;
		}
	}
</script>
</head>
<body>
<table width="99%" border="0" align="center" cellpadding="0"
	cellspacing="1" class="TableBorder">
	<tr>
		<td height="30" colspan=2 align="center" class="TableTitle1"><b>用户报修管理</b>
		</td>
	</tr>
	<tr>
		<td width="100" class="TableRow2" height=25><strong>管理快捷方式：</strong>
		</td>
		<td class="TableRow2"><a href="Admin_system.asp">网站信息设置</a> | <A
			href="admin_fankui_list.asp" target="main">反馈管理</A></td>
	</tr>
</table>
<table width="100%" height="72" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td height="20" align=center>
	<tr>
		<td align=center>
		<table cellspacing="0" width="100%">
			<tr align="center">
				<td valign="top" colspan="3">
				<form name="Del_baoxiu" method="post">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="1" class="tableBorder">
					<tr>
						<td width="100" height="25" align="center" class="TableTitle1">
						报修编号</td>
						<td width="80" height="25" align="center" class="TableTitle1">报修人</td>
						<td width="90" height="25" align="center" class="TableTitle1">
						楼栋或部门</td>
						<td width="90" height="25" align="center" class="TableTitle1">班级或宿舍</td>
						<td width="158" align="center" class="TableTitle1">报修原因</td>
						<td width="130" align="center" class="TableTitle1">报修物品</td>

						<td width="80" align="center" class="TableTitle1">期望维修时间</td>
						<td width="60" align="center" class="TableTitle1">开始时间</td>
						<td width="60" height="25" align="center" class="TableTitle1">状态</td>
						<td width="30" align="center" class="TableTitle1">维修人</td>

						<td width="30" align="center" class="TableTitle1">删除</td>
					</tr>

					<%
						ArrayList allBxListInFix = (ArrayList)request.getSession().getAttribute("allBxListInFix");
						ArrayList allBxListInItem = (ArrayList)request.getSession().getAttribute("allBxListInItem");
						
						for (int i=0 ; i<allBxListInFix.size(); i++)
						{
					%>

					<tr>
						<td width="100" height="25" align="center" class="TableRow2"><a href="BxProcess?action=process&FixId=<%=((BxList)allBxListInFix.get(i)).getListId() %>"><%=((BxList)allBxListInFix.get(i)).getListId() %></a></td>
						<td width="80" height="25" align="center" class="TableRow2"><%=((BxList)allBxListInFix.get(i)).getStdName() %></td>
						<td width="90" height="25" align="center" class="TableRow2"><%=((BxItem)allBxListInItem.get(i)).getBuildingNum() %></td>
						<td width="90" height="25" align="center" class="TableRow2"><%=((BxItem)allBxListInItem.get(i)).getRoomNum() %></td>
						<td width="158" height="25" align="center" class="TableRow2"><%=((BxItem)allBxListInItem.get(i)).getItemDesc() %>
						</td>
						<td width="130" height="25" align="center" class="TableRow2"><%=((BxItem)allBxListInItem.get(i)).getItemCate() %>,<%=((BxItem)allBxListInItem.get(i)).getItemDetail() %>
						</td>

						<td width="80" align="center" class="TableRow2"><%=((BxItem)allBxListInItem.get(i)).getEpecFixDate() %></td>
						<td width="60" align="center" class="TableRow2"><%=((BxList)allBxListInFix.get(i)).getFixStartDate() %></td>
						<td width="60" height="25" align="center" class="TableRow2"><%=((BxList)allBxListInFix.get(i)).getFixStatus() %></td>
						<td width="30" align="center" class="TableRow2"><%=((BxList)allBxListInFix.get(i)).getFixWorkerId() %></td>

						</td>
						<td width="30" align="center" class="TableRow2"><input
							name="BoxUser" type="checkbox" value=""></td>
					</tr>
					
					<%
						}
					%>
					
					<tr>
						<td colspan="3"><input type="button" name="finishedlist" value="已处理"></td>
						
						<td colspan="3"><input type="button" name="unfinishedlist" value="未处理"></td>
						
						<td colspan="3"><input type="button" name="alllist" value="所  有"></td>
						
						<td colspan="3"><input type="button" name="delete" value="删  除"></td>
						
					</tr>
					
				</table>

				</form>
				</td>
			</tr>
		</table>
</table>
<%@include file="copyright.jsp"%>
</body>
</html>