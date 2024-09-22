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
	<table width="588" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
        <td height="33" background="<%=request.getContextPath()%>/images/shop_12.gif"></td>
        <td width="505" height="33" align="right" valign="middle" background="<%=request.getContextPath()%>/images/shop_12.gif"><table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">您好！欢迎登录 ！</marquee></td>
          </tr>
        </table></td>
        <td width="10" background="<%=request.getContextPath()%>/images/shop_12.gif">&nbsp;</td>
      </tr>
     
       <tr>
        <td width="88" height="50" background="<%=request.getContextPath()%>/images/shop_15.gif">&nbsp;</td>
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif"><div align="center" ><font class="word_green" size="3"><b >用户留言</b></font></div>
		</td>
     
   		</tr>
 	</table>
  	
	<s:form action="message_detail" method="post" namespace="/message">
  	<table width="588" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
  		<tr height="35">
  			<td  align="right" width="15%" bgcolor="#FFFFFF" >标题：</td>
  			<td  bgcolor="#FFFFFF" width="85%">&nbsp;<s:property value="#request.list[0].title"></s:property></td>
  		</tr>
  		<tr height="35" >
  			<td   align="right" bgcolor="#FFFFFF">留言人：</td>
  			<td  bgcolor="#FFFFFF" width="85%">&nbsp;<s:property value="#request.list[0].who"></s:property></td>
  		</tr>
  		<tr height="35" >
  			<td   align="right" bgcolor="#FFFFFF">回复人：</td>
  			<td  bgcolor="#FFFFFF" width="85%">&nbsp;<s:property value="#request.list[0].renamea"></s:property></td>
  		</tr>
  		
  		<tr height="35">
  			<td   align="right"  bgcolor="#FFFFFF">内容：</td>
  			<td  bgcolor="#FFFFFF"  width="85%">
  				&nbsp;<s:textarea name="#request.list[0].content" cssClass="text" id="content" cols="60" rows="10" disabled="true"></s:textarea>
  			</td>
  		</tr>
  		<tr height="35">
  			<td   align="right"  bgcolor="#FFFFFF">管理员回复：</td>
  			<td  bgcolor="#FFFFFF"  width="85%">
  			&nbsp;<s:textarea name="#request.list[0].reflex" cssClass="text" id="reflex" cols="60" rows="10" disabled="true"></s:textarea>
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
