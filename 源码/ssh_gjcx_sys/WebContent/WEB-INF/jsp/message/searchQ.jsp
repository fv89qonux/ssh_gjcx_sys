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
<title>公交查询系统</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
       
</head>
<body>
<s:form action="message_searchQ" namespace="/message" method="post">


<table width="100%"  border="0" cellpadding="0" cellspacing="0">
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right">
          <div align="center" ><font class="word_green" size="3"><b >用户留言</b></font></div>
    
         <a href="message/message_insertInit">[ <img src="<%=request.getContextPath()%>/images/list.gif" width="11" height="13">留言&nbsp;&nbsp;&nbsp;&nbsp;]</a></td>
     
      </tr>
    </table>
    
<table width="588"  border="0" cellspacing="0" cellpadding="0" align="center">
 <tr>
 <td class="tableBorder">
<table width="588" height="236"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    
    <td valign="top">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
           
            <tr valign="top">
              <td  align="center">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <th height="30" class="tableBorder_B_dashed" align="center"> 
                       <div align="center" ><font class="word_green" size="3"><b >&nbsp;标题</b></font></div></th>
                      <th  height="30" class="tableBorder_B_dashed" align="center">
                        <div align="center" ><font class="word_green" size="3"><b >&nbsp;留言人</b></font></div></th>
                    </tr>
					<s:iterator value="#request.messageList" var="message">
						<tr >
							<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    							&nbsp;<a href="message/message_detail?messagedto.tbMessage.id=<s:property value='#message.id'/>" target=mainFrame><s:property value="#message.title"/></a>
    						</td>
			    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
			    				&nbsp;<a href="message/message_detail?messagedto.tbMessage.id=<s:property value='#message.id'/>" target=mainFrame><s:property value="#message.who"/></a>
			    			</td>
    					</tr>
    					<tr><td>&nbsp;</td></tr>
                    </s:iterator>
                    
                    <tr><td align="right" colspan="3">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/message/message_searchQ.action" items="${totalCount }"
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
      </table></td>
  </tr>
</table>


</td>
</tr>
</table>
</s:form>
</body>
</html>

