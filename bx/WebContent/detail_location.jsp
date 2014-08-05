<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder">
		<tr>
			<td height="30" colspan="2" align="center" class="TableTitle1"><b>班级部门分类管理</b>
			</td>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height="25"><strong>管理快捷方式</strong>
			</td>
			<td class="TableRow2"><a href="">网站信息设置</a> | <a href="">添加分类</a>
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
			<td height="30" align="center" class="TableTitle1"><strong>二级分类管理</strong>
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
						<td width="40%"><div align="center">二级分类名称</div>
						</td>
						<td width="30%"><div align="center">操作</div>
						</td>
					</tr>

					<c:forEach var="detailLocation" items="${requestScope.detailLocations }">
						<tr>
							<td><div align="center">
									<input name="room" type="text" id="room" size="20"
										value="${detailLocation.roomNum }">
								</div>
							</td>
							<td><div align="center">
									<input type="submit" name="Submit" value="修改"
										class="go-wenbenkuang"> &nbsp; <a href="" onClick=""><font
										color=red>删除</font>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>

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
			<td height="30" align="center" class="TableTitle1"><strong>添加二级分类</strong>
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
						<td width="40%"><div align="center">二级分类名称</div>
						</td>
						<td width="30%"><div align="center">操作</div>
						</td>
					</tr>
					<form name="form2" method="post" action="" onSubmit="return chk1()">
						<tr>
							<td><div align="center">
									<input name="anclass2" type="text" id="anclass2" size="20" />
								</div>
							</td>
							<td><div align="center">
									<input name="anclassidorder2" type="text" id="anclassidorder2"
										size="6" value="">
								</div>
							</td>
							<td><div align="center">
									<input type="submit" name="Submit3" value="添加"
										class="go-wenbenkuang">
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
																	<font color="#000000">操作注意事项及说明</font>
																</div>
															</td>
														</tr>
														<tr>
															<td><table width="80%" border="0" align="center"
																	cellpadding="5" cellspacing="0">
																	<tr>
																		<td height="16"><font color="#FF0000">·请注意分类名称不要含有非法字符。<br />
																				·进行删除操作的同时，会删除此一级分类下包含的所有二级分类。 </font>
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