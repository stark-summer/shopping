<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/jquery-ui-1.7.custom.css" rel="stylesheet"
	type="text/css" />
<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="../js/jquery-ui-1.7.custom.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<script type="text/javascript">


	$(document).ready(function() {
		
		$("#levelName").blur(function(){
			var levelName = $("#levelName").val();
			if (levelName.length == 0 || levelName == "") {
				$("#levelNameAlert").html("<font size='5' color='red'>×</font>");
			}else{
				$("#levelNameAlert").html("<font size='5' color='green'>√</font>");
			}
		});
		
		$("#levelName").click(function(){
			$("#levelNameAlert").html("");
		});
		$("#startPoint").blur(function(){
			var startPoint = $("#startPoint").val();
			if (startPoint.length == 0 || startPoint == "") {
				$("#startPointAlert").html("<font size='5' color='red'>×</font>");
			}else{
				$("#startPointAlert").html("<font size='5' color='green'>√</font>");
			}
		});
		
		$("#startPoint").click(function(){
			$("#startPointAlert").html("");
		});
		$("#endPoint").blur(function(){
			var endPoint = $("#endPoint").val();
			if (endPoint.length == 0 || endPoint == "") {
				$("#endPointAlert").html("<font size='5' color='red'>×</font>");
			}else{
				if($("#startPoint").val()>=endPoint){
					$("#endPointAlert").html("<font size='5' color='red'>×</font>");
					$("#endPoint").focus();
				}else{
					$("#endPointAlert").html("<font size='5' color='green'>√</font>");
				}
			}
		});
		
		$("#endPoint").click(function(){
			$("#endPointAlert").html("");
		});
		
		$("#updateBtn").click(function() {
			var levelCode = $("#levelCode").val();
			if (levelCode.length == 0 || levelCode == "") {
				$("#levelCodeInfo").show();
				$("#levelCodeAlert").html("<font size='5' color='red'>×</font>");
				$("#levelCode").focus();
				return false;
			}else{
				$("#levelCodeInfo").hide();
				$("#levelCodeAlert").html("<font size='5' color='green'>√</font>");
				
			}

			var levelName = $("#levelName").val();
			if (levelName.length == 0 || levelName == "") {
				$("#levelNameInfo").show();
				$("#levelNameAlert").html("<font size='5' color='red'>×</font>");
				$("#levelName").focus();
				return false;
			}else{
				$("#levelNameInfo").hide();
				$("#levelNameAlert").html("<font size='5' color='green'>√</font>");
				
			}

			var startPoint = $("#startPoint").val();
			if (startPoint.length == 0 || startPoint == "") {
				$("#startPointInfo").show();
				$("#startPointAlert").html("<font size='5' color='red'>×</font>");
				$("#startPoint").focus();
				return false;
			}else{
				$("#startPointInfo").hide();
				$("#startPointAlert").html("<font size='5' color='green'>√</font>");
				
			}

			var endPoint = $("#endPoint").val();
			if (endPoint.length == 0 || endPoint == "") {
				$("#endPointInfo").show();
				$("#endPointAlert").html("<font size='5' color='red'>×</font>");
				$("#endPoint").focus();
				return false;
			}else{
				if($("#startPoint").val()>=endPoint){
					$("#endPointAlert").html("<font size='5' color='red'>×</font>");
					$("#endPoint").focus();
					return false;
				}else{
					$("#endPointInfo").hide();
					$("#endPointAlert").html("<font size='5' color='green'>√</font>");
				}
			}
			jQuery.ajax({
				type : "post",
				url : "levelJson_updateLevel.action",
				dataType : 'text',
				data : $('#updateLevel_form').serialize(),
				success : function(json) {

					if (json != null && json != '') {
						var member = json; //包数据解析为json 格式
						var jsons = member.split("*");
						 
						if (eval(jsons[0]) == "true") {
							alert('更新成功!');
							window.close();
							window.returnValue = true;
						} else {
							if (undefined != jsons[1]) {
								alert(jsons[1]);
							} else {
								alert("更新失败！");
							}
							window.close();
							window.returnValue = true;
						}
					} else {
						alert("异步处理异常，返回值为空！");
					}
				}
			});
		});

		$("#cancelBtn").click(function() {
			window.close();
			window.returnValue = false;

		});
	});
</script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>

<title>更新级别信息</title>

<link href="../images/skin.css" rel="stylesheet" type="text/css" />
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="../images/mail_leftbg.gif"><img
				src="../images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="../images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>


					</tr>
				</table></td>
			<td width="16" valign="top" background="../images/mail_rightbg.gif"><img
				src="../images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="../images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">

					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：更新级别</td>
								</tr>

								<tr>
									<td height="20"><table width="100%" height="1" border="0"
											cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
											<tr>
												<td></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<table width="100%" height="55" border="0" cellpadding="0"
											cellspacing="0">

											<tr>
												<td width="10%" height="55" valign="middle"><img
													src="../images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以更新新级别</span><span
													class="left_txt3">！</span><br>
												</td>
											</tr>
										</table></td>
								</tr>
								<tr>

									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><table width="100%" height="31" border="0"
											cellpadding="0" cellspacing="0" class="nowtable">
											<tr>
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;级别信息设置</td>
											</tr>
										</table></td>

								</tr>
								<tr>
									<td>
										<form id="updateLevel_form">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">级别代码<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="hidden" name="level.id"
														value="<s:property value="level.id"/>" /> <input
														type="text" id="levelCode" name="level.levelCode"
														value="<s:property value="level.levelCode"/>" size="30"
														readonly="readonly" /> <span id="levelCodeAlert"></span>
														<div id="levelCodeInfo"></div></td>
												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">级别名<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="levelName" name="level.levelName"
														value="<s:property value="level.levelName"/>" size="30" />
														<span id="levelNameAlert"></span></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">起始点<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="startPoint" name="level.startPoint"
														value="<s:property value="level.startPoint"/>" size="30" />
														<span id="startPointAlert"></span></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">终止点<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="endPoint" name="level.endPoint"
														value="<s:property value="level.endPoint"/>" size="30" />
														<span id="endPointAlert"></span></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">备注:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><textarea
															id="remark" name="level.remark" cols="25" rows="5">
															<s:property value="level.remark" />
														</textarea></td>

												</tr>


												<tr>
													<td height="30" colspan="3">&nbsp;</td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2"><input type="button" value="取消更新"
														id="cancelBtn" name="cancelBtn" />
														&nbsp;&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2">
														&nbsp;&nbsp;&nbsp;<input type="button" value="提交更新"
														id="updateBtn" />
													</td>

												</tr>
											</table>
										</form>
									</td>
								</tr>



							</table>
						</td>
					</tr>
				</table>
			</td>
	</table>

</body>
</html>