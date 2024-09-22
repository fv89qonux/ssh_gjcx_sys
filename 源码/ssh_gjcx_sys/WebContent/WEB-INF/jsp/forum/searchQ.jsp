<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page import="com.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
TbMember username=((TbMember)session.getAttribute("username"));
if(username==null){
	out.println("<script language='javascript'>alert('请先登录!');window.history.go(-1);</script> ");
	
}
%>
<html>
<head>
<base href="<%=basePath%>">
<title>公交查询系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
       
</head>
<body >
<s:form action="forum_searchQ" namespace="/forum" method="post">
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right">
         <div align="center" ><font class="word_green" size="3"><b >公交论坛</b></font></div>
         <a href="<%=request.getContextPath()%>/forum/forum_insertInit">[ <img src="<%=request.getContextPath()%>/images/list.gif" width="11" height="13">创建话题]</a>
		</td>
     
   		</tr>
 	</table>
    
            
                
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="10" >&nbsp;</td>
            </tr>
            <tr valign="top">
              <td  align="center">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <th height="30" class="tableBorder_B_dashed" align="center" ><font class="word_green" size="2"><b >&nbsp;标题</b></font></th>
                      <th height="30" class="tableBorder_B_dashed" width="80px"><font class="word_green" size="2"><b >&nbsp;创建人</b></font></th>
                      <th height="30" class="tableBorder_B_dashed" ><font class="word_green" size="2"><b >&nbsp;发布日期</b></font></th>
                    </tr>
					<s:iterator value="#request.forumList" var="forum">
						<tr >
							<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    							&nbsp;<a href="<%=request.getContextPath()%>/forum/forum_detail.action?forumdto.tbForum.id=<s:property value='#forum.id'/>" target=mainFrame><s:property value="#forum.title"/></a>
    						</td>
			    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center"  width="80px">
    							&nbsp;<s:property value="#forum.father"/>
    						</td>
			    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center" >
    							<s:property value="#forum.intime"/>
    						</td>
			    		
			    		</tr>
			    		<tr >
							<td colspan="4"> &nbsp;</td>
			    		</tr>
                    </s:iterator>
                    <tr><td align="right" colspan="4">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/forum/forum_searchQ.action" items="${totalCount }"
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
           </table></td>
          </tr>
      </table>

</s:form>
</body>
</html>

