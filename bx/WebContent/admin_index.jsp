<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<frameset rows="35,*" frameborder="NO" border="0" framespacing="0">
	<frame src="admin_top.jsp" noresize="noresize" frameborder="0"
		name="topFrame" scrolling="no" marginwidth="0" marginheight="0" />
	<frameset rows="*" cols="185,*" id="frame">
		<frame src="admin_left.jsp" name="leftFrame" noresize="noresize"
			marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" />
		<frame src="admin_main.jsp" name="main" marginwidth="0"
			marginheight="0" frameborder="0" scrolling="yes" />
	</frameset>
	<noframes>
	<body></body>
	</noframes>
</frameset>
</html>