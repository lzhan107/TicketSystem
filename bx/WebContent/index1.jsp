<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.bx.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
	<table width="760" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td><table width="100%" border="0" align="center"
					cellpadding="0" cellspacing="1" class="tableBorder5">
					<tr>
						<td width="50" height="33" align="center" class="TableTitle1"><strong>������</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>ԤԼά��ʱ��</strong>
						</td>
						<td width="60" align="center" class="TableTitle1"><strong>ά��״̬</strong>
						</td>
						<td width="105" align="center" class="TableTitle1"><strong>
								���ޱ��</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>
								¥������</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>
								�༶������ </strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>������Ʒ</strong>
						</td>
						<td width="180" align="center" class="TableTitle1"><strong>��ϸ����</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>ά��ʱ��</strong>
						</td>
					</tr>


					<!-- ��ʾ������Ϣ -->





					<c:forEach var="BxListItem"
						items="${requestScope.tempBxAfterFillList }">
						<tr>
							<td width="50" height="32" align="center" class="TableBody1">
								${BxListItem.username}</td>
							<td width="70" align="center" class="TableBody1">
									${BxListItem.epec_Fix_Date }</td>
							<td width="60" align="center" class="TableBody1"><font
								color="#FF0000">${BxListItem.fix_Status }
							</font> </td>
							<td width="105" align="center" class="TableBody1"><a
								href="BxProcess?action=checkbxinfo&fixid=${BxListItem.fix_Id }"><font color="#0099FF">
											${BxListItem.fix_Id }
								</font> </a>
							</td>
							<td width="70" align="center" class="TableBody1">
									${BxListItem.building_Num }
							</td>
							<td width="70" align="center" class="TableBody1">
									${BxListItem.room_Num }
							</td>
							<td width="70" align="center" class="TableBody1">
									${BxListItem.item_Cate }:${BxListItem.item_Detail }
							</td>
							<td width="180" align="center" class="TableBody1">
									${BxListItem.item_Desc }
							</td>
							<td width="70" align="center" class="TableBody1"><font
								color="#FF0000">
										${BxListItem.fix_Start_Date}
							</font></td>
						</tr>
					</c:forEach>




				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFFF"><a href="BxProcess?action=nextpage">��һҳ</a>
			</td>
		</tr>
	</table>

	<%@include file="copyright.jsp"%>
</body>
</html>