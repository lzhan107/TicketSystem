<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bx.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function checkdata() {
		if (document.baoxiu.baoxiu_class.value == "") {
			alert("�Բ�����ѡ���꼶���ţ�");
			document.baoxiu.baoxiu_class.focus();
			return false;
		}
		if (document.baoxiu.baoxiu_banji.value == "") {
			alert("�Բ�����ѡ��༶��");
			document.baoxiu.baoxiu_banji.focus();
			return false;
		}
		if (document.baoxiu.baoxiu_user.value == "") {
			alert("�Բ���������������ʵ������");
			document.baoxiu.baoxiu_user.focus();
			return false;
		}
		if (document.baoxiu.baoxiu_date.value == "") {
			alert("�Բ�����ѡ��ϣ��ά�����ڣ�");
			document.baoxiu.baoxiu_date.focus();
			return false;
		}
		if (document.baoxiu.contact.value == "") {
			alert("�Բ�����������ϵ�绰��");
			document.baoxiu.contact.focus();
			return false;
		}
		if (document.baoxiu.contact.value.length < 4) {
			alert("�Բ���������绰����̫���˰ɣ�");
			document.baoxiu.contact.focus();
			return false;
		}
		if (document.baoxiu.contact.value.length > 11) {
			alert("�Բ�����������ϵ�绰����̫���˰ɣ�");
			document.baoxiu.contact.focus();
			return false;
		}
		if (document.baoxiu.baoxiu_wp.value == "") {
			alert("�Բ��������뱨����Ʒ����");
			document.baoxiu.baoxiu_wp.focus();
			return false;
		}
		if (document.baoxiu.baoxiu_yuanyin.value == "") {
			alert("�Բ��������뱨��ԭ��");
			document.baoxiu.baoxiu_yuanyin.focus();
			return false;
		}
		if (document.baoxiu.guzhang.value == "") {
			alert("�Բ��������뱨�޹������ּ�Ҫ��");
			document.baoxiu.guzhang.focus();
			return false;
		}
	}
</script>
<script type="text/javascript">
function showAllRoomsPerBuilding(buildingList)
{
	var selectedValue = buildingList.options[buildingList.selectedIndex].value;
	//document.baoxiu.buildingSelected.innerHTML = "<option selected>"+selectedValue+"</option>";
	
	//buildingList.options[buildingList.selectedIndex].selected;
	location.href = "GeneralManage?action=fetchRoomList&type=edit&Building_Num="
			+ selectedValue;
}

function showAllItemsPerCate(cateList)
{
	var selectedValue = cateList.options[cateList.selectedIndex].value;
	
	location.href = "GeneralManage?action=fetchItemDetailList&type=edit&Item_Cate="+selectedValue;
}

function get_selected_room_value(roomList)
{
	//alert("enter");
	//roomList = document.getElementById("bx_room");
	var selectedValue = roomList.options[roomList.selectedIndex].value;
	
	location.href = "GeneralManage?action=getSelectedRoom&type=edit&Room_Num="+selectedValue;	
}

