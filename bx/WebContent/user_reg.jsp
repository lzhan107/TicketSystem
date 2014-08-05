<%@ page language="java" contentType="text/html; charset=GBK" import="java.util.Date"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<script type="text/javascript">
function FrmAddLink_onsubmit() {
	if (document.FrmAddLink.user_name.value=="")
		{
		  alert("对不起，请输入用户名！")
		  document.FrmAddLink.user_name.focus()
		  return false
		 }
	else if (document.FrmAddLink.zs_name.value=="")
		{
		  alert("对不起，请输入真实姓名！")
		  document.FrmAddLink.zs_name.focus()
		  return false
		 }
	else  if (document.FrmAddLink.password.value=="")
		{
		  alert("对不起，请您输入密码！")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password.value.length < 4)
		{
		  alert("为了安全，您的密码应该长一点！")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password.value.length > 16)
		{
		  alert("您的密码太长了吧！")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.user_name.value==document.FrmAddLink.password.value)
		{
		  alert("为了安全，用户名与密码不应该相同！")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password_two.value=="")
		{
		  alert("对不起，请您输入验证密码！")
		  document.FrmAddLink.password_two.focus()
		  return false
		 }
	else if (document.FrmAddLink.password_two.value == document.FrmAddLink.password.value)
		{
		  alert("对不起，您两次输入的密码不一致！")
		  document.FrmAddLink.password_two.focus()
		  return false
		 }
	}	
</script>
</head>
<%@include file="head.jsp" %>
<body>
<%
String uname1 = (String)request.getSession().getAttribute("uname");
%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" ><strong><span class="style1">注册新用户名</span>
      </strong>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="608" align="center">    
            <form method="POST" action="UserProcess" name="FrmAddLink" LANGUAGE="javascript" onSubmit="return FrmAddLink_onsubmit()">
              <table width="500" height="66" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100%" valign="top" height="43"><table border="0" width="100%" cellspacing="1" cellpadding="0"  class="tableBorder">
                      <tr bgcolor="#FFFFCC">
                        <td height="40" colspan="2"><p align="center"><span class="style2">第二步：填入你的想用于登陆的用户名和密码</span><br>
                            <strong><font color="#FF0000">请填好下表提交，并记住用户名和密码，用于以后登陆时的身份验证</font></strong></td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">用户名称：</td>
                        <td width="76%" height="14" class="TableRow2">&nbsp;
                          <input name="uname" type="text" class="wu" size="18" value="<%=uname1 %>" > <!-- onKeyUp="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onKeyDown="if(event.keyCode==13)event.keyCode=9" -->
                        &nbsp; <span class="style1">建议使用手机号</span> </td>
                      </tr>
                      <tr >
                        <td height="30" align="right" class="TableRow2">真实姓名：</td>
                        <td width="76%" height="15" class="TableRow2">&nbsp; <input name="Username" type="text" class="wu" size="18"> <!-- js code:onKeyUp="value=value.replace(/[ -~]/g,'')" onKeyDown="if(event.keyCode==13)event.keyCode=9" -->
                        &nbsp; <span class="style1">只受理真实姓名报修</span> </td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">用户密码：</td>
                        <td width="76%" height="30" class="TableRow2">&nbsp;
                          <input name="Password" type="password" class="wu" size="18">
                          &nbsp; <span class="style1">不能少于4位</span></td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">
						验证密码：</td>
                        <td width="76%" height="30" class="TableRow2">&nbsp;
                      <input name="password_two" type="password" class="wu" size="18">
                      <input type="hidden" name="action" value="userregistration">
                          &nbsp; <span class="style1">验证密码是njacc.edu</span></td>
                          
                          </tr>
                  </table></td>
                </tr>
              </table>
              　<br>
                  <input name="B1" type="submit" class="button2" value="提 交">
                  &nbsp;&nbsp;
                  <input name="B2" type="reset" class="button2" value="重 写">
             
            </form></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>