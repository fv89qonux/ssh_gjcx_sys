<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
		
		function doagain(){
			document.getElementById("nameboard").value="";
			document.getElementById("routef").value="";
			document.getElementById("routeend").value="";
		}
		
		
    </script>
</head>
  
<body>

	
  <s:form action="line_search" namespace="/line" method="get">
 <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif">
	           <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
					    <tr>
							  <td width="24"><img src="<%=request.getContextPath()%>/images/ico07.gif" width="20" height="18" /></td>
							  <td width="30%">
							  		线路名称:<s:textfield name="linedto.tbLine.nameboard" id="nameboard"/>
							  </td>
							  <td width="20%">
							  		始发站:<s:textfield name="linedto.tbLine.routef" id="routef"/>
							  </td>
							  <td width="20%">
							  		终点站:<s:textfield name="linedto.tbLine.routeend" id="routeend"/>
							  </td>
							  <td width="15%">
								  	站点:<s:textfield name="linedto.tbLine.site" id="site"/>
						  	  </td>
						
							 <td width="8%">
							  		<input name="Submit" type="button" class="right-button02" value="查 询" onclick="submit()" style="cursor: hand"/>
							  </td>
							  <td width="8%">
							  		<input onClick="doagain()" type="button" class="right-button02" value="重 置"  style="cursor: hand"/>
							  </td>
					  	</tr>
			       </table>
          </td>
   		</tr>
 </table>
		<%if (mess!=null){ %>
	<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr >
        <td width="99%"  ><span class="red"><%=mess%></span></td>
 		</tr>
	</table>
	<%} %>
 
 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="0" class="newfont03">
  	<tr>
  	
		<td  width="50" height="26" align="center"	>		
				 <input onclick="javascript:document.forms[0].action='line/line_insertInit';document.forms[0].submit();" type="button" class="right-button08" value="添加 " style="cursor: hand"/>		
		</td> 
	   <td width="587" height="26" align="center"></td>
  	</tr>
  </table>
 
  	  
  
  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	 <tr class="CTitle" >
              <td height="22" colspan="8" align="center" style="font-size:16px">信息列表</td>
         </tr>
    	<tr bgcolor="#EEEEEE">
			<td  width="10%" align="center"  >线路名称</td>
    		<td width="20%" align="center" >始发站</td>
    		<td width="20%" align="center" >终点站</td>
    		<td  align="center" >营运时间</td>
    		<td  align="center" >票价</td>
    		<td  align="center" >发车频率</td>
    		<td  align="center" >备注</td>
    		<td width="15%" align="center" >操作</td>
    	</tr>
    	<s:iterator value="#request.lineList" var="line">
    		<tr>
    			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
    				&nbsp;<s:property value="#line.nameboard"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.routef"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.routeend"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.runtime"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.price"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.frequency"/>
    			</td>
    			<td  class="tableboder"   bgcolor="#FFFFFF"  align="center">
    				&nbsp;<s:property value="#line.memo"/>
    			</td>
    			<s:hidden id="id" name="#line.id"></s:hidden>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF">
    				<a href="line/line_updateInit?linedto.tbLine.id=<s:property value='#line.id'/>">编辑</a>&nbsp;&nbsp;|
    				<a href="line/line_delete?linedto.tbLine.id=<s:property value='#line.id'/>">删除</a>    			
    		    </td>
    		</tr>
    	</s:iterator>
    	<tr><td align="right" colspan="6">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/line/line_search.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
									<pg:param name="linedto.tbLine.nameboard" value="${linedto.tbLine.nameboard}"/>
									<pg:param name="linedto.tbLine.site" value="${linedto.tbLine.site}"/>
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
    </s:form>
</body>
</html>
