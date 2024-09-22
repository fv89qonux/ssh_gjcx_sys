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
    <title>图片信息</title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    
 </head>
  
<body>
<s:form action="pic_detail" method="post" namespace="/pic">
<table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
    
    <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
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
        <td width="93" height="50" background="<%=request.getContextPath()%>/images/shop_15.gif">&nbsp;</td>
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="center">
          <div align="center" ><font class="word_green" size="3"><b >公交图片</b></font></div>
         </td>
     </tr>
 </table>
 <table>
 	<tr>
 		<td>&nbsp;</td>
 	</tr>
 </table>
<table width="99%" align="center" border="0" cellpadding="4" cellspacing="1"class="newfont03" >
    	 <s:iterator value="#request.picList" var="pic">
          <tr>
            <td  align="center" ><img src="images/goods/<s:property value="#pic.pic" />" width="150" height="100"/></td>
          <td>
          <table>
          <tr>
          	<td>&nbsp;</td>
          	<td  align="left">
			名称：<s:property value="#pic.name"/>       	
	        </td>
          </tr>
          <tr>
          		<td>&nbsp;</td>
          		<td  align="left">
	          	简介：<s:property value="#pic.content"/>		
	        </td>
          </tr>
     	  <tr>
     	  	<td>&nbsp;</td>
          	<td  align="left">
	         	 备注：<s:property value="#pic.memo"/>
	        </td>
         </tr>
          <tr>
          <td>&nbsp;</td>
	        <td  align="left">
	          	<a href="images/goods/<s:property value="#pic.pic"/>" target="_bank">点击查看大图</a>
	        </td>
	        </tr>
         </table>
         </td>
         </tr>
         <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
     </s:iterator>
     <tr><td align="right" colspan="1" width="60%">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/pic/pic_searchQ.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
									<pg:first><a href="${pageUrl }" id="first">首页</a></pg:first>
									<pg:prev><a href="${pageUrl }">上一页</a></pg:prev>
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
  <table width="99%" align="center" >
    	<tr height="35" >
    		<td width="20%">&nbsp;</td>
  			<td   align="center" >
  			<input type="button" value="返回" class="button" onclick="window.history.back();" style="cursor: default"/>
  			</td>
  			<td width="20%">&nbsp;</td>
  		</tr>
    </table>
    </td>
    </tr>
    </table>
</s:form>
 
</body>
</html>
