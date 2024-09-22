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
	 <style type="text/css">
  div {
		word-spacing : 10px;
		
	}
  </style>
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif">
		</td>
     
   		</tr>
 	</table>
  	
	<s:form action="new_detail" method="post" namespace="/new">
  	<table width="588" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCCFF" class="newfont03">
  		<tr height="35">
  			<td  align="right" width="5
  			%" bgcolor="#FFFFFF" ></td>
  			<td  bgcolor="#FFFFFF"  align="center"  ><div><font ><b><s:property value="#request.list[0].title"></s:property></b></font></div></td>
  		<td  align="right" width="5
  			%" bgcolor="#FFFFFF" ></td>
  		</tr>
  		<tr height="35">
  			<td   align="right"  bgcolor="#FFCCFF"></td>
  			<td  bgcolor="#FFCCFF"  width="85%"><div align="left">
  				<p><font>&nbsp;<s:property value="#request.list[0].content"/></font></p></div>
  			</td>
  			<td   align="right"  bgcolor="#FFCCFF">&nbsp;</td>
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
