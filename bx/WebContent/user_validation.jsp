<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<script type="text/javascript">
function  form_onsubmit()
{
  var strTemp = document.form.admin_valcode.value;
  if (strTemp.length == "" )
  {
      alert("验证密码不能为空！");
      document.form.admin_valcode.focus();
      return false;
  }  
}
</script>
</head>
<%@include file="head.jsp" %>
<body>

<table width="760" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="30" align="center"><span class="style1"><strong>注册新用户</strong></span></td>
  </tr>
</table>
<div align="center"></div>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
	<form action="UserProcess" method="POST" name="form" id="form" onSubmit="return form_onsubmit()">

  <table width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><table width="500" border="0" align="center" cellpadding="0" cellspacing="1" class="TableBorder">
        <tr bgcolor="#FFFFCC">
          <td height="40" colspan="2"><p align="center"><strong>第一步：验证您的身份</strong><br />
                  <span class="style1">验证密码是njacc.edu </span></p></td>
        </tr>
        <tr bgcolor="#FFFFFF" >
          <td height="30" align="center" class="TableRow2">验证密码 ：&nbsp;
              <input name="admin_valcode" type="password" class="wu" id="password" size="30" />
              <input type="hidden" name="action" value="userregistrationRequest">
          </td>
        </tr>
      </table></td>
    </tr>
  </table>
  <p align="center"><input name="join0" type="submit" class="button2" id="join3" value=" 下一步 " >
  </p>
</form></td>
  </tr>
</table>
<%@include file="copyright.jsp" %>
</body>
</html>