<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��������ѯ</title>
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
   alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
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
                  <td width="72"><a href="user/user_manage"  target=all>��̨����</a></td>
                    </tr>
              </table></td>
            </tr>
            <tr>
              <td height="57" valign="top" background="images/shop_07.gif"><table width="100%" height="53"  border="0" cellpadding="0" cellspacing="0">
                <tr align="center">
                  <td width="8%"><a href="index.jsp" target="_top">��ҳ</a><br>
                    </td>
                  <td width="2%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="11%"><a href="line/line_searchQ" target=mainFrame>������ѯ<br>
					</a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="14%"><a href="forum/forum_searchQ" target=mainFrame>������̳<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="10%"><a href="new/new_searchQ" target=mainFrame>��������<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="10%"><a href="pic/pic_searchQ" target=mainFrame>����ͼƬ<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="15%"><a href="upload/upload_search" target=mainFrame>��Դ�ϴ�����<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="14%"><a href="message/message_searchQ" target=mainFrame>�û�����<br>
                    </a></td>
                  <td width="1%"><img src="images/shop_09.gif" width="3" height="57"></td>
                  <td width="21%"><a href="<%=path %>/introduce.jsp" target=mainFrame>ϵͳ����<br>
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
