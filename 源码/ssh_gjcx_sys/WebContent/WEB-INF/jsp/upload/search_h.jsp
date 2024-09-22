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

	
  <s:form action="upload_searchQ" namespace="/upload" method="post">
 <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
   		</tr>
 </table>
	
		  
  <table width="99%" align="center" border="0" cellpadding="1" cellspacing="0" class="newfont03">
  	<tr>
  	
		<td  width="50" height="26" align="center"	>		
				 <input onclick="javascript:document.forms[0].action='upload/upload_insertInitQ';document.forms[0].submit();" type="button" class="right-button08" value="添加 " style="cursor: hand"/>		
		</td> 
	   <td width="587" height="26" align="center"></td>
  	</tr>
  </table>
 
    
		  
  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	 <tr bgcolor="#EEEEEE">
			<th  align="center"  >名称</th>
			<th width="30%" align="center"  >添加日期</th>
    		<th width="20%" align="center" >操作</th>
    	</tr>
    	<s:iterator value="#request.loadList" var="load">
    		<tr>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#load.name"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#load.intime"/>
    			</td>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF"><a href="<%=request.getContextPath()%>/upload/upload_delete?loaddto.tbLoad.id=<s:property value='#load.id'/>">删除</a>&nbsp;&nbsp;|
    				<a href="<%=request.getContextPath()%>/download/download_fileDownload?docId=<s:property value="#load.id"/>">下载</a>
    			</td>
    		</tr>
    	</s:iterator>
    	
    	<tr><td align="right" colspan="3">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/upload/upload_searchQ.action" items="${totalCount }"
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
