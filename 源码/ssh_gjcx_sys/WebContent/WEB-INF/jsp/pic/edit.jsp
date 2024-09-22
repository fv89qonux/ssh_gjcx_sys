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

		function doSelect(_title,usersid){
			var actions;
			
			if (document.getElementById("name").value==""){
				alert("名称不能为空");
				return false;
			}
			
			if (document.getElementById("pic").value==""){
				alert("图片文件不能为空");
				return false;
			}
			
			if(_title=="更新"){
				actions="pic/pic_update";
			} else {
				actions="pic/pic_insert";
			}
			document.pic.action = actions;
			document.pic.submit();
		}
	</script>

</head>

<body>
	<table width="102%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr >
          <td width="102%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif"></td>
 		</tr>
	</table>
	<s:form name="pic"  namespace="/pic" action="pic_insert" method="post">
	<table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
	 	<tr class="CTitle"> 
           	 <th class="tablestyle_title" align="center"><%=title%></th>
        </tr>
		
		<tr>
			<td>
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>名&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="picdto.tbPic.name" cssClass="text"  id="name" size="93"/><span class="red"> *</span>
							</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>图片文件：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="picdto.tbPic.pic" cssClass="text"  id="pic" />(此处只填写图片文件路径即可) 
							</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>解&nbsp;&nbsp;&nbsp;&nbsp;释：</td>
							<td class="tableboder" bgcolor="#FFFFFF">
								&nbsp;<s:textarea name="picdto.tbPic.content" cssClass="text" id="content" cols="60" rows="15"/>
							</td>
							<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="10%"  align="right" nowrap>备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
							<td class="tableboder" bgcolor="#FFFFFF">
								&nbsp;<s:textarea name="picdto.tbPic.memo" cssClass="text" id="memo" cols="60" rows="15"/>
							</td>
							<td>&nbsp;</td>
					</tr>
					<tr>
							
							<td>&nbsp;<s:hidden id="intime" name="picdto.tbPic.intime"/>
							<s:hidden id="id" name="picdto.tbPic.id"/></td>	
					</tr>
					
				</table>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="保存" class="button" onclick="doSelect('<%=title%>','<s:property value='picdto.tbPic.id'/>');"/>　
			<input type="button"  value="返回" class="button" onclick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
