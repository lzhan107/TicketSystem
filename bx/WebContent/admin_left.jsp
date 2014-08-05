<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<style type="text/css">
BODY {
	margin: 0px;
	FONT-SIZE: 12px;
	FONT-FAMILY: "宋体", "Verdana", "Arial", "Helvetica", "sans-serif";
	background: #799AE1;
	SCROLLBAR-FACE-COLOR: #799AE1;
	SCROLLBAR-HIGHLIGHT-COLOR: #799AE1;
	SCROLLBAR-SHADOW-COLOR: #799AE1;
	SCROLLBAR-DARKSHADOW-COLOR: #799AE1;
	SCROLLBAR-3DLIGHT-COLOR: #799AE1;
	SCROLLBAR-ARROW-COLOR: #FFFFFF;
	SCROLLBAR-TRACK-COLOR: #AABFEC;
}

TABLE {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

TD {
	FONT: 12px 宋体
}

IMG {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	VERTICAL-ALIGN: bottom;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

A {
	FONT: 12px 宋体;
	COLOR: #215dc6;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #428eff
}

.sec_menu {
	BORDER-RIGHT: white 1px solid;
	BACKGROUND: #d6dff7;
	OVERFLOW: hidden;
	BORDER-LEFT: white 1px solid;
	BORDER-BOTTOM: white 1px solid
}

.list_title {
	
}

.list_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 8px;
	COLOR: #215dc6;
	POSITION: relative;
	TOP: 2px;
	visibility: visible;
}

.list_title2 {
	
}

.list_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 8px;
	COLOR: #428eff;
	POSITION: relative;
	TOP: 2px
}
</style>
<script type="text/javascript">
	function show(obj, maxg, obj2) {
		if (obj.style.pixelHeight < maxg) {
			obj.style.pixelHeight += maxg / 10;
			obj.filters.alpha.opacity += 20;
			obj2.background = "images/title_hide.gif";
			if (obj.style.pixelHeight == maxg / 10)
				obj.style.display = 'block';
			myObj = obj;
			mymaxg = maxg;
			myObj2 = obj2;
			setTimeout('show(myObj,mymaxg,myObj2)', '5');
		}
	}
	function hide(obj, maxg, obj2) {
		if (obj.style.pixelHeight > 0) {
			if (obj.style.pixelHeight == maxg / 5)
				obj.style.display = 'none';
			obj.style.pixelHeight -= maxg / 5;
			obj.filters.alpha.opacity -= 10;
			obj2.background = "images/title_show.gif";
			myObj = obj;
			mymaxg = maxg;
			myObj2 = obj2;
			setTimeout('hide(myObj,mymaxg,myObj2)', '5');
		} else if (whichContinue)
			whichContinue.click();
	}
	function chang(obj, maxg, obj2) {
		if (obj.style.pixelHeight) {
			hide(obj, maxg, obj2);
			nopen = '';
			whichcontinue = '';
		} else if (nopen) {
			whichContinue = obj2;
			nopen.click();
		} else {
			show(obj, maxg, obj2);
			nopen = obj2;
			whichContinue = '';
		}
	}
</script>
<script type="text/javascript">
	function showsubmenu(sid) {
		var whichEl = eval("submenu" + sid);
		var menuTitle = eval("menuTitle" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
		}
	}
</script>
</head>

