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
    <link href="<%=path %>/css/control.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript">
			var i = 1;
			function addComponent() {
				
				var c = "<input class='check1' type='radio' name='radiobutton' onclick='onClickFile(this.value)' id='radio"+(++i)+"' value='file"+i+"' />";
		        uploadHTML = document.createElement( c);
		        document.getElementById("files").appendChild(uploadHTML);
		        var f = "<input type='file' name='xxglDto.upload.upload' style='width: 90%; height: 17px; font-size: 12px; border: solid 1px #ccc;' id='file"+i+"' />";
		        uploadHTML = document.createElement(f);
		        document.getElementById("files").appendChild(uploadHTML);
		        var b = "<br id='br"+i+"' />"
		        uploadHTML = document.createElement(b);
		        document.getElementById("files").appendChild(uploadHTML);
			}
			function onClickFile(id){
			  document.forms[0].fileinfoid.value=id;
			}
			function save() {
				var actions;
				if (document.getElementById("name").value==""){
				alert("名称不能为空");
				return false;
				}
			
				actions = "upload/upload_insert";
				document.form1.action = actions;
				document.form1.submit();
			}
		</script>

</head>

<body>
	<s:form action="upload/upload_insert" method="post" name="form1"
			enctype="multipart/form-data">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
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
         <td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="right"> <div align="center" ><font class="word_green" size="3"><b >文件上传</b></font></div></td>
     
      </tr>
    </table>
 	
			<table width="588" height="236"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    
    <td valign="top">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr bgcolor="#C7E8EC">
					<td height="22" colspan="4" class="STYLE3">
						<div align="center">
							上传附件
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">

							<tr>
								<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
									<table width="80%" border="0" align="center" cellpadding="0"
										cellspacing="0">

										<tr>
											<td height="5"></td>
										</tr>
										
										<tr>
											<td height="20" class="STYLE1" nowrap="nowrap"
												bgcolor="#EFF4F7">
												<div align="center">
													附件：
												</div>
											</td>
											<td class="STYLE1" colspan="3" bgcolor="#EFF4F7"
												align="center">
												文档
											</td>
										</tr>
										
										<tr>
											<td height="20" class="STYLE1" colspan="4">
												<div id="files">
													<input class="check1" type="radio" name="radiobutton"
														id="radio1" value="file1"
														onClick="onClickFile(this.value)" />
													<input id="file1" type="file" name='loaddto.upload.upload'
														style="width: 90%; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
													
													<br id="br1" />
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" class="STYLE1" nowrap="nowrap"
												bgcolor="#EFF4F7">
												<div align="center">
													名称：
												</div>
											</td>
											<td class="STYLE1" colspan="3" bgcolor="#EFF4F7">
												
												<s:textfield name="loaddto.tbLoad.name" cssClass="text"  id="name" size="25"/><span class="word_orange">*</span>
											</td>
										</tr>
										
										<tr>
											<td height="35" colspan="4" class="STYLE1" align="center">
												<input class="buttonOut" type="button" value="上传"
													style="width: 65px; font-size: 12px"
													onclick="save();">
												<input class="buttonOut" type="button" value="返回"
													style="width: 65px; font-size: 12px"
													onclick="javascript:history.back();">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="fileinfoid">
			</td>
			</tr>
			</table>
		</s:form>
</html>
