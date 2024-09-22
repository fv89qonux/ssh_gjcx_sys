<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page import="com.DB.connDB" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mess = (String)request.getAttribute("mess");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查询页面</title>
      <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />

</head>
  
<body>

	
<s:form action="new_searchQ" namespace="/new" method="post">

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
          <div align="center" ><font class="word_green" size="3"><b >公交新闻</b></font></div>
       
         </td>
     </tr>
 </table>
 <table>
 	<tr>
 		<td>&nbsp;</td>
 	</tr>
 </table>
<table width="100%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	<tr bgcolor="#EEEEEE">
			<td height="30" class="tableBorder_B_dashed" align="center"> <div align="center" ><font class="word_green" size="2"><b >&nbsp;标题</b></font></div></td>
    		 <td height="30" class="tableBorder_B_dashed" align="center"> <div align="center" ><font class="word_green" size="2"><b >&nbsp;发布日期</b></font></div></td>
    	</tr>
   <s:iterator value="#request.newList" var="new1">
    	<tr >
			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
							&nbsp;<a href="new/new_detail?newdto.tbGg.id=<s:property value="#new1.id"/>" target=mainFrame><s:property value="#new1.title"/></a>
						</td>
   			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
							&nbsp;<s:property value="#new1.intime"/>
 						</td>
		</tr>
   </s:iterator> 	
    	<tr><td align="right" colspan="3">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize}" url="${ctx}/new/new_searchQ.action" items="${totalCount}"
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
     </td>
     </tr>
     </table>
    </s:form>
</body>
</html>
