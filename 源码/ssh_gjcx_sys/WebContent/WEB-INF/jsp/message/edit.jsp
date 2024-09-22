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
	<title>用户<%=title%></title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"> 

		function doSelect(id){
			
			if (document.getElementById("reflex").value==""){
				alert("回复信息不能为空");
				return false;
			}
			actions="message/message_update";
			
			document.new1.action = actions;
			document.new1.submit();
		}
	</script>

</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr >
          <td width="100%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
 		</tr>
	</table>
	<s:form name="new1"  namespace="/message" action="message_update" method="post">
	<table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
	 	<tr class="CTitle"> 
           	 <th class="tablestyle_title" align="center">回复信息</th>
        </tr>
		
		<tr>
			<td>
			<fieldset style="height:100%;">
			<legend>信息回复</legend>
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td width="10%"  align="right" nowrap>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
						<td  bgcolor="#FFFFFF" class="tableboder">
							<s:property value="messagedto.tbMessage.title" />
  						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>留言人：</td>
						<td  bgcolor="#FFFFFF" class="tableboder">
							<s:property value="messagedto.tbMessage.who" />
  						</td>
					</tr>
					
					<tr>
						<td width="10%"  align="right" nowrap>内容：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="messagedto.tbMessage.content" cssClass="text" id="content" cols="70" rows="15" readonly="true"/>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>回复：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="messagedto.tbMessage.reflex" cssClass="text" id="reflex" cols="70" rows="15" /><span class="red"> *</span>
						</td>
					</tr>
					
					<tr>
							<td>
							<s:hidden id="id" name="messagedto.tbMessage.id"/>
							<s:hidden id="title" name="messagedto.tbMessage.title"/>
							<s:hidden id="who" name="messagedto.tbMessage.who"/>
							<s:hidden id="intime" name="messagedto.tbMessage.intime"/></td>	
							<td>&nbsp;</td>
					</tr>
					
					</table>
					</fieldset>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="保存" class="button" onClick="doSelect('<s:property value='messagedto.tbMessage.id'/>');"/>　
			<input type="button"  value="返回" class="button" onClick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
