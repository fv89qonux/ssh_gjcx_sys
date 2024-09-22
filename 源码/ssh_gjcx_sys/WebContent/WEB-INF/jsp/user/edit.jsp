<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>查询页面</title>
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
  
		<link href="<%=path %>/css/style1.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript">

function save() {
	if (document.getElementById("userName").value == "") {
		alert("用户名不能为空");
		return false;
	}else if (document.getElementById("userName").value.length < 6) {
		alert("用户名长度太短，用户名要大于等于6位");
		return false;
	}
	if (document.getElementById("trueName").value == "") {
		alert("真实姓名不能为空");
		return false;
	}
	if (document.getElementById("passWord").value == "") {
		alert("密码不能为空");
		return false;
	}else if(document.getElementById("passWord").value.length < 6) {
		alert("密码长度太短，密码要大于等于6位");
		return false;
	}

	if (document.getElementById("pwd1").value != document
			.getElementById("passWord").value) {
		alert("密码不一致！");
		return false;
	}

	document.dd.action = "<%=path %>/user/user_update";
	document.dd.submit();
}
</script>

	</head>
	<body>
		<s:form name="dd"  namespace="/user" method="post">

			<table width="102%" height="236" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tableBorder">
				<tr>

					<td valign="top">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td height="33"
									background="<%=request.getContextPath()%>/images/shop_12.gif"></td>
								<td width="505" height="33" align="right" valign="middle"
									background="<%=request.getContextPath()%>/images/shop_12.gif">
									<table width="100%" height="24" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td align="right" class="word_green">
												<marquee direction="left" scrollamount="1" scrolldelay="1"
													onMouseOver="this.stop();" onMouseOut="this.start();">
													您好！欢迎登录 ！
												</marquee>
											</td>
										</tr>
									</table>
								</td>
								<td width="10"
									background="<%=request.getContextPath()%>/images/shop_12.gif">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="93" height="50"
									background="<%=request.getContextPath()%>/images/shop_15.gif">
									&nbsp;
								</td>
			<td colspan="2" background="<%=request.getContextPath()%>/images/shop_16.gif" align="center"><div align="center" ><font class="word_green" size="3"><b >用户信息修改</b></font></div>
								</td>				
							</tr>
						</table>
						</td></tr>
						
						<tr align="center" >
						<td align="center">
						<div align="center">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr align="center">
								<td height="189" valign="top" >
								
									<table width="100%" border="0" cellspacing="-2"
										cellpadding="-2" >
										
											
											<s:hidden name="memberdto.tbMember.id"></s:hidden>
												<s:hidden name="memberdto.tbMember.userName"
													cssClass="text" id="userName"/>
										
										<tr>
											<td height="28" align="center">
												真实姓名：
											</td>
											<td height="28">
												<s:textfield name="memberdto.tbMember.trueName"
													cssClass="text" id="trueName" size="30" />
												<span class="word_orange" >*</span>
											</td>
										</tr>
										<tr>
											<td height="28" align="center">
												 新密&nbsp;&nbsp;码：
											</td>
											<td height="28">
											<input type="password" name="memberdto.tbMember.passWord"  class="text" id="passWord" size="30" value="<s:property value="memberdto.tbMember.passWord"/>">
												<%--<s:password name="memberdto.tbMember.passWord"
													cssClass="text" id="passWord" size="33"/>
												--%><span class="word_orange">*</span>
											</td>
										</tr>
										<tr>
											<td height="28" align="center">
												确认密码：
											</td>
											<td height="28">
												<input name="pwd1" type="password" size="30" maxlength="30" value="<s:property value="memberdto.tbMember.passWord"/>">
												<span class="word_orange">*</span>
											</td>
										</tr>
										<tr>
											<td height="28" align="center">
												联系地址：
											</td>
											<td class="word_grey">
												<s:textfield name="memberdto.tbMember.address"
													cssClass="text" id="address" size="30" />
											</td>
										</tr>
										<tr>
											<td height="28" align="center" style="padding-left: 10px">
												Email：
											</td>
											<td class="word_grey">
												<s:textfield name="memberdto.tbMember.email" cssClass="text"
													id="email" size="30" />
											</td>
										</tr>

										<tr>
											<td height="34">
												&nbsp;
											</td>
											<td class="word_grey">
												<input name="Button" type="button" class="btn_grey"
													value="确定保存" onClick="save()">
												<input name="Submit22" type="button" class="btn_grey"
													value="返回" onClick="window.history.go(-1);">
											</td>
										</tr>
									</table>
		
								</td>
							</tr>
						</table>
					</div></td>
				</tr>
			</table>

		</s:form>
	</body>
</html>

