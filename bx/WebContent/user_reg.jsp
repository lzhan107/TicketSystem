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
		  alert("�Բ����������û�����")
		  document.FrmAddLink.user_name.focus()
		  return false
		 }
	else if (document.FrmAddLink.zs_name.value=="")
		{
		  alert("�Բ�����������ʵ������")
		  document.FrmAddLink.zs_name.focus()
		  return false
		 }
	else  if (document.FrmAddLink.password.value=="")
		{
		  alert("�Բ��������������룡")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password.value.length < 4)
		{
		  alert("Ϊ�˰�ȫ����������Ӧ�ó�һ�㣡")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password.value.length > 16)
		{
		  alert("��������̫���˰ɣ�")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.user_name.value==document.FrmAddLink.password.value)
		{
		  alert("Ϊ�˰�ȫ���û��������벻Ӧ����ͬ��")
		  document.FrmAddLink.password.focus()
		  return false
		 }
	else if (document.FrmAddLink.password_two.value=="")
		{
		  alert("�Բ�������������֤���룡")
		  document.FrmAddLink.password_two.focus()
		  return false
		 }
	else if (document.FrmAddLink.password_two.value == document.FrmAddLink.password.value)
		{
		  alert("�Բ�����������������벻һ�£�")
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
    <td align="center" ><strong><span class="style1">ע�����û���</span>
      </strong>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="608" align="center">    
            <form method="POST" action="UserProcess" name="FrmAddLink" LANGUAGE="javascript" onSubmit="return FrmAddLink_onsubmit()">
              <table width="500" height="66" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100%" valign="top" height="43"><table border="0" width="100%" cellspacing="1" cellpadding="0"  class="tableBorder">
                      <tr bgcolor="#FFFFCC">
                        <td height="40" colspan="2"><p align="center"><span class="style2">�ڶ�����������������ڵ�½���û���������</span><br>
                            <strong><font color="#FF0000">������±��ύ������ס�û��������룬�����Ժ��½ʱ�������֤</font></strong></td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">�û����ƣ�</td>
                        <td width="76%" height="14" class="TableRow2">&nbsp;
                          <input name="uname" type="text" class="wu" size="18" value="<%=uname1 %>" > <!-- onKeyUp="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onKeyDown="if(event.keyCode==13)event.keyCode=9" -->
                        &nbsp; <span class="style1">����ʹ���ֻ���</span> </td>
                      </tr>
                      <tr >
                        <td height="30" align="right" class="TableRow2">��ʵ������</td>
                        <td width="76%" height="15" class="TableRow2">&nbsp; <input name="Username" type="text" class="wu" size="18"> <!-- js code:onKeyUp="value=value.replace(/[ -~]/g,'')" onKeyDown="if(event.keyCode==13)event.keyCode=9" -->
                        &nbsp; <span class="style1">ֻ������ʵ��������</span> </td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">�û����룺</td>
                        <td width="76%" height="30" class="TableRow2">&nbsp;
                          <input name="Password" type="password" class="wu" size="18">
                          &nbsp; <span class="style1">��������4λ</span></td>
                      </tr>
                      <tr >
                        <td width="24%" height="30" align="right" class="TableRow2">
						��֤���룺</td>
                        <td width="76%" height="30" class="TableRow2">&nbsp;
                      <input name="password_two" type="password" class="wu" size="18">
                      <input type="hidden" name="action" value="userregistration">
                          &nbsp; <span class="style1">��֤������njacc.edu</span></td>
                          
                          </tr>
                  </table></td>
                </tr>
              </table>
              ��<br>
                  <input name="B1" type="submit" class="button2" value="�� ��">
                  &nbsp;&nbsp;
                  <input name="B2" type="reset" class="button2" value="�� д">
             
            </form></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>