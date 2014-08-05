/*<meta http-equiv="Content-Type" content="text/html; charset=gb2312">*/

//把复选框全选或反选。
function CheckAll(elementsA,elementsB)
{
	var len = elementsA;
	if(len.length > 0)
	{
		for(i=0;i<len.length;i++)
		{
			elementsA[i].checked = true;
		}
		if(elementsB.checked ==false)
		{
			for(j=0;j<len.length;j++)
			{
				elementsA[j].checked = false;
			}
		}
	}
	else
	{
		len.checked = true;
		if(elementsB.checked == false)
		{
			len.checked = false;
		}
	}
}
//这个的作用是判断是否选择了复选框。
function Check1(form)
{
	var flag = false;
	var len = self.document.all.item("BoxUser");
	var path ="";
	if(len.length > 0)
	{
		for(j=0;j<len.length;j++)
		{
			if(self.document.all.item("BoxUser",j).checked)
			{
				flag = true;
			}
		}
		if(!flag)
		{
			alert("请选择要删除的项目");
			return false;
		}
	}
	else
	{
		if(len.checked == false)
		{
			alert("请选择要删除的项目");
			return false;
		}
	}
	if(confirm("确定要删除吗？"))
	{
	form.action = "admin_baoxiu_dele.asp";
	form.submit();
	}
}



