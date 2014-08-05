<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>后台管理</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="js/js_fankui.js"></script>
</head>
<body leftmargin="0" topmargin="0">
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder"0>
		<tr>
			<td height="30" colspan=2 align="center" class="TableTitle1"><b>管理员反馈管理</b>
			</td>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height=25><strong>管理快捷方式：</strong>
			</td>
			<td class="TableRow2"><a href="Admin_system.asp">网站信息设置</a> | <A
				href="admin_baoxiu_list.jsp" target="main">报修管理</A></td>
		</tr>
	</table>
	<table border="0" width="100%" cellspacing="0" cellpadding="0"
		height="72" align="center">
		<tr>
			<td height="20" align=center>
		<tr>
			<td align=center>
				<table cellspacing="0" bordercolorlight="#FFFFFF" width="100%">
					<tr align="center">
						<td valign="top" colspan="3">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1" class="tableBorder">
								<tr>
									<td width="120" height="25" align="center" class="TableTitle1">报修编号</td>
									<td width="442" height="25" align="center" class="TableTitle1">维修反馈</td>
									<td width="80" height="25" align="center" class="TableTitle1">维修人员</td>
									<td width="155" height="25" align="center" class="TableTitle1">维修时间</td>
									<td width="60" height="25" align="center" class="TableTitle1">修改反馈</td>
								</tr>

								<c:forEach var="feedback"
									items="${requestScope.allFeedbackList }">
									<tr>
										<td width="120" height="25" align="center" class="TableRow2">${feedback.fixId }</td>
										<td width="442" height="25" align="center" class="TableRow2">${feedback.fixEval }<font
											color="#FF0000"></font></td>
										<td width="80" height="25" align="center" class="TableRow2"><font
											color="#FF0000">${feedback.worker_Name }</font></td>
										<td width="155" height="25" align="center" class="TableRow2"><font
											color="#FF0000">${feedback.fix_Start_Date }</font></td>
										<td width="60" height="25" align="center" class="TableRow2"><a
											href='admin_fankui_edit.jsp?baoxiu_id='><img border=0
												src='images/edit.gif' alt='编辑该反馈信息'> </a><a
											href='admin_fankui.asp?baoxiu_id='><img border=0
												src='images/reply.gif' alt='管理员维修反馈'> </a></td>
									</tr>
								</c:forEach>


							</table></td>
					</tr>
				</table>
	</table>
	<%@include file="copyright.jsp"%>
</body>
</html>