<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.model.TbMember"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.DB.connDB" %>
<%
connDB conn=new connDB();
ResultSet rs_line=conn.executeQuery("select  * from tb_gg order by id desc");
%>
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

</head>
  
<body>

	
<s:form action="new_searchQ" namespace="/new" method="post">
<table width="102%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="33" background="<%=request.getContextPath()%>/images/shop_12.gif"></td>
        <td width="505" height="33" align="right" valign="middle" background="<%=request.getContextPath()%>/images/shop_12.gif">
        <table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0"> 
          <tr>
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">您好！欢迎登录 ！</marquee></td>
          </tr>
        </table></td>
        <td width="10" background="<%=request.getContextPath()%>/images/shop_12.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="93" height="50" background="<%=request.getContextPath()%>/images/shop_15.gif">&nbsp;</td>
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="center"><div align="center" ><font class="word_green" size="3"><b >公交新闻</b></font></div>
         </td>
     </tr>
 </table>
 <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center" class="tableBorder">
       <tr>
    
    <td valign="top">
 <table>
 	<tr>
 		<td>&nbsp;</td>
 	</tr>
 </table>
<table width="99%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03" >
    	<tr bgcolor="#EEEEEE">
			<td height="30" class="tableBorder_B_dashed" align="center"><div align="center" ><font class="word_green" size="2"><b >&nbsp;标题</b></font></div></td>
    		 <td height="30" class="tableBorder_B_dashed" align="center"><div align="center" ><font class="word_green" size="2"><b >&nbsp;发布日期</b></font></div></td>
    	</tr>
    	  <%
			String  id="";
			String title="";
			String INTime="";
			while(rs_line.next()){
			  id=rs_line.getString(1);
			  title=rs_line.getString(2);
			  INTime=rs_line.getString(4);
		%>
    	<tr >
			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
							&nbsp;<a href="<%=request.getContextPath()%>/new/new_detail?newdto.tbGg.id=<%=id%>" target=mainFrame><%=title %></a>
						</td>
   			<td  class="tableboder"   bgcolor="#FFFFFF" align="center">
							&nbsp;<%=INTime %>
 						</td>
		</tr>
    	
    	<%}%>
     </table>
     </td>
     </tr>
     </table>
    </s:form>
     <s:if test="msg!=null">
 <script type="text/javascript"> 
 	alert('${msg}');
 </script>
 </s:if>
</body>
</html>
