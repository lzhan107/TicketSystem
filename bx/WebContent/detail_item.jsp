<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder"0>
		<tr>
			<td height="30" colspan="2" align="center" class="TableTitle1"><b>��
					�� �� �� �� �� �� ��</b>
			</td>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height="25"><strong>�����ݷ�ʽ��</strong>
			</td>
			<td class="TableRow2"><a href="Admin_system.asp">��վ��Ϣ����</a> | <a
				href="pud_bclass.asp">��ӷ���</a>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder"0>
		<tr>
			<td height="30" align="center" class="TableTitle1"><b>�����������</b>
			</td>
		</tr>
		<tr>
			<td height="37" valign="top" class="TableRow2"><table border="0"
					cellpadding="0" cellspacing="0" height="8">
					<tr>
						<td>&nbsp;[<A href="">������ҳ</A>]-&gt; <BR>
						</td>
					</tr>
				</table>
				<table width="95%" border="0" cellpadding="1" cellspacing="1"
					align="center">
					<tr>
						<td width="40%"><div align="center">������������</div>
						</td>
						<td width="30%"><div align="center">ȷ������</div>
						</td>
					</tr>

					<form name="form1" method="post" action="">
						<c:forEach var="detail" items="${requestScope.itemDetails }">
							<tr>
								<td width="40%"><div align="center">
										<input name="nclass" type="text" id="nclass" size="20"
											value="${detail.itemDetail }">
									</div>
								</td>
								<td width="30%"><div align="center">
										<input type="submit" name="Submit" class="go-wenbenkuang"
											value="�� ��"> &nbsp;<a href=""
											onClick="return confirm('��ȷ������ɾ��������')"><font color=red>ɾ��</font>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</form>

				</table>
				<table border="0" cellpadding="0" cellspacing="0" height="8">
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder">
		<tr>
			<td height="30" align="center" class="TableTitle1"><b>��Ӷ�������</b>
			</td>
		</tr>
		<tr>
			<td valign="top" class="TableRow2"><table border="0"
					cellpadding="0" cellspacing="0" height="8">
					<tr>
						<td></td>
					</tr>
				</table>
				<table width="95%" border="0" cellpadding="1" cellspacing="1"
					align="center">
					<tr>
						<td width="40%"><div align="center">������������</div>
						</td>
						<td width="30%"><div align="center">��������</div>
						</td>
						<td width="30%"><div align="center">ȷ������</div>
						</td>
					</tr>
					<tr>
						<td width="40%"><div align="center">
								<input name="nclass2" type="text" id="nclass2" size="20" />
								&nbsp; <input name="anclassid" type="hidden" value="">
							</div>
						</td>
						<td width="30%"><div align="center">
								<input name="Submit2" type="submit" class="go-wenbenkuang"
									id="Submit2" value="�� ��">
							</div>
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" height="8">
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="80%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td rowspan="2"><table width="100%" border="0"
								cellspacing="0" cellpadding="0" class="12v">
								<tr>
									<td class="12v"><table border="0" cellpadding="0"
											cellspacing="0" style="border-collapse: collapse"
											id="AutoNumber3" height="0" width="100%">
											<tr>
												<td><table width="100%" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="30"><div align="center">
																	<font color="#000000">����ע�����˵��</font>
																</div>
															</td>
														</tr>
														<tr>
															<td><table width="80%" border="0" align="center"
																	cellpadding="5" cellspacing="0">
																	<tr>
																		<td height="16"><font color="#FF0000">����ע��������Ʋ�Ҫ���зǷ��ַ���<br />
																		</font>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>