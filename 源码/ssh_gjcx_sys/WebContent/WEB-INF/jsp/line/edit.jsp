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

		function doSelect(_title,id){
			var actions;
			
			if (document.getElementById("nameboard").value==""){
				alert("线路名称不能为空");
				return false;
			}
			if (document.getElementById("routef").value==""){
				alert("始发站不能为空");
				return false;
			}
			if (document.getElementById("routeend").value==""){
				alert("终点站不能为空");
				return false;
			}
			if (document.getElementById("runtime").value==""){
				alert("营运时间不能为空");
				return false;
			}
			if (document.getElementById("price").value==""){
				alert("票价不能为空");
				return false;
			}
			if (document.getElementById("globalprice").value==""){
				alert("全程运行时间不能为空");
				return false;
			}
			if (document.getElementById("site").value==""){
				alert("停靠站点不能为空");
				return false;
			}
			if (document.getElementById("frequency").value==""){
				alert("发车频率不能为空");
				return false;
			}
			if (document.getElementById("frequency").value==""){
				alert("发车频率不能为空");
				return false;
			}
			
			
			if(_title=="更新"){
				actions="line/line_update";
			} else {
				actions="line/line_insert";
			}
			document.new1.action = actions;
			document.new1.submit();
		}
	</script>

</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr >
          <td width="100%" height="62" background="<%=request.getContextPath()%>/images/nav04.gif">
           	</td>
 		</tr>
	</table>
	<s:form name="new1"  namespace="/line" action="line_update" method="post">
	<table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
	 	<tr class="CTitle"> 
           	 <th class="tablestyle_title" align="center">公交线路管理</th>
        </tr>
		
		<tr>
			<td>
			<fieldset style="height:100%;">
			<legend>公交线路管理</legend>
				<table border="0" cellpadding="2" cellspacing="1" style="width:100%" >
					
					<tr>
						<td width="10%"  align="right" nowrap>线路名称：</td>
						<td  bgcolor="#FFFFFF" class="tableboder">
							&nbsp;<s:textfield name="linedto.tbLine.nameboard" cssClass="text"  id="nameboard" size="94"/><span class="red"> *</span>
  						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>始发站：</td>
						<td  bgcolor="#FFFFFF" class="tableboder">
							&nbsp;<s:textfield name="linedto.tbLine.routef" cssClass="text"  id="routef"  size="94"/><span class="red"> *</span>
  						</td>
					</tr>
					
					<tr>
						<td width="10%"  align="right" nowrap>终点站：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.routeend" cssClass="text"  id="routeend"  size="94"/><span class="red"> *</span>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>营运时间：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.runtime" cssClass="text"  id="runtime"  size="94"/><span class="red"> *</span>
						</td>
					</tr>
					
					<tr>
						<td width="10%"  align="right" nowrap>票价：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.price" cssClass="text"  id="price"  size="94"/><span class="red"> *</span>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>全程运行时间：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.globalprice" cssClass="text"  id="globalprice"  size="94"/><span class="red"> *</span>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>停靠站点：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="linedto.tbLine.site" cssClass="text"  id="site" cols="60" rows="10"/><span class="red"> <font color="red">*&nbsp;(添加公交线路时，站点与站点之间用“-”间隔开来。例：新苑街-白石桥西-紫竹院南门)</font></span>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>发车频率：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.frequency" cssClass="text"  id="frequency"  size="94"/><span class="red"> *</span>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>线路提示：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.prompt" cssClass="text"  id="prompt"  size="94"/>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>类型：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.mold" cssClass="text"  id="mold"  size="94"/>
						</td>
					</tr>
					<%--<tr>
						<td width="10%"  align="right" nowrap>上行：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.up" cssClass="text"  id="up"  size="94"/>
						</td>
					</tr>
					<tr>
						<td width="10%"  align="right" nowrap>下行：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textfield name="linedto.tbLine.down" cssClass="text"  id="down"  size="94"/>
						</td>
					</tr>
					--%><tr>
						<td width="10%"  align="right" nowrap>备注：</td>
						<td class="tableboder" bgcolor="#FFFFFF">
							&nbsp;<s:textarea name="linedto.tbLine.memo" cssClass="text"  id="memo" cols="60" rows="10"/>
						</td>
					</tr>
					
					<tr>
							<td>
							<s:hidden id="id" name="linedto.tbLine.id"/>
							</td>	
							<td>&nbsp;</td>
					</tr>
					
					</table>
					</fieldset>
				</td>
				
			</tr>
			
			
	<tr>
	
		<TD colspan="2" align="center" height="50px">
			<input type="button"  value="保存" class="button" onClick="doSelect('<%=title%>','<s:property value='linedto.tbLine.id'/>');"/>　
			<input type="button"  value="返回" class="button" onClick="window.history.go(-1);"/>
		</TD>
		
	</tr>
	</table>

	</s:form>
</body>
</html>
