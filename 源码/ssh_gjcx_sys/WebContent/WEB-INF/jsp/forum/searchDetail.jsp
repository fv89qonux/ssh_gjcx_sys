<%@ page language="java" pageEncoding="GB18030"%>
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
    <title>��ѯҳ��</title>
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

	
  <s:form action="forum_searchDetail" namespace="/forum" method="post">
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
              <td height="22" colspan="7" align="center" style="font-size:16px">������Ϣ�б�</td>
         </tr>
    	<tr bgcolor="#EEEEEE">
			<td   align="center"  >����</td>
    		<td width="10%" align="center" >������</td>
    		<td width="10%" align="center" >����</td>
    	</tr>
    	<s:iterator value="#request.detailList" var="detail">
    		<tr>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#detail.content"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#detail.who"/><br>
    				<s:property value="#detail.intime"/>
    			</td>
    			<s:hidden id="id" name="#detail.id"></s:hidden>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF">
    				<a href="<%=request.getContextPath()%>/forum/forum_deleteDetail?detaildto.tbDetail.id=<s:property value='#detail.id'/>">ɾ��</a>    			
    		    </td>
    		</tr>
    	</s:iterator>
    	
    	<tr><td align="right">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }"url="${ctx}/forum/forum_searchDetail.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
									<pg:param name="forumdto.tbForum.id" value="${forumdto.tbForum.id}"/>
									<pg:first><a href="${pageUrl }" id="first">��ҳ</a></pg:first>
									<pg:prev><a href="${pageUrl }">��һҳ</a></pg:prev>
									<pg:pages>
										<c:choose>
											<c:when test="${currentPageNumber==pageNumber}"><b>${pageNumber }</b></c:when>
											<c:otherwise><a href="${pageUrl }">${pageNumber }</a></c:otherwise>
										</c:choose>
									</pg:pages>
									<pg:next><a href="${pageUrl }">��һҳ</a></pg:next>
									<pg:last><a href="${pageUrl }">ĩҳ</a></pg:last>
					</pg:pager>
					</p>
</td></tr>
     </table>
     <table width="99%" align="center">
		    	<tr height="35">
		    		<td width="20%">&nbsp;</td>
		  			<td   align="center"  bgcolor="#FFFFFF">
		  			<input type="button" value="����" class="button" onclick="window.history.back();" style="cursor: default"/>
		  			</td>
		  			<td width="20%">&nbsp;</td>
		  		</tr>
    		</table>
    </s:form>
</body>
</html>
