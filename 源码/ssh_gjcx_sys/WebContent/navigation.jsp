<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>公交车查询</title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />
    <SCRIPT LANGUAGE="JavaScript">
<!--
function AddFavorite(sURL, sTitle){
 try{
  window.external.addFavorite(sURL, sTitle);
  }
 catch (e){
  try{
   window.sidebar.addPanel(sTitle, sURL, "");
   }
  catch (e)
  {
   alert("加入收藏失败，请使用Ctrl+D进行添加");
  }
 }
}
    </script>
 </head>
  
<body>
<table width="790" height="115"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td bgcolor="#CCCCCC" height="6px"></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="25%"><img src="images/shop_02.jpg" width="275" height="109"></td>
          <td width="75%"><table width="100%" height="109"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="52" align="right" valign="top"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0">
                <tr align="center">
                  <td width="281">&nbsp;</td>
                  <td width="7" valign="top"><img src="images/T_contact.gif" width="42" height="28"></td>
                  <td width="72"><a href="user/user_manage"  target=all>后台管理</a></td>
                    </tr>
              </table></td>
            </tr>
            <tr>
              <td height="57" valign="top" background="images/shop_07.gif"><table width="100%" height="53"  border="0" cellpadding="0" cellspacing="0">
                <tr align="center">
                  <td width="8%"><a href="index.jsp" target="_top">首页</a><br>
                    </td>
                  <td width="2%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="11%"><a href="line/line_searchQ" target=mainFrame>公交查询<br>
					</a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="14%"><a href="forum/forum_searchQ" target=mainFrame>公交论坛<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="10%"><a href="new/new_searchQ" target=mainFrame>公交新闻<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="10%"><a href="pic/pic_searchQ" target=mainFrame>公交图片<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="15%"><a href="upload/upload_search" target=mainFrame>资源上传下载<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="14%"><a href="message/message_searchQ" target=mainFrame>用户留言<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="21%"><a href="<%=path %>/introduce.jsp" target=mainFrame>系统介绍<br>
                    </a></td>
                  <td width="2%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
