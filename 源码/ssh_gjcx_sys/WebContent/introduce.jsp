<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.model.*"%>

<html>
  <head>
	<%@ page import="com.DB.connDB" %>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
  
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>系统介绍</title>
    <link rel="stylesheet" type="text/css" href="./xmlhttp/css/rime/rime.css" />
  <style type="text/css">
  div {
	
	word-spacing : 10px;
	margin-left : 30px;
	margin-right: 20px
	
}
  </style>
  </head>
  <body>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right">
         <div align="center" ><font class="word_green" size="3"><b >系统介绍</b></font></div>
         </td>
     </tr>
    
    </table>
      
   <table width="102%" border="0" cellspacing="0" cellpadding="0" align="center" class="tableBorder">
       <tr>
    
    <td valign="top">  </td>

	<td  bgcolor="#FFCCFF" colspan="4" ><div align="left" style="width:600px；hight:600">
	  <p><font><br/>
	&nbsp;&nbsp;随着改革开放的迅猛展开，中国的交通方式变得越来越完善，公交车几乎可以遍及大城市的每一个角落，
	错综复杂的公交车线路网让人们的出行，上下班获得了巨大的方便和实惠。但是，复杂的交通也给人们的出行带来难题。
	本系统通过网络，可以使人们方便、快捷的查询到所需要的交通信息，从而节省时间，提高效率。
          本系统就是为了方便人们出行，方便人们进行相关的交通以及旅游、购物等信息的查询而设计的。
     </font></p> <p><font>  
     &nbsp;&nbsp; 本系统有一下功能：公交车路线查询，本系统可以选择直乘查询和换乘查询，来查出你想要座的车次。公交车站点查询，查询所有
     经过该线路的站点，公交车线路查询，可以查出你输入的公交车线路所经过的所有站点。公交新闻，主要是发布一些最新的公交方面的新闻给用户浏览。
     公交论坛，主要是给注册会员使用，登录的会员可以在论坛里面发帖，回帖，讨论或者发表一些关于公交方面的信息。公交图片，主要是对于那些对公交信息感性趣的人设计的，
     这里面有一些关于公交信息图片可供浏览，如各式各样的公交车图片，公交广告等。资源上传下载，这里会提供一些有关资源列表供感兴趣的会员下载。
	用户留言，如果会员对该系统有什么意见或者建议，可以通过该模块发留言给管理员。

	 
 </tr>
 
 </table>

  </body>
</html>
