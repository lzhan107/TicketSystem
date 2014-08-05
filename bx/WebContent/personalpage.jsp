<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bx.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<%@include file="head.jsp"%>
<c:set var="uname1" value="${sessionScope.uname}" />
<body>
	<table width="760" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tableBorder5">
		<tr>
			<td>
				<table width="760" height="30" border="0" align="center"
					cellpadding="5" cellspacing="1">
					<tr>
						<td align="center"><b>个人页面</b></td>
					</tr>
				</table>

				<table width="760" border="0" align="center" cellpadding="0"
					cellspacing="1">
					<tr>
						<td width="164" height="30" align="right">用户帐号：</td>
						<td height="30" width="450">&nbsp;&nbsp;<input type="text"
							name="uname" value="${uname1 }" readonly> <font
							color="#FF0000"></font></td>
					</tr>
					<tr>
						<td width="164" height="30" align="right">报修人姓名：</td>
						<c:set var="Username" value="${sessionScope.Username}" />
						<td height="30">&nbsp;&nbsp;<input name="Username" class="wu"
							value="${Username }" size="10" maxlength="10" readonly>
						</td>

					</tr>


					<tr>
						<td width="164" height="30" align="right">&nbsp;&nbsp;报修记录：</td>
						<td>
							<table>
								<tr>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>已处理</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
								</tr>
								<%
									ArrayList unfixedBxHistoryList = (ArrayList) request
											.getAttribute("unfixedBxHistoryList");
									int size = 0;
									int j = 0;
									size = unfixedBxHistoryList.size();
									if (size % 3 == 0) {
										j = size / 3;
									} else {
										j = size / 3 + 1;
									}
								%>
								<%
									for (int i = 0; i < j; i++) {
								%>
								<tr>
									<%
										for (int k = 0; k < 3; k++) {
									%>
									<td width="120" height="23" align="center" class="TableRow2"></td>
									<%
										}
									%>
								</tr>
								<%
									}
								%>
								<tr>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>未处理</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
								</tr>
								<%
									ArrayList fixedBxHistoryList = (ArrayList) request
											.getAttribute("fixedBxHistoryList");
									int size2 = 0;
									int j2 = 0;
									size2 = fixedBxHistoryList.size();
									if (size2 % 3 == 0) {
										j2 = size2 / 3;
									} else {
										j2 = size2 / 3 + 1;
									}
								%>
								<%
									for (int i2 = 0; i2 < j2; i2++) {
								%>
								<tr>
									<%
										for (int k2 = 0; k2 < 3; k2++) {
									%>
									<td width="120" height="23" align="center" class="TableRow2"></td>
									<%
										}
									%>
								</tr>
								<%
									}
								%>
								<tr>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>正在处理</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
									<td width="120" height="23" align="center" class="TableTitle1"><strong>&nbsp;</strong>
									</td>
								</tr>
								<%
									ArrayList pendingList = (ArrayList) request
											.getAttribute("pendingList");
									int size3 = 0;
									int j3 = 0;
									size = pendingList.size();
									if (size3 % 3 == 0) {
										j3 = size3 / 3;
									} else {
										j3 = size3 / 3 + 1;
									}
								%>
								<%
									for (int i3=0; i3<j3; i3++)
									{
								%>
								<tr>
								<%
											for (int k3=0; k3<3; k3++)
											{
										%>
									<td width="120" height="23" align="center" class="TableRow2"></td>
										<%
											}
										%>
								</tr>
								<%
									}
								%>
							</table>
						</td>
					</tr>
				</table> <%@include file="copyright.jsp"%>
</body>
</html>