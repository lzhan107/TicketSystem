<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function save_onclick() {
		var strTemp = document.forms.weixiu_zhuangtai.value;
		if (strTemp.length == "") {
			alert("��ѡ��ά��״̬��");
			document.forms.weixiu_zhuangtai.focus();
			return false;
		}
		var strTemp = document.forms.weixiu_main.value;
		if (strTemp.length == "") {
			alert("������ά�޷�����");
			document.forms.weixiu_main.focus();
			return false;
		}
	}
</script>
</head>
<body leftmargin="0" topmargin="0">
	<form name="forms" method="post"
		action="admin_fankui_edit_save.jsp?baoxiu_id=<%-- <%=baoxiu_id%> --%>"
		onsubmit="return save_onclick()">
		<table width="99%" border="0" align="center" cellpadding="0"
			cellspacing="1" class="TableBorder">
			<tr>
				<td height="30" colspan="2" align="center" class="TableTitle1"><b>�༭������Ϣ</b>
				</td>
			</tr>
			<tr>
				<td width="100" class="TableRow2" height="25"><strong>�����ݷ�ʽ��</strong>
				</td>
				<td class="TableRow2"><a href="Admin_system.asp">��վ��Ϣ����</a> | <a
					href="admin_baoxiu_list.asp" target="main">���޹���</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="TableBorder">
			<tr>
				<td align="center" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">

						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1">
									<tr>
										<td height="12" colspan="2" align="center" class="TableTitle1">ά����Ա�����༭</td>
									</tr>
									<tr>
										<td width="17%" height="12" align="right" class="TableRow2">����Ա��</td>
										<td height="12" class="TableRow2"><font color="#0000FF">admin</font>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="17%" height="27" align="right" class="TableRow2">�޸����</td>
										<td width="83%" height="27" bgcolor="#FFFFFF"
											class="TableRow2"><select name="weixiu_zhuangtai" size=1
											class=wu id="weixiu_zhuangtai">
												<option value="��ά��">��ά��</option>
												<option value="ά����">ά����</option>
										</select>
										</td>
									</tr>
									<tr>
										<td width="17%" height="25" align="right" class="TableRow2">ά�޷�����</td>
										<td width="83%" height="25" class="TableRow2"><textarea
												name="weixiu_main" cols="65" rows="10" class="wu"></textarea>
											<font class="style1">�����ܳ���250���֣�</font>
										</td>
									</tr>
									<tr align="center" bgcolor="#D9F0FF">
										<td height="25" colspan="2" class="TableRow2"><input
											name="Submit" type="submit" class="button2" value="������">
											<input type="hidden" name="user_name" value="admin"><input
											name="Submit" type="reset" class="button2" value="������д">
										</td>
									</tr>
								</table></td>
						</tr>

					</table></td>
			</tr>
		</table>
	</form>
	<%@include file="copyright.jsp"%>
</body>
</html>