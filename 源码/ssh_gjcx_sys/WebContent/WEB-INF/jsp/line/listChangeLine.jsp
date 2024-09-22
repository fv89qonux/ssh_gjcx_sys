<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String[] str = (String[])request.getAttribute("str");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公交线路信息</title>
    
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
	 
	 	<c:if test="${count==0}">
	 	<table>
    			<tr>
    				<th align="center">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"> 对不起，没有找到符合条件的乘车方案！</font></th>
    			</tr>
    		</table>
	 	</c:if>
	 	<c:if test="${count!=0}">
    		<table>
    			<tr>
    				<th align="center">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				从&nbsp;&nbsp; &nbsp;<s:property value="linedto.tbLine.routef"/> &nbsp;
    				到 &nbsp;<s:property value="linedto.tbLine.routeend"/>&nbsp; &nbsp; &nbsp;您总共有 &nbsp;<font color="red">${count}</font>&nbsp;&nbsp;&nbsp;种换乘方案可选</th>
    			</tr>
    		</table>
    		<br/>
		  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	<tr bgcolor="#EEEEEE">
    		<th align="left"  align="center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		换乘方案一览表</th>
    	</tr>
    	
    	<s:iterator value="#request.list" var="dto">
		<tr bgcolor="#EEEEEE">
		<td align="left" colspan="7"><li>从  <b><s:property value="linedto.tbLine.routef"/></b>   
		坐   <b><s:property value="#dto.firstLine.nameboard"/></b>   
		到  <b ><font color="red"><s:property value="#dto.change"/></font></b> ，再从   
		<b><font color="red"><s:property value="#dto.change"/></font></b>   
		坐   <b><s:property value="#dto.secondLine.nameboard"/></b>  
		到  <b><s:property value="linedto.tbLine.routeend"/></b></li>
		</td>
		</tr>
    	</s:iterator>
    	</table>
    	</c:if>
		     <table width="99%" align="center">
		    	<tr height="35">
		    		<td width="20%">&nbsp;</td>
		  			<td   align="center"  bgcolor="#FFFFFF">
		  			<input type="button" value="返回" class="button" onclick="window.history.back();" style="cursor: default"/>
		  			</td>
		  			<td width="20%">&nbsp;</td>
		  		</tr>
		  		
		  		<tr><td align="right" colspan="7">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/line/line_searchQ.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
									<pg:param name="linedto.tbLine.routef" value="${linedto.tbLine.routef}"/>
									<pg:param name="linedto.tbLine.routeend" value="${linedto.tbLine.routeend}"/>
									<pg:first><a href="${pageUrl }" id="first">首页</a></pg:first>
									<pg:prev><a href="${pageUrl }">上一页</a><pg:param name="test" value="testss"/></pg:prev>
									<pg:pages>
										<c:choose>
											<c:when test="${currentPageNumber==pageNumber}"><b>${pageNumber }</b></c:when>
											<c:otherwise><a href="${pageUrl }">${pageNumber }</a></c:otherwise>
										</c:choose>
									</pg:pages>
									<pg:next><a href="${pageUrl }">下一页</a></pg:next>
									<pg:last><a href="${pageUrl }">末页</a></pg:last>
					</pg:pager>
					</p>
</td></tr>
    		</table>
		
  </body>
</html>
