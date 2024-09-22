<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script language="javascript">
	var bool=true
	function switch_close(){
	if(bool){ parent.main.cols="0,8,*"
					myimg.src="<%=request.getContextPath()%>/images/toright.gif"
					bool=false}
	else{
			parent.main.cols="213,8,*"
			myimg.src="<%=request.getContextPath()%>/images/toleft.gif"
			bool=true
			}
	
	}
</script>
 <BODY leftmargin="0" topmargin="0">
	<table width="8"  height="100%" cellspacing="0" cellpadding="0" >
	<tr>
		<td align="center" valign="middle" bgcolor="#799ae1"><img src="<%=request.getContextPath()%>/images/toleft.gif" onclick="switch_close()" id="myimg"></td>
	</tr>
</table>
</BODY>

</html>
