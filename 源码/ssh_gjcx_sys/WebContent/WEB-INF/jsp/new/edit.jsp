<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String title = (String)request.getAttribute("title");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>信息<%=title%></title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript"> 

		function doSelect(_title,usersid){
			var actions;
			
			if (document.getElementById("title").value==""){
				alert("标题不能为空");
				return false;
			}
			
			if (document.getElementById("content").value==""){
				alert("内容不能为空");
				return false;
			}
			
			if(_title=="更新"){
				actions="new/new_update";
			} else {
				actions="new/new_insert";
			}
			document.new1.action = actions;
			document.new1.submit();
		}
	</script>

</head>

<body>
	<table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
 		</tr>
	</table>
	<s:form name="new1"  namespace="/new" action="new_insert" method="post">
	<table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
	 	<tr class="CTitle"> 
           	 <th class="tablestyle_title" align="center"><%=title%></th>
        </tr>
		
		<tr>
			<td>
			<fieldset style="height:100%;">
			<legend>编辑信息</legend>
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>标题：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="newdto.tbGg.title" cssClass="text"  id="title" size="93"/><span class="red"> *</span>
							</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>内容：</td>
							<td class="tableboder" bgcolor="#FFFFFF">
								&nbsp;<s:textarea name="newdto.tbGg.content" cssClass="text" id="content" cols="60" rows="15"/><span class="red"> *</span>
							</td>
							<td>&nbsp;</td>
					</tr>
					<tr>
							
							<td>&nbsp;<s:hidden id="intime" name="newdto.tbGg.intime"/>
							<s:hidden id="id" name="newdto.tbGg.id"/></td>	
					</tr>
					
							</table>
					</fieldset>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="保存" class="button" onclick="doSelect('<%=title%>','<s:property value='newdto.tbGg.id'/>');"/>　
			<input type="button"  value="返回" class="button" onclick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
