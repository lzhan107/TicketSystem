<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%@include file="head.jsp"%>
<body>
	<c:set var="itemBean" value="${requestScope.itemBean }"></c:set>
	<c:set var="listBean" value="${requestScope.listBean }"></c:set>
	<c:set var="workerName" value="${requestScope.WorkerName }"></c:set>
	<form name="feedbackform" action="GeneralManage?action=feedback&fixid=${listBean.listId }" method="post">
	<table width="760" border="0" align="center" cellpadding="0"
		cellspacing="1" class="tableBorder5">
		<tr>
			<td height="30" colspan="6" align="center" class="TableTitle1"><b><span
					class="style1"></span> �� �� �� �� ϸ �� ��</b></td>
		</tr>
		<tr align="center">
			<td width="118" height="30" class="TableBody1">���ޱ�ţ�</td>
			<td width="112" height="30" class="TableBody1"><span
				class="style2">${listBean.listId }</span></td>
			<td width="120" class="TableBody1">¥�����ţ�</td>
			<td width="136" class="TableBody1"><span class="style2">
			${itemBean.buildingNum }
			</span></td>
			<td width="134" height="30" class="TableBody1">�༶������</td>
			<td width="131" class="TableBody1"><span class="style2">
			${itemBean.roomNum }
			</span></td>
		</tr>
		<tr align="center">
			<td width="118" height="30" class="TableBody1">������Ʒ<span
				lang="en-us">/</span>������</td>
			<td width="112" height="30" class="TableBody1"><span
				class="style2">${itemBean.itemCate }|${itemBean.itemDetail }
				</span></td>
			<td width="120" height="30" class="TableBody1">ԤԼά�����ڣ�</td>
			<td width="136" height="30" class="TableBody1"><span
				class="style2">${itemBean.epecFixDate }</span></td>
			<td height="30" class="TableBody1">��ϵ�绰��</td>
			<td height="30" class="TableBody1"><span class="style2"></span>
			</td>
		</tr>

		<tr>
			<td height="30" align="center" class="TableBody1">����������� ��</td>
			<td colspan="5" class="TableBody1">&nbsp;<span class="style2">
			${itemBean.itemDesc }
			</span>
			</td>
		</tr>
		<tr>
			<td width="16%" height="30" align="center" class="TableBody1">ά�޷�����</td>
			<td height="30" colspan="5" class="TableBody1"><span
				class="style2">
					<select name="feedback">
						<option value="δ����">δ����</option>
						<option value="��">��</option>
						<option value="��">��</option>
						<option value="��">��</option>
					</select>
				</span></td>
		</tr>
		<tr>
			<td height="30" colspan="6" align="right" class="TableBody1">
				<input type="submit" name="submit" value="�ύ����">
				&nbsp;&nbsp;<a href="BxProcess?action=fillbx">�޸ı��޵�</a>
			</td>
		</tr>
	</table>
	<table width="760" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="760" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tableBorder5">
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="4">
					<tr>
						<td height="30" align="center" class="TableTitle1"><b>ά ��
								��  Ϣ</b></td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
					<tr>
						<td height="30" align="center" class="TableBody1">ά����Ա��</td>
						<td width="15%" height="30" align="center" class="TableBody1"><span
							class="style1">${workerName }</span></td>
						<td width="16%" height="30" align="center" class="TableBody1">�޸����</td>
						<td width="18%" align="center" class="TableBody1"><span
							class="style2">${listBean.fixStatus }</span></td>
						<td width="18%" height="30" align="center" class="TableBody1">ά��ʱ�䣺</td>
						<td width="17%" align="center" class="TableBody1"><span
							class="style2">${listBean.fixStartDate }</span></td>
					</tr>


				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>