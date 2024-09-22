<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
    <title>查询页面</title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript">
    	function doSelectAll(e){			
			var ids = new Array();
			ids=document.getElementsByName("id");
			if(ids!=null){
				for(i=0;i<ids.length;i++){
					ids[i].checked=e.checked;
				}			
			}		
		}
		
		
    </script>
</head>
  
<body>

	
  <s:form action="forum_search" namespace="/forum" method="post">
 <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
   		</tr>
 </table>
	
 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="0" class="newfont03">
  	<tr>
  	
		<td  width="50" height="26" align="center"	>		
		</td> 
	   <td width="587" height="26" align="center"></td>
  	</tr>
  </table>
  	  
  
  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	 <tr class="CTitle" >
              <td height="22" colspan="7" align="center" style="font-size:16px">信息列表</td>
         </tr>
    	<tr bgcolor="#EEEEEE">
			<td   align="center"  >标题</td>
    		<td width="20%" align="center" >创建人</td>
    		<td  width="20%"align="center" >创建时间</td>
    		<td width="15%" align="center" >操作</td>
    	</tr>
    	<s:iterator value="#request.forumList" var="forum">
    		<tr>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#forum.title"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#forum.father"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#forum.intime"/>
    			</td>
    			<s:hidden id="id" name="#forum.id"></s:hidden>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF">
    				<a href="<%=request.getContextPath()%>/forum/forum_searchDetail.action?forumdto.tbForum.id=<s:property value='#forum.id'/>">详细</a>&nbsp;&nbsp;|
    				<a href="<%=request.getContextPath()%>/forum/forum_delete.action?forumdto.tbForum.id=<s:property value='#forum.id'/>">删除</a>    			
    		    </td>
    		</tr>
    	</s:iterator>
    	
    	        <tr><td align="right" colspan="4">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/forum/forum_search.action" items="${totalCount }"
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
    </s:form>
</body>
</html>
