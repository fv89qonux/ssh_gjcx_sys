<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String title = (String)request.getAttribute("title");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>信息<%=title%></title>
	<link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript"> 

		function doSelect(usersid){
			var actions;
			if (document.getElementById("content").value==""){
				alert("内容不能为空");
				return false;
			}
			actions="forum/forum_insertDetail?forumd="+usersid;
			document.forum.action = actions;
			document.forum.submit();
		}
	</script>

</head>

<body>
	<s:form name="forum"  namespace="/forum" action="forum_insertDetail" method="post">
	

<table width="588" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
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
         <div align="center" ><font class="word_green" size="3"><b >公交论坛</b></font></div></td>
     
      </tr>
    </table>
 
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>发言：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="detaildto.tbDetail.content" cssClass="text"  id="content" cols="55" rows="10"/><span class="word_orange">*</span>
							</td>
							
						<td>&nbsp;</td>
					</tr>
					
							</table>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="提交" class="button" onclick="doSelect('<s:property value="forumd"/>');"/>　
			<input type="button"  value="返回" class="button" onclick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
