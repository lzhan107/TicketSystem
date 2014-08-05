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
<script type="text/javascript">
function checkdata()
{
if(document.baoxiu.baoxiu_class.value == "")
	{
		alert("对不起，请选择年级或部门！");
		document.baoxiu.baoxiu_class.focus();
		return false;
	}
if(document.baoxiu.baoxiu_banji.value == "")
	{
		alert("对不起，请选择班级！");
		document.baoxiu.baoxiu_banji.focus();
		return false;
	}	
if(document.baoxiu.baoxiu_wp.value == "")
	{
		alert("对不起，请输入报修物品名！");
		document.baoxiu.baoxiu_wp.focus();
		return false;
	}
if(document.baoxiu.baoxiu_date.value == "")
	{
		alert("对不起，请选择希望维修日期！");
		document.baoxiu.baoxiu_date.focus();
		return false;
	}
if(document.baoxiu.contact.value == "")
	{
		alert("对不起，请输入联系电话！");
		document.baoxiu.contact.focus();
		return false;
	}
if(document.baoxiu.contact.value.length == "" )
	{
		alert("对不起，请输入电话号码！");
		document.baoxiu.contact.focus();
		return false;
	}				
if(document.baoxiu.baoxiu_yuanyin.value == "")
	{
		alert("对不起，请输入报修原因！");
		document.baoxiu.baoxiu_yuanyin.focus();
		return false;
	}	
if(document.baoxiu.guzhang.value == "")
	{
		alert("对不起，请输入报修故障显现及要求！");
		document.baoxiu.guzhang.focus();
		return false;
	}						 
}  
</script>
<script type="text/javascript">
var LastCount =0;
function CountStrByte(Message,Total,Used,Remain){ //字节统计
 var ByteCount = 0;
 var StrValue  = Message.value;
 var StrLength = Message.value.length;
 var MaxValue  = Total.value;

 if(LastCount != StrLength) { // 在此判断，减少循环次数
	for (i=0;i<StrLength;i++){
		ByteCount  = (StrValue.charCodeAt(i)<=256) ? ByteCount + 1 : ByteCount + 2;
      if (ByteCount>MaxValue) {
      	Message.value = StrValue.substring(0,i);
			alert("留言内容最多不能超过 " +MaxValue+ " 个字节！\n注意：一个汉字为两字节。");
         ByteCount = MaxValue;
         break;
      }
	}
   Used.value = ByteCount;
   Remain.value = MaxValue - ByteCount;
   LastCount = StrLength;
 }
}
</script>
<script type="text/javascript">
function showAllRoomsPerBuilding(buildingList)
{
	var selectedValue = buildingList.options[buildingList.selectedIndex].value;
	//document.baoxiu.buildingSelected.innerHTML = "<option selected>"+selectedValue+"</option>";
	
	//buildingList.options[buildingList.selectedIndex].selected;
	location.href = "GeneralManage?action=fetchRoomList&Building_Num="
			+ selectedValue;
}

function showAllItemsPerCate(cateList)
{
	var selectedValue = cateList.options[cateList.selectedIndex].value;
	
	location.href = "GeneralManage?action=fetchItemDetailList&Item_Cate="+selectedValue;
}

function get_selected_room_value(roomList)
{
	//alert("enter");
	//roomList = document.getElementById("bx_room");
	var selectedValue = roomList.options[roomList.selectedIndex].value;
	
	location.href = "GeneralManage?action=getSelectedRoom&Room_Num="+selectedValue;	
}

function get_selected_detail_value(detailList)
{
	var selectedValue = detailList.options[detailList.selectedIndex].value;

	location.href = "GeneralManage?action=getSelectedItemDetail&Item_Detail="+selectedValue;
}
</script>
<script type="text/javascript" src="js/calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Ben McFarlin (mcfarlin@netscape.net) -->
<!-- Web Site:  http://sites.netscape.net/mcfarlin -->



<!-- Begin
function populate(objForm,selectIndex) {
timeA = new Date(objForm.year.options[objForm.year.selectedIndex].text,
objForm.month.options[objForm.month.selectedIndex].value,1);
timeDifference = timeA - 86400000;
timeB = new Date(timeDifference);
var daysInMonth = timeB.getDate();
for (var i = 0; i < objForm.day.length; i++) {
objForm.day.options[0] = null;
}
for (var i = 0; i < daysInMonth; i++) {
objForm.day.options[i] = new Option(i+1);
}
document.baoxiu.day.options[0].selected = true;
}
function getYears() {

// You can easily customize what years can be used
var years = new Array(1997,1998,1999,2000,2001,2005);

for (var i = 0; i < document.baoxiu.year.length; i++) {
document.baoxiu.year.options[0] = null;
}
timeC = new Date();
currYear = timeC.getFullYear();
for (var i = 0; i < years.length; i++) {
document.baoxiu.year.options[i] = new Option(years[i]);
}
document.baoxiu.year.options[2].selected=true;
}
window.onLoad = getYears;
//  End -->
</script>
</head>
<%@include file="head.jsp"%>
<c:set var="uname1" value="${sessionScope.uname}" />
<body>

<form action="BxProcess?action=fillbxsuccess" method="post"
	name="baoxiu">
