<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page import="com.model.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="com.DB.connDB" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
  
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"> 

		function login(){
			if (document.getElementById("userName").value==""){
				alert("请输入用户名");
				return false;
			}
			if (document.getElementById("passWord").value==""){
				alert("请输入用户名密码");
				return false;
			}
			document.form1.target="_top";
			document.form1.action = "<%=request.getContextPath()%>/user/user_memLogin";
			document.form1.submit();
		}
</script>

<table width="188"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="83" align="center"><img src="<%=request.getContextPath()%>/images/shop_11.gif" width="182" height="83"></td>
      </tr>
      <tr>
        <td height="98" align="center" background="<%=request.getContextPath()%>/images/shop_17.gif">		  
        <s:form action="user_memLogin" namespace="/user" method="post" name="form1" target="_top">
          <table width="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10%" >&nbsp;</td>
              <td width="100%" valign="top" background="<%=request.getContextPath()%>/images/index_09.gif">
			  <%
			  TbMember username=((TbMember)session.getAttribute("username"));
			  if (username==null ){%>
			  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="94%" height="24">会员名
                    <input name="userName" type="text" class="txt_grey" id="userName" size="16"></td>
                </tr>
                <tr>
                  <td height="24">密&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;
                    <input name="passWord" type="password" class="txt_grey" id="passWord" size="16" onKeydown="if(event.keyCode==13) form1.submit();"></td>
                </tr>
                <tr>
                  <td height="31">
                    <input name="Submit2" type="button" class="btn_grey" value="登录" onClick="login()">                    
                    <input name="Submit3" type="reset" class="btn_grey" value="重置">
                    </td>
                </tr>
                <tr>
                	  <td><a href="<%=request.getContextPath()%>/user/user_insertInit" target=mainFrame>注册</a></td>
                
                </tr>
              </table>
			  <%}else{%>
                <table width="100%"  border="0" cellpadding="0" cellspacing="0" >
                  <tr>
                    <td width="94%" height="31" align="center" class="word_white">[<%=username.getUserName()%>]您好!<br>您现在可以进行操作了!</td>
                    <td width="6%">&nbsp;</td>
                  </tr>
                  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                  <tr>
                    <td width="94%" align="center"><a href="<%=request.getContextPath()%>/user/user_updateInit.action" target="mainFrame"><b>[修改信息]</b></a>
                    &nbsp;<a href="<%=request.getContextPath()%>/enterAgain.action" target="_top"><b>[退出登录]</b></a></td>
                    <td width="6%">&nbsp;</td>
                  </tr>
                  
                </table>
				<%}%>
				</td>
            </tr>
          </table>
		  </s:form></td>
      </tr>
    </table>
      <table width="180" height="155"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="<%=request.getContextPath()%>/images/shop_22.gif" width="182" height="58"></td>
        </tr>
        <tr>
          <td height="97" align="center" valign="top" class="tableBorder_l"><table width="88%"  border="0" cellspacing="0" cellpadding="0">
			<s:iterator value="#request.list" >
			<tr>
              <td height="24" class="tableBorder_T_dashed" align="center">
              	<a href="<%=request.getContextPath()%>/line/line_lineDetail.action?name=<s:property />" target=mainFrame><s:property /></a>
              </td>
            </tr>
            </s:iterator>
			</table></td>
        </tr>
        
        <tr><td align="center">
					<p style="font-size: 13px;">
					<pg:pager maxPageItems="${pageSize }" url="${ctx}/line/line_lineScan.action" items="${totalCount }"
									export="currentPageNumber=pageNumber" >
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
<s:if test="msg!=null"><script type="text/javascript">alert('${msg}');</script></s:if>
