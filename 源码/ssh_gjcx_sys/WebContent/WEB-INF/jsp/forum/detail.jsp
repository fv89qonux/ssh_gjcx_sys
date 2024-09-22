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
    <title>详细信息</title>
   <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"> 

		function doSelect(_title,id){
			var actions;
			actions="forum/forum_insertDetail?forumid="+_title;
			document.forum.action = actions;
			document.forum.submit();
		}
	</script>
  </head>
  
<body>
	<s:form action="forum_insertDetail" method="post" namespace="/forum" name="forum">
  	<table width="588" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
        <td height="33" background="<%=request.getContextPath()%>/images/shop_12.gif"></td>
        <td width="545" height="33" align="right" valign="middle" background="<%=request.getContextPath()%>/images/shop_12.gif"><table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">您好！欢迎登录 ！</marquee></td>
          </tr>
        </table></td>
        <td width="10" background="<%=request.getContextPath()%>/images/shop_12.gif">&nbsp;</td>
      </tr>
     
       <tr>
        <td width="88" height="50" background="<%=request.getContextPath()%>/images/shop_15.gif">&nbsp;</td>
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right">
         <div align="center" ><font class="word_green" size="3"><b >公交论坛</b></font></div>
         <a href="<%=request.getContextPath()%>/forum/forum_detailInit?forumd=<s:property value="#request.list[0].id"/>">[ <img src="<%=request.getContextPath()%>/images/list.gif" width="11" height="13">发言]</a>
		</td>
     
   		</tr>
 	</table>
  	
	<table width="100%" align="center" border="0"  class="newfont03">
  		<tr >
  			<td  align="center" width="100%" bgcolor="#FFFFFF" colspan="2"><div align="center" ><font class="word_green" size="5"><b >
  			&nbsp;<s:property value="#request.list[0].title"></s:property></b></font></div></td>
  		</tr>
  		<c:if test="${! empty detail}">
  		<s:iterator value="#request.detail" var="detail">
  		<tr>
  		
	  			<td  align="center" width="100%" colspan="2" bgcolor="#FFFFFF" >
	  			<table width="100%" align="center" border="0"  class="newfont03">
	  			<tr>
	  			<td  bgcolor="#FFCCFF"  colspan="2" >
	  			<div style="white-space10px; word-spacing: 15px;margin-left: 20px; margin-right: 20px">	<font style="color: #421AE6" size="3"><b >&nbsp;<s:property value="#detail.content" ></s:property></b></font>
	  		
	  			</div></td></tr>
	  			<tr>
	  			<td width="68%">&nbsp;</td>
	  			<td  bgcolor="#FFFFFF"  align="left"><font style="color: #421AE6">&nbsp;&nbsp;回复人：<s:property value="#detail.who"></s:property></font><br/>
	  			</td></tr>
	  			<tr>
	  			<td width="68%">&nbsp;</td>
	  			<td bgcolor="#FFFFFF"  align="left"><font style="color: #421AE6" >回复时间：<s:property value="#detail.intime"></s:property></font></td></tr>
	  			</table></td>
	  			</tr>
	  		
  		</s:iterator>
  		
  		<tr><td align="right">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }"url="${ctx}/forum/forum_detail.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
									<pg:param name="forumdto.tbForum.id" value="${forumdto.tbForum.id}"/>
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
  		</c:if>
  		<c:if test="${empty detail}">
  			<tr >
	  			<td  bgcolor="#FFCCFF"  colspan="2" align="center">
	  				<font  class="word_green" size="5">&nbsp;&nbsp;暂无回复</font>
	  			</td></tr>
  		</c:if>
  	</table>
  	
  	
    <table  align="center">
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