<table width="760" border="0" align="center" cellpadding="0"
	cellspacing="0" class="tableBorder5">
	<tr>
		<td>
		<table width="760" height="30" border="0" align="center"
			cellpadding="5" cellspacing="1">
			<tr>
				<td align="center"><b>报 修 登 记</b></td>
			</tr>
		</table>
		<table width="760" border="0" align="center" cellpadding="0"
			cellspacing="1">
			<tr>
				<td height="30" align="center" class="style1">说明：请您认真填写每一项！带*必须填写！</td>
			</tr>
		</table>
		<table width="760" border="0" align="center" cellpadding="0"
			cellspacing="1">
			<tr>
				<td width="164" height="30" align="right">用户帐号：</td>
				<td height="30" width="450">&nbsp;&nbsp;<input type="text"
					name="uname" value="${uname1 }"> <font color="#FF0000"></font></td>
				<td rowspan=7 valign="top"><c:forEach var="errorMessage"
					items="${ requestScope.errorMessageList}">
					<font color="red" size="2">${errorMessage}</font>
					<br>
					<br>
				</c:forEach></td>
			</tr>
			<tr>
				<td height="30" align="right">报修人姓名：</td>
				<c:set var="Username" value="${sessionScope.Username}" />
				<td height="30">&nbsp;&nbsp;<input name="Username" class="wu"
					value="${Username }" size="10" maxlength="10"> *
				（此为你注册的真实姓名,不可更改!）</td>

			</tr>
			<tr>
				<td width="164" height="30" align="right">报修部门：</td>
				<td height="30">&nbsp; <select name="baoxiu_class"
					id="baoxiu_class" onchange="showAllRoomsPerBuilding(this)">



					<%
										String Building_Num = (String) request.getSession().getAttribute(
												"Building_Num");
										if (Building_Num != null) {
									%>
					<option selected><%=Building_Num%></option>

					<%
										} else {
									%>

					<option value="" selected>请选择</option>

					<%
										}
									%>

					<c:forEach var="building" items="${sessionScope.allBuildingList}">
						<option value="${building.buildingNum }">${building.buildingNum
						}</option>
					</c:forEach>


				</select> <select name="bx_room" onchange="get_selected_room_value(this)">


					<%
						String Room_Num = (String)request.getSession().getAttribute("Room_Num");
						if (Room_Num != null)
						{
					%>
					<option value=""><%=Room_Num %></option>
					<%
						}
						else
						{
					%>
					<option value="" selected>请选择</option>

					<%
						}
					%>
					<c:forEach var="room" items="${sessionScope.allRoomList}">
						<option value="${room.roomNum }">${room.roomNum }</option>
					</c:forEach>





				</select> * （请先选择年级或部门）</td>

			</tr>
			<tr>
				<td width="164" height="30" align="right">报修物品名称：</td>
				<td height="30">&nbsp; <select name="baoxiu_lb" id="baoxiu_lb"
					onchange="showAllItemsPerCate(this)">


					<%
										String Item_Cate = (String) request.getSession().getAttribute(
												"Item_Cate");
										if (Item_Cate != null) {
									%>
					<option selected><%=Item_Cate%></option>
					<%
										} else {
									%>
					<option value="" selected="selected">请选择</option>


					<%
										}
									%>
					<c:forEach var="cate" items="${sessionScope.allGeneralCateList }">
						<option value="${cate.itemCate }">${ cate.itemCate}</option>
					</c:forEach>


				</select> <select name="bx_detail" id="bx_detail"
					onchange="get_selected_detail_value(this)">

					<%
						String Item_Detail = (String)request.getSession().getAttribute("Item_Detail");
						if (Item_Detail != null)
						{
							
					%>
					<option value="" selected="selected"><%=Item_Detail %></option>
					<%
						}else
						{
						%>
					<option value="" selected="selected">请选择</option>
					<%
						}						
						%>
					<c:forEach var="itemDetails"
						items="${sessionScope.allItemDetailList }">
						<option value="${itemDetails.itemDetail }">${itemDetails.itemDetail
						}</option>
					</c:forEach>


				</select> *</td>

			</tr>
			<tr>
				<td width="164" height="30" align="right">预约维修日期：</td>
				<td height="30">&nbsp;
				<input
								type="text" name="expecTime" id="btntxt3" /><input name="button3"
								value="*" id="button3" type="button"
								onclick="c.showMoreDay = true;c.show(this,getObjById('btntxt3'))" />
				</td>

			</tr>
			<tr>
				<td width="164" height="26" align="right">联系电话：</td>
				<td height="26">&nbsp; <input name="contact" type="text"
					class="wu" value="${uname1 }" size="18" maxlength="15"> *</td>

			</tr>

			<tr>
				<td width="164" align="right">故障详细描述：</td>
				<td>&nbsp; <textarea name="Item_Desc" cols="65" rows="10"
					class="wu"
					onKeyDown="CountStrByte(this.form.guzhang,this.form.total,this.form.used,this.form.remain);"
					onkeyup="CountStrByte(this.form.guzhang,this.form.total,this.form.used,this.form.remain);"></textarea>
				*<BR>
				<BR>
				&nbsp;&nbsp;最多允许 <input name="total" type="text" disabled id="total"
					value="1600" size="4"> 个字节 已用字节：&nbsp; <input name="used"
					type="text" disabled id="used" value="0" size="4"> 剩余字节： <input
					name="remain" type="text" disabled id="remain" value="1600"
					size="4"></td>

			</tr>
			<tr align="center">
				<td height="30" colspan=2><input class="button2" name="apply"
					type="submit" value="报修申请"> <input name="reset"
					type="reset" class="button2" value="重新填写"> <span
					class="TableRow2"> &nbsp;<input type="button" value="返   回"
					name="back" onclick="javascript:history.back()" /> </span></td>
			</tr>
		</table>
		</td>
	</tr>

</table>
</form>
<%@include file="copyright.jsp"%>
</body>
</html>