function get_selected_detail_value(detailList)
{
	var selectedValue = detailList.options[detailList.selectedIndex].value;

	location.href = "GeneralManage?action=getSelectedItemDetail&type=edit&Item_Detail="+selectedValue;
}
</script>
<script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
	<table width="99%" border="0" align="center" cellpadding="0"
		cellspacing="1" class="TableBorder">
		<tr>
			<td height="30" colspan="2" align="center" class="TableTitle1"><b>��
					�� �� �� ��</b>
			</td>
		</tr>
		<tr>
			<td width="100" class="TableRow2" height="25"><strong>�����ݷ�ʽ��</strong>
			</td>
			<td class="TableRow2"><a href="Admin_system.asp">��վ��Ϣ����</a> | <a
				href="admin_baoxiu_list.jsp" target="main">���޹���</a> | <a
				href="admin_fankui_list.jsp" target="main">��������</a>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="5"
		cellspacing="1">
		<tr>
			<td height="20" align="center"></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="TableBorder">
		<tr>
			<td>
				<form action="BxProcess?action=processupdate" method="post" name="baoxiu"
					onsubmit="return checkdata()">
					<table border=0 cellpadding=0 cellspacing=1 width="100%">



							<c:set var="listBean"
										value="${requestScope.bxFixInfoListForUpdate }" />
									<c:set var="itemBean"
										value="${requestScope.bxItemInfoListForUpdate }" />
									<c:set var="userBean"
										value="${requestScope.bxUserInfoForUpdate }" />

						<tr>
							<td height="25" colspan="2" align="center" class="TableTitle1">�޸ı��޵�</td>
						</tr>
						<tr>
							<td height="25" align="right" class="TableRow2">���ޱ�ţ�</td>
							<td height="25" class="TableRow2"><span class="style2">
									<input type="text" name="fixid" value="${listBean.listId }" readonly> </span></td>
						</tr>
						<tr>
							<td height="25" align="right" class="TableRow2">�û��ʺţ�</td>
							<td height="25" class="TableRow2"><input
								name="baoxiu_master" class="wu" value="${userBean.uname }" size="10"
								maxlength="10" readonly>
							</td>
						</tr>

						<tr>
							<td height="25" align="right" class="TableRow2">������������</td>
							<td height="25" class="TableRow2"><input name="baoxiu_user"
								class="wu" value="${listBean.stdName }" size="10" maxlength="10" readonly>
							</td>
						</tr>
						<tr>
							<td width="164" height="25" align="right" class="TableRow2">���޲��ţ�</td>
							<td height="25" class="TableRow2"><select name="baoxiu_lb"
								id="baoxiu_lb" onchange="showAllRoomsPerBuilding(this)">


									


									<!-- --����¥��-- -->


									<c:set var="Building_Num_Edit"
										value="${sessionScope.Building_Num_Edit }" /> 

									<c:choose>
										<c:when test="${Building_Num_Edit == null }">
												<option value="${itemBean.buildingNum }" selected>${itemBean.buildingNum
													}</option>
											<c:forEach var="bxBuilding"
												items="${sessionScope.bxBuildingList }">
												<option value="${bxBuilding.buildingNum }">${bxBuilding.buildingNum
													}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="${Building_Num_Edit }" selected>${Building_Num_Edit
												}</option>
											<c:forEach var="bxBuilding"
												items="${sessionScope.bxBuildingList }">
												<option value="${bxBuilding.buildingNum }">${bxBuilding.buildingNum
													}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>


									<!-- ����¥�� -->



									<!-- ���޷��� -->

							</select> <select name="baoxiu_wp" id="baoxiu_wp"
								onchange="get_selected_room_value(this)">



									<c:set var="Room_Num_Edit"
										value="${sessionScope.Room_Num_Edit }" />





									<c:choose>
										<c:when test="${null != Building_Num_Edit }">
											<option value="${Room_Num_Edit }" selected>${Room_Num_Edit
												}</option>
											<c:forEach var="allRoom" items="${sessionScope.allRoomList }">
												<option value="${allRoom.roomNum }">${allRoom.roomNum
													}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="${itemBean.roomNum }" selected>${itemBean.roomNum
												}</option>
											<c:forEach var="bxRoom" items="${bxRoomList }">
												<option value="${bxRoom.roomNum }">${bxRoom.roomNum
													}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>

									<!-- ���޷��� -->

							</select> *</td>
						</tr>
						<tr>
							<td width="164" height="25" align="right" class="TableRow2">������Ʒ��</td>
							<td height="25" class="TableRow2"><select name="baoxiu_lb"
								id="baoxiu_lb" onchange="showAllItemsPerCate(this)">




									<!-- ���޷��� -->

									<c:set var="Item_Cate_Edit"
										value="${sessionScope.Item_Cate_Edit }" />





									<c:choose>
										<c:when test="${Item_Cate_Edit == null }">
												<option value="${itemBean.itemCate }" selected>${itemBean.itemCate
													}</option>
											<c:forEach var="cateList"
												items="${sessionScope.bxItemCateList }">
												<option value="${cateList.itemCate }">${cateList.itemCate
													}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="${Item_Cate_Edit }" selected>${Item_Cate_Edit
												}</option>
											<c:forEach var="cateList"
												items="${sessionScope.bxItemCateList }">
												<option value="${cateList.itemCate }">${cateList.itemCate
													}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>


									<!-- ���޷��� -->


							</select> <select name="baoxiu_wp" id="baoxiu_wp"
								onchange="get_selected_detail_value(this)">


									<!-- ����ϸ�� -->

									<c:set var="Item_Detail_Edit"
										value="${sessionScope.Item_Detail_Edit }" />






									<c:choose>
										<c:when test="${null != Item_Cate_Edit }">
											<option value="${Item_Detail_Edit }" selected>${Item_Detail_Edit
												}</option>
											<c:forEach var="allItemDetail"
												items="${sessionScope.allItemDetailList }">
												<option value="${allItemDetail.itemDetail }">${allItemDetail.itemDetail
													}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="${itemBean.itemDetail }" selected>${itemBean.itemDetail
												}</option>
											<c:forEach var="bxItemDetail" items="${bxItemDetailList }">
												<option value="${bxItemDetail.itemDetail}">${bxItemDetail.itemDetail
													}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>







									<!-- ����ϸ�� -->

							</select> *</td>
						</tr>
						<tr>
							<td width="164" height="25" align="right" class="TableRow2">ԤԼά�����ڣ�</td>
							<td height="25" class="TableRow2"><span class="content9">
									<input type="text" name="baoxiu_date" readonly value="${itemBean.epecFixDate }"
									onClick=setDayHM(this);; /> </span> * <span class="style1">��������ѡ��ԤԼά��ʱ��</span>
							</td>
						</tr>
						<tr>
							<td width="164" height="25" align=right class="TableRow2">��ϵ�绰��</td>
							<td height="25" align=middle class="TableRow2">
								<p align="left">
									<input name="contact" type="text" class="wu" value="${userBean.uname }" size="18"
										maxlength="15">
							</td>
						</tr>
						<tr>
							<td width="164" height="25" align="right" class="TableRow2">
								����ԭ��</td>
							<td height="25" class="TableRow2"><input
								name="baoxiu_yuanyin" class="wu" value="${itemBean.itemCate } ${itemBean.itemDetail }" size="50"
								maxlength="50"> *�����ϼ�������<span class="style1">���ܳ���50����</span>��</td>
						</tr>
						<tr>
							<td width="164" align="right" class="TableRow2">���޹������ּ�Ҫ��</td>
							<td class="TableRow2"><textarea name="guzhang" cols="65"
									rows="10" class="wu">${itemBean.itemDesc }</textarea> *��������ϸ������</td>
						</tr>
						<tr>
							<td width="164" height="25" align=right class="TableRow2">ά��״̬��</td>
							<td height="25" align=middle class="TableRow2"><select
								name="fixstatus">
									<option value="δ����">δ����</option>
									<option value="���ڴ���">���ڴ���</option>
									<option value="�Ѵ���">�Ѵ���</option>
							</select></td>
						</tr>
						<tr>
							<td width="164" height="25" align=right class="TableRow2">����ʱ�䣺</td>
							<td height="25" align=middle class="TableRow2"><input
								type="text" name="processtime" id="btntxt3" /><input name="button3"
								value="*" id="button3" type="button"
								onclick="c.showMoreDay = true;c.show(this,getObjById('btntxt3'))" />
							</td>
						</tr>
						<tr>
							<td width="164" height="25" align=right class="TableRow2">ά���ˣ�</td>
							<td height="25" align=middle class="TableRow2"><select
								name="fixworker">
									<option value="����">����</option>
									<option value="����">����</option>
									<option value="����">����</option>
									<option value="����">����</option>
							</select></td>
						</tr>
					</table>
					<tr align="center">
						<td height="30" colspan=2 class="TableRow2"><input
							class="button2" name="apply" type="submit" value="��������">
							<input type="hidden" name=ip value=""> <input
							name="Submit" type="reset" class="button2" value="������д">
							&nbsp;<INPUT type="button" value="��   ��" name="back"
							onClick=javascript:history.back();>
						</td>
					</tr>

				</form></td>
		</tr>
	</table>
</body>
</html>