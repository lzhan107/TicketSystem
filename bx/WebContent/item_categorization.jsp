<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
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
				href="wp_bclass.asp">��ӷ���</a>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder">
		<tr>
			<td height="30" align="center" class="TableTitle1"><strong>һ�����������</strong>
			</td>
		</tr>
		<tr>
			<td height="44" class="TableRow2"><table border="0"
					cellpadding="0" cellspacing="0" height="8">
					<tr>
						<td></td>
					</tr>
				</table>
				<table width="90%" border="0" align="center" cellpadding="1"
					cellspacing="0">
					<tr>
						<td width="40%"><div align="center">һ����������</div>
						</td>
						<td width="30%"><div align="center">��������</div>
						</td>
						<td width="30%"><div align="center">ȷ������</div>
						</td>
					</tr>

					<form name="myfrom" method="post" action="">
						<c:forEach var="items" items="${requestScope.allItems }">
							<tr>
								<td><div align="center">
										<input name="anclass" type="text" id="anclass" size="20"
											value="${items.itemCate }"> &nbsp;[<A href="CategorizationManage?action=detailitems&itemid=${items.itemCate }">��Ŀ¼</A>]
									</div>
								</td>
								<td><div align="center">
										<input type="submit" name="Submit" value="�� ��"> &nbsp;
										<a href=""
											onClick="return confirm('��ȷ������ɾ��������(ͬʱɾ�������µĶ�������)')"><font
											color=red>ɾ��</font>
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
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder">
		<tr>
			<td height="30" align="center" class="TableTitle1"><strong>���һ������</strong>
			</td>
		</tr>
		<tr>
			<td class="TableRow2"><table border="0" cellpadding="0"
					cellspacing="0" height="8">
					<tr>
						<td></td>
					</tr>
				</table>
				<table width="90%" border="0" align="center" cellpadding="1"
					cellspacing="0">
					<tr>
						<td width="40%"><div align="center">һ����������</div>
						</td>
						<td width="30%"><div align="center">ȷ������</div>
						</td>
					</tr>
					<form name="form2" method="post" action="">
						<tr>
							<td><div align="center">
									<input name="anclass2" type="text" id="anclass2" size="20" />
								</div>
							</td>
							<td><div align="center">
									<input name="anclassidorder2" type="text" id="anclassidorder2"
										size="6" value="s">
								</div>
							</td>
							<td><div align="center">
									<input type="submit" name="Submit3" value="�� ��">
								</div>
							</td>
						</tr>
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
																				������ɾ��������ͬʱ����ɾ����һ�������°��������ж������ࡣ</font>
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