<body leftmargin="0" topmargin="0" bgcolor="#FF9800">
<table cellspacing="0" cellpadding="0" width="100%" align="left"
	border="0">
	<TBODY>
		<TR>
			<TD vAlign=top>
			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD vAlign=bottom height=42><IMG height=38
							src="images/title.gif" width=158></TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD class=list_title onMouseOver="this.typename='list_title2';"
							onmouseout="this.typename='list_title';"
							background="images/title_quit.gif" height=25><SPAN><a
							href="admin_main.jsp" target="main"><B>管理首页</B> </A>/<a href="AdminProcess?action=logout"
							><B>退出</B> </A> </SPAN></TD>
					</TR>
				</TBODY>
			</TABLE>
			&nbsp;

			<table cellspacing=0 cellpadding=0 width=158 align=center>
				<tbody>
					<tr style="CURSOR: hand">
						<td class=list_title id=list9
							onMouseOver="this.typename='list_title2';"
							onClick=chang(menu9,60,list9);
							onMouseOut="this.typename='list_title';"
							background="images/title_show.gif" height=25><span>公告管理</span>
						</td>
					</tr>
					<tr>
						<td valign="middle">
						<div class=sec_menu id=menu9
							style="DISPLAY: none; FILTER: alpha(Opacity =         0); WIDTH: 158px; HEIGHT: 0px">
						<table cellspacing=2 cellpadding=0 width=135 align=center>
							<tbody>
								<tr>
									<td height=25><a href="AfficheProcess?action=pubaffiche"
										target="main">发布公告</a></td>
								</tr>
								<tr>
									<td height=25><a href="AfficheProcess?action=manageaffiche" target="main">所有公告</a>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						</td>
					</tr>
				</tbody>
			</table>
			&nbsp;

			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD class=list_title id=list2
							onmouseover="this.typename='list_title2';"
							onclick=chang(menu2,60,list2);
							onmouseout="this.typename='list_title';"
							background="images/title_show.gif" height=25><SPAN>报修管理</SPAN>
						</TD>
					</TR>
					<TR>
						<TD align="center">
						<DIV class=sec_menu id=menu2
							style="DISPLAY: none; FILTER: alpha(Opacity =         0); WIDTH: 158px; HEIGHT: 0px">
						<TABLE cellSpacing=2 cellPadding=0 width=135 align=center>
							<TR>
								<TD height=25><a href="BxProcess?action=bxmanage&bxmanagetype=finished" target="main">报修管理</a>
								</TD>
							</TR>
							<TBODY>
								<TR>
									<TD height=25><a href="BxProcess?action=feedbackmanage"
										target="main">反馈管理</a></TD>
								</TR>
							</TBODY>
						</TABLE>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			&nbsp;

			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD class=list_title id=list3
							onmouseover="this.typename='list_title2';"
							onclick=chang(menu3,60,list3);
							onmouseout="this.typename='list_title';"
							background="images/title_show.gif" height=25><SPAN>分类管理</SPAN>
						</TD>
					</TR>
					<TR>
						<TD valign="middle">
						<DIV class=sec_menu id=menu3
							style="DISPLAY: none; FILTER: alpha(Opacity =         0); WIDTH: 158px; HEIGHT: 0px">
						<TABLE width=135 align=center cellPadding=0 cellSpacing=2>
							<TBODY>
								<TR>
									<TD height=25><a href="CategorizationManage?action=locations" target="main">部门分类管理</a>
									</TD>
								</TR>
								<TR>
									<TD height=25><a href="CategorizationManage?action=items" target="main">物品分类管理</a>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			&nbsp;

			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD class=list_title id=list10
							onmouseover="this.typename='list_title2';"
							onclick=chang(menu10,60,list10);
							onmouseout="this.typename='list_title';"
							background="images/title_show.gif" height=25><SPAN>用户管理</SPAN>
						</TD>
					</TR>
					<TR>
						<TD valign="middle">
						<DIV class=sec_menu id=menu10
							style="DISPLAY: none; FILTER: alpha(Opacity =         0); WIDTH: 158px; HEIGHT: 0px">
						<TABLE width=135 align=center cellPadding=0 cellSpacing=2>
							<TBODY>
								<TR>
									<TD height=25><a href="UserManage?action=userlist" target="main">用户列表</a>
									</TD>
								</TR>
								<TR>
									<TD height=25><a href="admin_user_add.jsp" target="main">添加用户</a>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			&nbsp; <script type="text/javascript">
						var nopen = "";
						var whichContinue = '';
					</script> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
			&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
			<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
				<TBODY>
					<TR style="CURSOR: hand">
						<TD class=list_title id=list8
							onmouseover="this.typename='list_title2';" onclick=chang(menu8,
							80, list8);;
onmouseout=this.typename
							= 'list_title';;
background="images/title_show.gif" height=25><SPAN>系统信息</SPAN>
						</TD>
					</TR>
					<TR>
						<TD valign="middle">
						<DIV class=sec_menu id=menu8
							style="FILTER: alpha(Opacity =         100); WIDTH: 158px; HEIGHT: 80px">
						<TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
							<TBODY>
								<TR>
									<TD height=30>
									<p style="line-height: 200%"><A onfocus=this.blur();
										href="#">版权所有：分院校园网</A>
									</TD>
								</TR>
								<TR>
									<TD height=30>
									<p style="line-height: 200%"><a onFocus=this.blur();
										href="http://www.njacc.cn" target=_blank>技术支持：分院校园网</a>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<p class="sec_menu">&nbsp;</p>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

			<table border="0" WIDTH="100%" HEIGHT="20%"
				style="border-collapse: collapse" bordercolor="#111111"
				cellpadding="0" cellspacing="0" bgcolor="#799AE1">
				<tr>
					<td></td>
				</tr>
			</table>
</table>
</body>
</html>