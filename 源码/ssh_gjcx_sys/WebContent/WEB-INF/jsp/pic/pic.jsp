<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    <title>图片信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
    <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
   		</tr>
    </table>
	<s:form action="pic_detail" method="post" namespace="/pic">
     <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
          	<td>&nbsp;</td>
            <td  align="center" ><img src="images/goods/<s:property value="#request.list[0].pic"></s:property>" ></td>
          </tr>
          <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
          <tr>
          	<td>&nbsp;</td>
          	<td  align="center">
	          	<table>
	          		<tr>
	          			<td align="center" width="20%">名称：</td>
          				<td><s:property value="#request.list[0].name"></s:property>
	          			</td>
	          		</tr>
	          	</table>
	        </td>
          </tr>
          <tr>
          		<td>&nbsp;</td>
          		<td  align="center">
	          	<table>
	          		<tr>
	          			<td align="center" width="20%">简介：</td>
	          			<td><s:property value="#request.list[0].content"></s:property>
	          			</td>
	          		</tr>
	          	</table>
	        </td>
         
          </tr>
     	  <tr>
     	  	<td>&nbsp;</td>
          	<td  align="center">
	          	<table>
	          		<tr>
	          			<td align="center" width="20%">日期：</td>
	          			<td><s:property value="#request.list[0].intime"></s:property>
	          			</td>
	          		</tr>
	          	</table>
	        </td>
         
          </tr>
     	  <tr>
     	  	<td>&nbsp;</td>
          	<td  align="center">
	          	<table>
	          		<tr>
	          			<td align="center" width="20%">备注：</td>
	          			<td><s:property value="#request.list[0].memo"></s:property>
	          			</td>
	          		</tr>
	          	</table>
	        </td>
         
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
