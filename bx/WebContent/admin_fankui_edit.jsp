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
<body leftmargin="0" topmargin="0">
	<form name="forms" method="post"
		action="admin_fankui_edit_save.jsp?baoxiu_id=<%-- <%=baoxiu_id%> --%>"
		onsubmit="return save_onclick()">
		<table width="99%" border="0" align="center" cellpadding="0"
			cellspacing="1" class="TableBorder">
			<tr>
				<td height="30" colspan="2" align="center" class="TableTitle1"><b>编辑反馈信息</b>
				</td>
			</tr>
			<tr>
				<td width="100" class="TableRow2" height="25"><strong>管理快捷方式：</strong>
				</td>
				<td class="TableRow2"><a href="Admin_system.asp">网站信息设置</a> | <a
					href="admin_baoxiu_list.asp" target="main">报修管理</a>
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
										<td height="12" colspan="2" align="center" class="TableTitle1">维修人员反馈编辑</td>
									</tr>
									<tr>
										<td width="17%" height="12" align="right" class="TableRow2">管理员：</td>
										<td height="12" class="TableRow2"><font color="#0000FF">admin</font>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="17%" height="27" align="right" class="TableRow2">修复与否：</td>
										<td width="83%" height="27" bgcolor="#FFFFFF"
											class="TableRow2"><select name="weixiu_zhuangtai" size=1
											class=wu id="weixiu_zhuangtai">
												<option value="已维修">已维修</option>
												<option value="维修中">维修中</option>
										</select>
										</td>
									</tr>
									<tr>
										<td width="17%" height="25" align="right" class="TableRow2">维修反馈：</td>
										<td width="83%" height="25" class="TableRow2"><textarea
												name="weixiu_main" cols="65" rows="10" class="wu"></textarea>
											<font class="style1">（不能超过250个字）</font>
										</td>
									</tr>
									<tr align="center" bgcolor="#D9F0FF">
										<td height="25" colspan="2" class="TableRow2"><input
											name="Submit" type="submit" class="button2" value="发表反馈">
											<input type="hidden" name="user_name" value="admin"><input
											name="Submit" type="reset" class="button2" value="重新填写">
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