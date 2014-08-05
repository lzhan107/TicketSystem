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
						<td width="50" height="33" align="center" class="TableTitle1"><strong>报修人</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>预约维修时间</strong>
						</td>
						<td width="60" align="center" class="TableTitle1"><strong>维修状态</strong>
						</td>
						<td width="105" align="center" class="TableTitle1"><strong>
								报修编号</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>
								楼栋或部门</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>
								班级或宿舍 </strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>报修物品</strong>
						</td>
						<td width="180" align="center" class="TableTitle1"><strong>详细描述</strong>
						</td>
						<td width="70" align="center" class="TableTitle1"><strong>维修时间</strong>
						</td>
					</tr>


					<!-- 显示保修信息 -->





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
			<td bgcolor="#FFFFFF"><a href="BxProcess?action=nextpage">下一页</a>
			</td>
		</tr>
	</table>

	<%@include file="copyright.jsp"%>
</body>
</html>