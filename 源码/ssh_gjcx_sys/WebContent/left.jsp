<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/left.gif);
}
-->
</style>
<link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
<LINK REL=stylesheet HREF="<%=path %>/js/toc.css" TYPE="text/css">
<SCRIPT LANGUAGE="JavaScript" src="<%=path %>/js/AdminTree.js"></script>
<script type="text/javascript">
	function back(){
	parent.location="<%=request.getContextPath()%>/login_enterAgain";
}
</script>
</head>

<BODY onLoad="init()" topmargin="0" leftmargin="0" rightmargin="0">
<form action="enterAgain.action" method="post">
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD align="center">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" >
		  <tr>
			<td width="207" height="55" background="images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01"><span class="left-font02">您好,<%=((TbManager)request.getSession().getAttribute("user")).getManager() %></span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01" >
						[&nbsp;<a href="enterHAgain.action" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
	
<table width="100%" cellspacing="0" cellpadding="0" border="0" class='left-table03'>
		<tr height="30">
			<td align="center" valign="middle"><ul><li><a  href="line/line_search" id=ttt target=mainFrame>线路管理</a></li></ul></td>
		</tr>
		<tr height="30">
			<td align="center" valign="middle"><ul><li><a  href="forum/forum_search"  target=mainFrame>论坛管理</a></li></ul></td>
		</tr>
		<tr height="30">
			<td align="center" valign="middle"><ul><li><a  href="new/new_search"  target=mainFrame>新闻管理</a></li></ul></td>
		</tr>
		<tr>
			<td align="center" valign="middle"><ul><li><a  href="pic/pic_search"  target=mainFrame>图片管理</a></li></ul></td>
		</tr>
		<tr>
			<td align="center" valign="middle"><ul><li><a  href="upload/upload_searchQ"  target=mainFrame>资源管理</a></li></ul></td>
		</tr>
		<tr>
			<td align="center" valign="middle"><ul><li><a  href="message/message_search"  target=mainFrame>留言管理</a></li></ul></td>
		</tr>
		<tr>
			<td align="center" valign="middle"><ul><li><a  href="user/user_search"  target=mainFrame>用户管理</a></li></ul></td>
		</tr>
</table>
</TD>
</tr>
</table>
</form>	
</BODY>
</html>
