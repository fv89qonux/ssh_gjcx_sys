<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理!</title>

    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function login(){
			if (document.getElementById("userName").value==""){
				alert("请输入用户名");
				return false;
			}
			if (document.getElementById("passWord").value==""){
				alert("请输入密码");
				return false;
			}
			
			document.form1.action = "<%=request.getContextPath()%>/login.action";
			document.form1.submit();
			return true;
		}
</script>
</head>

<body bgcolor="#336699">
 <form action="login" method="post" onsubmit="return login()" name="form1">
	<table width="100%"   border="0"><tr ><td height="120">&nbsp;</td></tr> 
	<tr><td>	
      <table width="350"   border="0" align="center" cellpadding="0" cellspacing="0"  background ="<%=request.getContextPath() %>/images/login_M.jpg" class="tableBorder">
        <tr>
          <td height="136" align="center">&nbsp;</td>
        </tr>	  
              
        <tr>
          <td height="87" align="center" valign="top"><table width="62%"   border="0" cellpadding="0" cellspacing="0">
           <tr>
              <td width="95%" align="center">&nbsp;用户名：
              <input name="manager" type="text" id="userName" size="20"/></td>
              </tr>
            <tr>
              <td align="center">&nbsp;密&nbsp;&nbsp;码：
             &nbsp; <input name="pwd" type="password" id="passWord" size="20"/></td>
              </tr>

            <tr>
              <td align="center"><input name="Submit" type="submit" class="btn_grey" value="确认"/> &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置"/>
              &nbsp;
              </td>
              </tr>
          </table></td>
        </tr>
</table>
</td></tr>
</table>
  </form> 
        <s:if test="msg!=null">
 <script type="text/javascript"> 
 	alert('${msg}');
 </script>
 </s:if> 
</body>
</html>
