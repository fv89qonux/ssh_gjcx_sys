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
	<title>用户<%=title%></title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript"> 

		function doSelect(id){
			
			if (document.getElementById("title").value==""){
				alert("标题不能为空");
				return false;
			}
			if (document.getElementById("content").value==""){
				alert("内容不能为空");
				return false;
			}
			actions="message/message_insert";
			
			document.new1.action = actions;
			document.new1.submit();
		}
	</script>

</head>

<body>
	<table width="588" border="0" cellspacing="0" cellpadding="0" align="center">
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
        <td width="88" height="50" background="<%=request.getContextPath()%>/images/shop_15.gif">&nbsp;</td>
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif"><div align="center" ><font class="word_green" size="3"><b >用户留言</b></font></div>
		</td>
     
   		</tr>
 	</table>
  	
	<s:form name="new1"  namespace="/message" action="message_insert" method="post">
	<table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
	 	
		<tr>
			<td>
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
						<td  bgcolor="#FFFFFF" class="tableboder">
							&nbsp;<s:textfield name="messagedto.tbMessage.title" cssClass="text"  id="title" size="93"/>
						</td>
  						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>内容：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="messagedto.tbMessage.content" cssClass="text" id="content" cols="60" rows="15" />
						</td>
						<td>&nbsp;</td>
					</tr>
					</table>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="提交" class="button" onClick="doSelect('<s:property value='messagedto.tbMessage.id'/>');"/>　
			<input type="button"  value="返回" class="button" onClick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
