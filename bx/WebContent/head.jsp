<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function save_onclick() {
		var strTemp = document.forms.username.value;
		if (strTemp.length == "") {
			alert("�������û�����");
			document.forms.username.focus();
			return false;
		}
		var strTemp = document.forms.password.value;
		if (strTemp.length == "") {
			alert("���������룡");
			document.forms.password.focus();
			return false;
		}
		var strTemp = document.forms.yan.value;
		if (strTemp.length == "") {
			alert("��������֤�룡");
			document.forms.yan.focus();
			return false;
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_setTextOfTextfield(objName, x, newText) { //v3.0
		var obj = MM_findObj(objName);
		if (obj)
			obj.value = newText;
	}

	function Affiche(chatwindow) {
		var MainWindow = window
				.open(
						chatwindow,
						"_blank",
						"toolbar=no,location=no,menubar=no,scrollbars=no,width=400,height=450,resizeable=no,status=no");
	}
</script>
</head>
<body>
	<form method="post" action="UserProcess" name="forms"
		onsubmit="return save_onclick()">
		<table width="760" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td><img src="images/bx.gif" width="760" height="100"></td>
			</tr>
		</table>
		<table width="760" border="0" cellspacing="0" cellpadding="0"
			align="center">
			<tr bgcolor="#D50000">
				<td height="24" width="1%" bgcolor="#335EA8" align="center"></td>
				<td width="30%" bgcolor="#335EA8"><a href="day.htm"
					target="_blank"><font color="#ffffff"><b><script
									language="JavaScript" src="js/date.js" type="text/javascript"></script>
								<script>
								document.write(+nian)
							</script>��<script>
								document.write(+yue)
							</script>��<script>
								document.write(+ri)
							</script>��&nbsp;����<script>
								document.write("" + week)
							</script> </b> </font> </a>
				</td>
				<td height="25" align="right" bgcolor="#335EA8"><strong>
						<a href="index1.jsp"><font color="#FFFFFF">��ҳ</font> </a><font
						color="#FFFFFF">&nbsp;|</font>&nbsp;<a
						href="UserProcess?action=uservalidation"><font color="#FFFFFF">�û�ע��</font>
					</a><font color="#FFFFFF">&nbsp;|&nbsp;</font><a
						href="BxProcess?action=fillbx"><font color="#FFFF66">���޵Ǽ�</font>
					</a><font color="#FFFFFF">&nbsp;|&nbsp;<a
							href="UserProcess?action=userlogout"><font color="#FFFFFF">ע����¼</font>
						</a> </font> </strong>
				</td>
				<td width="1%" align="right" bgcolor="#335EA8"></td>
			</tr>
		</table>
		<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
			<TBODY>
				<TR>
					<TD height="30" background=IMAGES/T_15.jpg><MARQUEE
							onmouseover=this.stop() onmouseout=this.start() scrollAmount=2
							scrollDelay=5>

							<img src="images/d.gif" width="19" height="18" border="0" /><a
								href="#" onClick="Affiche('ViewAffiche.asp?id=')"
								alt="����鿴������ϸ����"> </a> []

						</MARQUEE></TD>
				</TR>
			</TBODY>
		</TABLE>

		<table width="760" border="0" align="center" cellpadding="5"
			cellspacing="1" bgcolor="#666666">
			<tr>
				<td bgcolor="#FFFFFF"><table border=0 cellpadding=0
						cellspacing=0 rules=cols width="100%" align="center" height="25">
						<tr bgcolor="#FFFFFF">




							<%
								String Username = (String) session.getAttribute("Username");
								String uname = (String) session.getAttribute("uname");
								//�ͻ�������ϲ�ʱ������request
							%>
							<%
								if ("".equals(Username) || null == Username) {
							%>



							<td height="25"><span class="style1"><strong>

								</strong> </span>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">

									<tr>
										<td align="left">�û����� <input name="uname" id="username"
											style="font-size: 9pt; background-color: #CDF0F9" size="10"
											font face="����" value=""> ���룺 <input name="Password"
											type="password" id="password"
											style="font-size: 9pt; background-color: #CDF0F9" size="10"
											font face="����"> ��֤�룺 <!-- <input name="verifycode"
											type="text" style="font-size: 9pt; background-color: #CDF0F9"
											size="5" maxlength="5" font face="����"> --> <font color=white><b></b>
										</font> <input name="Submit" type="submit" value="��½"> <input
											name="Submit" type="reset" value="����"> <input
											type="hidden" name="action" value="userlogin">
										</td>
									</tr>

								</table>
							</td>

							<%
								session.setAttribute("Username", Username);
									session.setAttribute("uname", uname);
								} else
									out.write("�����û�:" + Username + ",���ã������Ҫ�걨������д�����");
							%>


							<td class=content9 bgcolor="#FFFFFF" height="25"><p
									align="right">
									<a href="BxProcess?action=bxmanage&type=personal"
										style="text-decoration: none">�ҵı���&gt;&gt;&gt;</a>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>