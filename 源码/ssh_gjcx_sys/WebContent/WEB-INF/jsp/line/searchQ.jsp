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
    <script language="javascript" src="<%= request.getContextPath() %>/js/common.js" type="text/javascript"></script>
    <script language="javascript">
    	
		
		function query1(){
			document.getElementById("routef").value="";
			document.getElementById("routeend").value="";
			document.getElementById("site").value="";
		}
		function query2(){
			document.getElementById("nameboard").value="";
			document.getElementById("routef").value="";
			document.getElementById("routeend").value="";
		}
		function query3(){
			document.getElementById("nameboard").value="";
			document.getElementById("site").value="";
			var start = document.getElementById("routef").value;
			var end = document.getElementById("routeend").value
			if(!IsNotNull(start)) {
				alert("请输入起点站！");
				return false;
			}else if(!IsNotNull(end)){
				alert("请输入终点站");
				return false;
			}else if(trim(end) == trim(start)) {
				alert("起点和终点相同，请重新输入");
				return false;
			}
			return true;
		}
		
		
    </script>
</head>
  
<body>

	
  <s:form action="line_searchQ" namespace="/line" method="get" name="frm">
  <s:hidden name="linedto.flag" value="1"></s:hidden>
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right">
         <%--
       		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
			    <tr>
					  <td width="89"></td>
					  <td colspan="3" >
					  		线路名称:<s:textfield name="linedto.tbLine.nameboard" id="nameboard"/>&nbsp;&nbsp;<input name="Submit" type="submit" class="right-button02" value="查 询" onClick="query1()" style="cursor: hand"/>
						  	站&nbsp;&nbsp;点:<s:textfield name="linedto.tbLine.site" id="site"/>&nbsp;&nbsp;<input name="Submit" type="submit" class="right-button02" value="查 询" onClick="query2()" style="cursor: hand"/>
				  </td>
				</tr>
				<tr>
					<td width="89"></td>
					  <td width="300">
					  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;起&nbsp;&nbsp;点:
					  		<s:textfield name="linedto.tbLine.routef" id="routef"/>&nbsp;&nbsp;-->
				  </td>
					  <td width="300">
					  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;终&nbsp;&nbsp;站:
					  		<s:textfield name="linedto.tbLine.routeend" id="routeend"/>
				  </td>
				  <td align="left" width="89">
				  	<input onClick="return query3()" type="submit" class="right-button02" value="查 询"  style="cursor: hand"/>
				  </td>
				</tr>	  
	       </table>
	        --%>
         </td>
     </tr>
 </table>
 <table>
 	<tr>
 		<td>&nbsp;</td>
 	</tr>
 </table>
	
       		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
			    <tr>
					  <td width="89"></td>
					  <td colspan="3" >
					  		线路名称:<s:textfield name="linedto.tbLine.nameboard" id="nameboard"/>&nbsp;&nbsp;<input name="Submit" type="submit" class="right-button02" value="查 询" onClick="query1()" style="cursor: hand"/>
						  	站&nbsp;&nbsp;点:<s:textfield name="linedto.tbLine.site" id="site"/>&nbsp;&nbsp;<input name="Submit" type="submit" class="right-button02" value="查 询" onClick="query2()" style="cursor: hand"/>
				  </td>
				</tr>
				<tr>
					<td width="89"></td>
					  <td width="300"><br>
					  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;起&nbsp;&nbsp;点:
					  		<s:textfield name="linedto.tbLine.routef" id="routef"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--->
				  </td>
					  <td width="400" align="left"><br>终&nbsp;&nbsp;站:
					  		<s:textfield name="linedto.tbLine.routeend" id="routeend"/>
					  		
					  		<input onClick="return query3()" type="submit" class="right-button02" value="查 询"  style="cursor: hand"/>
				  </td>
				</tr>	  
	       </table>	
	<br>
	
	
  <table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	<tr bgcolor="#EEEEEE">
			<td  width="10%" align="center"  >线路名称</td>
    		<td width="20%" align="center" >始发站</td>
    		<td width="20%" align="center" >终点站</td>
    		<td  align="center" >营运时间</td>
    		<td  align="center" >票价</td>
    		<td  align="center" >发车频率</td>
    		<td width="10%" align="center" >操作</td>
    		
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
    			<s:hidden id="id" name="#line.id"></s:hidden>
    			<td class="tableboder"  align="center" bgcolor="#FFFFFF">
    				<a href="<%=request.getContextPath()%>/line/line_lineDetail.action?flag=1&linedto.tbLine.id=<s:property value='#line.id'/>">查看</a>&nbsp;&nbsp;
    			</td>
    		</tr>
    	</s:iterator>
    	<tr><td align="right" colspan="6">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/line/line_searchQ.action" items="${totalCount }"
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
     </td>
     </tr>
     </table>
    </s:form>
</body>
</html>
