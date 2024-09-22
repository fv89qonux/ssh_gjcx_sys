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

	
  <s:form action="pic_search" namespace="/pic" method="post">
 <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
   		</tr>
 </table>
	
		  
  <table width="99%" align="center" border="0" cellpadding="1" cellspacing="0" class="newfont03">
  	<tr>
  	
		<td  width="50" height="26" align="center"	>		
				 <input onclick="javascript:document.forms[0].action='pic/pic_insertInit';document.forms[0].submit();" type="button" class="right-button08" value="添加 " style="cursor: hand"/>		
		</td> 
	   <td width="587" height="26" align="center"></td>
  	</tr>
  </table>
  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	 <tr class="CTitle" >
              <td height="22" colspan="7" align="center" style="font-size:16px">信息列表</td>
         </tr>
    	<tr bgcolor="#EEEEEE">
			<td  align="center"  >名称</td>
			<td  align="center"  >添加日期</td>
    		<td width="20%" align="center" >操作</td>
    	</tr>
    	<s:iterator value="#request.picList" var="pic">
    		<tr>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#pic.name"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#pic.intime"/>
    			</td>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF"><a href="${ctx}/pic/pic_detail?picdto.tbPic.id=<s:property value='#pic.id'/>">详细</a>&nbsp;&nbsp;|
    				<a href="${ctx}/pic/pic_updateInit?picdto.tbPic.id=<s:property value='#pic.id'/>">编辑</a>&nbsp;&nbsp;|
    				<a href="${ctx}/pic/pic_delete?picdto.tbPic.id=<s:property value='#pic.id'/>">删除</a>    			
    		    </td>
    		</tr>
    	</s:iterator>
    	
    	<tr><td align="right" colspan="3">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/pic/pic_search.action" items="${totalCount }"
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
