<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String[] str = (String[])request.getAttribute("str");
String[] str1 = (String[])request.getAttribute("str1");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
	        <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif">
			</td>
	     </tr>
	 	</table>
	 	<s:form action="line_lineDetail" method="post" namespace="/line">
    		<table>
    			<tr>
    				<td width="15%">线路名称:</td>
    				<td width="15%"><s:property value="#request.list[0].nameboard"/>&nbsp;&nbsp;&nbsp;</td>
    				<td align="center">营运时间: <s:property value="#request.list[0].runtime"/></td>
    				<td width="30%"><%--营运时间:--%>&nbsp;</td>
    			</tr>
    			<tr>
    				<td width="15%">票&nbsp;&nbsp;&nbsp;&nbsp;价:</td>
    				<td width="15%"><s:property value="#request.list[0].price"/></td>
    				<td align="center">全程运营时间:<s:property value="#request.list[0].globalprice"/></td>
    				<td >发车频率:<s:property value="#request.list[0].frequency"/></td>
    			</tr>
    		</table>
    		<table align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" width="100%">
    		<tr>
    			<td align="center" ><s:property value="#request.list[0].nameboard"/>车</td>
    		</tr>
    		<tr>
    			<td>
    				<table width="100%">
		    			<tr>
			    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center" width="100%">
			    				(起点)<s:property value="#request.list[0].routef"/>-----<s:property value="#request.list[0].routeend"/>(终点)
			    			</td>
			    		</tr>
		    			<% 
		    			if(str!=null&&str.length>0){
		    				int j=str.length -1;
		    				for(int i=0;i<str.length;i++){
		    			 %>
	    					<tr>
			    				<td class="tableboder"  bgcolor="#FFFFFF" align="center">&nbsp;<%=str[i] %></td>
			    			</tr>
			    		<%}
			    		}%>
			    	</table>
    		    </td>
    		<%--
    		<td  >
    		<table>
    			<tr>	
	    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
	    				(起点)<s:property value="#request.list[1].routef"/>-----<s:property value="#request.list[1].routeend"/>(终点)
	    			</td>
	    		</tr>
	    			<% int jj=str1.length -1;
	    				for(int i=0;i<str1.length;i++){
	    			 %>
    			<tr>
		    		<td  class="tableboder"   bgcolor="#FFFFFF" align="center">&nbsp;<%=str1[i] %></td>
		    	</tr>
		    	<% }%>
    		</table>
    		</td>
    		--%>
    		</tr>	
		   </table>
		    <table align="center">
		    	<tr>
    				<td  class="tableboder"   bgcolor="#FFFFFF" align="center" width="20%">线路提示：</td>
    					<td  class="tableboder"   bgcolor="#FFFFFF" align="left" >
    					&nbsp;<s:property value="#request.list[0].prompt"/>
    				</td>
	    		</tr>
	    		<tr>
    				<td  class="tableboder"   bgcolor="#FFFFFF" align="center" width="20%">线路类型：</td>
    					<td  class="tableboder"   bgcolor="#FFFFFF" align="left" >
    					&nbsp;<s:property value="#request.list[0].mold"/>
    				</td>
	    		</tr>
		    <tr>
    				<td  class="tableboder"   bgcolor="#FFFFFF" align="center" width="20%">备&nbsp;&nbsp;注：</td>
    					<td  class="tableboder"   bgcolor="#FFFFFF" align="left" >
    					&nbsp;<s:property value="#request.list[0].memo"/><s:property value="#request.list[1].memo"/>
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
