<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>详细信息</title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
	
  </head>
  
<body>
	<table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
   		</tr>
 	</table>
  	
	<s:form action="user_detail" method="post" namespace="/user">
  	<table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
  		<tr class="CTitle" >
              <td height="22" colspan="7" align="center" style="font-size:16px">详细信息</td>
         </tr>
  		<tr height="35">
  			<td  align="right" width="15%" bgcolor="#FFFFFF" >用户名：</td>
  			<td  bgcolor="#FFFFFF" width="85%">&nbsp;<s:property value="#request.list[0].userName"></s:property></td>
  		</tr>
  		<tr height="35" >
  			<td   align="right" bgcolor="#FFFFFF">真实姓名：</td>
  			<td  bgcolor="#FFFFFF" width="85%">&nbsp;<s:property value="#request.list[0].trueName"></s:property></td>
  		</tr>
  		<tr height="35">
  			<td   align="right"  bgcolor="#FFFFFF">地址：</td>
  			<td  bgcolor="#FFFFFF"  width="85%">&nbsp;<s:property value="#request.list[0].address"></s:property></td>
  		</tr>
  		<tr height="35">
  			<td   align="right"  bgcolor="#FFFFFF">电子邮箱：</td>
  			<td  bgcolor="#FFFFFF"  width="85%">&nbsp;<s:property value="#request.list[0].email"></s:property></td>
  		</tr>
  		
  		
    </table>
    <table width="99%" align="center">
    	<tr height="35">
    		<td width="20%">&nbsp;</td>
  			<td   align="center"  bgcolor="#FFFFFF">
  			<input type="button" value="返回" class="button" onclick="window.history.back();" style="cursor: default"/>
  			</td>
  			<td width="20%">&nbsp;</td>
  		</tr>
    </table>
    </s:form>
</body>
</html>
